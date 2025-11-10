#!/bin/bash

# Script to install AI CLIs: GitHub Copilot CLI and Gemini CLI

echo "Starting AI CLIs installation..."

# Function to check if a command exists
command_exists () {
  type "$1" &> /dev/null ;
}

# Check for Node.js
if ! command_exists node ; then
  echo "Error: Node.js is not installed. Please install Node.js (version 22 or higher) first."
  exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 22 ]; then
  echo "Error: Node.js version is too old. Please update to Node.js 22 or higher."
  exit 1
fi
echo "Node.js version check passed (v$NODE_VERSION)."

# Check for npm
if ! command_exists npm ; then
  echo "Error: npm is not installed. Please install npm (version 10 or higher) first."
  exit 1
fi

# Check npm version
NPM_VERSION=$(npm -v | cut -d '.' -f 1)
if [ "$NPM_VERSION" -lt 10 ]; then
  echo "Error: npm version is too old. Please update to npm 10 or higher."
  exit 1
fi
echo "npm version check passed (v$NPM_VERSION)."

echo "All prerequisites met. Installing AI CLIs globally..."

# Install GitHub Copilot CLI
echo "Installing GitHub Copilot CLI..."
npm install -g @github/copilot
if [ $? -ne 0 ]; then
  echo "Error: GitHub Copilot CLI installation failed."
  exit 1
fi
echo "GitHub Copilot CLI installed successfully!"
echo "Next steps for Copilot: Run 'copilot auth' to link your GitHub account."

echo "----------------------------------------"

# Install Gemini CLI
echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli
if [ $? -ne 0 ]; then
  echo "Error: Gemini CLI installation failed."
  exit 1
fi
echo "Gemini CLI installed successfully!"
echo "Next steps for Gemini: Run 'gemini auth' to link your Google account."


echo "All AI CLIs installed successfully!"

exit 0
