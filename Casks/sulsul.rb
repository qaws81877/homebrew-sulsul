cask "sulsul" do
  version "5.0"
  sha256 "3105f269b8b7588ff0ee46ed6578b8cb73d3eb4868a83d9c31c3f464d1a9e630"

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
