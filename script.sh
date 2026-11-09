#!/usr/bin/env bash


# --- e621: direct to posts, filtered to explicit, sorted so media shows first ---
E621="https://e621.net/posts?tags=order%3Arandom+rating%3Ae"
# 10 e621 tabs, each a different random page so you don't get identical results
for i in $(seq 1 10); do
    xdg-open "${E621}&page=$i" >/dev/null 2>&1 &
done

# --- video sites: direct to browse/trending video pages ---
VIDEO_SITES=(
    "https://www.pornhub.com/video?o=tr"
    "https://www.xvideos.com/best"
    "https://www.xhamster.com/videos?sort=top"
    "https://www.redtube.com/bestnew"
    "https://www.youporn.com/browse/trending/"
    "https://www.eporner.com/0/1/"
    "https://www.spankbang.com/trending"
    "https://www.tube8.com/trending/"
    "https://www.txxx.com/latest-updates/"
    "https://www.beeg.com/trending"
)
for url in "${VIDEO_SITES[@]}"; do
    xdg-open "$url" >/dev/null 2>&1 &
done

# --- image galleries: direct to gallery/album listings, not homepages ---
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
    xdg-open "$url" >/dev/null 2>&1 &
done
