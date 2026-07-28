cask "r4dio" do
  version "1.2.7-rc.1"

  on_arm do
    sha256 "be974a132f2b9b8d0ea032b2b98b08cb3aea7d4e8842a40d9e731b2beb2c0705"
    url "https://github.com/ja-mf/r4dio/releases/download/v#{version}/r4dio-macos-arm64-app.zip"
  end

  on_intel do
    sha256 "4827b29f52bfa728280f38a7bc3a4a045c7a2d32aa71f4c6ba519f85ea414b3c"
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
