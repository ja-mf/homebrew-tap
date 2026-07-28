class R4dio < Formula
  desc "Terminal radio and audio player (internet radio, NTS metadata, song recognition)"
  homepage "https://github.com/ja-mf/r4dio"
  license "MIT"
  version "1.2.7-rc.1"

  depends_on "ffmpeg"
  depends_on "mpv"
  depends_on "yt-dlp"

  on_arm do
    url "https://github.com/ja-mf/r4dio/releases/download/v1.2.7-rc.1/r4dio-macos-arm64-cli.tar.gz"
    sha256 "882ec5994e2ca6b85a0cc2484bc6df72a3c27fc7e7802532154615b967b7e284"
  end

  on_intel do
    url "https://github.com/ja-mf/r4dio/releases/download/v1.2.7-rc.1/r4dio-macos-x86_64-cli.tar.gz"
    sha256 "6f4acfc7d5d41ea28317a3a27c1e50e16c78f60e4e79c7cd81387385601561c0"
  end

  def install
    # vibra and stations.toml live next to the resolved r4dio binary in
    # libexec so r4dio's beside-the-exe discovery finds them (song
    # recognition and the bundled station list keep working).
    libexec.install "r4dio", "vibra", "stations.toml", "LICENSE"
    bin.install_symlink libexec/"r4dio"
  end

  def caveats
    <<~EOS
      r4dio is a TUI app — run it in a truecolor terminal
      (Ghostty, iTerm2, kitty, WezTerm). Terminal.app shows wrong colors.
      For the self-contained app that ships its own terminal:
        brew install --cask ja-mf/tap/r4dio
    EOS
  end

  test do
    assert_path_exists libexec/"r4dio"
    assert_path_exists libexec/"vibra"
  end
end
