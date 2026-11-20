# Design Audit — GarageGo

**Date:** 2026-11-20 · **Version:** 1.1.2+22 · **Grade: 56.5 / 100 — F**
**Mode:** deep (7 routed screens + 6 form sheets + tokens + real iOS/Android/iPad renders)
**Reviewer stance:** senior mobile designer. Grades are earned; "looks fine" is a C at best.

> **Read the grade correctly.** User-facing severity is **D**: the palette is disciplined, the
> information architecture is honest, and nothing is unusable. System-integrity severity is **F**:
> 259 raw `TextStyle(` blocks (37 per product screen, the worst typography sprawl in the fleet),
> `TextTheme` never populated, 40 presentation colour literals outside the token file, and
> four of five product screens with **zero** `Semantics`. The composite lands at 56.5 — four points
> under the C band — because those failures multiply across every future screen.
> The fix is **systematise, do not redesign**: the layout and palette ideas are already right.

---

## 1. Snapshot

| Field | Value |
|---|---|
| Product | GarageGo — personal vehicle garage, service/fuel log, tax & document tracker |
| Version | `1.1.2+22` |
| Platform | Flutter Web (CF Pages) + Android + iOS · Material 3 · light + dark |
| Dart files | 65 |
| Routes / screens | 8 routes / 7 screens (5 product + splash + onboarding) |
| Router | `lib/core/router/app_router.dart` — `StatefulShellRoute.indexedStack`, 5 branches, no root-level modal route |
| State | Riverpod 3.x, offline-first (`shared_preferences`), no backend, no account |
| Locales | 8 (`id, en, ar, jv, su, zh, ja, es`) — 513 ARB keys each |
| Design tokens | `lib/core/constants/app_colors.dart` (24 named colours) + `lib/core/theme/app_theme.dart` (279 L) + `app_motion.dart` (Tier 3) |
| Documented system | `DESIGN.md` → `docs/reference/design-system/{foundations,components}.md` |
| Test rigour | 7 unit files + `test/trace/` (contrast scan, nav-overlap, press-scale) + `test/store_screens/` (overflow + landscape) — **above fleet average** |

**The two numbers that matter.**

1. `docs/reference/design-system/components.md:39` states:
   > *"**Dilarang** menulis `Color(0x...)` literal langsung di widget presentation."*

   Measured:

   | Layer | `Color(0x…)` literals |
   |---|---|
   | `lib/core/constants/app_colors.dart` (legal token file) | **32** |
   | `lib/features/garage/widgets/garage_share_dialog.dart` | **17** |
   | `lib/core/ui/` (splash 5, onboarding 5, app config 3) | **13** |
   | `lib/features/fuel/fuel_logs_screen.dart` | **1** |
   | remaining one-off literals in theme/readable helpers | **9** |
   | **total** | **72** |

2. `AGENTS.md:85-86` repeats the same ban and `components.md:46` promises a 1.6× text-scale
   ceiling. Both are contradicted by the type layer: **259** `TextStyle(` constructions and
   **242** explicit `fontSize:` declarations, with `TextTheme` never configured in `app_theme.dart`
   (`app_theme.dart:6-141` has no `textTheme:` entry).

---

## 2. Sitemap

Parsed from `lib/core/router/app_router.dart` — 8 route nodes, matching the fleet inventory exactly.

```
/splash                      → FleetSplashScreen        core/ui/fleet_splash_screen.dart (294 LOC)
/onboarding                  → FleetOnboardingScreen    core/ui/fleet_onboarding_screen.dart (1003)
├─ (shell) /                 → GarageDashboardScreen    features/garage/garage_dashboard_screen.dart (1701)
├─ (shell) /maintenance      → MaintenanceScreen        features/maintenance/maintenance_screen.dart (1071)
├─ (shell) /service          → MaintenanceScreen(tab 1) features/maintenance/maintenance_screen.dart (1071)
├─ (shell) /fuel             → FuelLogsScreen           features/fuel/fuel_logs_screen.dart (658)
├─ (shell) /glovebox         → GloveboxScreen           features/glovebox/glovebox_screen.dart (427)
└─ (shell) /settings         → SettingsScreen           features/settings/settings_screen.dart (1041)
```

Structural notes:

- **Shell is correct.** `StatefulShellRoute.indexedStack` (`app_router.dart:29`) gives each tab its
  own Navigator, so scroll and tab position survive switching. `Navigator.push` is used **0 times**.
- **`/service` is a second route onto the same widget** (`app_router.dart:51-54`) used only to open
  tab 1 ("also used by store captures"). It is a capture hook wearing a route's clothes — a user
  who deep-links `/service` gets a screen whose tab state is otherwise untracked in any URL.
- **No entity routes.** A vehicle, a service log, a fuel fill, or a document has no address. There
  is no `/vehicles/:id`; the only identity in the app is provider state. Share links cannot open
  an item, and iOS back-swipe never exists because nothing is ever pushed.
- **Five destinations on the shell** (`navigation_shell.dart:46-76`) with `extendBody: true` and a
  glass bar (`navigation_shell.dart:31-39`). The dashboard compensates with an 80dp FAB lift
  (`garage_dashboard_screen.dart:24`, `:384-404`) and 96dp list padding (`:468-473`) — correct, and
  the only screen that paid the nav bar its tax properly.
- **Three tabs nested inside bottom-nav item 2** (`maintenance_screen.dart:52-56`, `:336-386`):
  Schedules / History / Inspections. A horizontal `TabBar` inside a persistent 5-item bottom bar is
  two navigation hierarchies stacked, and the tab state is invisible to the route.

---

## 3. Screen inventory

