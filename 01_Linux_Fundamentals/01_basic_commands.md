# Linux/Unix Command Reference Guide

## Basic Navigation and Directory Management

### 1. pwd (Print Working Directory)
**Purpose**: Shows current directory path
```bash
$ pwd
/home/user/documents

# Common Options:
-L    # Print logical path (follows symbolic links)
-P    # Print physical path (shows actual filesystem path)
```

### 2. cd (Change Directory)
**Purpose**: Navigate between directories
```bash
$ cd /path/to/directory    # Absolute path
$ cd documents            # Relative path
$ cd ..                   # Move up one directory
$ cd ~                    # Go to home directory
$ cd -                    # Go to previous directory
$ cd ~/documents         # Go to documents in home directory
```

### 3. ls (List Directory Contents)
**Purpose**: Display files and directories
```bash
# Basic Usage
$ ls                  # List current directory
$ ls /path/to/dir     # List specific directory

# Common Options
$ ls -l              # Long format with details
$ ls -a              # Show hidden files
$ ls -h              # Human-readable sizes
$ ls -R              # Recursive listing
$ ls -S              # Sort by size
$ ls -t              # Sort by modification time
$ ls -r              # Reverse order
$ ls -ltr            # Long format, sorted by time, reversed

# Practical Examples
$ ls -lah            # Combines long format, hidden files, and human-readable sizes
$ ls *.txt           # List all .txt files
$ ls -d */           # List only directories
```

### 4. mkdir (Make Directory)
**Purpose**: Create new directories
```bash
# Basic Usage
$ mkdir new_directory

# Common Options
$ mkdir -p a/b/c     # Create parent directories as needed
$ mkdir -m 755 dir   # Create with specific permissions
$ mkdir -v dir       # Verbose output

# Practical Examples
$ mkdir -p project/{src,docs,tests}     # Create multiple nested directories
$ mkdir $(date +%Y-%m-%d)              # Create directory with today's date
```

## File Operations

### 5. cat (Concatenate)
**Purpose**: Display, combine, and create files
```bash
# Basic Usage
$ cat file.txt                    # Display file content
$ cat file1.txt file2.txt        # Display multiple files
$ cat file1.txt file2.txt > combined.txt   # Combine files

# Common Options
$ cat -n                         # Number all lines
$ cat -b                         # Number non-blank lines
$ cat -s                         # Squeeze blank lines
$ cat -A                         # Show all non-printing characters

# Practical Examples
$ cat << EOF > file.txt         # Create file with content
Hello World
EOF
$ cat > file.txt                # Create/overwrite file
$ cat >> file.txt               # Append to file
```

### 6. less
**Purpose**: View files with pagination
```bash
# Basic Usage
$ less file.txt

# Common Options
-N        # Show line numbers
-S        # Chop long lines
-i        # Case-insensitive search
-M        # Show detailed prompt
-F        # Quit if entire file can be displayed on first screen

# Navigation Commands (within less)
/pattern  # Search forward
?pattern  # Search backward
n         # Next occurrence
N         # Previous occurrence
g         # Go to first line
G         # Go to last line
q         # Quit
```

### 7. touch
**Purpose**: Create empty files or update timestamps
```bash
# Basic Usage
$ touch file.txt              # Create empty file or update timestamp

# Common Options
$ touch -a                    # Change access time only
$ touch -m                    # Change modification time only
$ touch -t 202401011200      # Set specific timestamp (YYYYMMDDhhmm)

# Practical Examples
$ touch file{1..10}.txt      # Create multiple files
$ touch -d "2 hours ago" file.txt   # Set relative time
```

### 8. cp (Copy)
**Purpose**: Copy files and directories
```bash
# Basic Usage
$ cp source.txt destination.txt
$ cp -r source_dir destination_dir

# Common Options
-i        # Interactive (prompt before overwrite)
-u        # Update (copy only when source is newer)
-v        # Verbose output
-p        # Preserve attributes
-l        # Create hard links
-s        # Create symbolic links

# Practical Examples
$ cp -rp /path/to/source/* /backup/    # Backup with permissions
$ cp file{1..5}.txt directory/         # Copy multiple files
$ cp -u *.txt /backup/                 # Update only newer files
```

