# Maskot Tori — kandidat anchor

**rubah mekanik (fennec fox)** · peran Sidekick

Fennec fox bertelinga besar peka mendengar bunyi mesin halus — teliti merawat kondisi kendaraan.

Spesifikasi dan prompt: [`docs/mascots/prompts/garagego.md`](../../../docs/mascots/prompts/garagego.md)

| File | Uji terukur | Catatan |
|---|---|---|
| `anchor-candidate-01.png` | pending | Belum digenerate |

Uji terukur hanya menyaring rasio, transparansi, palet, dominasi aksen, outline,
dan pemisahan grayscale. **Tiga hal ini tetap butuh mata:**

- Signature detail: topi mekanik datar slate #334155 beremblem speedometer emas #F59E0B di depan
- Siluet: kepala rubah mungil dengan dua telinga segitiga besar menjulang, moncong runcing lembut
- Selalu: tanpa hidung, satu highlight per mata, tanpa cast shadow

Regenerate: `bash docs/mascots/generate_anchors.sh garagego`

Dibuat via Gemini "Gambar" (Pro Mendalam), dikendalikan `gstack browse`.

<!-- mascot-sheet:begin -->
## Mascot sheet (50 poses + 50 expressions)

The full character sheet for **Tori** (rubah mekanik (fennec fox)) lives **outside this repo** in the fleet library
`../docs/mascots/sheets/garagego/` (`~/projects/faishal.id/docs/mascots/sheets/garagego/`). It is on this machine
only, not in git and not in the app bundle.

- `poses/pose-NN-<id>.png` (01 to 50) and `expressions/expr-NN-<id>.png` (01 to 50): transparent RGBA 1024x1024.
- `README.md` there: an index of every file (ID, what it shows, QA result). Pick a pose from it by meaning.
- Pose and expression lists: `../tools/mascot_kits/catalog.py`. How the sheet was made: `../tools/mascot_kits/README.md`.
- Known gaps: none.

To use one in the app:
1. Copy only the files `lib/` uses into `assets/mascot/poses/` or `assets/mascot/expressions/` (keep the file name).
   Downscale to 512 px when shown small. Never copy the whole sheet (about 50 MB).
2. List each new subfolder under `flutter: assets:` in `pubspec.yaml`: `assets/mascot/` does not include subfolders.
3. Bump the version (§VER) from the fleet root: `python3 tools/bump_version.py garagego minor`.
<!-- mascot-sheet:end -->
