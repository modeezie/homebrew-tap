cask "sanebar" do
  version "2.1.29"
  sha256 "0656d75d97b7ae6723a8eb786c2ac04031f8d8065b2963498ed68b68bdd1d986"

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
