# Linux/Unix Command Reference Guide

## Table of Contents

| ID  | Command                                            | Description                                            |
| --- | -------------------------------------------------- | ------------------------------------------------------ |
| 1   | [`pwd`](#1-pwd-print-working-directory)            | Print current working directory path                   |
| 2   | [`cd`](#2-cd-change-directory)                     | Change between directories                             |
| 3   | [`ls`](#3-ls-list-directory-contents)              | List directory contents and their properties           |
| 4   | [`mkdir`](#4-mkdir-make-directory)                 | Create new directories                                 |
| 5   | [`cat`](#5-cat-concatenate)                        | Display, combine, and create text files                |
| 6   | [`less`](#6-less)                                  | View text files with forward and backward navigation   |
| 7   | [`more`](#7-more)                                  | View text files with forward-only pagination           |
| 8   | [`head`](#8-head)                                  | Display the beginning of files                         |
| 9   | [`tail`](#9-tail)                                  | Display the end of files                               |
| 10  | [`touch`](#10-touch)                               | Create empty files or update file timestamps           |
| 11  | [`cp`](#11-cp-copy)                                | Copy files and directories                             |
| 12  | [`mv`](#12-mv-move)                                | Move or rename files and directories                   |
| 13  | [`rm`](#13-rm-remove)                              | Remove files and directories                           |
| 14  | [`tr`](#14-tr-translate)                           | Translate or delete characters in text                 |
| 15  | [`wc`](#15-wc-word-count)                          | Count lines, words, and characters in files            |
| 16  | [`ln`](#16-ln-link)                                | Create hard or symbolic links between files            |
| 17  | [`locate`](#17-locate)                             | Find files by name using system database               |
| 18  | [`find`](#18-find)                                 | Search for files and directories with complex criteria |
| 19  | [`grep`](#19-grep-global-regular-expression-print) | Search for text patterns in files                      |
| 20  | [`cut`](#20-cut)                                   | Extract sections from lines of files                   |
| 21  | [`awk`](#21-awk)                                   | Pattern scanning and text processing language          |
| 22  | [`sort`](#22-sort)                                 | Sort lines of text files                               |
| 23  | [`uniq`](#23-uniq)                                 | Report or omit repeated lines                          |
| 24  | [`diff`](#24-diff)                                 | Compare files line by line                             |
| 25  | [`cmp`](#25-cmp)                                   | Compare files byte by byte                             |

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
$ mkdir -p a/b/c     # Create a folder inside a folder
$ mkdir -m 755 dir   # Create with specific permissions
$ mkdir -v dir       # Verbose output

# -v: Stands for verbose. When this option is used, mkdir prints a message indicating that the directory has been created successfully.

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

### 7. more

**Purpose**: File perusal filter for viewing text

```bash
# Basic Usage
$ more file.txt                    # View file content page by page

# Common Options
-d        # Display help prompt
-f        # Count logical lines
-p        # Clear screen before display
-c        # Clear screen before display
-s        # Squeeze multiple blank lines

# Navigation Commands (within more)
SPACE     # Next page
b         # Previous page
/pattern  # Search pattern
q         # Quit

# Practical Examples
$ more +10 file.txt               # Start display at line 10
$ more -s *.txt                   # View multiple files
$ ls -l | more                    # Paginate directory listing
```

### 8. head

**Purpose**: Display the beginning of files

```bash
# Basic Usage
$ head file.txt                    # Show first 10 lines
$ head -n 5 file.txt              # Show first 5 lines

# Common Options
-n        # Number of lines to show
-c        # Number of bytes to show

# Practical Examples
$ head -n 20 *.log                # Show first 20 lines of all log files
$ head -c 100 binary.dat          # Show first 100 bytes
$ head -n -5 file.txt             # Show all but last 5 lines
```

### 9. tail

**Purpose**: Display the end of files

```bash
# Basic Usage
$ tail file.txt                    # Show last 10 lines
$ tail -n 5 file.txt              # Show last 5 lines

# Common Options
-n        # Number of lines to show
-f        # Follow file in real-time
-F        # Follow and retry if file disappears
-c        # Number of bytes to show

# Practical Examples
$ tail -f /var/log/syslog         # Monitor log file in real-time
$ tail -n +10 file.txt            # Show all lines starting from line 10
$ tail -f -n0 log.txt | grep ERROR  # Monitor only errors in real-time
```

### 10. touch

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

### 11. cp (Copy)

**Purpose**: Copy files and directories

```bash
# Basic Usage
$ cp source.txt destination.txt
$ cp -r source_dir destination_dir

# Common Options
-i        # Interactive, If a file already exists at the destination, cp -i will ask you if you want to overwrite it.

-u        # Only copies the source file if it is newer than the destination file or if the destination file does not exist,

-v        # Verbose output
-p        # Preserve attributes
-l        # Create hard links
-s        # Create symbolic links

# Practical Examples
$ cp -rp /path/to/source/* /backup/    # Backup with permissions
$ cp file{1..5}.txt directory/         # Copy multiple files
$ cp -u *.txt /backup/                 # Update only newer files
```

### 12. mv (Move)

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

### 13. rm (Remove)

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

### 14. tr (Translate)

**Purpose**: Translate or delete characters

```bash
# Basic Usage
$ tr 'set1' 'set2'                # Replace characters in set1 with set2

# Common Options
-d        # Delete characters in set1
-s        # Squeeze repeated characters
-c        # Use complement of set1

# Practical Examples
$ echo "Hello" | tr 'a-z' 'A-Z'   # Convert to uppercase
$ tr -d '\n\r' < file.txt         # Remove newlines and carriage returns
$ tr -s ' ' < file.txt            # Squeeze multiple spaces into one
```

### 15. wc (Word Count)

**Purpose**: Count lines, words, and characters in files

```bash
# Basic Usage
$ wc file.txt                      # Show lines, words, and bytes
$ wc -l file.txt                   # Count lines only

# Common Options
-l        # Count lines
-w        # Count words
-c        # Count bytes
-m        # Count characters
-L        # Length of longest line

# Practical Examples
$ wc -l *.txt                      # Count lines in all text files
$ find . -type f | wc -l           # Count files in directory and subdirectories
$ cat file.txt | wc -w             # Count words in a file
```

### 16. ln (Link)

**Purpose**: Create links between files

```bash
# Basic Usage
$ ln source target                 # Create hard link
$ ln -s source target             # Create symbolic (soft) link

# Common Options
-s        # Create symbolic link
-f        # Force creation
-i        # Interactive mode
-v        # Verbose output
-b        # Create backup of existing target file

# Practical Examples
$ ln -s /path/to/file shortcut     # Create symbolic link named 'shortcut'
$ ln -s ../shared shared           # Create relative symbolic link
$ ln file1 file2                   # Create hard link between files
```

## Searching and Finding

### 17. locate

**Purpose**: Find files by name using database

```bash
# Basic Usage
$ locate filename                  # Find files matching pattern

# Common Options
-i        # Ignore case
-n N      # Limit output to N entries
-e        # Print only existing files
-c        # Count matches only
-r        # Use regular expression
-b        # Match only basename

# Practical Examples
$ locate -i "*.pdf"               # Find all PDF files (case insensitive)
$ locate -r "/home/.*\.txt$"      # Find txt files in home using regex
$ locate -c "*.jpg"               # Count all JPG files in database
```

### 18. find

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

### 19. grep (Global Regular Expression Print)

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

### 20. cut

**Purpose**: Extract sections from lines of files

```bash
# Basic Usage
$ cut -d',' -f1,3 file.csv        # Extract fields 1 and 3 using comma delimiter

# Common Options
-d        # Specify delimiter
-f        # Select fields
-c        # Select characters
-b        # Select bytes

# Practical Examples
$ cut -d':' -f1 /etc/passwd       # Extract usernames
$ cut -c1-10 file.txt             # Extract first 10 characters of each line
$ cut -d' ' -f2- file.txt         # Extract all fields except the first
```

### 21. awk

**Purpose**: Pattern scanning and text processing

```bash
# Basic Usage
$ awk '{print $1}' file.txt       # Print first field of each line

# Common Options
-F        # Set field separator
-v        # Set variable
-f        # Read program from file

# Pattern Matching
$ awk '/pattern/ {print}' file.txt    # Print lines matching pattern
$ awk '$1 == "value" {print $2}'      # Print second field if first field matches

# Common Operations
$ awk '{sum += $1} END {print sum}'   # Sum first field
$ awk 'length($0) > 80'               # Print lines longer than 80 characters
$ awk '{print NR, $0}'                # Print line numbers

# Practical Examples
$ awk -F',' '{print $1 ": " $2}' file.csv    # Format CSV data
$ awk '{s+=$1} END {print "avg=" s/NR}' nums.txt   # Calculate average
$ awk 'NR%2==0' file.txt                     # Print even-numbered lines
```

### 22. sort

**Purpose**: Sort lines of text files

```bash
# Basic Usage
$ sort file.txt                    # Sort lines alphabetically

# Common Options
-n        # Numeric sort
-r        # Reverse order
-k        # Sort by specific field
-t        # Specify field separator
-u        # Remove duplicates
-h        # Human numeric sort (2K, 1G)

# Practical Examples
$ sort -k2 -t',' file.csv         # Sort by second field (comma-separated)
$ sort -nr numbers.txt            # Sort numbers in reverse order
$ sort -u -k1,1 file.txt          # Sort and remove duplicates based on first field
```

### 23. uniq

**Purpose**: Report or omit repeated lines

```bash
# Basic Usage
$ uniq file.txt                    # Remove adjacent duplicate lines

# Common Options
-c        # Count occurrences
-d        # Only print duplicate lines
-u        # Only print unique lines
-i        # Ignore case
-f        # Skip fields
-s        # Skip characters

# Practical Examples
$ sort file.txt | uniq            # Remove all duplicate lines (must sort first)
$ sort file.txt | uniq -c         # Count occurrences of each line
$ uniq -d file.txt                # Show only duplicate lines
```

### 24. diff

**Purpose**: Compare files line by line

```bash
# Basic Usage
$ diff file1 file2                 # Show differences between files

# Common Options
-u        # Unified format
-i        # Ignore case differences
-b        # Ignore changes in whitespace
-w        # Ignore all whitespace
-r        # Recursively compare directories
-y        # Side-by-side output

# Practical Examples
$ diff -u file1 file2 > patch.diff # Create patch file
$ diff -r dir1 dir2                # Compare directories
$ diff --color file1 file2         # Colorized output
```

### 25. cmp

**Purpose**: Compare files byte by byte

```bash
# Basic Usage
$ cmp file1 file2                  # Compare two files

# Common Options
-b        # Print differing bytes
-i N      # Skip first N bytes
-n N      # Compare at most N bytes
-s        # Silent mode, return status only

# Practical Examples
$ cmp -b file1 file2              # Show byte differences
$ cmp -s file1 file2 && echo "Files are identical"  # Check if files are identical
$ cmp -i 100 file1 file2          # Compare files starting at byte 100
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
