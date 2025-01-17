# Functions in Bash Scripts

## Basic Function Structure

### Creating and Calling Functions

```bash
#!/bin/bash

# Basic function
say_hello() {
    echo "Hello, World!"
}

# Call the function
say_hello
```

### Functions with Parameters

```bash
#!/bin/bash

greet() {
    echo "Hello, $1!"    # $1 is the first parameter
}

# Call function with parameter
greet "Alice"
greet "Bob"
```

## Working with Parameters

### Multiple Parameters

```bash
#!/bin/bash

print_info() {
    name=$1
    age=$2
    city=$3
    echo "Name: $name"
    echo "Age: $age"
    echo "City: $city"
}

print_info "John" "25" "New York"
```

### Using $@ for All Parameters

```bash
#!/bin/bash

list_items() {
    echo "Number of items: $#"
    echo "Items:"
    for item in "$@"; do
        echo "- $item"
    done
}

list_items apple banana orange
```

## Return Values

### Using Exit Codes

```bash
#!/bin/bash

check_number() {
    if [ "$1" -gt 10 ]; then
        return 0    # Success
    else
        return 1    # Failure
    fi
}

number=15
if check_number $number; then
    echo "$number is greater than 10"
else
    echo "$number is not greater than 10"
fi
```

### Using Echo for Return Values

```bash
#!/bin/bash

get_sum() {
    local num1=$1
    local num2=$2
    echo $((num1 + num2))
}

# Store function output in a variable
result=$(get_sum 5 3)
echo "The sum is: $result"
```

## Local Variables

### Using Local Variables in Functions

```bash
#!/bin/bash

my_function() {
    local name="John"    # Local variable
    age=25              # Global variable
    echo "Inside function: $name, $age"
}

name="Alice"
my_function
echo "Outside function: $name, $age"
```

## Practical Examples

### 1. Calculator Function

```bash
#!/bin/bash

calculate() {
    local num1=$1
    local operator=$2
    local num2=$3

    case $operator in
        "+") echo $((num1 + num2)) ;;
        "-") echo $((num1 - num2)) ;;
        "*") echo $((num1 * num2)) ;;
        "/")
            if [ $num2 -eq 0 ]; then
                echo "Error: Division by zero"
                return 1
            fi
            echo $((num1 / num2))
            ;;
        *)
            echo "Invalid operator"
            return 1
            ;;
    esac
}

# Using the calculator
result=$(calculate 10 "+" 5)
echo "10 + 5 = $result"

result=$(calculate 20 "*" 3)
echo "20 * 3 = $result"
```

### 2. File Operations Library

```bash
#!/bin/bash

# Check if file exists
check_file() {
    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Get file size
get_file_size() {
    if check_file "$1"; then
        stat -f %z "$1"
    else
        echo "File not found"
        return 1
    fi
}

# Backup file
backup_file() {
    local file=$1
    if check_file "$file"; then
        cp "$file" "${file}.backup"
        echo "Backup created: ${file}.backup"
        return 0
    else
        echo "Cannot backup: file not found"
        return 1
    fi
}

# Using the functions
file="test.txt"

if check_file "$file"; then
    echo "File exists"
    size=$(get_file_size "$file")
    echo "Size: $size bytes"
    backup_file "$file"
else
    echo "File does not exist"
fi
```

## Function Libraries

### Creating a Library File (functions.sh)

```bash
#!/bin/bash

# functions.sh - Library of useful functions

log_message() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1"
}

is_number() {
    [[ $1 =~ ^[0-9]+$ ]]
}

get_user_input() {
    local prompt=$1
    local value
    read -p "$prompt" value
    echo "$value"
}
```

### Using the Library

```bash
#!/bin/bash

# Source the library
source ./functions.sh

# Use the functions
log_message "Script started"

number=$(get_user_input "Enter a number: ")
if is_number "$number"; then
    log_message "Valid number entered: $number"
else
    log_message "Invalid input"
fi
```

## Practice Exercises

1. Create a library of string functions that:

   - Converts string to uppercase/lowercase
   - Counts words in a string
   - Reverses a string

2. Create a function that:
   - Takes a directory path as parameter
   - Counts files and subdirectories
   - Returns total size of directory

## Tips and Best Practices

1. **Always use local variables** in functions:

```bash
my_function() {
    local my_var="local"    # Good
    global_var="global"     # Avoid unless needed
}
```

2. **Document your functions**:

```bash
# Calculate sum of two numbers
# Arguments:
#   $1 - First number
#   $2 - Second number
# Returns:
#   Sum of the numbers
calculate_sum() {
    local num1=$1
    local num2=$2
    echo $((num1 + num2))
}
```

3. **Check parameters**:

```bash
my_function() {
    if [ $# -lt 2 ]; then
        echo "Error: Need at least 2 parameters"
        return 1
    fi
    # Function code
}
```

Remember:

- Use meaningful function names
- Keep functions focused on single tasks
- Use local variables
- Document your functions
- Check parameters before using them
- Return meaningful exit codes
