import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/ui/press_scale.dart';
import 'package:garagego/core/ui/tap_target.dart';

void main() {
  // TapTarget(child: PressScale(...)) is the documented pattern for icon
  // actions (bookmark). PressScale must not steal the tap from TapTarget.
  testWidgets('PressScale di dalam TapTarget tetap meneruskan ketukan', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: TapTarget(
              semanticLabel: 'Simpan aturan',
              haptic: false,
              onTap: () => taps++,
              child: const PressScale(child: Icon(Icons.bookmark_border)),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  // enabled:false never builds, so the lazy controller used to be created
  // inside dispose() and threw.
  testWidgets(
    'FLOW-GAR-01-T07 PressScale(enabled: false) dibuang tanpa error',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: PressScale(enabled: false, child: Text('x'))),
      );
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      expect(tester.takeException(), isNull);
    },
  );
}
