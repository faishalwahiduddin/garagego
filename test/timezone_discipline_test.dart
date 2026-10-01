import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Guard TZ-2 (`~/projects/docs/standards.md` §TZ).
///
/// Platform contract: stored instants are UTC, everything a human reads is
/// shown in the SELECTED zone (Settings manual zone, or the device zone
/// while on Auto), through `lib/core/utils/app_timezone.dart`. Breaking it
/// fails silently on a dev machine: `DateTime.now()`, `.toLocal()` and
/// `DateFormat(...)` all use the DEVICE zone, which is Asia/Jakarta on the
/// laptop and something else on a user's phone — off by hours, and by a whole
/// day between 00:00 and the zone offset after midnight.
///
/// Dart's own parsers (`DateTime.parse`/`tryParse`) are banned outside the
/// helper too: a string without `Z`/offset is read as DEVICE-local. Model
/// `fromJson` goes through `AppTimeZone.parseUtc()` (legacy naive strings
/// decode as UTC, garbage throws loud); `toJson` encodes with
/// `AppTimeZone.encodeForPrefs()` (UTC `Z`).
///
/// Stepping days with `.add`/`.subtract(Duration(days: n))` is banned too:
/// on a zone wall clock it skips or repeats a calendar day across a DST
/// switch. Fixed-interval seed approximations (service presets, sample
/// vehicles) are allowlisted per line below — they are install-day
/// approximations, never zone calendar math.
///
/// Instant reads use `package:clock` (`clock.now()`), not `DateTime.now()`,
/// so tests can freeze time — but the value is still only an instant. Any
/// line below that keeps a `DateTime.now()` is allowlisted PER LINE with its
/// reason, never per file, so a new offender in the same file is caught.
///
/// Line scan, not an AST: a COMMENT quoting a forbidden call is caught too.
/// That is deliberate — describe the anti-pattern in words, or allowlist it.
/// Known gap: reading `.day`/`.hour` off a device-zone `DateTime` is not
/// detectable by a line scan; that is what code review and the TZ=UTC run of
/// the test suite are for.
class _ForbiddenPattern {
  final RegExp pattern;
  final String why;
  const _ForbiddenPattern(this.pattern, this.why);
}

/// Excluded ENTIRELY: the helper itself, the only file allowed to resolve
/// zones, format in a zone, or parse raw values into UTC.
const _allowedFiles = {'lib/core/utils/app_timezone.dart'};

final _forbidden = <_ForbiddenPattern>[
  _ForbiddenPattern(
    RegExp(r'\.toLocal\s*\('),
    'uses the DEVICE zone -- display through AppTimeZone.format*() in the '
        'selected zone from lib/core/utils/app_timezone.dart',
  ),
  _ForbiddenPattern(
    // Also the named constructors: DateFormat.yMMMd(...), DateFormat.Hm(...).
    RegExp(r'\bDateFormat\s*(?:\(|\.\w+\s*\()'),
    'DateFormat from package:intl renders in the device zone -- use '
        'AppTimeZone.format*()',
  ),
  _ForbiddenPattern(
    RegExp(r'DateTime\.now\s*\(\s*\)'),
    'DateTime.now() cannot be frozen by package:clock -- use '
        'AppTimeZone.nowUtc()/clock.now() for instants, or allowlist it '
        'with a reason',
  ),
  _ForbiddenPattern(
    RegExp(r'DateTime\.(?:try)?[Pp]arse\s*\('),
    "Dart's parser reads a string without Z/offset as DEVICE-local and rolls "
        'impossible dates over -- use AppTimeZone.parseUtc() via _decodeDate()',
  ),
  _ForbiddenPattern(
    RegExp(r'\.(?:add|subtract)\s*\(\s*(?:const\s+)?Duration\s*\(\s*days\s*:'),
    'a 24h step skips or repeats a calendar day across DST on a zone wall '
        'clock -- fixed-interval seed approximations only, allowlisted per line',
  ),
];

