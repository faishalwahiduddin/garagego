# Design Audit — GarageGo

**Date:** 2026-11-20 · **Version:** 1.1.2+22 · **Grade: 51.6 / 100 — F**
**Mode:** deep (7 screens + 6 sheets + tokens + real renders) · **Stance:** senior mobile designer;
grades are earned, "looks fine" is a C at best.

> **Read the grade correctly.** User-facing severity is **D**: the app is coherent, the palette is
> disciplined, nothing is unusable. System-integrity severity is **F**: the app publishes a design
> system, ships the components that enforce it, and uses none of them — `TextTheme` is never defined,
> `TapTarget` has zero call sites, and 259 raw `TextStyle(` blocks hardcode the type scale screen by
> screen. The fix is **systematise, do not redesign**: the visual craft is already the best here.

---

## 1. Snapshot

| Field | Value |
|---|---|
| Product | GarageGo — personal vehicle garage: service history, oil intervals, fuel economy, tax/STNK/insurance, odometer |
| Version | `1.1.2+22` |
| Platform | Flutter Web (CF Pages) + Android + iOS · Material 3 · light + dark |
| Dart files | 65 |
| Routes / screens | 8 routes / 7 product screens (5 shell tabs + splash + onboarding) |
| Router | `lib/core/router/app_router.dart` — `StatefulShellRoute.indexedStack`, 5 branches; splash + onboarding on the root navigator |
| State | Riverpod (`flutter_riverpod`) over `shared_preferences`, offline-only, no account |
| Locales | 8 (`id, en, ar, jv, su, zh, ja, es`) |
| Design tokens | `lib/core/constants/app_colors.dart` (70 L) + `lib/core/theme/app_theme.dart` (279 L) + `lib/core/theme/app_motion.dart` (21 L) — **3 of 12** standard token files |
| Documented system | `DESIGN.md` → `docs/reference/design-system/{foundations,components}.md` |
| Test rigour | 19 test files incl. dual-theme contrast scan of all 5 tabs and a landscape render matrix — **above fleet average** |

**The two numbers that matter.** `docs/reference/design-system/components.md:39` says *"**Dilarang**
menulis `Color(0x...)` literal langsung di widget presentation"*, and `components.md:47` says *"Target
sentuh minimal 44pt (`TapTarget`)"*. Measured:

| Layer | `Color(0x…)` | Evidence |
|---|---|---|
| `lib/features/garage/` (presentation) | **21** | `garage_dashboard_screen.dart:728` decodes a status colour from an int at runtime |
| `lib/features/fuel/` (presentation) | **1** | `fuel_logs_screen.dart:221` `Color(0xFF16A34A)` |
| presentation subtotal | **22** | a written ban, violated 22 times |
| `lib/core/{constants,ui}` (legal) | 50 | `app_colors.dart` 34 + shared widgets 16 |
| **total** | **72** | inventory `hardcoded_colors` |

`TapTarget` appears 8 times in `lib/` — its definition, a doc comment, a test. Call sites: **0**.
`PressScale` has **41** call sites, 5 owning a tap, so the documented pattern in
`press_scale.dart:16-18` (*"keep `TapTarget` for the 44pt hit area… put `PressScale` inside it"*) is
inverted everywhere.

---

## 2. Sitemap

Parsed from `lib/core/router/app_router.dart` (8 nodes, 1 shell with 5 branches).

```
/splash                       → FleetSplashScreen        core/ui/fleet_splash_screen.dart (294)
/onboarding                   → FleetOnboardingScreen    core/ui/fleet_onboarding_screen.dart (1003)
(shell b1) /                  → GarageDashboardScreen    features/garage/garage_dashboard_screen.dart (1701)
(shell b2) /maintenance       → MaintenanceScreen        features/maintenance/maintenance_screen.dart (1071)
(shell b2) /service           → MaintenanceScreen(tab:1) features/maintenance/maintenance_screen.dart (1071)
(shell b3) /fuel              → FuelLogsScreen           features/fuel/fuel_logs_screen.dart (658)
(shell b4) /glovebox          → GloveboxScreen           features/glovebox/glovebox_screen.dart (427)
(shell b5) /settings          → SettingsScreen           features/settings/settings_screen.dart (1041)
```

- **Shell is correct.** `indexedStack` gives each branch its own Navigator, so tab state and scroll
  position survive switches (`app_router.dart:29-33`). **`/settings` is a tab, not a modal**
  (`app_router.dart:76-83`) — defensible, but it spends the fifth slot an "Overview" would want.
- **Two routes render one screen.** `/maintenance` and `/service` differ only by `initialTab`
  (`app_router.dart:51-54`), a store-capture convenience leaked into the router: after a `/service`
  deep link, tapping Service resets to tab 0, a state the tab bar cannot express.
- **No entity routes.** A vehicle, service log, fill-up and document have no address; every detail is
  a sheet or dialog, so no share link can open a record.
- **Zero `Navigator.push`** (`imperative_nav` = 0) — navigation is 100% declarative. But no custom page
  exists either: tab switches use the default `MaterialPage`, so no iOS idiom is honoured and no
  edge-swipe-back exists (`grep -c "Platform.isIOS" lib` → **0**).

---

## 3. Screen inventory

