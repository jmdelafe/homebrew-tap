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
```

Use the full name: plain `brew install jot` installs the unrelated BSD `jot`
formula from homebrew/core.

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

## Troubleshooting

- If you run into install issues, ensure Homebrew is up to date:

```sh
brew update
```

- For issues with **jot** specifically, please report them on the main project repo:
  https://github.com/jmdelafe/jot/issues

## Maintaining the tap

Changes to `main` must go through a pull request, including administrator changes.
Force pushes and branch deletion are blocked. Reviewer approval is not required,
so the maintainer can merge their own pull requests.

The Tests workflow runs `brew style`, `brew audit` and an install/uninstall of
each cask on `macos-latest` for every pull request.

The Update casks workflow runs every six hours (or manually, or on a
`jot-release` repository dispatch). It uses `brew livecheck` to find the newest
Jot tag, including pre-releases, then opens a pull request that bumps `version`
and `sha256`. Pull requests opened with `GITHUB_TOKEN` do not trigger other workflows, so run
Tests on the update branch manually (Actions > Tests > Run workflow) before
merging.

To bump manually, edit `version` and `sha256` in `Casks/jot.rb`; get the hash
from the release's `checksums.txt`.

The repository Actions setting **Allow GitHub Actions to create and approve pull
requests** must be enabled for the workflow to open these pull requests. The
workflow does not approve or merge them and has no bypass of branch protection.
