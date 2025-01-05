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
