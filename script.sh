#!/usr/bin/env bash
set -uo pipefail

command -v xdg-open >/dev/null || { echo "xdg-open not found"; exit 1; }

open() { xdg-open "$1" >/dev/null 2>&1 & sleep 0.4; }

# --- e621: random explicit posts, 10 distinct random draws ---
E621="https://e621.net/posts?tags=order%3Arandom+rating%3Ae"
for _ in $(seq 1 10); do
    open "$E621"
done

# --- video sites: trending/best pages ---
VIDEO_SITES=(
    "https://www.pornhub.com/video?o=tr"
    "https://www.xvideos.com/best"
    "https://www.xhamster.com/videos?sort=top"
    "https://www.redtube.com/bestnew"
    "https://www.youporn.com/browse/trending/"
    "https://www.eporner.com/0/1/"
    "https://www.spankbang.com/trending/"
    "https://www.tube8.com/trending/"
    "https://www.txxx.com/latest-updates/"
    "https://www.beeg.com/trending"
)
for url in "${VIDEO_SITES[@]}"; do
    open "$url"
done

# --- image galleries: gallery/album listings ---
IMAGE_SITES=(
    "https://www.imagefap.com/gallery.php?type=0"
    "https://www.pixiv.net/en/tags/R-18/artworks"
    "https://rule34.xxx/index.php?page=post&s=list&tags=all"
    "https://danbooru.donmai.us/posts?tags=rating%3Aexplicit"
    "https://www.gelbooru.com/index.php?page=post&s=list&tags=all"
    "https://safebooru.org/index.php?page=post&s=list&tags=all"
    "https://www.hentai-foundry.com/pictures"
    "https://e-hentai.org/"
    "https://www.8muses.com/"
    "https://www.furaffinity.net/browse/all/?rating=2"
)
for url in "${IMAGE_SITES[@]}"; do
    open "$url"
done