| # | Route | Screen | LOC | Archetype | Primary action | Loading | Empty | Error |
|---|---|---|---|---|---|---|---|---|
| 1 | `/` | GarageDashboardScreen | 1701 | Home / garage dashboard | quick actions (FAB) | ✗ | ✓ `:405-463` | ✗ |
| 2 | `/maintenance` (tabs 0-2) | MaintenanceScreen | 1071 | Reminder queue / history / checklist | mark done · add log · inspect | ✗ | ✓ `:525`, `:762`, `:935` | ✗ |
| 3 | `/fuel` | FuelLogsScreen | 658 | Log + KPI | add fill-up (dialog) | ✗ | ✓ `:421-459` | ✗ |
| 4 | `/glovebox` | GloveboxScreen | 427 | Document wallet | add document (sheet) | ✗ | ✓ `:207-256` | ✗ |
| 5 | `/settings` | SettingsScreen | 1041 | Settings | export / restore | ✗ | n/a | SnackBar only `:45-50` |
| — | `/splash` | FleetSplashScreen | 294 | Launch | — | — | — | — |
| — | `/onboarding` | FleetOnboardingScreen | 1003 | Onboarding | finish / skip | — | — | — |

**Empty states are genuinely designed on every screen** — icon-in-circle, title, one-sentence body, a
real recovery button; better than most of the fleet. **Loading and error states are absent
everywhere**: the app is offline-first so the happy path never waits, but backup export/import and
share are fallible, and `FleetLoadingView` / `FleetStateSwitcher` / `FleetShimmerCard` ship in
`lib/core/ui/fleet_loading_view.dart` with **0 call sites** outside that file.

---

## 4. Screen anatomy

Type sizes are explicit `fontSize` literals because there is no `TextTheme` to inherit from.

### 4.1 Dashboard — `garage_dashboard_screen.dart`

| Section | Components | Type | Colour | Verdict |
|---|---|---|---|---|
| App bar (`:286-381`) | 20px logo chip + `GarageGo` + share + add, both in 30px tinted circles | title 19/w800 | `context.textPrimary` on surface | Brand doubles as page title; two icon buttons are 30dp visual circles — the smallest thing in the bar is what you tap |
| Vehicle switcher (`:481-590`) | horizontal `ListView` of pills in `SizedBox(height: 40)` | name 12/w600-700, plate 10/w700 | selected `brandFill` + white | **Clips mid-word** at ≤430dp (`iphone69-1.png`, Android `1.png`); 40dp tall, below the documented 44pt floor |
| Health hero (`:720-917`) | 52dp badge, name, plate chip, year, 48dp score ring, status label, warning strip, share link | name 17/w800, plate 11/w700, score 15/w900, status **10**/w700 | `readable(statusColor)`; warning strip danger@8% | The score is 15sp inside a 48dp ring and its **label is 10sp** — the verdict is the smallest text in the card |
| Achievements (`garage_achievements_card.dart:14-217`) | emoji level badge, title, XP, 7dp bar, 4×N badge grid | level 10/w800, title 15/w800, XP 12, badge label **10**/w500 | primary@8-15% on card | Emoji `🛡️` used as an icon (`garage_gamification.dart:50`) against `components.md:42`. The grid uses `LayoutBuilder` + computed cell height — the only adaptive component in the app |
| KPI grid (`:616-674`) | 2×2 `_buildMetricCard` | label 11/w600, value 15/w800 | four accents (accent, primary, warning, success) | Four accent colours on four peer metrics means none of them signals |
| Oil card (`:919-1043`) | status icon, title, `Reset Oli`, interval label, km chip, 6dp bar | title 14/w700, chip 11/w700, interval 12 | via `readable()` | **Correct due-ness model**: `kmUntilNextOilChange` (`vehicle.dart:181-184`) → `kmOverdue` / `kmRemainingShort`, bar = value/interval |
| Tax card (`:1045-1194`) | header + `Buka Brankas`, two tiles with `daysRemaining` | label 11/w600, value 14/w800 | tax red when `isTaxClose`, plate amber when `isPlateClose` | Computed day counts — good. The same two numbers repeat on the Glovebox header (`glovebox_screen.dart:147,176`) and again per row |
| TCO (`:1196-1310`) | 3 legend dots + 3 amounts | label 11, amount 13/w800 | warning / accent / primary dots | A 3-segment legend with **no bar** — the dots encode a proportion that is not drawn |
| Upcoming (`:1312-1477`) | up to 3 rows: icon, title, km chip, `Lihat Semua` | title 12/w600, chip 11/w700 | urgency colour per row | **`schedules.take(3)`** on an unsorted list (`:1318`) — "upcoming" is neither next-by-date nor next-by-km |
| Recent services (`:1479-1643`) | up to 3 rows: icon, title, `odo • date`, cost, `Riwayat Lengkap` | title 13/w600, meta **11** | accent icon chip | `NumberFormat('#,###', 'id_ID')` at `:1616` renders `20.000 km` in the English build |

### 4.2 Maintenance — `maintenance_screen.dart`

- **Three tabs inside a bottom-nav destination** (`:52-56`, `:342-384`). Counts in the labels
  (`Jadwal (6)`) are genuinely useful; the nesting is not.
- **Filter chips** All / Attention / Safe (`:433-461`) are the correct three options. Height comes
  from the default `ChoiceChip` (~32dp visual); no `materialTapTargetSize`, no 48dp floor.
- **Schedule card** (`:594-710`): urgency pill + category + edit + delete in row one, title 15/w700,
  `km remaining` and `days left` on one line, interval summary 11sp, divider, right-aligned `Tandai
  Selesai / Reset`. Seven interactive surfaces per card.
- **`daysLeft` and `kmOverdue` are both computed** (`:659-674`, from `vehicle.dart:407-424`) — the right
  call, and the strongest product thinking on the screen.
- **Contradiction surfaced to the user:** `iphone69-2.png` shows a card badged `Overdue` with
  `Overdue by 4500 km` beside `245 days left`. Both are true under a dual-trigger model, but the card
  gives no "or" and no priority, so the user cannot tell which trigger fired.
- **Category is stored localised and rendered verbatim** (`:615` list, `:818` history): the English
  render `iphone69-3.png` shows **`Ganti Oli`** and **`Ban & Suspensi`**. Delete is one tap, no
  confirm, no undo (`:635-641`, `:838-844`, `:1031-1037`).

