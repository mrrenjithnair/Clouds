# Memories on the Cloud

A dynamic photo-album site where each folder inside `Images/` becomes a floating cloud on the home page. Click a cloud → fly into a themed album view.

## Files
- `index.html` — the whole app (home + trekking theme + lightbox + audio player)
- `data.js` — auto-generated manifest of albums (do not edit by hand)
- `generate.sh` — re-scans `Images/` and rewrites `data.js`
- `Images/<Folder Name>/` — drop your photos (and optional audio) here. The folder name becomes the cloud label.

## Adding more memories
1. Create a new folder inside `Images/` (the name = cloud label, e.g. `Beach 2025`).
2. Drop in `.jpg`, `.jpeg`, `.png`, `.webp` images.
3. Optionally drop in an `.mp3`, `.wav`, `.m4a`, or `.ogg` audio file — it plays in the vintage radio at the bottom of the album.
4. Run `./generate.sh` in this folder. That's it — refresh the page.

## Themes
The theme is picked automatically from the folder name (in `generate.sh`):
- `trekking` (default) — matches names containing trek, camp, hike, mountain, valley, sandan
- `beach`, `city` — placeholders ready for you to add more themes later

For now only the `trekking` theme is implemented. New themes can be added later by extending `index.html`.

## Opening it
Double-click `index.html`. (If images don't load due to spaces in folder names, serve the folder with `python3 -m http.server` and open `http://localhost:8000`.)