| # | Route | Screen | LOC | Archetype | Primary action | Loading | Empty | Error | Offline |
|---|---|---|---|---|---|---|---|---|---|
| 1 | `/` | GarageDashboardScreen | 1701 | Home / dashboard | Quick Actions (FAB) | ✗ | ✓ (`:405-463`) | ✗ | n/a (local) |
| 2 | `/maintenance` | MaintenanceScreen | 1071 | List + detail tabs | Mark Done / Reset | ✗ | ✓ (`:525-570`) | ✗ | n/a |
| 3 | `/service` | MaintenanceScreen | 1071 | Service history | Add service log | ✗ | ✓ (`:761-792`) | ✗ | n/a |
| 4 | `/fuel` | FuelLogsScreen | 658 | Log + statistic | Add fill-up | ✗ | ✓ (`:421-459`) | ✗ | n/a |
| 5 | `/glovebox` | GloveboxScreen | 427 | Document vault | Add document | ✗ | ✓ (`:207-256`) | ✗ | n/a |
| 6 | `/settings` | SettingsScreen | 1041 | Settings | export / import | ~ (`:719-731` "…") | n/a | ✓ snackbar (`:45-50`) | n/a |
| — | `/splash` | FleetSplashScreen | 294 | Launch | — | — | — | — | — |
| — | `/onboarding` | FleetOnboardingScreen | 1003 | Onboarding | finish | — | — | — | — |

Every product screen designs an **empty** state with icon + title + body + CTA — the single strongest
systematic behaviour in the app, ahead of most of the fleet. **No screen designs a loading state** and
none needs one on the happy path (all data is synchronous `shared_preferences`), but the two genuinely
async operations — backup export/import (`settings_screen.dart:35-84`) — show no progress surface,
only a terminal snackbar.

---

## 4. Screen anatomy

Values below are read from the code, not the design docs.

### 4.1 Dashboard (`garage_dashboard_screen.dart`)

| Section | Components | Type / colour | Verdict |
|---|---|---|---|
| App bar | logo tile 34dp + wordmark + share + add | 19/w800 `context.textPrimary` (`:311-319`) | Wordmark is the title: the screen has no contextual name |
| Vehicle switcher | 40dp-tall horizontal `ListView.separated` of `AnimatedContainer` pills (`:481-590`) | 12/w600–700 name, **10**/w700 plate, radius 20 | Active pill is unmistakable (solid `brandFill`, white text, `:518-527`). Clips at the right edge with no fade (`iphone69-1`, android `1.png`) |
| Health hero | `Card` radius 16, 52dp icon tile, 48dp score ring, warning strip, share link (`:720-917`) | name 17/w800, plate 11, score **15**, status **10**, warning **11** | The score — the reason the card exists — is 15sp; the word under it is 10sp |
| Achievements | emoji tile, level badge, XP line, 7dp progress, 4×N badge grid (`garage_achievements_card.dart:22-250`) | level 15, XP 12, badge label **10** | Largest card on the screen, least useful: 8 badges + 4 share icons + a truncated next-level line, above the odometer |
| Metric grid | 2×2 `_buildMetricCard` (`:613-674`, `:1645-1700`) | title 11/w600, value 15/w800 | Four numbers, four units (`km`, `Rp/km`, `km/L`, `Rp`) — units present, label below legibility floor |
| Oil status | progress + remaining chip (`:919-1043`) | interval 12, remaining **11** | Honest dual-trigger model, but the bar has no legend |
| Tax card | two nested tiles PKB / plate (`:1045-1194`) | label 11, value 14 | Duplicates `glovebox_screen.dart:128-188` exactly, one tab apart |
| TCO | 3 dot+label+amount columns (`:1196-1268`) | label 11, amount 13 | Three equal columns on a 360dp phone → the amount shrinks first |
| Upcoming | up to 3 rows + "See all" (`:1312-1477`) | title 12, chip 11 | Shows km remaining only; the date trigger lives one screen away |
| Recent services | up to 3 rows (`:1479-1643`) | title 13, meta **11**, cost 13 | Correct row anatomy (item / odo+date / cost) — the best list in the app |

### 4.2 Maintenance (`maintenance_screen.dart`)

- Header: "Service: <vehicle>" at 18/w800 (`:330-335`), then a 48dp `TabBar` with icon+label
  ("Schedules (6)") at 13sp (`:342-383`).
- Filter bar: 3 `ChoiceChip`s at 12sp plus a `PopupMenuButton` (`:431-521`). "All / Attention / Safe"
  is the right filter count; it is not remembered across visits (`_scheduleFilter` is local state,
  `:46`).
- Schedule card: urgency pill, category, **edit + delete icon buttons with `visualDensity.compact`**
  (`:619-641`), title 15/w700, km + days row, interval summary 11sp, divider, "Mark Done / Reset"
  text button (`:692-705`). ≈200dp per card; only ~2.5 cards fit a phone viewport (`iphone69-2`).
- History: search + filled add button (`:739-757`), then cards with category chip, workshop, date,
  trash (`:809-846`), title, odometer, notes, divider, cost (`:848-880`). All four scannable fields
  are present; they are spread over four rows where a two-line row would do.
- Inspections: same card grammar, pass-percentage pill, date, odometer (`:894-1070`).
- **Every delete is immediate** (`:638-640`, `:841-843`, `:1034-1036`). No confirm, no undo.

### 4.3 Fuel (`fuel_logs_screen.dart`)

