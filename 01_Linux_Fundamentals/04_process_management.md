# Linux Process Management Guide

## Understanding Processes

Every program running on Linux is a process. Each process has:

- A unique Process ID (PID)
- A Parent Process ID (PPID)
- User/owner
- Priority/nice value
- Resource usage stats

## Essential Process Commands

### 1. ps (Process Status)

Displays information about running processes.

```bash
# Basic Usage
ps                  # Show your processes
ps aux              # Show all processes
ps -ef              # Full process listing

# Common Options
ps aux | grep nginx    # Find nginx processes
ps -u username         # Show user's processes
ps -p 1234            # Show specific PID
ps --forest           # Show process tree

# Useful columns
# PID: Process ID
# %CPU: CPU usage
# %MEM: Memory usage
# STAT: Process state
# TIME: CPU time used
# COMMAND: Command name
```

### 2. top (Interactive Process Viewer)

Real-time view of system processes.

```bash
# Basic Usage
top                 # Start top

# Interactive Commands (while in top)
q                   # Quit
h                   # Help
k                   # Kill process (enter PID)
r                   # Renice process
M                   # Sort by memory usage
P                   # Sort by CPU usage
1                   # Show individual CPU cores
c                   # Show full command path
```

### 3. kill (Terminate Processes)

Sends signals to processes.

```bash
# Common Signals
kill -15 PID        # SIGTERM (graceful shutdown)
kill -9 PID         # SIGKILL (force shutdown)
kill -1 PID         # SIGHUP (reload configuration)

# Examples
kill 1234           # Terminate process 1234
killall firefox     # Kill all firefox processes
pkill process_name  # Kill by process name
```

### 4. nice and renice (Process Priority)

Manage process priority (-20 to 19, lower = higher priority).

```bash
# Start new process with priority
nice -n 10 command      # Run with lower priority
nice -n -10 command     # Run with higher priority (needs sudo)

# Change running process priority
renice -n 5 -p PID     # Change priority of running process
```

### 5. jobs, bg, fg (Job Control)

Manage background and foreground jobs.

```bash
# Job Control
command &            # Start process in background
Ctrl + Z            # Suspend current process
bg                  # Resume suspended process in background
fg                  # Bring background process to foreground
jobs                # List background jobs
```

## Common Use Cases

### 1. Finding Resource-Heavy Processes

```bash
# Using top
top -o %CPU         # Sort by CPU usage
top -o %MEM         # Sort by memory usage

# Using ps
ps aux --sort=-%cpu | head -n 5    # Top 5 CPU-using processes
ps aux --sort=-%mem | head -n 5    # Top 5 memory-using processes
```

### 2. Managing Unresponsive Programs

```bash
# Find the process
ps aux | grep program_name

# Try graceful shutdown first
kill -15 PID

# If still running after a few seconds
kill -9 PID
```

### 3. Background Processing

```bash
# Start process in background
long_running_command &

# Check status
jobs

# Bring to foreground if needed
fg %1              # %1 is job number from jobs command
```

### 4. crontab (Scheduled Process Management)

Manages scheduled tasks (cron jobs) that run automatically at specified times.

```bash
# Basic Usage
crontab -l          # List current user's cron jobs
crontab -e          # Edit cron jobs
crontab -r          # Remove all cron jobs

# Common Options
-u username         # Manage another user's crontab (requires sudo)
-i                  # Prompt before deleting all jobs
```

#### Crontab Time Format

```bash
# Format:
# Minute Hour Day Month DayOfWeek Command
# (0-59) (0-23) (1-31) (1-12) (0-6, 0=Sunday)

# Special Characters
*        # Any value
,        # Value list separator
-        # Range of values
/        # Step values
```

#### Common Examples

```bash
# Format examples
30 2 * * *        # Every day at 2:30 AM
0 */4 * * *       # Every 4 hours
*/15 * * * *      # Every 15 minutes
0 0 * * 0         # Every Sunday at midnight
0 0 1 * *         # First of every month

# Real usage examples
# Backup home directory daily at 1 AM
0 1 * * * tar -czf /backup/home_$(date +\%Y\%m\%d).tar.gz /home/

# Clear temp files weekly
0 0 * * 0 rm -rf /tmp/*

# Run system updates daily at 3 AM
0 3 * * * apt update && apt upgrade -y

# Log system status hourly
0 * * * * top -b -n 1 >> /var/log/system_status.log
```

