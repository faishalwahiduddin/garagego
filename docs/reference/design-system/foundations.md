---
type: Reference
title: Design System Foundations
description: Visual tokens and theme for GarageGo.
status: active
last-updated: 2026-11-13
---

# Foundations — GarageGo

SSOT: [`DESIGN.md`](../../../DESIGN.md) · Panduan ini diturunkan dari kode tema yang ada, bukan sebaliknya: bila nilai di sini berbeda dengan kode, kodelah yang benar — perbarui dokumen ini.

## Sumber token di kode

- [`lib/core/constants/app_colors.dart`](../../../lib/core/constants/app_colors.dart)
- [`lib/core/theme/app_theme.dart`](../../../lib/core/theme/app_theme.dart)
- [`lib/core/theme/app_motion.dart`](../../../lib/core/theme/app_motion.dart) (durasi & kurva gerak)

## Tema

- **Material 3** (`useMaterial3: true`).
- **Terang + gelap**: `theme` dan `darkTheme` dipasang di `lib/main.dart`.

## Palet warna

Nilai dibaca dari konstanta `Color(0x…)` di berkas sumber. Gunakan lewat nama token, jangan menyalin heksa.

### `app_colors.dart`

| Token | Nilai | Catatan |
|---|---|---|
| `primary` | `#EA580C` | Clean vibrant Orange 600 |
| `primaryLight` | `#F97316` | Orange 500 |
| `primaryDark` | `#C2410C` | Orange 700 |
| `secondary` | `#0F172A` | Slate 900 |
| `accent` | `#0284C7` | Sky 600 |
| `accentLight` | `#38BDF8` | Sky 400 |
| `success` | `#10B981` | Emerald 500 |
| `warning` | `#F59E0B` | Amber 500 |
| `danger` | `#EF4444` | Red 500 |
| `bgDark` | `#0B0F17` | Refined pure dark |
| `bgSurface` | `#131B28` | Elevated dark surface |
| `bgCard` | `#172030` | Card dark |
| `border` | `#263348` | Subtle dark border |
| `textDarkPrimary` | `#F8FAFC` |  |
| `textDarkSecondary` | `#94A3B8` |  |
| `textDarkMuted` | `#8090A6` | >= 4.5:1 on bgDark/bgSurface/bgCard |
| `bgLight` | `#F8FAFC` |  |
| `bgLightSurface` | `#FFFFFF` |  |
| `bgLightElevated` | `#F1F5F9` |  |
| `borderLight` | `#E2E8F0` |  |
| `textLightPrimary` | `#0F172A` |  |
| `textLightSecondary` | `#475569` |  |
| `textLightMuted` | `#56657A` | >= 4.5:1 on white/bgLight/bgLightElevated |
| `carColor` | `#0284C7` |  |
| `carColorLight` | `#38BDF8` |  |
| `motoColor` | `#D97706` |  |
| `motoColorLight` | `#F59E0B` |  |

### Literal heksa tambahan di berkas tema

Nilai berikut dipakai langsung (tanpa nama token) di berkas sumber di atas:

`#0369A1`, `#065F46`, `#92400E`, `#9A3412`, `#B91C1C`, `#F87171`, `#FB923C`

Utang token: bila sebuah nilai dipakai berulang, angkat jadi konstanta bernama (DS-3).

## Tipografi

- Tidak ada keluarga font kustom ter-bundle di `pubspec.yaml`; teks memakai font bawaan platform.
- `fontFamily: 'monospace'` dipakai di 1 tempat di `lib/`.

## Radius

Nilai `BorderRadius.circular(...)` yang dipakai di tema/`main.dart`: `10`, `12`, `16`, `20`, `24`.

## Motion

Dari `AppMotion`: `fast` 150 ms, `base` 250 ms, `slow` 350 ms. Selalu resolve lewat `AppMotion.resolve(context, d)` agar mode reduced-motion dihormati (durasi menjadi nol).

## Aksesibilitas

- `AppTextScale` (`lib/core/a11y/text_scale.dart`) membatasi skala teks platform maksimum 1.6×; setiap layar harus bertahan di 1.6× tanpa terpotong.
- Target sentuh minimal 44pt lewat `TapTarget` (`lib/core/ui/tap_target.dart`).
- Kontras teks minimal WCAG AA 4.5:1 di kedua tema (DS-6).
