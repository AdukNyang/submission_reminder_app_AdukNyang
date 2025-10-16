#!/bin/bash

# Prompt user for their name
echo "Enter your name:"
read user_name

# Create main directory
dir_name="submission_reminder_${user_name}"
mkdir -p "$dir_name"

# Create subdirectories
mkdir -p "$dir_name/app"
mkdir -p "$dir_name/assets"
mkdir -p "$dir_name/config"
mkdir -p "$dir_name/modules"

# Create config.env file
cat > "$dir_name/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create reminder.sh file
cat > "$dir_name/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Create functions.sh file
cat > "$dir_name/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Create submissions.txt file with additional student records
cat > "$dir_name/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Emmanuel, Shell Permissions, Submitted
Blessing, Git, Not Submitted
Kelvin, Shell Basics, Submitted
Amina, Shell Navigation, Submitted
Victor, Shell Permissions, Not Submitted
Tinashe, Git, Submitted
Mary, Shell Basics, Submitted
James, Shell Navigation, not submitted
Sarah, Git, submitted
Michael, Shell Basics, not submitted
Lisa, Shell Permissions, submitted
David, Shell Navigation, not submitted
EOF

# Create startup.sh file
cat > "$dir_name/startup.sh" << 'EOF'
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
EOF

echo "Environment created successfully in directory: $dir_name"
echo "To test the application:"
echo "1. cd $dir_name"
echo "2. ./startup.sh"