### 4.3 Fuel — `fuel_logs_screen.dart`

- **KPI grid** (`:351-407`) with `maxLines: 1` + ellipsis (`:636-638`): the primary metric renders as
  **"Average Fuel Econ…"** in `iphone69-4.png` — the label truncates while the card keeps a 14dp icon
  + 8dp gap before the text.
- **Fill-up row** (`:461-592`): litres pill, fuel-type chip, date, delete, `Odo: 24.100 km` +
  `Rp 548.000`, price line with Full/Partial, per-fill `km/L` badge. Arithmetic is **correct and
  verifiable**: 40.0 L × Rp 13.700 = Rp 548.000; 32.5 L × 13.700 = 445.250; 400 ÷ 32.5 = 12.3 km/L.
- **Point grouping is wrong for full-tank math:** the per-fill point is looked up by odometer equality
  (`:462`), not by the previous full-tank odometer, so two fill-ups at the same odo share a point.
- **The list is a spread `...logs.map` inside a `SingleChildScrollView`** (`:341`, `:461`) — every row
  builds every frame, unlike `maintenance:793`. **No edit path:** a mistyped litre figure means
  delete-and-retype.

### 4.4 Glovebox — `glovebox_screen.dart`

- Header card (`:89-188`) repeats the tax/plate countdowns from the dashboard; rows (`:295-419`) carry
  a 38dp generic icon, title 14/w700, number 12, status pill 11/w700, `Valid until …` 12sp, cost, note
  at **11sp in `textMuted`**, divider, `Ubah` + delete.
- **Status is not colour-only** (`:263-272`): expired / due-soon / days-left each get a distinct string
  plus colour — satisfies `components.md:41`, the app's best a11y decision.
- **No attachment surface exists.** `VehicleDocument` has no image or file field
  (`vehicle.dart:608-627`); `add_document_sheet.dart:124-197` collects title, number, date, cost,
  notes and nothing else. A "digital glovebox" cannot hold a photo of the STNK.
- **Ordering is insertion order**: `addDocument` appends (`app_providers.dart:264-267`) and the
  filtered provider does not sort (`:350-355`). An expired document added last sits below four valid ones.

### 4.5 Settings — `settings_screen.dart`

- Fleet list (`:225-285`) with per-vehicle delete and **no confirmation** (`:268-281`).
- `SegmentedButton<ThemeMode>` with **three icon-only segments and no labels** (`:342-355`). The comment
  at `:331-334` reasons about `minimumSize: Size(48, 44)` — still under 48dp height — and nothing gives
  the segments an accessible name.
- Language + timezone rows (`:366-442`): timezone is wrapped in `Semantics(button: true, label: …)`
  (`:403`); language, immediately above, is not (`:399-400`). Backup / CSV / reset (`:459-698`) is
  four `ListTile`s, one destructive action with a confirm dialog, errors as a `SnackBar` — no retry.
- **The bottom of the list is under the nav bar.** The shell sets `extendBody: true`
  (`navigation_shell.dart:26`) and the bar is themed `height: 65` (`app_theme.dart:48`). Every other
  screen pads its scroll body by 96 (`garage:468-473`, `maintenance:573`, `fuel:343`, `glovebox:72`);
  Settings pads 16 and ends with `SizedBox(height: 32)` (`:184`, `:800`).

### 4.6 Forms

| Surface | File:line | Height model | Keyboard | Validation |
|---|---|---|---|---|
| Add vehicle | `add_vehicle_sheet.dart:99-400` | intrinsic + `viewInsets` | handled (`:97`, `:108`) | name/plate/year/odo via `AppValidators` |
| Add schedule | `add_schedule_sheet.dart:96-347` | intrinsic + `viewInsets` | handled | interval > 0, title required |
| Inspection | `inspection_sheet.dart:66-235` | **fixed `height × 0.85`** | **not handled** | none (checklist only) |
| Add document | `add_document_sheet.dart:60-243` | intrinsic + `viewInsets` | handled | title + cost |
| Service / fuel log | `maintenance_screen.dart:87-225`; `fuel_logs_screen.dart:36-295` | `AlertDialog` + scroll | Material default | title/odo/cost; odo/litres/price |

The inspection sheet is the outlier: `Container(height: MediaQuery.of(context).size.height * 0.85)`
with a `Column` ending in the notes `TextField` (`:198-205`) and the save button, adding no
`viewInsets.bottom` — the field being typed into sits behind the keyboard.

---

## 5. Visual evidence review (real renders)

Source: `docs/store/metadata/ios-screenshots/en-US/iphone69-{1..5}.png` (1206×2622, 430dp logical) and
`docs/store/metadata/android/en-US/images/phoneScreenshots/{1..5}.png` (1080×1920, 411dp), produced by
`test/store_screens/store_screens_test.dart` — the real app, not mockups.
`docs/store/screenshots/overflows.txt` is **empty**, so nothing in the store matrix overflowed.

