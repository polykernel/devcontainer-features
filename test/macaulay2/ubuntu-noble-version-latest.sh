#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Feature-specific tests
check 'version' M2 --version | grep '1.24.05'

# Report result
reportResults