| Section | Components | Values | Verdict |
|---|---|---|---|
| KPI grid | 2×2 cards (`:351-407`, `:602-657`) | title 11/`maxLines: 1`, value 15/w800 | "Average Fuel Econ…" truncates on iPhone (`iphone69-4`) and fits on Android (`4.png`) — width-dependent, not content-aware |
| History header | 14sp section label (`:410-418`) | — | Section labels are all 14sp: consistent, if flat |
| Fill row | litres pill, fuel-type pill, date, trash; odo + total; price + full-tank + km/L badge; station (`:461-593`) | pills 11, odo 15, price 12, km/L 11, station 11 | Six facts per row, three in 11sp. The km/L badge appears only from the second fill, with no explanation why the first has none |
| Live preview in form | 4 computed lines inside the dialog (`:148-253`) | labels 11–12, values 11–14 | Genuinely good product thinking — the only place that explains the arithmetic before saving |

### 4.4 Glovebox (`glovebox_screen.dart`)

- Header card (16/w800 title, doc count) + two tiles: PKB and 5-year plate with `daysRemaining`
  (`:79-193`). Those two numbers are then repeated verbatim in the document list below
  (`:335-345`) — the same "75 days remaining" twice in one viewport (`iphone69-5`).
- Document rows: 38dp icon tile, title 14, number 12, status pill 11, "Valid until" 12, cost 13,
  notes 11, Edit text button + trash (`:295-418`). Delete is immediate (`:405-411`).

### 4.5 Settings (`settings_screen.dart`)

- Six sections in one `ListView`: fleet (`:187-285`), appearance & language (`:289-446`), backup
  (`:449-603`), reset (`:606-698`), about (`:699-797`), commercial contact (`:799`).
- **Good**: the timezone row is wrapped in `Semantics(button: true, label: …)` with a stable
  `Key('btn-timezone')` (`:403-442`), and the timezone sheet labels every option (`:865-936`).
  The only screen that takes accessibility seriously — it proves the team knows how.
- **Bad**: deleting a vehicle is one tap on a 20dp trash icon with **no confirmation**, and it
  cascade-deletes five collections (`settings_screen.dart:268-281` → `app_providers.dart:36-47`).
  The most destructive action in the app is the least guarded.
- Theme switch is an icon-only `SegmentedButton` with `minimumSize: Size(48, 44)`
  (`settings_screen.dart:329-362`) — 4dp short of Material's 48dp, and the segments have no text
  labels, so a screen reader gets three unlabelled buttons.

### 4.6 Splash & onboarding

Both are fleet-shared and visually more confident than the product screens: a 1003-LOC onboarding
with real page hierarchy (`fleet_onboarding_screen.dart`) and a 294-LOC splash. They also hold 10 of
the 40 presentation colour literals (`fleet_splash_screen.dart:5`,
`fleet_onboarding_screen.dart:5`) — the shared layer is not the token-clean layer.

---

## 5. Visual evidence review

Source: `docs/store/metadata/ios-screenshots/en-US/iphone69-{1..5}.png` and `ipad13-1.png`;
`docs/store/metadata/android/en-US/images/phoneScreenshots/{1,2,4}.png` (1080×1920). Device renders
produced by the store harness, not marketing mockups.

### 5.1 What the renders show

| # | Severity | Finding | Evidence | Fix |
|---|---|---|---|---|
| 1 | **HIGH** | The vehicle switcher clips the second pill mid-plate on iPhone and shears the plate entirely on Android. With 4+ vehicles the active vehicle can start off-screen and there is no scroll cue. | `iphone69-1.png` ("Honda Vario" cut), `1.png` ("Honda Vario 160" + plate clipped) | `ShaderMask` fade on the trailing 24dp, or a dropdown showing "2 of 3"; scroll the active pill into view on first build |
| 2 | **HIGH** | A KPI label truncates to "Average Fuel Econ…" on the narrower iPhone column yet fits on Android — a data label lost to `maxLines: 1` on an 11sp title. | `iphone69-4.png` vs `4.png`; `fuel_logs_screen.dart:629-638` | Allow 2 lines, or shorten the label, and raise it to 12sp |
| 3 | **HIGH** | Schedule cards show two independent remaining values with no statement of which trigger fired: one card reads "Overdue by 4500 km" and "245 days left" in the same breath. | `iphone69-2.png`, `2.png`; `maintenance_screen.dart:655-676` | One verdict line — "Overdue on distance (4,500 km past) · time OK (245 days)" — or a two-segment gauge |
| 4 | **MEDIUM** | Thousands separators appear and disappear between screens: "Odo: 24.100 km" in history vs "Overdue by 4500 km" and "Last: 20000 km" in schedules. | `iphone69-3.png` vs `iphone69-2.png`; formatted at `maintenance_screen.dart:859`, raw at `:659-661`, `:683` | One `NumberFormat('#,###')` helper at every call site; assert no four-digit run without a separator |
| 5 | **MEDIUM** | The achievements card is the largest block on the dashboard, its next-level line truncates ("(1,000 …"), and the Quick Actions FAB covers bottom-row badge tiles. | `iphone69-1.png`, `1.png` | Move achievements below the metrics; one badge row + "See all"; 16dp gap above the FAB |
| 6 | **MEDIUM** | Glovebox prints "75 days remaining" twice in one viewport (header tile + document row), and the same figure again on the dashboard tax card. | `iphone69-5.png`; `glovebox_screen.dart:146-153` vs `:341-344` | Header tiles become a compact "PKB · 75 d" summary that scrolls to the row; one source of truth |
| 7 | **POLISH** | The odometer metric is labelled "Odometer (km)" and valued "24.500 km" — the unit prints twice. | `ipad13-1.png`; `garage_dashboard_screen.dart:621-623` | Label "Odometer", value "24.500 km" |

