# Variables and User Input in Bash Scripts

## Understanding Variables

### Basic Variable Usage

Variables store information that you can use later in your script. In Bash, we create them without any declaration keyword:

```bash
#!/bin/bash

# Creating and using variables
name="Alice"
age=25
echo "Name: $name"
echo "Age: $age"
```

### Variable Naming Rules

- Start with a letter or underscore
- Can contain letters, numbers, underscores
- Are case-sensitive
- No spaces around the = sign

```bash
# Correct
user_name="John"
age=30
CITY="New York"

# Wrong
user name="John"    # Contains space
1user="John"        # Starts with number
age = 30            # Spaces around =
```

## Types of Variables

### 1. Shell Variables

These are variables you create in your script:

```bash
#!/bin/bash

# Creating shell variables
city="London"
temperature=20
message="It's a nice day"

echo "The temperature in $city is $temperature degrees"
```

### 2. Environment Variables

These are system-wide variables. Common ones include:

```bash
#!/bin/bash

echo "Your home directory is: $HOME"
echo "Your username is: $USER"
echo "Your shell is: $SHELL"
```

## Reading User Input

### Basic Input with `read`

```bash
#!/bin/bash

echo "What's your name?"
read user_name

echo "Hello, $user_name!"
```

### Read with a Prompt

```bash
#!/bin/bash

read -p "Enter your age: " user_age
echo "You are $user_age years old"
```

### Read with a timeout

```bash
#!/bin/bash

# Wait for 5 seconds for input
read -t 5 -p "Quick! Enter a number: " number
echo "You entered: $number"
```

## Command Substitution

Store command output in variables:

```bash
#!/bin/bash

current_time=$(date +%H:%M)
files_count=$(ls | wc -l)

echo "The time is: $current_time"
echo "Number of files in directory: $files_count"
```

## Practical Example: User Information Script

```bash
#!/bin/bash

# Get user information and display it

# Using read with prompts
read -p "Enter your name: " name
read -p "Enter your age: " age
read -p "Enter your city: " city

# Get current date using command substitution
current_date=$(date +%Y-%m-%d)

# Display all information
echo "
=== User Information ===
Date: $current_date
Name: $name
Age: $age
City: $city
Current Shell: $SHELL
Home Directory: $HOME
==================
"
```
