# Introduction to Bash Scripts

## What is a Bash Script?

A Bash script is simply a text file containing a series of commands that the Bash shell can execute. Think of it like a recipe - instead of typing commands one by one, you write them all in a file to run them automatically.

## Creating Your First Script

### Step 1: Creating the Script File

Let's create our first script using a text editor:

```bash
nano my_first_script.sh
```

Inside the file, we'll start with the "shebang" line and add some basic commands:

```bash
#!/bin/bash

echo "Hello, World!"
echo "This is my first Bash script!"
```

The `#!/bin/bash` line (called a shebang) tells the system this is a Bash script. It's always the first line of any Bash script.

### Step 2: Making the Script Executable

Before we can run our script, we need to make it executable:

```bash
chmod +x my_first_script.sh
```

Now you can run it:

```bash
./my_first_script.sh
```

## Basic Script Structure

Here's a simple but complete script structure:

```bash
#!/bin/bash

# This is a comment
# Comments help explain what your script does
# They start with a # symbol

echo "Starting the script..."

# Commands go here
date
whoami
pwd

echo "Script finished!"
```

## Comments and Best Practices

1. **Always use comments** to explain what your script does:

```bash
#!/bin/bash

# Script: system_info.sh
# Purpose: Display basic system information
# Author: Your Name
# Date: January 14, 2025

echo "System Information:"
hostname    # Display computer name
date        # Show current date and time
```

2. **Use meaningful names** for your scripts:
   - Good: `backup_photos.sh`, `system_check.sh`
   - Bad: `script1.sh`, `test.sh`

## Practical Example: A Welcome Script

Let's create a useful welcome script that shows basic system information:

```bash
#!/bin/bash

# welcome.sh - A simple welcome script

echo "===============================
Welcome, $(whoami)!
===============================

Current Time: $(date +%T)
Working Directory: $(pwd)
Terminal: $TERM
===============================
"
```

Save this as `welcome.sh`, make it executable with `chmod +x welcome.sh`, and run it with `./welcome.sh`.

## Common Mistakes to Avoid

1. **Forgetting the shebang line** (`#!/bin/bash`)
2. **Not making the script executable** (forgetting `chmod +x`)
3. **Using spaces around = in assignments**:
   - Correct: `name="John"`
   - Wrong: `name = "John"`

## Practice Exercises

1. Create a script that:

   - Displays "Hello, [your name]!"
   - Shows the current date
   - Lists the contents of your current directory

2. Modify the welcome script above to include:
   - The amount of free disk space (`df -h`)
   - The number of users logged in (`who`)

## Key Takeaways

- Scripts always start with `#!/bin/bash`
- Make scripts executable with `chmod +x`
- Use comments to explain your code
- Choose meaningful names for your scripts
- Test your scripts in a safe directory first

Try these examples and experiment with them. The best way to learn is by practicing and modifying existing scripts to see what happens!
