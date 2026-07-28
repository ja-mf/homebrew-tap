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
    sha256 "8ba7c62eaadcf52408a9c3b1aec8bb5819f0821a9740ccfea83835e4124a4f75"
  end

  on_intel do
    url "https://github.com/ja-mf/r4dio/releases/download/v1.2.7-rc.1/r4dio-macos-x86_64-cli.tar.gz"
    sha256 "be9b6ce3a2e4a81d1cd2a824db614db7301f8875e97fd9c48dabc6f4243f28c8"
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
