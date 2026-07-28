# homebrew-tap

Homebrew tap for [r4dio](https://github.com/ja-mf/r4dio) — a terminal radio and audio player.

## Install

```bash
# Self-contained app (r4dio.app, ships its own Ghostty terminal)
brew install --cask ja-mf/tap/r4dio

# CLI only (uses Homebrew's mpv/ffmpeg/yt-dlp; vibra included for song recognition)
brew install ja-mf/tap/r4dio
```

The cask and formula are updated automatically by the
[r4dio release workflow](https://github.com/ja-mf/r4dio/blob/main/.github/workflows/build-all-platforms.yml)
on every version tag.
