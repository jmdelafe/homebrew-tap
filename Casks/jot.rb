cask "jot" do
  version "0.1.0-alpha"
  sha256 "9c44ffdb75ee2e7620aeeddb49d43dcb7441bd47828c70ad593dc873797004a6"

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