| # | Severity | Finding | Evidence | Fix |
|---|---|---|---|---|
| 1 | **HIGH** | Vehicle switcher clips mid-word with no fade or scroll cue; a fourth vehicle is invisible. | `iphone69-1.png`, `1.png` ("Honda Vario" / "Honda Vario 160" cut at the right edge) | `ShaderMask` trailing 24dp fade + trailing padding; or a dropdown past 3 vehicles |
| 2 | **HIGH** | The floating `Quick Actions` bar covers the badge grid, including an interactive share icon. | `iphone69-1.png`, `1.png` (overlaps `Road Warrior` / `Service Regular`) | Move it into the app bar, or reserve trailing space instead of overlaying a 2-column grid |
| 3 | **HIGH** | Indonesian category strings leak into the English build: `Ganti Oli`, `Ban & Suspensi`. | `iphone69-3.png` | Store an enum, localise at render (`maintenance_screen.dart:615,818`) |
| 4 | **HIGH** | `id_ID` grouping in every locale: `5.000 km`, `20.000 km`, `24.100 km`. In en-US `5.000` reads as five. | `iphone69-2.png`, `iphone69-4.png` | 14 hardcoded `'id_ID'` formats → one locale-aware helper |
| 5 | **MEDIUM** | The primary KPI label truncates while the card keeps an icon and a gap; the same countdown appears three times ("75 days remaining": dashboard tile, glovebox header, document pill). | `iphone69-4.png`, `iphone69-5.png` | Drop the KPI icon; summarise once at the top of Glovebox, rows carry the date only |
| 7 | **POLISH** | The score label at 10sp is the smallest text in the card it explains; the TCO dots imply a bar that is not drawn. | `iphone69-1.png` | 12/w700 minimum; draw the 3-segment bar or drop the dots |

What the renders get **right** and must not be thrown away: the orange-on-slate palette (one accent,
seven neutrals), the `context.readable()` contrast ladder, the plate-as-chip motif on all five screens,
the 16dp card radius with a 1px hairline, tab labels that carry counts, empty states that recover.

### 5.1 Domain checks (vehicle garage, maintenance, reminders)

| Check | Verdict | Evidence |
|---|---|---|
| **(a) Service due-ness** — computed remaining distance/time? | **PASS, one failure** | Computed where it counts: oil card `garage:921-928`, schedule cards `maintenance:577-674`, dashboard rows `garage:1400-1465`. The failure is *selection*: `schedules.take(3)` (`garage:1318`) takes insertion order, not urgency |
| **(b) Document expiry** — computed, and not colour-only? | **PASS** | `daysRemaining` / `isExpired` / `isDueSoon` (`vehicle.dart:629-635`); text states `docExpiredAgo` / `docDueIn` / `docDaysLeft` (`glovebox:263-272`) |
| **(c) Currency, litres, odometer, km/L** | **FAIL formatting, PASS math** | Math verified against the render. Formatting is hardcoded `id_ID` in 14 places and `Rp ` in 5 |
| **(d) Photo / document surfaces** | **FAIL — surface absent** | No attachment field (`vehicle.dart:608-627`), no picker (`add_document_sheet.dart:124-197`), no `image_picker` in `pubspec.yaml` |
| **(e) Reminder ordering by urgency** | **FAIL — creation order** | `addSchedule` appends (`app_providers.dart:176-180`), provider does not sort (`:343-348`), documents append (`:264-267`); `iphone69-2.png` shows `Overdue` below `Due Soon` |

---

## 6. Scorecard

`score = Σ(category × weight) / Σ(weight)`; a11y and touch weigh 1.5×.

| # | Category | W | P/W/F | Score | Grade |
|---|---|---|---|---|---|
| 1 | Visual hierarchy & composition | 1.0 | 3/4/2 | 55.6 | F |
| 2 | Typography | 1.0 | 1/4/7 | 25.0 | F |
| 3 | Color & theming | 1.0 | 6/3/3 | **50** (auto-capped) | F |
| 4 | Spacing & layout | 1.0 | 4/3/7 | 39.3 | F |
| 5 | Navigation | 1.0 | 6/2/3 | 63.6 | D |
| 6 | Touch & gesture | **1.5** | 4/3/3 | 55.0 | F |
| 7 | Platform conventions | 1.0 | 2/4/4 | 40.0 | F |
| 8 | Motion & animation | 1.0 | 3/4/3 | 50.0 | F |
| 9 | Content states | 1.0 | 6/1/3 | 65.0 | D |
| 10 | Accessibility | **1.5** | 3/4/4 | 45.5 | F |
| 11 | Responsive & adaptive | 1.0 | 3/3/4 | 45.0 | F |
| 12 | Performance as design | 1.0 | 4/3/1 | 68.8 | D |
| 13 | AI-slop detection | 1.0 | 4/3/1 | 68.8 | D |
| | **Weighted total** | 14.0 | 49/41/45 | **51.6** | **F** |

Arithmetic, shown: `(55.6 + 25.0 + 50.0 + 39.3 + 63.6 + 82.5 + 40.0 + 50.0 + 65.0 + 68.25 + 45.0 +
68.8 + 68.8) / 14.0 = 721.85 / 14.0 = 51.56 → 51.6`. P/W/F sums to 49+41+45 = 135, which is
9+12+12+14+11+10+10+10+10+11+10+8+8.

One category is capped by the contract: **Color**, because `garage_dashboard_screen.dart` mixes
`context.textPrimary` with a literal hex decoded from `health.statusColor` (`:728`) — two sources of
truth in one file. Uncapped it scores 62.5.

### 6.1 Typography, in full (this is the grade)

`grep -c "textTheme\|TextTheme" lib/core/theme/app_theme.dart` → **0**. The theme defines
`colorScheme` (`:10-20`), `cardTheme` (`:35-43`), `navigationBarTheme` (`:44-…`), `dialogTheme`,
`bottomSheetTheme`, `inputDecorationTheme` — and **no type scale**. Every `TextStyle` is a local decision.

| Measure | Value |
|---|---|
| Raw `TextStyle(` in `lib/` | **259** |
| …across the 7 routed screens | **181** (25.9/screen) |
| …in sheets + widgets + shared UI | 78 |
| Explicit `fontSize` declarations | **244** |
| Distinct `fontSize` values | **16** (8, 9, 10, 10.5, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 24) |
| Declarations below 12sp | **54** |
| Declarations at ≥16sp | **35** |

