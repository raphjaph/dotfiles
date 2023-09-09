#!/usr/bin/env bash

set -euo pipefail

BRANCH=${1:-master}

git checkout $BRANCH
git stash pop