#### Best Practices for Cron Jobs 🌟

1. **Timing Considerations**

   - Avoid running resource-intensive jobs during peak hours
   - Stagger job times to prevent system overload
   - Consider using random delays for non-critical jobs

2. **Error Handling**

   ```bash
   # Redirect output to log file
   * * * * * command >> /var/log/cronjob.log 2>&1

   # Send mail on error only
   * * * * * command 2>&1 | /usr/bin/mail -s "Cron Error" admin@example.com
   ```

3. **Path and Environment**

   ```bash
   # Set path in crontab
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

   # Or use absolute paths in commands
   0 * * * * /usr/local/bin/script.sh
   ```

#### Common Crontab Patterns 📝

```bash
# Common timing patterns
@yearly             # Run once a year (0 0 1 1 *)
@monthly            # Run once a month (0 0 1 * *)
@weekly             # Run once a week (0 0 * * 0)
@daily              # Run once a day (0 0 * * *)
@hourly             # Run once an hour (0 * * * *)
@reboot             # Run at startup

# Example usage
@daily /scripts/daily-backup.sh
@reboot /scripts/startup-tasks.sh
```

#### Troubleshooting Cron Jobs 🔧

1. **Job Not Running**

   ```bash
   # Check cron daemon
   systemctl status cron

   # Check cron logs
   grep CRON /var/log/syslog

   # Verify crontab syntax
   crontab -l
   ```

2. **Permission Issues**

   ```bash
   # Make script executable
   chmod +x /path/to/script.sh

   # Check file permissions
   ls -l /path/to/script.sh

   # Run as specific user
   0 * * * * sudo -u username /path/to/script.sh
   ```

3. **Environment Problems**
   ```bash
   # Add environment variables to crontab
   SHELL=/bin/bash
   HOME=/home/username
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   ```

Remember:

- Always test your cron jobs manually before scheduling
- Use absolute paths in cron jobs
- Redirect output to logs for debugging
- Be mindful of system resources when scheduling jobs

## System Monitoring Tools

### 1. htop (Enhanced top)

Interactive process viewer (needs installation).

```bash
htop               # Start htop
# Features:
# - Color-coded output
# - Mouse support
# - Vertical and horizontal scrolling
# - Tree view
```

### 2. free (Memory Usage)

```bash
free -h            # Show memory usage in human-readable format
free -m            # Show in megabytes
```

### 3. uptime (System Load)

```bash
uptime             # Show load averages and system uptime
```

## Best Practices 🌟

1. **Process Termination**

   - Always try SIGTERM (kill -15) first
   - Use SIGKILL (kill -9) as last resort
   - Check process children before killing parent

2. **Resource Management**

   - Monitor system resources regularly
   - Use nice values appropriately
   - Be careful with high-priority processes

3. **Background Jobs**
   - Use nohup for processes that should survive terminal closure
   - Keep track of background jobs
   - Clean up completed jobs

## Quick Reference Commands 📝

```bash
# Process Information
ps aux              # List all processes
top                 # Interactive process viewer
pgrep firefox       # Find firefox PIDs

# Process Control
kill -15 PID        # Graceful termination
kill -9 PID         # Force termination
killall process     # Kill all matching processes

# Background Jobs
command &           # Start in background
Ctrl + Z           # Suspend process
bg                 # Resume in background
fg                 # Bring to foreground

# Resource Monitoring
free -h             # Memory usage
uptime              # System load
ps aux --sort=-%cpu # CPU usage
```

## Troubleshooting Tips 🔧

1. **Process Won't Die**

   ```bash
   # Try in this order:
   kill -15 PID     # SIGTERM
   kill -1 PID      # SIGHUP
   kill -9 PID      # SIGKILL
   ```

2. **High System Load**

   ```bash
   # Check CPU usage
   top -o %CPU

   # Check memory usage
   free -h

   # Find resource-heavy processes
   ps aux --sort=-%cpu | head -n 5
   ```

3. **Frozen Terminal**
   ```bash
   # Try in this order:
   Ctrl + C         # Interrupt current process
   Ctrl + Z         # Suspend process
   Ctrl + D         # EOF (exit)
   ```

Remember: Always be careful when killing processes, especially system processes. When in doubt, verify the PID before sending kill signals!
