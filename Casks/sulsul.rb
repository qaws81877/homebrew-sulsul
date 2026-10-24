cask "sulsul" do
  version "5.0.1"
  sha256 "7938d123349fbbdd90f2c2a2ba3b163bbd57eda238bf553bee17994ba4a454ec"

  url "https://github.com/qaws81877/sulsul/releases/download/v#{version}/Sulsul.dmg"
  name "Sulsul"
  name "술술"
  desc "Dictation app with Korean-first AI cleanup"
  homepage "https://github.com/qaws81877/sulsul"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Sulsul.app"

  zap trash: [
    "~/Library/Application Support/com.qaws81877.sulsul",
    "~/Library/Caches/com.qaws81877.sulsul",
    "~/Library/HTTPStorages/com.qaws81877.sulsul",
    "~/Library/HTTPStorages/com.qaws81877.sulsul.binarycookies",
    "~/Library/Preferences/com.qaws81877.sulsul.plist",
  ]
end
