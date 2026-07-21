#!/bin/bash
# =========================================
# build.sh - Build the application
# =========================================
echo "Starting build process..."

# Navigate to project root
cd "$(dirname "$0")/.."

# Clean previous build artifacts
echo "Cleaning old build files..."
rm -rf target/*.jar

# Compile and package with Maven
echo "Compiling source code..."
mvn clean package -DskipTests

# Check if build succeeded
if [ -f "target/employee-management.jar" ]; then
    echo "Build successful: target/employee-management.jar"
else
    echo "Build failed!"
    exit 1
fi

echo "Build process finished."
