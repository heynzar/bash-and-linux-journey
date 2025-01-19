# Hard Linux Questions

### 01 Basic Commands

1. How do you navigate to a directory with spaces in its name?
2. What command would you use to count the number of files and directories within a specific directory?
3. How can you view the last 15 lines of a file and keep monitoring it for new lines?
4. Which command allows you to replace a specific string in a file with another string and save the changes?
5. How can you list all files in a directory and its subdirectories, along with their sizes?
6. What is the difference between a hard link and a symbolic link, and how do you create each?
7. How do you find and delete all `.log` files within a directory and its subdirectories?
8. How can you sort the contents of a file numerically and remove duplicate lines?
9. What command can you use to display the 5 most frequently occurring words in a file?
10. How do you find the total size of all `.txt` files within the current directory?

### 02 File Permissions

11. How do you set permissions so that only the owner can read, write, and execute a file, while the group and others have no permissions?
12. What command is used to find all files owned by a specific user?
13. How do you ensure that new files created in a directory inherit the group ownership of the directory?
14. How can you change the permissions of a file to match those of another file?
15. Which command allows you to find files with the SUID bit set?

### 03 Users and Groups

16. How do you list all users currently logged into the system?
17. What command would you use to check the last login time of a user?
18. How can you add a user to multiple groups at once?
19. How do you change the password expiration policy for a specific user?
20. What is the purpose of the `/etc/shadow` file, and who has access to it?

### 04 Process Management

21. How can you run a command that continues to execute even after you log out?
22. How do you monitor the number of processes run by a specific user?
23. Which command allows you to send a specific signal (e.g., `SIGTERM`) to a process by name?
24. How do you schedule a recurring job to run every day at 2 AM?
25. What is the difference between `nice` and `renice` commands?

---

## Answers

### 01 Basic Commands

1. Use quotes or escape characters: `cd "directory with spaces"` or `cd directory\ with\ spaces`.
2. `find <directory> | wc -l`
3. `tail -n 15 -f <file>`
4. `sed -i 's/old_string/new_string/g' <file>`
5. `du -ah <directory>`
6. Hard link: `ln <target> <link_name>`, Symbolic link: `ln -s <target> <link_name>`
7. `find <directory> -name "*.log" -type f -delete`
8. `sort -n <file> | uniq`
9. `tr -s ' ' '\n' <file> | sort | uniq -c | sort -nr | head -n 5`
10. `find . -name "*.txt" -exec du -ch {} + | grep total`

### 02 File Permissions

11. `chmod 700 <file>`
12. `find / -user <username>`
13. Use the `chmod g+s <directory>` command to set the setgid bit.
14. `chmod --reference=<reference_file> <file>`
15. `find / -perm /4000`

### 03 Users and Groups

16. `who` or `w`
17. `last <username>`
18. `usermod -aG group1,group2 <username>`
19. `chage -M <days> <username>`
20. It stores hashed passwords and password policies. Only the root user has access to it.

### 04 Process Management

21. Use `nohup <command> &`.
22. `ps -u <username> | wc -l`
23. `pkill -SIGTERM <process_name>`
24. Add a cron job using `crontab -e`: `0 2 * * * <command>`
25. `nice` starts a process with a specific priority, while `renice` changes the priority of a running process.
