#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Aaryan Maurya | Roll: 24BAI10259
# Course: Open Source Software | Software Choice: Git
# Description: Reads a log file, counts keyword occurrences,
#              and shows the last 5 matching lines
# Usage: ./script4_log_analyzer.sh [logfile] [keyword]
# Example: ./script4_log_analyzer.sh /var/log/dpkg.log git
# ============================================================

# --- Accept log file path as first argument ($1) ---
LOGFILE=$1

# --- Accept keyword as second argument, default to 'error' if not given ---
KEYWORD=${2:-"error"}

# --- Counter to track how many matching lines we find ---
COUNT=0

echo "=================================================="
echo "            Log File Analyzer"
echo "=================================================="
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [!] No log file specified."
    echo "      Usage: $0 <logfile> [keyword]"
    echo "      Example: $0 /var/log/dpkg.log git"
    exit 1
fi

# --- Retry loop: check if file exists, retry up to 3 times ---
RETRIES=0
MAX_RETRIES=3

while [ ! -f "$LOGFILE" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
    echo "  [!] File not found: $LOGFILE"
    RETRIES=$((RETRIES + 1))

    # If we haven't hit max retries, ask for a new path
    if [ $RETRIES -lt $MAX_RETRIES ]; then
        read -p "  Enter a valid log file path (attempt $((RETRIES+1))/$MAX_RETRIES): " LOGFILE
    fi
done

# --- If file still not found after retries, exit with error ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [✘] Could not find a valid log file after $MAX_RETRIES attempts."
    echo "      Tip: Try /var/log/dpkg.log or /var/log/syslog"
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [!] Warning: The file '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "  Analyzing  : $LOGFILE"
echo "  Keyword    : '$KEYWORD'"
echo ""

# --- Read the log file line by line using a while-read loop ---
while IFS= read -r LINE; do

    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each match
    fi

done < "$LOGFILE"   # Feed the file into the while loop

# --- Print the summary ---
echo "  Result: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Show last 5 matching lines for context ---
echo "  Last 5 matching lines:"
echo "  ----------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
    echo "  > $MATCH"
done

echo ""
echo "=================================================="
echo "  Tip: For Git-related logs, try:"
echo "  $0 /var/log/dpkg.log git"
echo "=================================================="
