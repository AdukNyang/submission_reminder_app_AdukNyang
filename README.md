# submission_reminder_app_AdukNyang

This is a repository for my summative assessment - a submission reminder application that alerts students about upcoming assignment deadlines.

## How to Run the Application

### Prerequisites
- Git Bash or WSL (Windows Subsystem for Linux) for Windows users
- Basic shell/bash environment

### Setup Instructions

1. **Create the Environment**
   ```bash
   ./create_environment.sh
   ```
   - This will prompt you for your name
   - Creates a directory named `submission_reminder_{yourName}`
   - Sets up all necessary files and directories
   - Makes all shell scripts executable

2. **Navigate to Your App Directory**
   ```bash
   cd submission_reminder_{yourName}
   ```

3. **Run the Application**
   ```bash
   ./startup.sh
   ```
   - This starts the submission reminder application
   - Shows current assignment and days remaining
   - Lists students who haven't submitted

4. **Change Assignment (Optional)**
   ```bash
   ./copilot_shell_script.sh
   ```
   - Prompts for a new assignment name
   - Updates the configuration
   - Automatically reruns the application with new settings

## File Structure
```
submission_reminder_{yourName}/
├── app/
│   └── reminder.sh          # Main reminder logic
├── assets/
│   └── submissions.txt      # Student submission data
├── config/
│   └── config.env          # Configuration settings
├── modules/
│   └── functions.sh        # Helper functions
└── startup.sh              # Application entry point
```

## Testing
The application includes sample data for 16 students with various submission statuses across different assignments (Shell Navigation, Git, Shell Basics, Shell Permissions).