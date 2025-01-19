# Easy Linux Questions

### 01 Basic Commands

1. What is the command to display the current working directory?
2. How do you list all files and directories, including hidden ones?
3. Which command is used to create a new directory?
4. How do you display the content of a text file?
5. What command is used to move or rename a file?

### 02 File Permissions

6. How do you check the permissions of a file or directory?
7. What does the permission `rwxr-xr--` mean?
8. Which command is used to change the ownership of a file?
9. How do you change file permissions using symbolic notation (e.g., add write permission to the owner)?
10. What is the numeric value of `rw-r--r--` in octal notation?

### 03 Users and Groups

11. Which command is used to display information about the currently logged-in user?
12. How do you switch to a different user account?
13. What command is used to add a new user to the system?
14. How can you check the groups a user belongs to?
15. Which file contains the list of all users on a system?

### 04 Process Management

16. What command is used to display a list of running processes?
17. How do you terminate a process using its PID?
18. Which command shows the real-time CPU and memory usage of processes?
19. How do you run a command in the background?
20. What is the command to bring a background process to the foreground?

---

## Answers

### 01 Basic Commands

1. `pwd`
2. `ls -a`
3. `mkdir`
4. `cat <filename>`
5. `mv <source> <destination>`

### 02 File Permissions

6. `ls -l`
7. The owner has read, write, and execute permissions; the group has read and execute permissions; others have read-only permission.
8. `chown <user>:<group> <file>`
9. `chmod u+w <file>`
10. `644`

### 03 Users and Groups

11. `whoami`
12. `su <username>`
13. `adduser <username>` or `useradd <username>`
14. `groups <username>`
15. `/etc/passwd`

### 04 Process Management

16. `ps` or `ps aux`
17. `kill <PID>`
18. `top` or `htop`
19. Append `&` to the command (e.g., `command &`)
20. `fg`
