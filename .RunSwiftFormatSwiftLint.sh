#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGE_PATH="$SCRIPT_DIR"

SWIFTFORMAT_COMMAND=$(command -v swiftformat)
SWIFTLINT_COMMAND=$(command -v swiftlint)

if [ -z "$SWIFTFORMAT_COMMAND" ]; then
    echo "swiftformat is not installed"
else
    echo "swiftformat is installed at: $SWIFTFORMAT_COMMAND"
    cd "$PACKAGE_PATH" || exit
    "$SWIFTFORMAT_COMMAND" .
fi

if [ -z "$SWIFTLINT_COMMAND" ]; then
    echo "swiftlint is not installed"
else
    echo "swiftlint is installed at: $SWIFTLINT_COMMAND"
    cd "$PACKAGE_PATH" || exit
    "$SWIFTLINT_COMMAND"
fi
