# Usage (Ubuntu)

- To perform an **initial setup**, start by running the bootstraps script: `bash bootstrap.sh`.
  - Note that we are faced with a chicken-and-egg problem, because we don't have this repo present on a new machine yet. Often the easiest solution is to just copy-paste the  contents of this bootstrap script into a shell on the new machine, preferably without `set -eu`.
  - If we were running this set up from another machine that serves as the Ansible control node, we could run a single Ansible script from there, and there would be no need for a bootstrap script. This is obviously the way to go for servers, but generally not for personal or development machines: Since we log onto these directly rather than connecting through ssh, we usually don't have a locked down SSH server running, nor do we generally have a static IP configured. Thus, I find that the best solution is to use the somewhat elegant bootstrap script for initial setup, and henceforth run the Ansible script on localhost.
  - Since we usually will not have `make` available on a new machine, running this bootstrap script is not defined in the makefile. This script installs `make`, as well as git, and then clones this repo (if it does not already exist in the expected location).
- Install Ansible by running `make ansible`.
- Run the main machine configuration by cd'ing into utils_and_configs/machine_setup, and running `make machine_setup`.

# Notes

## AWS CLI

Unfortunately v2 is not available through Linux package manager (installing it through apt will still install v1) or PyPi ([only contains v1](https://github.com/aws/aws-cli/issues/4947) and unofficial version of v2) as of August 2023.
