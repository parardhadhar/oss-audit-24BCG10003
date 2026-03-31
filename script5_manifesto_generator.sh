#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Aaryan Maurya | Roll: 24BAI10259
# Course: Open Source Software | Software Choice: Git
# Description: Asks the user 3 questions interactively and
#              generates a personalised open source manifesto
# ============================================================

# --- Alias concept (demonstrated via comment and function) ---
# In a real shell session you could set: alias today='date +%d\ %B\ %Y'
# Here we achieve the same with a variable for portability in scripts

# Get today's date in readable format
DATE=$(date '+%d %B %Y')

# Define output filename using the current username
OUTPUT="manifesto_$(whoami).txt"

echo "=================================================="
echo "       Open Source Manifesto Generator"
echo "=================================================="
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""

# --- Question 1: Ask for a tool they use daily ---
read -p "  1. Name one open-source tool you use every day: " TOOL

# --- Question 2: Ask what freedom means to them ---
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

# --- Question 3: Ask what they would build and share ---
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Compose the manifesto by concatenating strings and writing to file ---
# Using > to create/overwrite the file, then >> to append each line

echo "==================================================" > "$OUTPUT"
echo "       MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "       Generated on: $DATE" >> "$OUTPUT"
echo "       By: $(whoami)" >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Main manifesto paragraph — built from user's answers
echo "  I believe in the power of open source software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Every day, I rely on $TOOL — a tool built not by" >> "$OUTPUT"
echo "  a corporation for profit, but by a community for" >> "$OUTPUT"
echo "  the common good. To me, freedom means $FREEDOM." >> "$OUTPUT"
echo "  That is the same freedom that open source gives" >> "$OUTPUT"
echo "  every developer: the freedom to read, change," >> "$OUTPUT"
echo "  and share the tools they depend on." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Inspired by projects like Git — built by Linus" >> "$OUTPUT"
echo "  Torvalds and shared with the world under the" >> "$OUTPUT"
echo "  GPL v2 license — I commit to contributing to" >> "$OUTPUT"
echo "  the open-source community. One day, I will build" >> "$OUTPUT"
echo "  $BUILD and share it freely, so that others may" >> "$OUTPUT"
echo "  build on my work just as I have built on theirs." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Standing on the shoulders of giants, I choose" >> "$OUTPUT"
echo "  to be a giant for the next generation." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"
echo "  Signed: $(whoami) | $DATE" >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"

# --- Confirm the file was saved and display it ---
echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""
echo "--- Your Manifesto ---"
echo ""

# Display the saved manifesto
cat "$OUTPUT"
