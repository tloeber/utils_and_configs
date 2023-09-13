# Usage (Ubuntu)

- To perform an **initial setup**, start by running the bootstraps script: `bash bootstrap.sh`. Note that we may not have `make` available on a new machine, therefore this step is not defined in the makefile. This script installs `make`, as well as git, and clones this repo if it does not already exist (in the expected location).
-

# Notes

## AWS CLI

Unfortunately v2 is not available through Linux package manager (installing it through apt will still install v1) or PyPi ([only contains v1](https://github.com/aws/aws-cli/issues/4947) and unofficial version of v2) as of August 2023.
