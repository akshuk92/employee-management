#!/bin/bash
# =========================================
# cleanup.sh - Clean temporary files and old logs
# =========================================
echo "Cleaning temp directory..."
rm -rf temp/*

echo "Removing log files older than 7 days..."
find logs/ -name "*.log" -mtime +7 -exec rm {} \;

echo "Removing empty directories..."
find . -type d -empty -delete 2>/dev/null

echo "Displaying current disk usage..."
du -sh .

echo "Cleanup finished."
