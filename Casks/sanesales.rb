cask "sanesales" do
  version "1.2.6"
  sha256 "8cfba9b2d6e90744c66e0b81ce636639c1832bb57e24a6c2c89e074878c64b08"

  url "https://dist.sanesales.com/updates/SaneSales-#{version}.zip"
  name "SaneSales"
  desc "Indie sales dashboard with Basic and Pro modes"
  homepage "https://sanesales.com"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "SaneSales.app"

  caveats <<~EOS
    Already have SaneSales installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanesales

    SaneSales updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneSales",
    "~/Library/Preferences/com.sanesales.app.plist",
    "~/Library/Caches/com.sanesales.app",
  ]

  livecheck do
    url "https://sanesales.com/appcast.xml"
    strategy :sparkle
  end
end