Top offenders: `garage_dashboard_screen.dart` **45**, `settings_screen.dart` **41**,
`maintenance_screen.dart` **40**, `fuel_logs_screen.dart` **28**, `garage_share_dialog.dart` 20,
`app_theme.dart` 20 (legal), `glovebox_screen.dart` 18.

Distribution: `11sp × 39`, `12sp × 64`, `13sp × 36`, `14sp × 43` — 182 of 244 declarations crammed into
a 4-step band, which is why the UI reads as *uniformly small* rather than hierarchical. An 11→12→13→14
ladder is a 1px-per-step ramp no eye resolves at arm's length, and the same screens also carry 10sp and
10.5sp labels the ramp cannot express.

### 6.2 Item-level findings

| SEVERITY | CATEGORY | Location | Issue | Fix |
|---|---|---|---|---|
| CRITICAL | Typography | `app_theme.dart:6-20` (0 `textTheme`), 244 `fontSize` | No type system; 16 sizes, 54 below 12sp | `lib/core/theme/app_typography.dart`, 6 steps (12 caption, 13 label, 15 body, 17 title, 22 headline, 28 display) wired as `textTheme:` in both ThemeData blocks |
| CRITICAL | Accessibility | `settings_screen.dart:342-355` | Three theme-mode segments are icon-only: no `Semantics`, no `tooltip`, no `label` — no accessible name | `ButtonSegment(label: Text(...))` or `Semantics(label:)` per segment |
| CRITICAL | Accessibility | 11 icon-only `IconButton`s: `maintenance:619,635,838,1031`; `fuel:505`; `glovebox:405`; `settings:269`; `add_vehicle:130`; `add_schedule:127`; `add_document:85`; `inspection:97` | Delete/edit/close have no `tooltip` (7 of 17 do) and no label | Label all 17; deletes need entity-specific copy |
| CRITICAL | Design system | `components.md:47` vs `TapTarget` 0 call sites | The component that enforces the 44pt floor is unused; `PressScale` (41) stands in | Adopt `TapTarget` at the 5 tap-owning sites, or delete the doc line and set `materialTapTargetSize: padded` |
| CRITICAL | Design system | `garage_dashboard_screen.dart:728`; `fuel_logs_screen.dart:221` | 22 `Color(0x…)` literals in presentation against an explicit ban | `context.healthColor(score)`; `AppColors.fuelGain` |
| CRITICAL | Copy / i18n | `maintenance:615,818`; `fuel:496`; `app_localizations_en.dart:264,1435` | Localised strings stored inside data and re-rendered verbatim (`Ganti Oli` on an English screen); zero ICU plurals in 8 locales ("1 days remaining") | Store IDs, localise at render; add ICU `plural` to the ARBs |
| HIGH | Layout | `garage_dashboard_screen.dart:481-483` | Vehicle chips fixed at 40dp — under the 44pt promise and the 48dp floor | Remove the fixed height; let the chip size itself |
| HIGH | Layout | `navigation_shell.dart:26` + `settings_screen.dart:184,800` | `extendBody: true` with 32dp terminal padding puts the contact cards behind the nav bar | `bottom: 96`, matching the other four screens |
| HIGH | Layout | `inspection_sheet.dart:66-68` vs `:198-205` | Fixed `0.85 × height` sheet, bottom `TextField`, no `viewInsets` — the keyboard covers the field being typed into | Add `MediaQuery.viewInsetsOf(context).bottom`; drop the fixed height |
| HIGH | Content | `app_providers.dart:176-180,343-348`; `garage:1318` | Reminders and the "upcoming" preview are creation-ordered; overdue can sit below safe | Sort by `urgency` then `kmRemaining` in the provider |
| HIGH | Content | `glovebox_screen.dart:258-419`, `vehicle.dart:608-627` | No attachment field, thumbnail or failure state — the product's own promise is unmet | `imagePath` + `image_picker`; 56dp thumb with a broken-image fallback |
| HIGH | Touch | `maintenance:635-641,838-844,1031-1037`; `fuel:505-511`; `glovebox:405-411` | Destructive delete is a single tap, no confirm, no undo | `SnackBar(action: Undo)` over a soft-delete buffer |
| HIGH | Platform | `grep Platform.isIOS` = 0; `navigation_shell.dart:33-64` | Material `NavigationBar`, Material dialogs and `BouncingScrollPhysics` on iOS; no platform branch | Adaptive nav shell, or an explicit written decision in `foundations.md` |
| HIGH | Design system | `garage_achievements_card.dart:47-49`; `garage_gamification.dart:38-62` | Emoji (`🚗 🔧 🛡️ ⚡ 👑`) used as icons, against `components.md:42` | Material symbols, or the Tori mascot poses the repo already ships |
| MEDIUM | Hierarchy | `garage:593-710` | Seven stacked cards; the score, the XP level and four KPIs all claim to be the hero | Keep hero + oil + upcoming; move achievements and TCO behind a details route |
| MEDIUM | Visual | `garage:1652-1699`; `fuel:609-657`; `glovebox:80-82` | `PressScale` wraps six *static* metric cards with no `onTap` — a press animation that goes nowhere | Remove it, or give each card a destination |
| MEDIUM | States | `settings:35-84` | Backup/export/import failure is SnackBar text only; no retry, no inline error | `FleetStateSwitcher` + retry; the component already exists and is unused |
| MEDIUM | Performance | `fuel:341,461` | Spread `...logs.map` in a `SingleChildScrollView` builds every row eagerly | `CustomScrollView` + `SliverList.builder` |
| MEDIUM | Motion | `AppMotion.resolve` 7 uses vs `duration: const Duration` 7 | Half the animations ignore reduced-motion | Resolve every explicit duration |
| POLISH | Motion / visual | 0 `Hero`, 0 `ShaderMask`, 0 `AnimatedOpacity`; `garage:1196-1310` | No shared-element transition between row and sheet; TCO dots imply a bar that is not drawn | `Hero` on the vehicle badge; draw the 3-segment bar or drop the dots |

