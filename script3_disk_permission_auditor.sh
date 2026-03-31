#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Aaryan Maurya | Roll: 24BAI10259
# Course: Open Source Software | Software Choice: Git
# Description: Loops through key system directories and
#              reports their size, owner, and permissions
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=================================================="
echo "         Disk and Permission Auditor"
echo "=================================================="
echo ""
echo "  Auditing key system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "Directory" "Permissions (type/owner/group)" "Size"
printf "  %-20s %-25s %-10s\n" "---------" "------------------------------" "----"

# --- Loop through each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before inspecting
    if [ -d "$DIR" ]; then

        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get human-readable size using du, suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        # Directory doesn't exist on this system
        printf "  %-20s %s\n" "$DIR" "[ does not exist on this system ]"
    fi

done

echo ""
echo "=================================================="
echo "  Git-Specific Directory Check"
echo "=================================================="
echo ""

# --- Check Git's config directory and binary location ---
GIT_CONFIG="$HOME/.gitconfig"    
GIT_BINARY="/usr/bin/git"        
GIT_SYSTEM_CONFIG="/etc/gitconfig" 

# Check user git config file
if [ -f "$GIT_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$GIT_CONFIG" 2>/dev/null | cut -f1)
    echo "  [✔] Git user config found: $GIT_CONFIG"
    echo "      Permissions: $PERMS | Size: $SIZE"
else
    echo "  [!] No user Git config found at $GIT_CONFIG"
    echo "      (Run 'git config --global user.name YourName' to create one)"
fi

echo ""

# Check git binary
if [ -f "$GIT_BINARY" ]; then
    PERMS=$(ls -l "$GIT_BINARY" | awk '{print $1, $3, $4}')
    echo "  [✔] Git binary found: $GIT_BINARY"
    echo "      Permissions: $PERMS"
else
    echo "  [✘] Git binary not found at $GIT_BINARY"
fi

echo ""

# Check system-wide git config
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    echo "  [✔] System-wide Git config found: $GIT_SYSTEM_CONFIG"
else
    echo "  [!] No system-wide Git config at $GIT_SYSTEM_CONFIG"
fi

echo ""
echo "=================================================="
