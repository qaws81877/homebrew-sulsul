# homebrew-sulsul

Unofficial [Homebrew](https://brew.sh) tap for [Sulsul (술술)](https://github.com/qaws81877/sulsul), a macOS dictation app.

## Install

```bash
brew install --cask qaws81877/sulsul/sulsul
```

Requires macOS 15 or later. The cask installs the notarized `Sulsul.dmg` from the GitHub release and checks its SHA-256.

## Updates

Sulsul updates itself (Sulsul > Check for Updates…), so the cask is marked `auto_updates true` and a plain `brew upgrade` leaves it alone. This tap tracks the latest release only for new installs.

## Uninstall

```bash
brew uninstall --cask sulsul          # remove the app
brew uninstall --cask --zap sulsul    # also remove its settings, caches and data
```

API keys entered in the app live in the macOS Keychain and are not removed automatically.

## Maintaining

After publishing a Sulsul release, run `scripts/bump.sh <version>`, check the diff, and commit.