What the renders get **right** and must not be thrown away: the orange/slate palette (unique in a
fleet of blue apps), the solid-pill active-vehicle state, the category chip + workshop + date header
row, the 16dp card radius with a hairline border, the 2×2 metric rhythm, and the empty states.

### 5.2 Domain integrity checks

An audit of a maintenance log is worthless if the log lies. Each check is answered from code plus a
real render.

| Check | Verdict | Evidence |
|---|---|---|
| Units on every number, consistent across screens | **Partial** | Units appear on every figure (`km`, `L`, `km/L`, `Rp/km`, `days`) — `garage_dashboard_screen.dart:623-667`, `fuel_logs_screen.dart:519-560`, `maintenance_screen.dart:858-861`. But number *formatting* is inconsistent: `#,###` at `maintenance_screen.dart:859` and `:680`, raw interpolation at `:659-661`, `:683`, and `settings_screen.dart:261` ("24500") |
| "Next service" driven by date **or** odometer with remaining km/days computed | **Pass (model), fail (copy)** | `MaintenanceSchedule` computes `dueOdometer`, `dueDate`, `kmRemaining`, `daysRemaining` (`vehicle.dart:393-412`) and `urgency()` picks the earliest trigger (`vehicle.dart:414-421`). UI shows km and days (`maintenance_screen.dart:655-676`) — never a bare date. But the pair is shown side by side with no precedence, so a card can read "Overdue" and "245 days left" at once |
| Fuel-consumption figure explains its method and sample | **Fail — CRITICAL** | "Average Fuel Economy 12.3 km/L" (`iphone69-4`) has no sample size, no method, no date range. The computation divides each odometer delta by the *current* fill's litres (`analytics_service.dart:212-226`) and ignores `isFullTank`, collected at `fuel_logs_screen.dart:132-145` but never read by the calculator. With exactly one fill it invents a baseline — `avgKmL = 12.5; bestKmL = 12.5;` (`analytics_service.dart:241-244`) — and the test suite **pins that invention** (`test/trace/trace_cases_test.dart:228`). A fabricated number rendered as the user's data is the most damaging defect in the product |
| Odometer entry rejects a lower value with a message saying why | **Fail — CRITICAL** | `AppValidators.validateOdometer` accepts `previousKm` and returns `validationOdometerLessThanPrevious` (`validators.dart:31-40`); the message ships in all 8 ARBs (`app_en.arb:336`). **No call site passes `previousKm`** — `fuel_logs_screen.dart:99`, `maintenance_screen.dart:147`, `:265`, `add_schedule_sheet.dart:255`, `add_vehicle_sheet.dart:283`. A fill can therefore be recorded below the vehicle's odometer; `addFuelLog` then refuses to move the odometer backwards (`app_providers.dart:110-116`), leaving a log that contradicts its own vehicle. This violates `AGENTS.md:65` — the app's own mandatory rule |
| Service rows scannable (date + odometer + cost + item) with **confirmed** delete | **Fail on delete** | All four fields are present (`maintenance_screen.dart:809-880`; `iphone69-3.png`). Delete is a bare 18dp trash icon executing immediately at `:841-843`, `:638-640`, `:1034-1036`, `fuel_logs_screen.dart:505-511`, `glovebox_screen.dart:405-411`, and `settings_screen.dart:275-279` (which cascades five collections). Zero `SnackBarAction`, zero undo, zero confirmation except the global reset (`settings_screen.dart:643-675`) |
| Multi-vehicle switcher makes the active vehicle unmistakable | **Pass on `/`, fail elsewhere** | Solid orange pill + white text + plate chip (`garage_dashboard_screen.dart:508-585`) is unambiguous. But the switcher exists only on the dashboard: on Maintenance, Fuel, Glovebox and Settings the vehicle is frozen into the app-bar string ("Fuel: Toyota Innova Zenix", `fuel_logs_screen.dart:310-313`) and cannot be changed without returning to tab 1 |

---

## 6. Scorecard

`score = Σ(category × weight) / Σ(weight)`; a11y and touch weigh 1.5×.

| # | Category | W | P/W/F | Score | Grade |
|---|---|---|---|---|---|
| 1 | Visual hierarchy & composition | 1.0 | 5/2/2 | 66.7 | D |
| 2 | Typography | 1.0 | 2/4/6 | 33.3 | F |
| 3 | Color & theming | 1.0 | 7/3/2 | **50** (auto-capped) | F |
| 4 | Spacing & layout | 1.0 | 4/6/4 | 50.0 | F |
| 5 | Navigation | 1.0 | 6/3/2 | 68.2 | D |
| 6 | Touch & gesture | **1.5** | 4/3/3 | 55.0 | F |
| 7 | Platform conventions | 1.0 | 3/5/2 | 55.0 | F |
| 8 | Motion & animation | 1.0 | 5/3/2 | 65.0 | D |
| 9 | Content states | 1.0 | 6/3/1 | 75.0 | C |
| 10 | Accessibility | **1.5** | 3/3/5 | 40.9 | F |
| 11 | Responsive & adaptive | 1.0 | 4/2/4 | 40.0 | F |
| 12 | Performance as design | 1.0 | 5/2/1 | 75.0 | C |
| 13 | AI-slop detection | 1.0 | 5/1/2 | 68.8 | D |
| | **Weighted total** | 14.0 | 59/41/35 | **56.5** | **F** |

Arithmetic: `66.7 + 33.3 + 50 + 50 + 68.2 + (55.0×1.5) + 55 + 65 + 75 + (40.9×1.5) + 40 + 75 + 68.8
= 790.85 / 14.0 = 56.49 → 56.5`. Grade band: **F** (<60).

