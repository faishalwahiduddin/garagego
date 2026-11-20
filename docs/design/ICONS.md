# GarageGo icon set

Custom SVG icons for the bottom nav and the main domain glyphs. Files live in
`assets/icons/` (bundled); render them with `AppIcon('name')`
(`lib/core/ui/app_icon.dart`). Preview sheet: `test/icons/goldens/icon_sheet.png`
(regenerate with `flutter test test/icons/icon_set_test.dart --update-goldens`).

## Style spec

- **Personality:** technical, sturdy, precise (workshop / dashboard instrument).
- **Grid:** 24x24, `viewBox="0 0 24 24"`, 2px safe padding (live area 2–22; a
  stroke may touch 2.5 only for handles and wheels).
- **Stroke:** 1.75, `stroke-linecap="round"`, `stroke-linejoin="round"`.
- **Corners:** machined, tight: rx 1.5 on bodies, 0.75–1 on inner details.
  Straight edges and true circles; no organic curves.
- **Fill:** outline + duotone. Secondary shape (windshield, tank, display
  window, folder flap, gauge face, roof/body) is filled at
  `fill-opacity="0.3"`. Small key details (headlights, needle hub, oil drop)
  are solid.
- **Colour:** draw only with `currentColor`; `AppIcon` tints with srcIn, so
  only alpha matters. No `<style>`, text, raster, root transforms or
  width/height.
- **Nav states:** inactive = pure outline (`nav_x`); selected = same outline
  plus the duotone secondary fill (`nav_x_active`). Domain icons always use the
  duotone variant.

## Inventory

| File | Meaning | Used in |
|------|---------|---------|
| `nav_garage(_active)` | garage with shutter | nav tab Garage |
| `nav_service(_active)`, `wrench` | spanner | nav tab Service; dashboard quick action, service history rows, maintenance history empty state |
| `nav_fuel(_active)`, `fuel_pump` | fuel pump | nav tab Fuel; quick action, fuel metric/KPI, fuel empty state |
| `nav_glovebox(_active)`, `document` | document folder | nav tab Glovebox; glovebox header, empty state, BPKB/other docs |
| `car`, `motorbike` | vehicle avatar | vehicle card, chips, garage empty state |
| `engine_oil` | oil can + drop | oil change card |
| `service_schedule` | stopwatch | schedule quick action, reminders card, schedule tab + empty state |
| `odometer` | gauge with needle | odometer metric, fuel efficiency KPI |
| `registration` | STNK card | tax/STNK card, STNK documents |
| `inspection` | clipboard checklist | inspection quick action, tab, buttons, empty state |
| `cost` | banknote | total cost (TCO) metric |

Kept as standard Material icons: settings gear, add, share, delete, edit,
close, chevrons, search, more, check, status icons (overdue/due/safe),
insurance, emission, SIM.
