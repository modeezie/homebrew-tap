cask "sanesales" do
  version "1.3.2"
  sha256 "1d1f367b5ed4e6738cf6857752ebbaa97da09519361c863d2f616c5737cf1e2b"

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