Two automatic caps applied per `SCORECARD.md:45-51`: category 3 (a `Color(0x…)` literal in a screen
that also reads `Theme.of(context)` — `fuel_logs_screen.dart:221`) and category 10 (interactive
elements with no accessible name — the six trash icons).

### Item-level failures that set the grade

| SEVERITY | CATEGORY | Location | Issue | Fix |
|---|---|---|---|---|
| CRITICAL | Data | `analytics_service.dart:241-244` | One fill-up yields a fabricated "12.5 km/L" average; `test/trace/trace_cases_test.dart:228` enshrines it | Return `—` until ≥2 full-tank fills; show "needs 1 more full tank" |
| CRITICAL | Data/Validation | `validators.dart:31-40` + 5 call sites | `previousKm` guard never wired; odometer can move backwards against `AGENTS.md:65` | Pass `previousKm: active.currentOdometer` at `fuel_logs_screen.dart:99` and `maintenance_screen.dart:147,265`; surface the ARB message inline |
| CRITICAL | UX safety | 6 delete sites | Irreversible deletes, no confirm, no undo; vehicle delete cascades 5 collections | Confirm dialog for vehicle/reset; `SnackBarAction('Undo')` for every row delete |
| CRITICAL | Typography | 259 `TextStyle(`, 242 `fontSize:` | No `TextTheme`; 14-step scale (8→24); 54 declarations below 12sp; 37 per product screen | New `app_typography.dart` (6 steps), map `textTheme`, delete inline sizes |
| CRITICAL | Accessibility | 4 of 5 product screens | `Semantics` 0× in dashboard/maintenance/fuel/glovebox; `MergeSemantics` 0× fleet-wide; trash/edit icons unnamed | `Semantics(container:true, label: …)` per row; `tooltip:` on every icon button; `MergeSemantics` on card headers |
| HIGH | Touch | `tap_target.dart:15`, `garage_achievements_card.dart:107-110`, `:288-305` | `TapTarget` guarantees **44pt**, not Material's 48dp; the achievements share `IconButton` has `padding: zero` + empty `constraints` with an 18dp icon; badge share glyph is 12dp | `minSize: 48`; `constraints: BoxConstraints(minWidth: 48, minHeight: 48)` |
| HIGH | Layout | `garage_dashboard_screen.dart:481-590` | 40dp-tall switcher, clips at the viewport edge, active pill can be off-screen | Fade + `ensureVisible` on active, min height 48 |
| HIGH | Typography | `fuel_logs_screen.dart:629-638` | Data labels truncate at 11sp with `maxLines: 1` | 12sp floor, 2 lines, or shorter labels |
| HIGH | Consistency | `maintenance_screen.dart:659-661`, `:683`, `settings_screen.dart:261` | Unformatted four- and five-digit numbers next to formatted ones | Shared `formatKm()` helper |
| MEDIUM | Navigation | `app_router.dart:51-54`, `maintenance_screen.dart:52-56` | `/service` is a capture-only duplicate route; 3 tabs live inside bottom-nav item 2 | `/maintenance/schedules\|history\|inspections` as real routes; delete `/service` once captures move |
| MEDIUM | Responsive | `ipad13-1.png` | iPad = 800dp column + full-width 5-item bottom bar; no `NavigationRail`, no `LayoutBuilder` breakpoint (`LayoutBuilder` appears 3× in `lib/`) | `NavigationRail` ≥840dp; two-pane maintenance on tablet |
| MEDIUM | Theming | `garage_share_dialog.dart:31-80` | Four share themes hardcode 17 colours outside the token file; `:732` and `:652-654` add two more | Move theme palettes into `app_colors.dart` as named share-token sets |
| POLISH | AI slop | `lib/` (156 `SizedBox(height: …)`) | No spacing scale; 2,3,4,6,7,10,12,14,16,18,20,22,24,32 all appear | `app_spacing.dart` (4/8/12/16/24/32) |

---

## 7. Harsh verdict

1. **This is a well-organised app with no type system, and that is not cosmetic.** 242 size
   declarations across 14 steps means every screen re-decides what "small" is; the result is a
   dashboard whose health score is 15sp and whose caption under it is 10sp, a fuel card whose label
   dies at 11sp, and a service history that alternates 11/12/13/15 inside one row. Fix the scale once
   and half of this document's findings disappear.
2. **The product understands vehicles better than it understands trust.** The maintenance model is
   genuinely good — dual km/time triggers, computed urgency, a derived health score — and then it
   accepts an odometer below the last one, erases a service record on a single tap, and prints a
   made-up 12.5 km/L as if it were measured. In a logbook, wrong and irreversible beats ugly; these
   three are why the grade is F despite a coherent UI.
3. **The discipline exists in the codebase and is not applied.** `TapTarget`, `FleetShimmerCard`,
   `AppTextScale`, `AppMotion.resolve`, a contrast-scanning test — all shipped, half unused. The team
   knows the standard; the screens predate it and nobody went back. That is a two-day refactor, not a
   redesign, and it is the cheapest F-to-B in the fleet.

---

## 8. Competitor analysis

Scope: apps that solve "keep a per-vehicle service/fuel/tax record". Comparison at feature/IA level.

