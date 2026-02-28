cask "sanehosts" do
  version "1.1.0"
  sha256 "c248146d26303c9f0865a62f639e5a4e7f311c5c6c08a85560d537f98bc669d7"

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
