cask "jot" do
  version "0.1.0-alpha"
  sha256 "3a4da4d72cb04c6bcf11f19fc18c22123cf5cc47e2cc8ab1cc064e2b66ed3263"

  url "https://github.com/jmdelafe/jot/releases/download/v#{version}/Jot-macos-arm64.zip"
  name "Jot"
  desc "Menu bar scratchpad for quick notes"
  homepage "https://github.com/jmdelafe/jot"

  livecheck do
    url :url
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+(?:-[\w.]+)?)$/i)
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Jot.app"

  zap trash: [
    "~/Library/Preferences/com.jmdelafe.jot.plist",
    "~/Library/Saved Application State/com.jmdelafe.jot.savedState",
  ]

  caveats <<~EOS
    Jot is ad-hoc signed, not Developer ID signed or notarized. If macOS blocks
    the first launch, use System Settings > Privacy & Security > Open Anyway.

    Notes in ~/Library/Application Support/Jot are kept on uninstall and zap.
  EOS
end
