#!/bin/bash
# =========================================
# monitor.sh - Simple system monitoring script
# =========================================
echo "===== System Monitor Report ====="
echo "Date: $(date)"
echo ""
echo "--- Disk Usage ---"
df -h

echo ""
echo "--- Memory Usage ---"
free -h

echo ""
echo "--- Top Processes ---"
ps aux --sort=-%cpu | head -10

echo ""
echo "--- Application Log Tail ---"
tail -n 20 logs/application.log
