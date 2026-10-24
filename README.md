# homebrew-sulsul

Unofficial [Homebrew](https://brew.sh) tap for [Sulsul (술술)](https://github.com/qaws81877/sulsul), a macOS dictation app.

## Install

```bash
brew install --cask qaws81877/sulsul/sulsul
```

Requires macOS 15 or later. The cask installs the notarized `Sulsul.dmg` from the GitHub release and checks its SHA-256.

## Updates

Sulsul updates itself (Sulsul > Check for Updates…), so the cask is marked `auto_updates true`. With current Homebrew, `brew upgrade` also upgrades it when the installed app is older than the version in this tap, and does nothing when the app has already updated itself to that version. Install and upgrade through brew need the tap to be current, so a new release can take a short while to show up here.

## Uninstall

```bash
brew uninstall --cask sulsul          # remove the app
brew uninstall --cask --zap sulsul    # also remove its settings, caches and data
```

API keys entered in the app live in the macOS Keychain and are not removed automatically.

## Maintaining

After publishing a Sulsul release, run `scripts/bump.sh <version>`, check the diff, and commit.
