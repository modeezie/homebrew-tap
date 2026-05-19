cask "saneclip" do
  version "2.3.5"
  sha256 "6646d6c12a2972fa1c441b0e6b5b87f78a3bafa38811f73fc4780801cc92b730"

  url "https://dist.saneclip.com/updates/SaneClip-#{version}.zip"
  name "SaneClip"
  desc "Privacy-first clipboard manager with Basic and Pro modes"
  homepage "https://saneclip.com"

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "SaneClip.app"

  caveats <<~EOS
    Already have SaneClip installed? Use --adopt to let Homebrew manage it:
      brew install --cask --adopt sane-apps/tap/saneclip

    SaneClip updates itself automatically via Sparkle, so you don't need
    brew upgrade — but it works too if you prefer.
  EOS

  zap trash: [
    "~/Library/Application Support/SaneClip",
    "~/Library/Preferences/com.saneclip.app.plist",
    "~/Library/Caches/com.saneclip.app",
  ]

  livecheck do
    url "https://saneclip.com/appcast.xml"
    strategy :sparkle
  end
end