### 9. mv (Move)
**Purpose**: Move or rename files and directories
```bash
# Basic Usage
$ mv source destination              # Move or rename

# Common Options
-i        # Interactive mode
-u        # Update only if source is newer
-v        # Verbose output
-b        # Create backup of destination files

# Practical Examples
$ mv file.txt new_name.txt          # Rename file
$ mv -i *.txt ../documents/         # Move all .txt files
$ mv file{1..5}.txt directory/      # Move multiple files
```

### 10. rm (Remove)
**Purpose**: Delete files and directories
```bash
# Basic Usage
$ rm file.txt                       # Remove file
$ rm -r directory                   # Remove directory and contents

# Common Options
-f        # Force removal without confirmation
-i        # Interactive mode
-v        # Verbose output
-d        # Remove empty directories

# Practical Examples
$ rm -ri directory/                 # Interactive recursive deletion
$ rm -f *.tmp                       # Force remove all .tmp files
$ rm -rf directory/* && rmdir directory  # Clean directory then remove it
```

## Searching and Finding

### 11. find
**Purpose**: Search for files and directories
```bash
# Basic Usage
$ find /path -name "pattern"

# Common Options and Examples
# Find by name
$ find . -name "*.txt"              # Find .txt files
$ find . -iname "*.txt"             # Case-insensitive search

# Find by type
$ find . -type f                    # Find files
$ find . -type d                    # Find directories
$ find . -type l                    # Find symbolic links

# Find by size
$ find . -size +10M                 # Files larger than 10MB
$ find . -size -1M                  # Files smaller than 1MB
$ find . -empty                     # Find empty files/directories

# Find by time
$ find . -mtime -7                  # Modified in last 7 days
$ find . -mmin -60                  # Modified in last 60 minutes
$ find . -newer reference_file      # Modified more recently than reference

# Find with permissions
$ find . -perm 644                  # Exact permissions
$ find . -perm /u=w                 # At least writable by user

# Execute commands
$ find . -name "*.tmp" -exec rm {} \;   # Remove found files
$ find . -type f -exec chmod 644 {} +   # Change permissions

# Complex examples
$ find . -type f -name "*.log" -size +100M -mtime +30 -exec rm {} \;   # Remove old large log files
$ find . -type f -exec du -h {} + | sort -rh | head -n 10              # Find largest files
```

### 12. grep (Global Regular Expression Print)
**Purpose**: Search text patterns in files
```bash
# Basic Usage
$ grep "pattern" file.txt
$ grep "pattern" file1.txt file2.txt

# Common Options
-i        # Case-insensitive search
-v        # Invert match (show non-matching lines)
-w        # Match whole words only
-n        # Show line numbers
-r        # Recursive search
-l        # Show only filenames with matches
-c        # Count matching lines
-A n      # Show n lines after match
-B n      # Show n lines before match
-C n      # Show n lines before and after match

# Practical Examples
# Search in multiple files
$ grep -r "TODO" .                   # Recursive search for "TODO"
$ grep -li "error" *.log            # Find log files containing "error"

# Complex patterns
$ grep -E "^[A-Z]{2,4}$" file.txt   # Match 2-4 uppercase letters
$ grep -v "^#" config.txt           # Show non-comment lines

# Combining with other commands
$ ps aux | grep "python"            # Find python processes
$ history | grep "git commit"       # Find git commit commands
```

## Tips and Best Practices

1. **Use Tab Completion**: Press Tab to auto-complete file and directory names
2. **Use Wildcards**: `*` matches any characters, `?` matches single character
3. **Command History**: Use up/down arrows to navigate through previous commands
4. **Aliases**: Create shortcuts for commonly used commands
5. **Man Pages**: Use `man command` to read detailed documentation
6. **Command Options**: Combine short options (`ls -la` instead of `ls -l -a`)
7. **Backup Important Files**: Always backup before destructive operations
8. **Use sudo Carefully**: Be cautious with elevated privileges
9. **Pipe Commands**: Combine commands using `|` for complex operations
10. **Use Command Substitution**: `$(command)` or \`command\` to use output in other commands