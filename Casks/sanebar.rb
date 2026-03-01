cask "sanebar" do
  version "2.1.16"
  sha256 "5d319bcc2433c40f7f1809f121f5c10ed2fbd2790ebfd6c2679ec0cb172bc85e"

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
