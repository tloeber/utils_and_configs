# Setup

## Manual setup

- Copy-paste settings and keybindings from this repo into VSCode's
- Periodically copy-paste back to see diff and commit changes.

## Automated setup (may not be up to date)

To start using the settings from this repo on your machine,

- On Windows only: Move/rename existing versions of keybindings.json and settings.json (automated in shell script but not batch file.)
- Run commands in batch file/shell script to create hard links
- If error occurs, check if your vscode configs are stored in different location

# Troubleshooting

- If hardlink breaks (it can - at least on Windows), simply re-run batch file/shell script to generate it again. (Make sure the version in repo is up to date.)

# Prerequisites

- This repo must be cloned to main drive (since hard links are not supported across drives)
