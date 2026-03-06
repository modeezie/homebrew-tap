cask "saneclip" do
  version "2.2.4"
  sha256 "a9478003e4758cf714b6c87fb9716d639563f2b0afc771bd23340c108877675f"

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
