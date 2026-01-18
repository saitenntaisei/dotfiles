# Chezmoi Usage Guide

This repo contains dotfiles powered by chezmoi. Follow these steps to initialize and apply the dotfiles on a new machine.

## Prerequisites
- chezmoi
- 1password-cli

## Initialize
1. Initialize from this repo:
   ```sh
   chezmoi init <git-repo-url>
   ```
2. Inspect what will change:
   ```sh
   chezmoi diff
   ```

## Apply
1. Apply changes to your home directory:
   ```sh
   chezmoi apply
   ```
   1password login will be needed. 
2. Re-run `chezmoi diff` to confirm it is clean.

## Common Tasks
- Edit a managed file:
  ```sh
  chezmoi edit ~/.zshrc
  ```
- Add an existing file into chezmoi:
  ```sh
  chezmoi add ~/.config/<app>
  ```
- Update from repo:
  ```sh
  chezmoi update
  ```
- Check setup:
  ```sh
  chezmoi doctor
  ```

## Notes
- Files prefixed with `private_` are treated as restricted by chezmoi.
- Files ending in `*.tmpl` are templates rendered per host/user.
