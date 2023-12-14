#!/usr/bin/env bash

# Removes all local saved state and lock files.

find . -name ".terraform" -exec rm -rf {} \;
find . -name "*.lock.hcl" -delete
find . -name "*.tfstate" -delete
