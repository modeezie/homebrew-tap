cask "sanehosts" do
  version "1.1.15"
  sha256 "e53362bdd405f8ea82cc1052b799b07326408eb3f7651b26d00b8b998a25d9f6"

  url "https://dist.sanehosts.com/updates/SaneHosts-#{version}.zip"
  name "SaneHosts"
  desc "Host-based blocker with Basic and Pro profiles"
  homepage "https://sanehosts.com"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "SaneHosts.app"

  caveats <<~EOS
    Already have SaneHosts installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/sanehosts

    SaneHosts updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneHosts",
    "~/Library/Preferences/com.mrsane.SaneHosts.plist",
    "~/Library/Caches/com.mrsane.SaneHosts",
  ]

  livecheck do
    url "https://sanehosts.com/appcast.xml"
    strategy :sparkle
  end
end