| Product | Model | Core IA | What they do that GarageGo does not |
|---|---|---|---|
| **Drivvo** | freemium | Vehicle → refuels / expenses / services, one FAB per context, charts per vehicle | Per-fill efficiency **trend chart** and partial-fill awareness; GarageGo ignores `isFullTank` in its maths |
| **Fuelio** | freemium | Fill-up list is home; cost/km and consumption are computed columns | Every statistic states its sample ("based on last 12 fills"); no invented baseline |
| **aCar** | freemium | Timeline of events per vehicle; reminders by date/km with notifications | Real local notifications for due dates; GarageGo only shows a number when the app is open |
| **MyCarfax / CARFAX Car Care** | free (service capture) | Vehicle dashboard with recall + shop-fed service history | Recall alerts and an authoritative record; GarageGo is manual-only by design but has no recall entry point at all |
| **Simply Auto** | freemium | Multi-vehicle garage, service reminders, fuel log, expense splits | Explicit "which trigger fired" reminder copy and a per-vehicle odometer history graph |
| **Road Trip** | freemium/one-off | Log-first, stats-heavy, CSV export | Statistics screen with sample size and date range under every figure |
| **Torque / OBD apps** | hardware | Live OBD telemetry | Not a competitor for manual logs, but sets the expectation that economy is measured, not estimated |

**Positioning gap.** GarageGo's promise — 8 languages, no account, no ads, 100% offline, cars *and*
motorcycles, Indonesian tax semantics (PKB tahunan, pelat 5 tahunan) — is real and unique. Drivvo and
Fuelio are stronger at statistics, aCar at reminders, none models STNK/PKB the way GarageGo does. The
weakness is not scope, it is evidentiary honesty: the app shows numbers it cannot justify and hides
the one thing it computes well.

**Three competitor moves worth copying, cheapest first**

1. **State the sample** (Fuelio) — one line under the average: "last 6 full tanks". Two hours.
2. **One verdict per service** (Simply Auto / Polestar) — "Overdue on distance · time OK". Four hours.
3. **A real reminder schedule** (aCar) — local notifications for tax/plate/oil due dates. One day.

---

## 9. Mobbin reference delta

Pulled with `mobbin screens "<query>" --platform ios --limit 4 --previews --deep` for four queries —
`vehicle maintenance log`, `car garage app`, `fuel consumption tracker`, `service reminder` — then
`mobbin download` and the images were read. Every value below is read off the reference render.

### 9.1 Maintenance list → Mercedes-Benz · `https://mobbin.com/screens/155f60ad-ee02-4383-8de4-80f7f999eeb6`

| Dimension | GarageGo | Mercedes-Benz | Verdict |
|---|---|---|---|
| Row height | ~200dp card (`maintenance_screen.dart:590-712`) | ~56dp single-line row | **worse** — 3.5× the height for the same fact |
| Elements per row | 8 (pill, category, edit, delete, title, km, days, interval, CTA) | 3 (icon, label, status + chevron) | worse — scan speed |
| Destructive action | permanent 18dp trash on every row | none on the row | **dangerous**, not merely worse |
| Primary CTA | "Mark Done / Reset" repeated per card | one pinned full-width "Book appointment" | worse — decision repeated N times |
| Status vocabulary | 3 pills + two remaining values | one word ("Ok") + chevron | worse for precision, **better for glanceability** |

### 9.2 Next service → Rivian · `https://mobbin.com/screens/56bd4a31-4b7f-4bd9-828d-f7098b65171a`

| Dimension | GarageGo | Rivian | Verdict |
|---|---|---|---|
| Hero metric | health score in a 48dp ring, 15sp (`garage_dashboard_screen.dart:808-832`) | "22,764 mi" at ~40sp under a 15sp label | worse — the number that matters is 2.7× smaller |
| Progress | 6dp bar, no endpoints (`garage_dashboard_screen.dart:1030-1038`) | bar with labelled endpoints 22,500 / 30,000 | worse — a bar without endpoints is decoration |
| Explanation | "500 km remaining" + "136 days left" (`maintenance_screen.dart:655-676`) | one sentence: service every 7,500 miles, next checkpoint at 30,000 miles | worse — ours needs interpretation |
| Actions | two text buttons + a FAB | one filled CTA + one underlined link | worse |

### 9.3 Service verdict → Polestar · `https://mobbin.com/screens/c0029cca-3635-4457-88b9-aebb38affec9`

| Dimension | GarageGo | Polestar | Verdict |
|---|---|---|---|
| Dual trigger | two values, two lines, no precedence | one line: "300 days or 8740 mi" | **worse** — theirs fits the same model in 22 characters |
| Screen verdict | none; the user infers from pill colours | "All good. / No issues to report." at ~32sp | missing |
| Row density | cards with dividers | 4 hairline rows, 1 line each | worse |
| Repair affordance | trash icon per card | one contextual block ("Need to book a service?") | worse |

### 9.4 Fuel statistics → Tesla · `https://mobbin.com/screens/1f99eb66-657e-478a-a519-36cd212b963f`

| Dimension | GarageGo | Tesla | Verdict |
|---|---|---|---|
| Hero figure | four equal 11sp-labelled KPI cards (`fuel_logs_screen.dart:351-407`) | "155.0 kWh" at ~40sp with a 15sp label | worse — no focal number |
| Chart | none anywhere in the app | 12-month bar chart with 3 axis labels (0 / 78 / 156) | missing capability |
| Method disclosure | none (`iphone69-4`) | axis + period selector ("2026 · Year") | worse — ours cannot be audited by the user |
| CTA | icon-only "+" in the app bar | one outlined "View Charge Sessions" | worse for discoverability |

### 9.5 Garage / vehicle switching → My BMW · `https://mobbin.com/screens/061d974c-f7c4-4c59-a000-ef9fb50f2680`