---

## 7. Harsh verdict

1. **Design system on paper, copy-paste habit in code.** The docs name the palette and the
   components; the repo ships `TapTarget`, `FleetStateSwitcher` and `FleetShimmerCard` to enforce
   them; the screens use the palette and skip the components (`TapTarget` 0 call sites, `TextTheme`
   0 definitions). Not a taste disagreement — an unused API.
2. **The product logic is better than the interface.** `kmUntilNextOilChange`, `urgency()`,
   `daysUntilTaxDue` and the TCO split are real, tested domain maths — then the dashboard sorts them
   by insertion order and shows the same countdown three times. The app knows what matters; the
   screen does not.
3. **Typography is the whole problem:** 244 `fontSize` literals across 16 values, 182 inside a 4-step
   band, with the *verdict* label at 10sp. Fix the scale and half of these findings get cheaper,
   because spacing, hierarchy and a11y all key off it.

---

## 8. Competitor analysis

Scope: apps solving the same job — log vehicle service, track fuel economy, never miss a document
renewal. Compared at IA and feature level; verify specifics before build.

| Product | Model | Core IA | What they do that GarageGo does not |
|---|---|---|---|
| **Drivvo** | freemium, BR/ID | Vehicle switcher up top; per-vehicle Refuel / Services / Expenses tabs; next-service countdown is a *bar* | Per-fill cost-per-km history; garage-wide expense report |
| **aCar** | freemium | Reminders are a first-class tab with push scheduling; km and date triggers shown separately | Reminder notifications — GarageGo has none, it is a passive log |
| **MyCar / CARFAX Car Care** | free, dealer-linked | Service history by shop with receipt attachments | Receipt/photo attachment per service record |
| **Rivian** (in-app) | OEM | `Since last rotation 6,385 mi` against `Reminder every 8,000 mi`, one bar per consumable | Consumable progress with a labelled interval |
| **My BMW** | OEM | `NEXT SERVICES` ordered by urgency; each row reads `Due in October 2025 **or** 11,000 km` | Dual-trigger phrasing and urgency sort |
| **Apple Wallet / Google Wallet** | platform | Documents as cards with a thumbnail, a state header (`Expired`) and a date — never a countdown per row | Visual document identity + archive-by-state |

**Positioning gap.** GarageGo sits between a maintenance log and a document wallet and commits to
neither: the log is excellent (verified arithmetic, dual-trigger model, TCO), the wallet is a
spreadsheet with dates. Its differentiators — 100% offline, no account, no ads, Indonesian tax
vocabulary (PKB, STNK) — are worth protecting. The attackable gap: GarageGo computes everything on
open and schedules nothing. **Three moves worth copying, cheapest first:** urgency sort + "or"
phrasing (My BMW — one provider sort, one string); a labelled per-consumable progress bar (Rivian);
document thumbnails with an "Expired" archive (Wallet — the feature that justifies "glovebox").

---

## 9. Mobbin reference delta

Pulled with `mobbin screens "<query>" --platform ios --limit 4 --previews --deep` across four
archetypes (`vehicle garage maintenance log`, `car service reminder`, `fuel log odometer`, `document
expiry wallet`), downloaded with `mobbin download`, read as rendered images.

### 9.1 Consumable progress → Rivian · `mobbin.com/screens/ff300ecc-6839-447a-8104-3c7807143534`

| Dimension | GarageGo | Rivian | Verdict |
|---|---|---|---|
| Due value | chip, 11sp/w700: `500 km remaining` | numeral, ~56pt: `6,385 mi` | **worse** — ours is the smallest element in its card |
| Interval label | `Every 5.000 km` at 12sp in the same row | `Reminder every 8,000 mi` at 16pt directly under the bar | worse — the interval is decoupled from the bar it explains |
| Bar | 6dp, colour = urgency only | 8dp filled vs track, one per consumable | equal geometry, **worse placement** |
| Assets | 16dp icon chip | 130dp photo of the actual wheel | worse — no object identity |
| Action | `Reset Oli` styled like a filter, competing with the title | one `Edit` link, right-aligned under the reminder | worse |

### 9.2 Reminder queue → My BMW · `mobbin.com/screens/fbbd81ca-7614-4e75-8d50-94907c1cc870`

| Dimension | GarageGo | My BMW | Verdict |
|---|---|---|---|
| Order | insertion order (`app_providers.dart:176-180`) | urgency: overdue first, then date | **worse** — `iphone69-2.png` puts `Overdue` below `Due Soon` |
| Dual-trigger copy | two numbers stacked: `Overdue by 4500 km` + `245 days left` | one sentence: `Due in October 2025 or 11,000 km` | worse — ours reads as a contradiction |
| Row anatomy | 7 elements incl. 2 icon buttons + done button | 4: icon, title 17pt, meta 15pt, chevron | worse — 7 affordances where the job is "tell me what's next" |
| Overdue emphasis | red pill `Overdue` | red sentence `Overdue since November 2024` + red icon | equal colour, **worse wording** — a date beats a duration |
| Empty section | centred icon + title + body + button | section absent | different; ours is friendlier |

Counterpoint, `mobbin.com/screens/a5c5ac5e-9feb-4e66-9628-1c19e04c65cf`: Mercedes-Benz renders
**exactly one** alert — a 60dp amber row, `Maintenance service is overdue`, whole row tappable —
where GarageGo stacks three reminder cards, a warning strip and four KPIs. Their screen answers
"what do I do"; ours answers "what do I have".

### 9.3 Odometer / fuel entry → Turo · `mobbin.com/screens/bc45eb95-212b-4d83-93df-fe0944c11a3a`

