#!/bin/bash

# Check if we're in the correct directory
if [ ! -f "config/config.env" ]; then
    echo "Error: Please run this script from the submission_reminder app directory"
    exit 1
fi

echo "Starting Submission Reminder Application..."
echo "=========================================="

# Run the reminder application
./app/reminder.sh