| Dimension | GarageGo | My BMW | Verdict |
|---|---|---|---|
| Section headers | 14sp labels, same weight as body (`garage_dashboard_screen.dart:1515-1527`) | ~20sp uppercase section titles | worse — sections do not announce themselves |
| Vehicle identity | 12sp name + 10sp plate in a 40dp pill (`garage_dashboard_screen.dart:542-582`) | full-bleed vehicle photo + model name at ~18sp | worse for identity, **better for density** |
| Rows per action | one card per action, 2-line subtitle at 12sp | 2-line row, 13–15sp, chevron | equal |
| Primary action count | 1 FAB + 2 app-bar icons + 5 quick actions | 1 primary row | worse — five entry points compete |

**Cross-cutting deltas (component level)**

| Component | GarageGo | Reference norm | Action |
|---|---|---|---|
| Service row | 200dp card, 8 elements | 56dp row, 3 elements | rebuild as `ScheduleRow` with swipe actions |
| Statistic label | 11sp, `maxLines: 1`, ellipsis | 15sp label, 40sp value | label 12, value 22–28 |
| Progress | bar only | bar + labelled endpoints | `ProgressScale(min, max, value)` |
| Destructive row action | 18dp icon, immediate | overflow menu + confirm | `PopupMenuButton` + confirm sheet |
| Empty state | icon + title + body + CTA | same | **equal — keep** |
| Type scale | 14 steps, 8–24 | 5–6 steps | tokenise |

---

## 10. Missing features, screens and components

Ranked by user value per hour.

### Screens missing

| Screen | Why it matters | Reference |
|---|---|---|
| **Vehicle detail** (`/vehicles/:id`) | Specifications, odometer history and per-vehicle settings have no home; editing is a sheet launched from three places | My BMW |
| **Statistics** (`/statistics`) | Fuel economy exists as one average; no chart, no period, no sample | Tesla, Drivvo |
| **Reminders** (`/reminders`) | Due dates are passive numbers; there is no scheduled notification surface | aCar |
| **Log detail** (`/maintenance/:logId`) | Notes and photos of a service cannot be revisited; notes live truncated in a list | Mercedes-Benz |
| **History as a real route** (`/maintenance/history`) | Today it is tab index 1 with no URL; `/service` only fakes it | — |

### Features missing

- **Full-tank-aware consumption** — the field exists (`fuel_logs_screen.dart:132-145`) and is ignored.
- **Sample size and date range** on every statistic.
- **Odometer regression guard** (validator exists, unwired).
- **Undo** on any delete; **confirm** on vehicle delete.
- **Local notifications** for tax / plate / oil (the model already has exact due dates).
- **CSV import** (export exists at `settings_screen.dart:524-600`; the only way back in is full JSON backup).
- **A vehicle switcher outside the dashboard** — a persistent header or a switcher in every app bar.

### Components missing

`ScheduleRow` (compact list row) · `StatCard` (one focal value, 12sp label, 28sp figure) ·
`ProgressScale` (labelled endpoints) · `ConfirmDeleteSheet` · `UndoBar` · `EmptyDueToday` variant ·
`SkeletonList` (`FleetShimmerCard` exists in `core/ui/fleet_loading_view.dart`, **0 uses**) ·
`VehicleBadge` shared between dashboard and settings · a `FormSection` wrapper (the six sheets each
re-implement a 12–16dp label/field rhythm).

---

## 11. Improvement plan

Effort in engineer-hours for one developer who knows the codebase.

### P0 — broken (blocks a C, 9–11 h)

| # | Change | Files | Effort | Score delta |
|---|---|---|---|---|
| P0-1 | Kill the fabricated baseline: require ≥2 full tanks, use `isFullTank`, print the sample size | `analytics_service.dart:188-253`, `fuel_logs_screen.dart:351-407`, `trace_cases_test.dart:228` | 2 h | States +5 |
| P0-2 | Wire `previousKm` at all 5 odometer call sites and surface the existing ARB message | `validators.dart:31`, `fuel_logs_screen.dart:99`, `maintenance_screen.dart:147,265`, sheets | 1 h | States +5, Hierarchy +4 |
| P0-3 | Confirm + undo on all six deletes; vehicle delete gets a two-step confirm naming the cascade | `maintenance_screen.dart:638,841,1035`, `fuel_logs_screen.dart:505`, `glovebox_screen.dart:405`, `settings_screen.dart:268` | 2 h | Touch +8, States +5 |
| P0-4 | `app_typography.dart` (6 steps) + map `textTheme`; delete 242 inline `fontSize`; floor 12sp | all `features/*`, `core/theme/app_theme.dart` | 4 h | Typography 33 → 68 |
| P0-5 | `Semantics` per row + `tooltip` on every icon button; `MergeSemantics` on card headers | 5 product screens | 2 h | A11y 41 → 62 |

### P1 — system (12–16 h)

| # | Change | Files | Effort | Delta |
|---|---|---|---|---|
| P1-1 | `app_spacing.dart` + `app_radii.dart`; replace 156 `SizedBox` spacers and 12 radius values | `lib/`, all screens | 3 h | Layout 50 → 68 |
| P1-2 | Colour literals out of presentation: share-theme tokens into `app_colors.dart`, delete the three inline status hexes | `garage_share_dialog.dart:31-80,652,732`, `fuel_logs_screen.dart:221`, `garage_dashboard_screen.dart:728` | 2 h | Color 50 → 72 |
| P1-3 | 48dp targets: `TapTarget.minSize`, icon-button constraints, switcher height | `tap_target.dart:15`, `garage_achievements_card.dart:107,288`, `garage_dashboard_screen.dart:482` | 1.5 h | Touch 55 → 70 |
| P1-4 | Compact `ScheduleRow` (date + odo + item + cost, 72dp) with swipe actions and a confirm sheet | `maintenance_screen.dart` schedule/history tabs | 4 h | Hierarchy +10, States +4 |
| P1-5 | One number formatter (`formatKm`, `formatIdr`) applied at every call site | 5 screens | 1.5 h | Hierarchy +4 |
| P1-6 | Persistent vehicle switcher (app-bar `VehicleBadge` menu on all 5 tabs) | `features/shell`, 4 screens | 2 h | Hierarchy +4, Navigation +4 |
| P1-7 | `NavigationRail` ≥840dp + two-pane maintenance on tablet | `navigation_shell.dart`, `maintenance_screen.dart` | 3 h | Responsive 45 → 68 |

