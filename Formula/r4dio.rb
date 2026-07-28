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
    sha256 "ebc049896d89d9ce13052b2882afa85eff637dce7fb319ae940cc4ddcfa3cb2f"
  end

  on_intel do
    url "https://github.com/ja-mf/r4dio/releases/download/v1.2.7-rc.1/r4dio-macos-x86_64-cli.tar.gz"
    sha256 "9ebcc512ac74e60b1bb301293506a042736f013383df1e8199ac5e563250304a"
  end

  def install
    # vibra lives next to the resolved r4dio binary in libexec so r4dio's
    # beside-the-exe discovery finds it (song recognition keeps working).
    libexec.install "r4dio", "vibra", "LICENSE"
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
