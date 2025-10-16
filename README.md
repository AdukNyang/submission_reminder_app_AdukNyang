# submission_reminder_app_AdukNyang

This is a repository for my summative assessment - a submission reminder application that alerts students about upcoming assignment deadlines.

## Files Included

- `create_environment.sh` - Sets up the complete application environment
- `copilot_shell_script.sh` - Updates assignment names and reruns the application
- `README.md` - This instruction file

## How to Run the Application

### Prerequisites
- Git Bash or WSL (Windows Subsystem for Linux) for Windows users
- Basic shell/bash environment

### Setup Instructions

1. **Create the Environment**
   ```bash
   bash create_environment.sh
   ```
   - Prompts for your name
   - Creates directory `submission_reminder_{yourName}`
   - Sets up all necessary files and directories

2. **Navigate to Your App Directory**
   ```bash
   cd submission_reminder_{yourName}
   ```

3. **Run the Application**
   ```bash
   bash startup.sh
   ```
   - Shows current assignment and days remaining
   - Lists students who haven't submitted

4. **Change Assignment (Optional)**
   ```bash
   bash copilot_shell_script.sh
   ```
   - Prompts for new assignment name
   - Updates configuration and reruns application

## Application Features

- Tracks student submission status for multiple assignments
- Configurable assignment names and deadlines
- Automated directory structure creation
- Cross-platform compatibility (Windows/Linux)

## Git Workflow

This project uses a feature branch workflow:
- `feature/setup` - Development and rough work
- `main` - Final clean submission files only
