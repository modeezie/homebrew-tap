cask "sanebar" do
  version "2.1.30"
  sha256 "2d2e5c49a14de4de55f6472ba4f05a44672aa81a3e2f5f98911288326113a008"

  url "https://dist.sanebar.com/updates/SaneBar-#{version}.zip"
  name "SaneBar"
  desc "Tame your macOS menu bar — hide, organize, and search your icons"
  homepage "https://sanebar.com"

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "SaneBar.app"

  caveats <<~EOS
    Already have SaneBar installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanebar

    SaneBar updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneBar",
    "~/Library/Preferences/com.sanebar.app.plist",
    "~/Library/Caches/com.sanebar.app",
  ]

  livecheck do
    url "https://sanebar.com/appcast.xml"
    strategy :sparkle
  end
end
