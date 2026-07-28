cask "r4dio" do
  version "1.2.7-rc.1"

  on_arm do
    sha256 "92280bf7a161c5247d76a548eeae03e866d6226307a4321fe1e28fd3ac3a9549"
    url "https://github.com/ja-mf/r4dio/releases/download/v#{version}/r4dio-macos-arm64-app.zip"
  end

  on_intel do
    sha256 "1da2e2d8460ac6f99f40306c63790fdc1ec8db038f44753a1e1144e30bdf327e"
    url "https://github.com/ja-mf/r4dio/releases/download/v#{version}/r4dio-macos-x86_64-app.zip"
  end

  name "r4dio"
  desc "Terminal radio player as a self-contained app (ships its own Ghostty terminal)"
  homepage "https://github.com/ja-mf/r4dio"

  app "r4dio.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/r4dio.app"]
  end

  zap trash: "~/.config/radio"
end
