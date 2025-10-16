#!/bin/bash

# Check if config.env exists
if [ ! -f "config/config.env" ]; then
    echo "Error: config/config.env not found. Please run from the submission_reminder app directory."
    exit 1
fi

# Prompt user for new assignment name
echo "Enter the new assignment name:"
read new_assignment

# Update the ASSIGNMENT value in config.env using sed
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" config/config.env

echo "Assignment updated to: $new_assignment"
echo "Configuration updated successfully!"
echo ""
echo "Running startup.sh to check submissions for the new assignment..."
echo "================================================================"

# Run startup.sh to check submissions with new assignment
./startup.sh