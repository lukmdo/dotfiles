#!/usr/bin/env bash

set -euo pipefail

## BROWSER
# https://support.apple.com/en-gb/102362
# install defaultbrowser from brew/ports
defaultbrowser chrome

## SHORTCUTS/TEXT (DISABLE UNUSED/CONFLICTS)
# exported via
# defaults export pbs - | plutil -convert json -o - -  | jq --sort-keys > macos/defaults.pbs.json
plutil -convert xml1 -o - macos/defaults.pbs.json | defaults import pbs -
/System/Library/CoreServices/pbs -flush