### P2 — polish (10–12 h)

| # | Change | Effort | Delta |
|---|---|---|---|
| P2-1 | Replace the level emoji with the already-present `GarageLevel.icon` (`garage_gamification.dart:62`) | 0.5 h | AI slop +4, Theming +3 |
| P2-2 | Collapse achievements to one badge row + "See all"; move it below the metrics | 1.5 h | Hierarchy +4 |
| P2-3 | Fuel-economy trend chart with sample + period label | 4 h | Hierarchy +6, product |
| P2-4 | `ProgressScale` with labelled endpoints on oil + service | 2 h | Hierarchy +3 |
| P2-5 | Local notifications for tax/plate/oil due dates | 4 h | product, not score |
| P2-6 | Tabular figures on odometer/cost; `AnimatedSwitcher` on tab content | 1 h | Typography +3, Motion +4 |

**Projected after P0+P1:** 56.5 → ~75 (C). After P2: ~84 (B). Reaching a true **A** additionally
requires the missing screens in §10, a real chart, and a screen-reader pass on every row — not polish.

---

## 12. Definition of done

- [ ] `grep -rc "TextStyle(" lib/features` → **0** outside `app_typography.dart`
- [ ] `grep -rc "fontSize:" lib/features` → **0**
- [ ] `grep -rc "Color(0x" lib/features` → **0**; share themes live in `app_colors.dart`
- [ ] `validateOdometer` called with `previousKm` at every odometer field; a test enters 24,000 after 24,500 and asserts the inline message
- [ ] With one fuel log the average reads "—" and never a number; with six it reads "12.3 km/L · last 6 full tanks"
- [ ] Every delete offers Undo or a named confirmation; vehicle delete names the records it removes
- [ ] Every icon-only button has a `tooltip`; `MergeSemantics` count ≥ number of list rows
- [ ] All interactive targets ≥ 48×48dp (asserted in `press_scale_tap_test.dart`, not by eye)
- [ ] No four-digit number renders without a thousands separator in any locale (widget-level assertion)
- [ ] 320dp width and 1.6× text scale: zero overflow on all 7 routes; the KPI label survives
- [ ] iPad ≥840dp uses `NavigationRail`; maintenance becomes two-pane
- [ ] Scorecard re-run ≥ 85 with `file:line` evidence for every pass

---

## Appendix — method and reproduction

- **Sitemap:** parsed from `lib/core/router/app_router.dart` (8 nodes: splash, onboarding, 5 shell
  branches, plus the `/service` alias). Route count matches `docs/design-audit/_inventory.json`.
- **Counts:** `grep -rho` over `lib/` with `--include='*.dart'`. `Navigator.push` = **0**
  (`Navigator.pop` excluded as dialog dismissal). `TextStyle(` = **259**; `fontSize: [0-9]` = **242**
  across 14 distinct values (8×3, 9×2, 10×8, 11×39, 12×64, 13×36, 14×43, 15×12, 16×12, 17×6, 18×14,
  19×1, 22×1, 24×1); 54 declarations below 12sp; 35 at ≥16sp. Per-screen: dashboard 45, settings 41,
  maintenance 40, fuel 28, glovebox 18 → **172 / 5 = 34.4 per product screen**, 259 / 7 = **37.0**
  across the seven routed screens.
- **Colours:** 72 `Color(0x…)` total; 32 are declarations in `app_colors.dart`; 40 are literals in
  presentation/shared UI (share dialog 17, splash 5, onboarding 5, app config 3, fuel 1, plus 9
  one-off literals in the theme/`readable()` helpers).
- **Semantics:** `Semantics(` widget constructions = 8 (`tap_target.dart` 2, settings 3, contact
  cards 1, achievements 1, loading view 1), `semanticLabel` = 8, `MergeSemantics` = 0. Four of five
  product screens contain **none**.
- **Renders:** `docs/store/metadata/ios-screenshots/en-US/iphone69-{1..5}.png`, `ipad13-1.png`
  (1206×2622 / 2064×2752) and `docs/store/metadata/android/en-US/images/phoneScreenshots/{1,2,4}.png`
  (1080×1920). Read as images; only visible facts reported.
- **Mobbin:** four queries as listed in §9; six references downloaded as `.webp` and read. Cited
  URLs are the canonical `mobbin.com/screens/…` identifiers returned by the CLI.
- **Tests read, not executed** (audit mode forbids builds): `test/trace/ui_guard_test.dart` (contrast
  on 5 tabs × 2 themes at 430×932), `test/trace/contrast_scan.dart`, `test/store_screens/` (overflow
  + 5 landscape sizes), `test/trace/trace_cases_test.dart` (FLOW-* cases, incl. the pinned 12.5 km/L
  baseline at `:228` and the unwired backward-odometer validation at `:176`).
- **Scope:** read-only. No source, `pubspec.yaml`, asset or test file was modified; no version bump
  (§VER — docs-only change). One markdown file added.
