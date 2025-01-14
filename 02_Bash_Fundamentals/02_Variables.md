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

## Practice Exercises

1. Create a simple calculator:

```bash
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

sum=$((num1 + num2))
echo "The sum is: $sum"
```

2. Create a script that asks for a filename and creates it:

```bash
#!/bin/bash

read -p "Enter filename: " filename
touch "$filename"
echo "File '$filename' has been created"
ls -l "$filename"
```

## Important Tips

1. **Always quote your variables** when using them:

```bash
file_name="my file.txt"
# Correct:
echo "$file_name"
# Wrong:
echo $file_name    # Will break with spaces
```

2. **Use meaningful variable names**:

```bash
# Good
user_age=25
temperature_celsius=30

# Bad
a=25
temp=30
```

3. **Default Values**
   You can provide default values for variables:

```bash
#!/bin/bash

# Use default value if variable is unset
name=${user_name:-"Guest"}
echo "Hello, $name!"
```

## Exercise to Try

Create a script that:

- Asks for your name and favorite color
- Gets the current time using command substitution
- Creates a personalized message using all this information
- Has default values if no input is provided

Remember:

- Variables are case-sensitive
- No spaces around = in assignments
- Use quotes around variables when using them
- Use meaningful variable names
- Test your scripts with different inputs
