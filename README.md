# Memories on the Cloud

A dynamic photo-album site where each folder inside `Images/` becomes a floating cloud on the home page. Click a cloud → fly into a themed album view.

## Files
- `index.html` — the whole app (home + three themes + lightbox + audio player)
- `data.js` — auto-generated manifest of albums (do not edit by hand)
- `generate.sh` — re-scans `Images/`, converts HEIC → JPG, rewrites `data.js`
- `start.sh` — local launcher (picks a port, opens the browser)
- `CNAME` — custom domain for GitHub Pages
- `.github/workflows/build.yml` — auto-rebuilds on push
- `Images/<Folder Name>/` — drop your photos (and optional audio) here

## Adding a new memory
1. Create a folder inside `Images/` — the folder name becomes the cloud label.
2. Drop in photos (`.jpg`, `.jpeg`, `.png`, `.webp`, `.heic`) and optionally one audio file (`.mp3`, `.wav`, `.m4a`, `.ogg`).
3. (Optional) Create a tiny text file `.theme` inside the folder containing the theme name (e.g. `mumbai`). If you skip this, the folder gets the default **cloud** theme.
4. Run `./generate.sh`. HEIC files get auto-converted to JPG next to the originals.
5. Refresh the page.

## Themes
Theme is read from `Images/<Folder>/.theme`. Built-in themes:

| Theme name  | Vibe                                              |
|-------------|---------------------------------------------------|
| `cloud`     | Default. Sky + drifting clouds + polaroids.       |
| `trekking`  | Night mountains, stars, moon, campfire, tents.    |
| `mumbai`    | Marine Drive at dusk — skyline, sea, Queen's Necklace lights, scooter, chai, food, dog, movie reel. Movie-still photo frames. |

To add a new theme later, add a new `<section id="theme-yourname" class="view theme-page theme-yourname">` block in `index.html` with your own backdrop, then in the folder you want it for, create `.theme` containing `yourname`.

## HEIC support
`generate.sh` converts HEIC to JPG using the first available tool:
1. `sips` (macOS, built-in)
2. `heif-convert` (Linux: `apt install libheif-examples`)
3. Python with `pillow-heif` (`pip install pillow-heif Pillow`) — most reliable cross-platform
4. ImageMagick (`magick` or `convert`)

The GitHub Action installs pillow-heif automatically.

## Running locally
- Double-click `start.sh`, or
- `cd` here and run `python3 -m http.server 8000`, then visit `http://localhost:8000`.

## Hosting on GitHub Pages
1. `git init && git add . && git commit -m "memories" && git push origin main`
2. Repo Settings → Pages → Source: `Deploy from a branch`, Branch: `main` / root
3. Custom domain is already set to `clouds.mrrenjithnair.com` via the `CNAME` file. Add a CNAME DNS record `clouds → YOUR_USERNAME.github.io`.

After that: drop new photos into `Images/`, `git push`, the GitHub Action regenerates everything, and the site updates within a minute.
