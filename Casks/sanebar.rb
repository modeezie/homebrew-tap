cask "sanebar" do
  version "2.1.56"
  sha256 "629f21c5f0bd11e495ac9266f4fbfc6b45251fb4e0bfc9f4f529dcf8e465657f"

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
