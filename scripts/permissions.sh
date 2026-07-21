#!/bin/bash
# =========================================
# permissions.sh - Set correct file permissions
# =========================================
echo "Setting script permissions..."
chmod 755 scripts/*.sh

echo "Setting config file permissions (read-only)..."
chmod 644 config/*.properties

echo "Securing secrets directory..."
chmod 700 secrets/
chmod 600 secrets/*

echo "Setting log directory permissions..."
chmod 755 logs/

echo "Permissions updated successfully."