| Dimension | GarageGo | Turo | Verdict |
|---|---|---|---|
| Field layout | stacked `TextFormField`s in an `AlertDialog`, label above value | label 17pt left, value 17pt right, one 50pt row | **worse** — 5 stacked fields + checkbox + live preview in one dialog |
| Unit + keyboard | unit buried in the label (`Kilometer (Odometer / KM)`); system keyboard, no toolbar | unit inline after the number (`35,414 miles`); numeric pad with an explicit `Done` bar | worse on both — no dismissal affordance of our own |
| Live arithmetic | cost, trip distance, km/L, cost/km preview (`fuel:148-253`) | none (task is capture) | **better** — our live preview is the best idea on this screen; keep it |
| Error placement | validator text under the field on submit | inline on the value | equal |

### 9.4 Document wallet → Apple Wallet · `mobbin.com/screens/4e2bd1e9-9a04-46ba-9bd9-db7093ace671`

| Dimension | GarageGo | Apple Wallet | Verdict |
|---|---|---|---|
| Identity | 38dp generic icon per type | 78×78 thumbnail of the actual pass | **worse** — three STNKs look identical |
| State | countdown pill on every row (`75 days remaining`) | grouped by state: an `Expired` section excludes live passes | worse — a countdown on 6 rows is noise; one state header is a decision |
| Density | 7 text nodes incl. number, cost, note | 3 lines: title 17, subtitle 15, date 15 | worse — the number is longer than the name |
| Date | `Valid until 1/25/2027` | `13 Dec 2025` | equal |
| Attachment | none | the thumbnail *is* the attachment | worse — capability missing |

### 9.5 Expired-state treatment → Keeta · `mobbin.com/screens/3736cc4b-3d9c-4988-80d5-707026404245`

GarageGo signals expiry with red text + a red pill + a red icon and leaves the card identical.
Keeta dims the whole card to ~40% opacity, adds a grey `Expired` pill and `Expired on 06 Dec 2025`,
and separates `Used / Expired / Invalid` into tabs — **worse** for us on two counts: colour alone
does not survive greyscale or colour-blindness, and one tap does not answer "what lapsed".

**Cross-cutting deltas**

| Component | GarageGo | Reference norm | Action |
|---|---|---|---|
| Due-ness | 11sp chip | 22–56pt numeral + labelled bar | `DueProgress` |
| Reminder row | 7 affordances | 4 + swipe for secondary | `ScheduleRow` |
| Document row | 38dp icon + 5 text nodes | 78dp thumb + 3 text nodes | `DocumentRow` |
| Entry form | `AlertDialog`, 5 stacked fields | full-height sheet, label-left rows, pinned submit | `SpringSheetScaffold` |
| Expired state | colour only | opacity + pill + date + section | card treatment |
| Primary action | floating bar over content | pinned bar / app-bar action | relocate |

---

## 10. Missing features, screens and components

Ranked by user value per hour of work.

| Screen | Why it matters | Reference |
|---|---|---|
| **Vehicle detail** (`/garage/:id`) | The hero card summarises a page that does not exist; odometer edit has no home | MyCar |
| **Service log detail** (`/service/:id`) | Notes, workshop, parts and future receipts have no surface | CARFAX Car Care |
| **Document detail** (`/glovebox/:id`) | Attachment, renewal history and cost-per-year belong here | Apple Wallet |
| **Add fill-up as a sheet** (`/fuel/new`) | Fixes keyboard, validation and preview at once | Turo |
| **Month/garage overview** | "What needs money this month" is the fleet owner's actual question | Drivvo |

**Features missing:** photo attachments on documents and service logs (`image_picker` absent);
urgency sort on schedules and documents (data already exists); local notifications for service / tax /
STNK (the app computes a due date then never tells anyone); undo on delete (5 destructive paths, 0
undo); edit a fuel log (`fuel:505-511`); an odometer correction path with validation (today a
fat-fingered 250.000 km poisons every due calculation silently); per-year cost report (TCO exists,
the report does not).

**Components missing:** `DueProgress` · `ScheduleRow` · `DocumentRow` · `AttachmentPicker` +
`AttachmentThumb` · `AlertBanner` · `SectionHeader` with an action slot · `UndoBar` · an
`EmptyAddFirst` variant per entity. `FleetLoadingView`, `FleetStateSwitcher`, `FleetShimmerCard`,
`TapTarget` and `SpringSheetScaffold` already exist unused.

---

## 11. Improvement plan

Effort in engineer-hours for one developer who knows the codebase.

### P0 — broken (13–15 h)

| # | Change | Files | Effort | Score delta |
|---|---|---|---|---|
| P0-1 | `app_typography.dart` (6 steps), wire `textTheme:` into both themes, delete 244 inline `fontSize` | `app_theme.dart`, 7 screens + 6 sheets | 5 h | Typography 25 → 58 |
| P0-2 | One locale-aware number + currency helper; remove 14 `'id_ID'` literals | `garage:280,623,1003,1616`; `maintenance:326,680,859,1052`; `fuel:25,303,520`; `glovebox:21`; `share_dialog:113,204` | 1.5 h | Hierarchy/copy +6 |
| P0-3 | Category and fuel type as stable IDs, localise at render; migrate stored strings | `vehicle.dart:377-424,608`; `maintenance:615,818`; `fuel:496` | 3 h | Typography/i18n +5 |
| P0-4 | Accessible names: 11 tooltips, theme segments labelled, `MergeSemantics` on compound rows | `settings:269,342-355`; `maintenance:619,635,838,1031`; `fuel:505`; `glovebox:405` | 2 h | A11y 45.5 → 62 |
| P0-5 | Kill 22 presentation `Color(0x…)` (health + fuel tokens) | `garage:728`; `fuel:221`; `app_colors.dart` | 1 h | Color 50 → 72 (cap lifts) |
| P0-6 | 48dp floor on chips and icon buttons; adopt `TapTarget` at the 5 tap-owning sites | `garage:481-483`; `maintenance:439`; `fuel:752` | 1.5 h | Touch 55 → 68 |

