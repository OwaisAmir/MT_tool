#!/bin/bash

# Function to check if a package is installed
check_package() {
    package="$1"
    if ! command -v "$package" &> /dev/null; then
        echo "$package is not installed. Installing..."
        pkg install "$package" -y
    fi
}

# Check if Git is installed
check_package git

# Check if ncurses-utils is installed
check_package ncurses-utils

clear
chmod +x MT_tool.sh
bash MT_tool.sh
