#!/bin/bash
set -e

cd "$(dirname "$0")"

if ! command -v pyinstaller >/dev/null 2>&1; then
    echo "PyInstaller not found. Installing..."
    pip install --user pyinstaller
fi

MAIN_SCRIPT="main/main.py"
DEPLOY_DIR="../deploy"
BINARY_NAME="cleanconn3ct"

pyinstaller --onefile "$MAIN_SCRIPT" --distpath "$DEPLOY_DIR" --name "$BINARY_NAME" --paths "$(pwd)"

cp -r modules "$DEPLOY_DIR/"

echo "Binary exported to $DEPLOY_DIR/$BINARY_NAME"