### P1 — system (15–18 h)

| # | Change | Files | Effort | Delta |
|---|---|---|---|---|
| P1-1 | Sort schedules by `urgency` then `kmRemaining`; "upcoming" = first 3 of the sorted list; documents by `daysRemaining` | `app_providers.dart:343-355`; `garage:1318` | 1.5 h | Content 65 → 80 |
| P1-2 | `DueProgress`: numeral + labelled bar + state chip across oil, schedule and document rows | new `core/ui/due_progress.dart`; 3 screens | 4 h | Hierarchy +8, Visual +4 |
| P1-3 | `ScheduleRow`: 4 elements, swipe-to-edit / swipe-to-delete with `UndoBar` | `maintenance:594-713` | 3 h | Touch +6, Hierarchy +4 |
| P1-4 | Document photos: model field, `image_picker`, 56dp thumbnail, broken-image fallback | `vehicle.dart:608`; `add_document_sheet.dart`; `glovebox:295-419` | 4 h | product-defining; States +6 |
| P1-5 | Settings bottom inset + one nav-height constant; inspection sheet drops its fixed height and adds `viewInsets` | `settings:184,800`; `navigation_shell.dart:26`; `garage:24`; `inspection_sheet.dart:66-69` | 1.5 h | Layout +7 |
| P1-7 | Fuel add → `SpringSheetScaffold` form; keep the live preview | `fuel:36-295` | 2 h | Platform +4, Hierarchy +3 |

### P2 — polish (9–12 h)

| # | Change | Effort | Delta |
|---|---|---|---|
| P2-1 | Local notifications for service / tax / STNK due dates | 4 h | product, not score |
| P2-2 | Trailing `ShaderMask` fade on the vehicle switcher; move "Quick Actions" to an app-bar action | 1.5 h | Layout +2, Visual +4 |
| P2-4 | Replace emoji level icons with Material symbols or mascot poses | 1 h | compliance |
| P2-5 | Expired documents: dimmed card + `Expired` section; remove `PressScale` from 6 static cards | 2 h | States +4, Touch +3 |
| P2-6 | `Hero` on the vehicle badge; `AppMotion.resolve` everywhere | 1.5 h | Motion 50 → 70 |

**Projected after P0+P1:** 51.6 → ~74 (C). After P2: ~84 (B). A true **A** still needs the entity
routes and detail screens from §10, an end-to-end attachment pipeline, and a 1.6× text-scale pass
with evidence.

---

## 12. Definition of done

- [ ] `grep -c "textTheme" lib/core/theme/app_theme.dart` ≥ 2, and `grep -rc "fontSize:" lib/features`
      → 0 outside `app_typography.dart`
- [ ] `grep -rc "Color(0x" lib/features` → 0, and no `"id_ID"` in `lib/`; every number comes from
      `Localizations.localeOf(context)`
- [ ] `grep -c "TapTarget(" lib/features` ≥ 5, or the 44pt rule is removed from `components.md`
- [ ] All 17 `IconButton`s carry `tooltip:`, theme segments carry a label, `MergeSemantics` is on every
      compound row, and no target is below 48dp (`press_scale_tap_test.dart` asserts chip + app bar)
- [ ] Schedules render overdue-first, documents expired-first, each proven by a widget test; a
      document holds a photo, its row shows a thumbnail, a missing file renders a fallback
- [ ] Delete on all 5 paths offers Undo
- [ ] 320dp and 1.6× text scale render with zero overflow (both added to `store_overflow`'s matrix;
      `docs/store/screenshots/overflows.txt` stays empty)
- [ ] `iphone69-{1..5}.png` re-rendered: no `…` on a KPI label, no `5.000` in en-US, no Indonesian
      category on an English screen — and the scorecard re-run ≥ 85 with evidence

---

## Appendix — method and reproduction

- Sitemap and counts parsed from `docs/design-audit/_inventory.json` (`app == "garagego"`): 8 routes,
  7 screens, `unrouted_screens: []`, `imperative_nav: 0`. Code counts by `grep -o` over
  `lib/**/*.dart`; `Navigator.push` = 0, and `Navigator.pop` is excluded from nav debt (dialog
  dismissal ≠ navigation). The `Semantics` inventory of 18 = 10 `Semantics(` + 8 `semanticLabel`,
  the 10 including 2 inside `lib/core/ui/` and 1 inside a test-only widget.
- Per-directory `Color(0x` splits: garage 21, fuel 1, constants 34, core/ui 16. `TextStyle(` splits:
  garage 75, maintenance 50, settings 44, fuel 28, glovebox 21, gamification 11, core/ui 10,
  core/theme 20. `fontSize` bucketing: 244 declarations, 16 values, 54 below 12sp, 35 at ≥16sp.
- Renders: `docs/store/metadata/ios-screenshots/en-US/iphone69-{1..5}.png` and
  `docs/store/metadata/android/en-US/images/phoneScreenshots/{1..5}.png`, from
  `test/store_screens/store_screens_test.dart`; `docs/store/screenshots/overflows.txt` read and empty.
  Tests read but not executed: `test/trace/ui_guard_test.dart` (contrast scan, 5 tabs × 2 themes at
  900×1900), `test/trace/press_scale_tap_test.dart`, `test/store_screens/store_landscape_test.dart`.
- Mobbin: 4 deep searches, 6 references downloaded and read as images; URLs are canonical
  `mobbin.com/screens/<id>`; preview links expire after 30 days. No source, pubspec, test or asset file
  was modified — this document is the only change.
