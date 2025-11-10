#!/bin/bash

echo "==================================="
echo "Omarchy Installation - All Packages"
echo "==================================="
echo ""

# Install fish shell
echo "Step 1: Installing Fish Shell..."
echo "-----------------------------------"
./omarchy-install-fish.sh

if [ $? -ne 0 ]; then
    echo "Error: Fish installation failed"
    exit 1
fi

echo ""
echo "-----------------------------------"
echo "Step 2: Installing MPD..."
echo "-----------------------------------"
./omarchy-install-mpd.sh

if [ $? -ne 0 ]; then
    echo "Error: MPD installation failed"
    exit 1
fi

echo ""
echo "-----------------------------------"
echo "Step 3: Installing AI CLIs..."
echo "-----------------------------------"
./omarchy-install-ai-cli.sh

if [ $? -ne 0 ]; then
    echo "Error: AI CLIs installation failed"
    exit 1
fi

echo ""
echo "==================================="
echo "All installations completed!"
echo "==================================="
