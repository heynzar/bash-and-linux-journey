# Linux User and Group Management Guide

## Table of Contents

### User Management Commands

| ID  | Command                                 | Description                    |
| --- | --------------------------------------- | ------------------------------ |
| 1   | [`useradd`](#1-useradd-create-new-user) | Create new users in the system |
| 2   | [`usermod`](#2-usermod-modify-user)     | Modify existing user accounts  |
| 3   | [`userdel`](#3-userdel-delete-user)     | Delete users from the system   |
| 4   | [`passwd`](#4-passwd-manage-passwords)  | Manage user passwords          |

### Group Management Commands

| ID  | Command                                      | Description                             |
| --- | -------------------------------------------- | --------------------------------------- |
| 5   | [`groupadd`](#1-groupadd-create-new-group)   | Create new groups                       |
| 6   | [`groupmod`](#2-groupmod-modify-group)       | Modify existing groups                  |
| 7   | [`groupdel`](#3-groupdel-delete-group)       | Delete groups from the system           |
| 8   | [`gpasswd`](#4-gpasswd-manage-group-members) | Manage group members and administrators |

### Information Commands

| ID  | Command                                     | Description                      |
| --- | ------------------------------------------- | -------------------------------- |
| 9   | [`id`](#1-id-show-usergroup-ids)            | Show user and group IDs          |
| 10  | [`groups`](#2-groups-show-group-membership) | Display group membership         |
| 11  | [`who`](#3-who-show-logged-in-users)        | Show logged-in users             |
| 12  | [`w`](#4-w-detailed-who)                    | Detailed view of logged-in users |

## Understanding Users and Groups

Every Linux system has users and groups to manage access control and permissions. Each user:

- Has a unique username and ID (UID)
- Belongs to at least one group
- Has a home directory (usually `/home/username`)
- Uses a specific login shell

## User Management Commands

### 1. useradd (Create New User)

```bash
# Basic syntax
useradd [options] username

# Common options:
-m          # Create home directory
-s shell    # Specify login shell
-g group    # Specify primary group
-G groups   # Add to additional groups
-c comment  # Add comment/full name

# Examples:
useradd -m -s /bin/bash john              # Create user with home dir and bash shell
useradd -m -s /bin/bash -g developers -G sudo,docker alice   # Create user with groups
```

### 2. usermod (Modify User)

```bash
# Common use cases:
usermod -aG sudo john         # Add user to sudo group
usermod -s /bin/bash mary     # Change shell
usermod -L username          # Lock user account
usermod -U username          # Unlock user account
usermod -c "John Doe" john   # Add full name

# Change primary group
usermod -g newgroup username

# Add to multiple groups
usermod -aG group1,group2 username
```

### 3. userdel (Delete User)

```bash
# Basic usage
userdel username            # Delete user
userdel -r username        # Delete user and home directory

# Always check before deleting
id username                # Verify user exists
```

### 4. passwd (Manage Passwords)

```bash
# Set or change password
passwd username           # Change user's password
passwd                   # Change your own password

# Lock/unlock account
passwd -l username       # Lock
passwd -u username       # Unlock

# Password status
passwd -S username       # Check password status
```

## Group Management Commands

### 1. groupadd (Create New Group)

```bash
# Create new group
groupadd developers
groupadd -g 1001 project_team   # Specify GID
```

### 2. groupmod (Modify Group)

```bash
# Rename group
groupmod -n new_name old_name

# Change GID
groupmod -g 1002 group_name
```

### 3. groupdel (Delete Group)

```bash
groupdel group_name
```

### 4. gpasswd (Manage Group Members)

```bash
# Add user to group
gpasswd -a username group_name

# Remove user from group
gpasswd -d username group_name

# Set group administrators
gpasswd -A admin_user group_name
```

## Viewing User and Group Information

### 1. id (Show User/Group IDs)

```bash
id                  # Show your own info
id username         # Show specific user's info
```

### 2. groups (Show Group Membership)

```bash
groups              # Show your groups
groups username     # Show user's groups
```

### 3. who (Show Logged-in Users)

```bash
who                 # Show who is logged in
who -H              # Show header
```

### 4. w (Detailed Who)

```bash
w                   # Show who is logged in and what they're doing
```

## Common Examples and Use Cases

### 1. Creating a New Developer User

```bash
# Create user with appropriate groups
useradd -m -s /bin/bash -c "Jane Smith" -G developers,docker jane
passwd jane
```

### 2. Setting Up a Project Team

```bash
# Create group and add members
groupadd project_team
usermod -aG project_team user1
usermod -aG project_team user2
```

### 3. Giving Sudo Access

```bash
# Add user to sudo group
usermod -aG sudo username

# Or edit sudoers file (safer)
visudo
# Add line: username ALL=(ALL:ALL) ALL
```

## Best Practices 🌟

1. **User Creation**

   - Always use -m to create home directory
   - Set strong passwords
   - Assign appropriate groups
   - Use meaningful usernames

2. **Group Management**

   - Use descriptive group names
   - Regularly audit group memberships
   - Remove unused groups

3. **Security**
   - Regularly review sudo access
   - Lock unused accounts
   - Remove unnecessary group memberships
   - Use strong passwords

## Important Files 📁

```bash
/etc/passwd    # User information
/etc/group     # Group information
/etc/shadow    # Encrypted passwords
/etc/sudoers   # Sudo privileges
```

## Common Tasks Quick Reference

### Add New User with Sudo Access

```bash
useradd -m -s /bin/bash username
passwd username
usermod -aG sudo username
```

### Create Shared Group and Directory

```bash
groupadd shared_group
mkdir /shared
chgrp shared_group /shared
chmod 2775 /shared
```

### Lock/Backup Departing User

```bash
# Lock account
usermod -L username
# Backup home directory
tar -czf username-backup.tar.gz /home/username
# Remove user
userdel -r username
```

## Troubleshooting Tips 🔧

1. **User Can't Log In**

   ```bash
   # Check account status
   passwd -S username
   # Verify groups
   groups username
   # Check shell
   grep username /etc/passwd
   ```

2. **Sudo Access Issues**

   ```bash
   # Verify sudo group membership
   groups username | grep sudo
   # Check sudoers file
   visudo
   ```

3. **Group Access Problems**
   ```bash
   # Verify group existence
   getent group groupname
   # Check user's groups
   groups username
   ```

Remember: Always make backups before making significant changes to user accounts or group memberships!
