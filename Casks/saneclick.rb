cask "saneclick" do
  version "1.1.8"
  sha256 "94fc909316b844adbad60b98b52e14059694d427769c2eb3ebdab3c14740e14b"

  url "https://dist.saneclick.com/updates/SaneClick-#{version}.zip"
  name "SaneClick"
  desc "Finder action launcher with Basic and Pro script packs"
  homepage "https://saneclick.com"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "SaneClick.app"

  caveats <<~EOS
    Already have SaneClick installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/saneclick

    SaneClick updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneClick",
    "~/Library/Preferences/com.saneclick.SaneClick.plist",
    "~/Library/Caches/com.saneclick.SaneClick",
  ]

  livecheck do
    url "https://saneclick.com/appcast.xml"
    strategy :sparkle
  end
end
