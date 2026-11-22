# Homebrew Tap (jmdelafe)

This repository contains Homebrew casks maintained by **@jmdelafe**.

## Usage

Add the tap:

```sh
brew tap jmdelafe/tap
brew trust jmdelafe/tap
```

Install a cask:

```sh
brew install --cask jmdelafe/tap/jot
brew install --cask jmdelafe/tap/alacritty
```

Use the full name: plain `brew install jot` installs the unrelated BSD `jot`
formula from homebrew/core, and plain `brew install alacritty` resolves to the
official cask, which Homebrew disabled on 2026-09-01.

Upgrade installed casks:

```sh
brew upgrade
```

## Casks

- **jot** — Menu bar scratchpad for quick notes (Apple Silicon, macOS 26+)
  Project: https://github.com/jmdelafe/jot

Jot is ad-hoc signed, not Developer ID signed or notarized. If macOS blocks the
first launch, use **System Settings > Privacy & Security > Open Anyway**.
Uninstalling, including `brew uninstall --zap`, keeps your notes in
`~/Library/Application Support/Jot`.

- **alacritty** — GPU-accelerated terminal emulator
  Project: https://github.com/alacritty/alacritty

Homebrew disabled the official `alacritty` cask because its builds are not
notarized ([alacritty/alacritty#9046](https://github.com/alacritty/alacritty/issues/9046)).
This tap keeps the same cask, tracking upstream releases. If you installed it from
the official cask, switch over (your `~/.config/alacritty` config is untouched):

```sh
brew uninstall --cask alacritty
brew install --cask jmdelafe/tap/alacritty
```

If macOS blocks the first launch, use **System Settings > Privacy & Security >
Open Anyway**.

## Troubleshooting

- If you run into install issues, ensure Homebrew is up to date:

```sh
brew update
```

- For issues with **jot** specifically, please report them on the main project repo:
  https://github.com/jmdelafe/jot/issues
- For issues with **alacritty** itself, report them upstream:
  https://github.com/alacritty/alacritty/issues

## Maintaining the tap

Changes to `main` must go through a pull request, including administrator changes.
Force pushes and branch deletion are blocked. Reviewer approval is not required,
so the maintainer can merge their own pull requests.

The Tests workflow runs `brew style`, `brew audit` and an install/uninstall of
each cask on `macos-latest` for every pull request.

The Update casks workflow runs every six hours (or manually, or on a
`jot-release` repository dispatch). For each cask it uses `brew livecheck` to find
the newest version (Jot tags including pre-releases, latest Alacritty GitHub
release), then opens a pull request that bumps `version` and `sha256`. Pull requests opened with `GITHUB_TOKEN` do not trigger other workflows, so run
Tests on the update branch manually (Actions > Tests > Run workflow) before
merging.

To bump manually, edit `version` and `sha256` in `Casks/<cask>.rb`. For Jot,
get the hash from the release's `checksums.txt`; for Alacritty, run
`shasum -a 256` on the release's `.dmg`.

The repository Actions setting **Allow GitHub Actions to create and approve pull
requests** must be enabled for the workflow to open these pull requests. The
workflow does not approve or merge them and has no bypass of branch protection.