class _AllowlistEntry {
  final String file;
  final RegExp match;
  final String why;
  const _AllowlistEntry(this.file, this.match, this.why);
}

/// The exact reason for every remaining exception.
const _instantReason =
    'pure instant handling, zone-independent (standards.md §TZ: instants '
    'are compared/stored as UTC, only display is zoned)';

const _idReason =
    'unique-id generation from the epoch millis -- the value is never read '
    'as a time, only compared as a string';

const _seedReason =
    'install-day seed approximation ("N days ago / ahead") -- the instant is '
    'stored as UTC Z on save and only displayed through AppTimeZone, never '
    'used as zone calendar math';

const _formReason =
    'new-record form default: the initial wall-clock value the user edits '
    'before saving -- the saved instant is encoded as UTC Z';

const _dayDiffReason =
    'whole-day difference math on calendar days (expiry minus today at '
    'midnight) -- counts days, never renders a wall clock';

final _allowlist = <_AllowlistEntry>[
  // --- Model day math (vehicle.dart) -------------------------------------
  _AllowlistEntry(
    'lib/core/models/vehicle.dart',
    RegExp(r'final now = DateTime\.now\(\);'),
    '$_dayDiffReason -- daysUntilTaxDue/daysUntilPlateDue/daysRemaining',
  ),
  _AllowlistEntry(
    'lib/core/models/vehicle.dart',
    RegExp(r'DateTime\.now\(\)\.add\(const Duration\(days: \d+\)\)'),
    '$_seedReason -- sampleCar/sampleMotorcycle tax/plate/insurance defaults',
  ),
  _AllowlistEntry(
    'lib/core/models/vehicle.dart',
    RegExp(r'\.add\(const Duration\(days: 365 \* \d\)\)'),
    '$_seedReason -- plate/doc fallbacks approximate +3/+4 years from tax due',
  ),
  _AllowlistEntry(
    'lib/core/models/vehicle.dart',
    RegExp(r'now\.subtract\(const Duration\(days: \d+\)\)'),
    '$_seedReason -- defaultPresetsFor lastPerformedDate presets',
  ),
  // --- Seed storage (local_storage_service.dart) --------------------------
  _AllowlistEntry(
    'lib/core/storage/local_storage_service.dart',
    RegExp(r'date: DateTime\.now\(\)\.subtract\(const Duration\(days: \d+\)\)'),
    '$_seedReason -- seedInitialIfEmpty service/fuel/inspection timestamps',
  ),
  // --- Unique-id generation ------------------------------------------------
  _AllowlistEntry(
    'lib/core/providers/app_providers.dart',
    RegExp(r"'serv_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- markScheduleDone service-log id',
  ),
  _AllowlistEntry(
    'lib/features/garage/garage_dashboard_screen.dart',
    RegExp(r"'serv_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- quick-add service-log id',
  ),
  _AllowlistEntry(
    'lib/features/garage/add_vehicle_sheet.dart',
    RegExp(r"'veh_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new vehicle id',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/maintenance_screen.dart',
    RegExp(r"'serv_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new service-log id',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/add_schedule_sheet.dart',
    RegExp(r"'sched_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new schedule id',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/inspection_sheet.dart',
    RegExp(r"'insp_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new inspection id',
  ),
  _AllowlistEntry(
    'lib/features/fuel/fuel_logs_screen.dart',
    RegExp(r"'fuel_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new fuel-log id',
  ),
  _AllowlistEntry(
    'lib/features/glovebox/add_document_sheet.dart',
    RegExp(r"'doc_\$\{DateTime\.now\(\)\.millisecondsSinceEpoch\}'"),
    '$_idReason -- new document id',
  ),
  // --- New-record timestamps (instant "now", stored as UTC Z) --------------
  _AllowlistEntry(
    'lib/features/garage/garage_dashboard_screen.dart',
    RegExp(r'date: DateTime\.now\(\),'),
    '$_instantReason -- quick-add log timestamp, encoded as UTC Z on save',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/maintenance_screen.dart',
    RegExp(r'DateTime serviceDate = DateTime\.now\(\);'),
    '$_formReason -- add-service dialog initial date',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/maintenance_screen.dart',
    RegExp(r'performedDate: DateTime\.now\(\),'),
    '$_instantReason -- mark-done timestamp, encoded as UTC Z on save',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/add_schedule_sheet.dart',
    RegExp(r'_lastDate = s\?\.lastPerformedDate \?\? DateTime\.now\(\);'),
    '$_formReason -- schedule sheet initial last-performed date',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/add_schedule_sheet.dart',
    RegExp(r'lastDate: DateTime\.now\(\),'),
    '$_formReason -- new-schedule fallback date before the user picks',
  ),
  _AllowlistEntry(
    'lib/features/maintenance/inspection_sheet.dart',
    RegExp(r'date: DateTime\.now\(\),'),
    '$_instantReason -- new inspection timestamp, encoded as UTC Z on save',
  ),
  _AllowlistEntry(
    'lib/features/fuel/fuel_logs_screen.dart',
    RegExp(r'date: DateTime\.now\(\),'),
    '$_instantReason -- new fuel-log timestamp, encoded as UTC Z on save',
  ),
  // --- Form defaults one year out / validation bounds ----------------------
  _AllowlistEntry(
    'lib/features/garage/add_vehicle_sheet.dart',
    RegExp(r'DateTime _taxDueDate = DateTime\.now\(\)\.add\(const Duration\(days: 365\)\);'),
    '$_formReason -- tax-due picker initial value (~1 year out)',
  ),
  _AllowlistEntry(
    'lib/features/glovebox/add_document_sheet.dart',
    RegExp(r'_expiryDate = d\?\.expiryDate \?\? DateTime\.now\(\)\.add\(const Duration\(days: 365\)\);'),
    '$_formReason -- expiry picker initial value (~1 year out)',
  ),
  _AllowlistEntry(
    'lib/features/garage/add_vehicle_sheet.dart',
    RegExp(r'DateTime\.now\(\)\.year'),
    'manufacture-year field default and §VAL upper bound (current year + 1) '
        '-- a year number, never a rendered time',
  ),
];

bool _isAllowlisted(String relPath, String line) =>
    _allowlist.any((a) => a.file == relPath && a.match.hasMatch(line));

/// Every `.dart` file under [dir], as a path relative to [root].
List<String> _dartFilesUnder(Directory dir, String root) {
  if (!dir.existsSync()) return const [];
  return dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .map((f) => f.path.substring(root.length + 1).replaceAll(r'\', '/'))
      .toList()
    ..sort();
}

List<String> _findOffenders(String root, List<String> relPaths) {
  final offenders = <String>[];
  for (final rel in relPaths) {
    if (_allowedFiles.contains(rel)) continue;
    final lines = File('$root/$rel').readAsLinesSync();
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (_isAllowlisted(rel, line)) continue;
      for (final f in _forbidden) {
        if (f.pattern.hasMatch(line)) {
          offenders.add('$rel:${i + 1} -- ${f.why}\n    ${line.trim()}');
        }
      }
    }
  }
  return offenders;
}

void main() {
  final root = Directory.current.path;
  final libDir = Directory('$root/lib');

  test('no lib/ file reads or shows time outside app_timezone.dart', () {
    final files = _dartFilesUnder(libDir, root);
    // Sanity: if this is ~0 the scan targets the wrong directory and the
    // rest passes vacuously.
    expect(files.length, greaterThan(20));
    expect(files, contains('lib/core/utils/app_timezone.dart'));

    final offenders = _findOffenders(root, files);
    expect(
      offenders,
      isEmpty,
      reason: 'Unsafe time handling found:\n\n${offenders.join('\n')}\n',
    );
  });

  test('every allowlist entry points at a line that really exists', () {
    for (final entry in _allowlist) {
      final path = '$root/${entry.file}';
      expect(File(path).existsSync(), isTrue, reason: '${entry.file} missing');
      final lines = File(path).readAsLinesSync();
      final hits = lines.where((l) => entry.match.hasMatch(l)).length;
      expect(
        hits,
        greaterThan(0),
        reason: 'allowlist ${entry.file} (${entry.match.pattern}) matches no '
            'line -- the site moved or was removed; drop the dead entry',
      );
      // Also must still be a forbidden-pattern line, otherwise the entry is
      // dead weight that could later mask a real offender.
      final stillForbidden = lines
          .where((l) => entry.match.hasMatch(l))
          .any((l) => _forbidden.any((f) => f.pattern.hasMatch(l)));
      expect(stillForbidden, isTrue,
          reason: 'allowlist ${entry.file} (${entry.match.pattern}) no longer '
              'matches a forbidden pattern -- drop it');
      expect(entry.why.length, greaterThan(15), reason: 'reason too short');
    }
  });

  test('FORBIDDEN patterns really catch offenders (negative control)', () {
    const regressions = [
      'final createdAt = DateTime.now();',
      'final jam = raw.toLocal();',
      "DateFormat('dd/MM/yyyy').format(instant);",
      'DateFormat.yMMMd(locale).format(instant);',
      "DateFormat.Hm().format(instant);",
      "final d = DateTime.parse(json['created_at']);",
      'final d = DateTime.tryParse(raw.toString());',
      'checkDate = checkDate.subtract(const Duration(days: 1));',
      'final d = weekStart.add(Duration(days: i));',
    ];
    for (final line in regressions) {
      final caught = _forbidden.any((f) => f.pattern.hasMatch(line));
      expect(caught, isTrue, reason: 'not caught by any pattern: $line');
    }
  });

  test('safe lookalikes are not flagged', () {
    const safe = [
      'final d = DateTime(2026, 1, 1);',
      'final d = DateTime(date.year, date.month, date.day - 1);',
      'await Future.delayed(const Duration(milliseconds: 300));',
      'final label = AppTimeZone.formatDate(instant, loc);',
      'final now = clock.now().toUtc();',
      "final key = AppTimeZone.zoneDateKey(instant, loc);",
      'final r = AppTimeZone.dayRangeUtc(loc, day);',
      "final ok = AppTimeZone.isValidZoneName(name);",
      "final stored = AppTimeZone.encodeForPrefs(now);",
      "import 'package:garagego/core/utils/app_timezone.dart';",
    ];
    for (final line in safe) {
      final caught = _forbidden.any((f) => f.pattern.hasMatch(line));
      expect(caught, isFalse, reason: 'false positive: $line');
    }
  });

  test('a new offender in an allowlisted file is still caught (per line)', () {
    final dir = Directory.systemTemp.createTempSync('tz_guard_');
    addTearDown(() => dir.deleteSync(recursive: true));
    const victim = 'lib/core/providers/app_providers.dart';
    final fixture = File('${dir.path}/$victim')
      ..createSync(recursive: true)
      ..writeAsStringSync([
        "    id: 'serv_\${DateTime.now().millisecondsSinceEpoch}',", // allowlisted shape...
        "    final label = DateFormat('dd/MM').format(createdAt);", // new
        '    final seen = DateTime.now();', // new
      ].join('\n'));
    expect(fixture.existsSync(), isTrue);

    // NOTE: the first fixture line matches the app_providers allowlist regex
    // but the other two are new shapes in the same file, so per-line scoping
    // still flags exactly them... plus nothing else.
    final offenders = _findOffenders(dir.path, [victim]);
    expect(offenders, hasLength(2));
  });
}
