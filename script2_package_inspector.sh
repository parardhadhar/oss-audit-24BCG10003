#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Aaryan Maurya | Roll: 24BAI10259
# Course: Open Source Software | Software Choice: Git
# Description: Checks if a FOSS package is installed,
#              shows its details, and prints a philosophy note
# ============================================================

# --- Package to inspect ---
PACKAGE="git"

echo "=================================================="
echo "       FOSS Package Inspector"
echo "=================================================="
echo ""

# --- Check if the package is installed using dpkg (Ubuntu/Debian) ---
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    # Package IS installed — show its details
    echo "  [✔] '$PACKAGE' is installed on this system."
    echo ""
    echo "  Package Details:"
    echo "  ----------------"

    # Extract version number from dpkg output
    VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    echo "  Version  : $VERSION"

    # Show full package info using apt-cache
    apt-cache show "$PACKAGE" 2>/dev/null | grep -E "^(Version|License|Maintainer|Homepage|Description)" | head -10

else
    # Package is NOT installed — prompt user to install
    echo "  [✘] '$PACKAGE' is NOT installed."
    echo ""
    echo "  To install it, run:"
    echo "  sudo apt install $PACKAGE"
fi

echo ""
echo "  Philosophy Notes (by package):"
echo "  --------------------------------"

# --- Case statement: print a philosophy note based on package name ---
case "$PACKAGE" in
    git)
        echo "  Git: Born from necessity — Linus built it in 2 weeks"
        echo "  after a proprietary tool abandoned the Linux project."
        echo "  It proves open-source tools can outperform proprietary ones."
        ;;
    apache2)
        echo "  Apache: The web server that democratised the internet,"
        echo "  built by volunteers and now powering millions of sites."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight to keep the web open,"
        echo "  free from corporate monopoly and closed standards."
        ;;
    python3)
        echo "  Python: A language shaped entirely by its community,"
        echo "  proving that collaborative design produces elegant results."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris to stream video freely,"
        echo "  now the most versatile media player in existence."
        ;;
    *)
        # Default case if package name doesn't match any above
        echo "  '$PACKAGE': An open-source tool contributing to the"
        echo "  shared foundation that modern computing is built on."
        ;;
esac

echo ""
echo "=================================================="
