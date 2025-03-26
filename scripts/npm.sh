#!/bin/bash

# Define the global npm directory
NPM_GLOBAL_DIR="$HOME/.npm-global"
echo "NPM global directory set to $NPM_GLOBAL_DIR"

# Create the directory if it doesn't exist
mkdir -p "$NPM_GLOBAL_DIR"
echo "Created NPM global directory at $NPM_GLOBAL_DIR"

# Configure npm to use this directory
npm config set prefix "$NPM_GLOBAL_DIR"
echo "NPM global directory set to $NPM_GLOBAL_DIR"
