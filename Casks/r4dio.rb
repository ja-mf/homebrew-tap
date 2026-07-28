cask "r4dio" do
  version "1.2.7-rc.1"

  on_arm do
    sha256 "ff51af447d7ebdeca2c5ec97c63d40228e3e94d0884644033cd1a001c8f006d5"
    url "https://github.com/ja-mf/r4dio/releases/download/v#{version}/r4dio-macos-arm64-app.zip"
  end

  on_intel do
    sha256 "75c33f8e8d2b23b7dc6235a455d7a005174c3064460647f74df79136a7ebeabd"
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
