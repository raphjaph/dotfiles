#!/usr/bin/env bash

set -euo pipefail

BRANCH=${1:-master}

git stash
git checkout $1
