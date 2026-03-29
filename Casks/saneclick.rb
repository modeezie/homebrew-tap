cask "saneclick" do
  version "1.1.2"
  sha256 "b28128562f121a0d9497a8a49ea3fe244cd797a311cea6f9c707796ff4532c30"

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
