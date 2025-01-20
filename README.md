# Bash and Linux Journey

This project started as my journey to learn Linux and Bash scripting as part of a university module.

Along the way, I realized how valuable this knowledge could be, so I decided to enhance it and share it with everyone.

This guide serves as a solid starting point for anyone looking to understand Linux fundamentals and dive into Bash scripting.

---

![Project Cover, Bash and Linux Guide for Beginners](./cover.jpg)

## 📚 Table of Contents

1. [Linux Fundamentals](#1-linux-fundamentals)  
   1.1. [Basic Commands](#11-basic-commands)  
   1.2. [File Permissions](#12-file-permissions)  
   1.3. [Users and Groups](#13-users-and-groups-management)  
   1.4. [Process Management](#14-process-management)  
   1.5. [Regular Expressions](#15-regular-expressions)
2. [Bash Fundamentals](#2-bash-fundamentals)  
   2.1. [Introduction to Bash Scripts](#21-introduction-to-bash-scripts)  
   2.2. [Variables](#22-variables)  
   2.3. [Special Variables](#23-special-variables)  
   2.4. [Control Flow](#24-control-flow)  
   2.5. [Numbers and Strings](#25-numbers-and-strings)  
   2.6. [Loops and Iteration](#26-loops-and-iteration)  
   2.7. [Functions](#27-functions)
3. [Linux Fundamentals Test](#3-linux-fundamentals-test)  
   3.1. [Easy](#31-easy)  
   3.2. [Medium](#32-medium)  
   3.3. [Hard](#33-hard)
4. [Practical Scripts](#4-practical-scripts)\
   4.1. [Directory Organizer](#directory-organizer)\
   4.2. [System information](#system-information)  
   4.3. [Todo List](#todo)

---

## 📂 Project Structure

The project is organized into the following sections:

### 1. **Linux Fundamentals**

Learn the core concepts of Linux, from basic commands to managing processes. Files included:

- `01_basic_commands.md`: Overview of essential Linux commands.
- `02_file_permissions.md`: Managing file and directory permissions.
- `03_users_and_groups.md`: User and group management.
- `04_process_management.md`: Handling system processes.
- `Regular_Expressions.md`: Introduction to regular expressions in Linux.

### 2. **Bash Fundamentals**

A step-by-step guide to Bash scripting, covering everything from the basics to advanced concepts. Files included:

- `01_Introduction_Bash_Scripts.md`: Getting started with Bash scripts.
- `02_Variables.md`: Understanding variables in Bash.
- `03_Special_variables.md`: Overview of special variables.
- `04_Control_Flow.md`: Conditional statements and control flow.
- `05_Numbers_and_Strings.md`: Working with numbers and strings.
- `06_Loops_and_Iteration.md`: Looping constructs in Bash.
- `07_Functions.md`: Creating and using functions in Bash.

### 3. **Linux Fundamentals Test**

Test your understanding of Linux basics with three levels of challenges:

- `01_Easy.md`: Simple tasks to build confidence.
- `02_Medium.md`: Intermediate challenges to test your skills.
- `03_Hard.md`: Advanced problems, if you conquer these, you're ready for anything!

### 4. **Practical Scripts**

Real-world examples of Bash scripts to reinforce learning and showcase practical use cases:

- `directory_organizer.sh`: Automatically organize files into directories based on their type.
- `system_info.sh.md`: Display detailed system statistics at a glance.
- `todo.sh`: A simple script to manage your tasks from the terminal.

---

## 1.1 **Basic Commands**

This is a quick summary of basic Linux commands. For detailed explanations and examples, check the full guide [`01_basic_commands.md`](#).

| ID  | Command  | Description                                            |
| --- | -------- | ------------------------------------------------------ |
| 1   | `pwd`    | Print current working directory path                   |
| 2   | `cd`     | Change between directories                             |
| 3   | `ls`     | List directory contents and their properties           |
| 4   | `mkdir`  | Create new directories                                 |
| 5   | `cat`    | Display, combine, and create text files                |
| 6   | `less`   | View text files with forward and backward navigation   |
| 7   | `more`   | View text files with forward-only pagination           |
| 8   | `head`   | Display the beginning of files                         |
| 9   | `tail`   | Display the end of files                               |
| 10  | `touch`  | Create empty files or update file timestamps           |
| 11  | `cp`     | Copy files and directories                             |
| 12  | `mv`     | Move or rename files and directories                   |
| 13  | `rm`     | Remove files and directories                           |
| 14  | `tr`     | Translate or delete characters in text                 |
| 15  | `wc`     | Count lines, words, and characters in files            |
| 16  | `ln`     | Create hard or symbolic links between files            |
| 17  | `locate` | Find files by name using system database               |
| 18  | `find`   | Search for files and directories with complex criteria |
| 19  | `grep`   | Search for text patterns in files                      |
| 20  | `cut`    | Extract sections from lines of files                   |
| 21  | `awk`    | Pattern scanning and text processing language          |
| 22  | `sort`   | Sort lines of text files                               |
| 23  | `uniq`   | Report or omit repeated lines                          |
| 24  | `diff`   | Compare files line by line                             |
| 25  | `cmp`    | Compare files byte by byte                             |

## 1.2 **File Permissions**

This is a quick summary of file permissions in Linux. For detailed explanations and examples, check the full guide [`02_file_permissions.md`](#).

| ID  | Command   | Description                                 |
| --- | --------- | ------------------------------------------- |
| 1   | `chmod`   | Change permissions of files and directories |
| 2   | `chown`   | Change the owner of files and directories   |
| 3   | `chgrp`   | Change the group of files and directories   |
| 4   | `umask`   | Control default permission settings         |
| 5   | `getfacl` | Display Access Control Lists (ACLs)         |
| 6   | `setfacl` | Modify Access Control Lists (ACLs)          |

## 1.3 **Users and Groups Management**

This is a quick summary of users and groups management in Linux. For detailed explanations and examples, check the full guide [`03_users_and_groups.md`](#).

| ID  | Command    | Description                             |
| --- | ---------- | --------------------------------------- |
| 1   | `useradd`  | Create new users in the system          |
| 2   | `usermod`  | Modify existing user accounts           |
| 3   | `userdel`  | Delete users from the system            |
| 4   | `passwd`   | Manage user passwords                   |
| 5   | `groupadd` | Create new groups                       |
| 6   | `groupmod` | Modify existing groups                  |
| 7   | `groupdel` | Delete groups from the system           |
| 8   | `gpasswd`  | Manage group members and administrators |
| 9   | `id`       | Show user and group IDs                 |
| 10  | `groups`   | Display group membership                |
| 11  | `who`      | Show logged-in users                    |
| 12  | `w`        | Detailed view of logged-in users        |

## 1.4 **Process Management**

This is a quick summary of process management in Linux. For detailed explanations and examples, check the full guide [`04_process_management.md`](#).

| ID  | Command       | Description                                 |
| --- | ------------- | ------------------------------------------- |
| 1   | `ps`          | Display information about running processes |
| 2   | `top`         | Real-time view of system processes          |
| 3   | `kill`        | Send signals to processes                   |
| 4   | `nice/renice` | Manage process priority                     |
| 5   | `jobs/bg/fg`  | Manage background and foreground jobs       |
| 6   | `crontab`     | Schedule and manage automated tasks         |
| 7   | `htop`        | Enhanced interactive process viewer         |
| 8   | `free`        | Display memory usage                        |
| 9   | `uptime`      | Show system load and uptime                 |

## 1.5 **Regular Expressions**

This is a quick summary of regular expressions in Bash. For detailed explanations and examples, check the full guide [`Regular_Expressions.md`](#).

| ID  | Pattern | Description                                                |
| --- | ------- | ---------------------------------------------------------- |
| 1   | `.`     | Matches any single character                               |
| 2   | `[]`    | Matches any character within the brackets                  |
| 3   | `[^]`   | Matches any character not within the brackets              |
| 4   | `-`     | Defines a range of characters within brackets              |
| 5   | `*`     | Matches zero or more occurrences of the previous character |
| 6   | `+`     | Matches one or more occurrences of the previous character  |
| 7   | `?`     | Matches zero or one occurrence of the previous character   |
| 8   | `^`     | Matches the start of a line                                |
| 9   | `$`     | Matches the end of a line                                  |
| 10  | `{}`    | Specifies exact number of occurrences                      |
| 11  | `\`     | Escapes special characters                                 |
| 12  | `()`    | Groups patterns together                                   |
| 13  | `\|`    | Alternation (OR operator)                                  |
| 14  | `\b`    | Word boundary                                              |
| 15  | `\d`    | Matches any digit (equivalent to [0-9])                    |
| 16  | `\w`    | Matches any word character (equivalent to [a-zA-Z0-9_])    |
| 17  | `\s`    | Matches any whitespace character                           |

## 2.2 Variables

Variables are placeholders for storing data in Bash scripts.

**Key takeaways:**

- Assign values with `=` (no spaces).
- Use meaningful names (e.g., `user_name` not `a`).
- Access values with `$`, like `$name`.

**Types include:**

- **Shell Variables:** Script-local variables.
- **Environment Variables:** System-wide variables like `$HOME` and `$USER`.

To capture user input, use `read`, optionally with prompts or timeouts. Combine these with command substitution to store output from commands like `date`.

For detailed examples and practices, explore the full guide [`02_Variables.md`](#).
