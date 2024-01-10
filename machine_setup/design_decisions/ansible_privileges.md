# Challenge: How to enter root password?

This is necessary for a variety of the installation step, such as installing packages through the apt package manager..

## Ideal solution

Use a proper secrets manager such as Ansible Vault or AWS Secrets Manager. In the long term, I do want to use AWS Secrets Manager for that. However, for now I don't want to spend any more time than absolutely necessary on this.

## Current solution

Run Ansible script with sudo.

- This means we have to manually enter the sudo password, but at least it will be cached in the current shell.
- Downside, this leads to some tricky behavior, because the script will be run as the root user.
  - For the most part, we can work around this by accessing the right user through the `{{ ansible_user }}` variable. I create this variable in inventory.ini in a way that always identifies the current user, whether the script is run with `sudo` or not.
    - For example if you want to user's home directory be simply specify the location as `/home/{{ ansible_user }/`
  - Another alternative is to specify `become_user: {{ ansible_user }}` for a given step. (Note this also requires (`become: true`.)
    - In particular, this is what I did to make sure ASDF installed python for the right user not root. (There is a way to set environment variables for ASDF_DIR and ASDF_DATA_DIR, which should allow sharing installations between users. However, I found this more tricky to get to work then was worth it.)

## Other solutions tried but discarded

On the surface, the most obvious solution seems to simply run the playbook with `--asdk-become-pass`. However, this quickly gets tedious, as the password is not cached between runs. I used the solution for a while, but found it increased iteration time too much when debugging.
