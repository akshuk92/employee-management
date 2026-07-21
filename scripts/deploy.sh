#!/bin/bash
# =========================================
# deploy.sh - Deploy the application
# =========================================
APP_NAME="employee-management"
DEPLOY_DIR="$HOME/apps/$APP_NAME"
JAR_FILE="target/$APP_NAME.jar"
LOG_FILE="logs/deployment.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] Deployment started" >> "$LOG_FILE"

# Copy jar to deploy directory
echo "Copying application jar to $DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"
cp "$JAR_FILE" "$DEPLOY_DIR/"

# Copy configuration files
echo "Copying configuration files"
cp -r config/ "$DEPLOY_DIR/config/"

# Restart the service
echo "Restarting application service..."
# systemctl restart employee-management.service

echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] Deployment completed" >> "$LOG_FILE"
echo "Deployment finished successfully."
echo " deployment started"

