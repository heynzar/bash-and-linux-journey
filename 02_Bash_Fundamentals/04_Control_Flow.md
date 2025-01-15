# Basic Control Flow in Bash Scripts

## Understanding if/else Statements

### Basic if Structure

```bash
#!/bin/bash

age=18

if [ $age -ge 18 ]; then
    echo "You are an adult"
fi
```

### if/else Structure

```bash
#!/bin/bash

read -p "Enter your age: " age

if [ $age -ge 18 ]; then
    echo "You are an adult"
else
    echo "You are a minor"
fi
```

### if/elif/else Structure

```bash
#!/bin/bash

read -p "Enter your grade (0-100): " grade

if [ $grade -ge 90 ]; then
    echo "You got an A!"
elif [ $grade -ge 80 ]; then
    echo "You got a B!"
elif [ $grade -ge 70 ]; then
    echo "You got a C!"
else
    echo "You need to study more"
fi
```

## Condition Testing

### Numeric Comparisons

```bash
#!/bin/bash

number=10

# Common numeric comparisons
[ $number -eq 10 ]  # Equal to
[ $number -ne 5 ]   # Not equal to
[ $number -gt 5 ]   # Greater than
[ $number -lt 20 ]  # Less than
[ $number -ge 10 ]  # Greater than or equal
[ $number -le 10 ]  # Less than or equal
```

### String Comparisons

```bash
#!/bin/bash

name="Alice"

# String comparisons
[ "$name" = "Alice" ]     # Equal to
[ "$name" != "Bob" ]      # Not equal to
[ -z "$name" ]           # Check if empty
[ -n "$name" ]           # Check if not empty
```

### File Tests

```bash
#!/bin/bash

file="test.txt"

# Common file tests
[ -e "$file" ]  # Check if file exists
[ -f "$file" ]  # Check if regular file
[ -d "$file" ]  # Check if directory
[ -r "$file" ]  # Check if readable
[ -w "$file" ]  # Check if writable
[ -x "$file" ]  # Check if executable
```

## Case Statements

Useful for multiple choice scenarios:

```bash
#!/bin/bash

read -p "Enter your favorite color (red/blue/green): " color

case $color in
    "red")
        echo "Red like roses!"
        ;;
    "blue")
        echo "Blue like the sky!"
        ;;
    "green")
        echo "Green like grass!"
        ;;
    *)  # Default case
        echo "I don't know that color!"
        ;;
esac
```

## Practical Examples

### 1. File Checker Script

```bash
#!/bin/bash

read -p "Enter a filename: " filename

if [ -e "$filename" ]; then
    echo "File exists!"

    if [ -f "$filename" ]; then
        echo "It's a regular file"
    elif [ -d "$filename" ]; then
        echo "It's a directory"
    fi

    if [ -r "$filename" ]; then
        echo "File is readable"
    fi
    if [ -w "$filename" ]; then
        echo "File is writable"
    fi
else
    echo "File does not exist"
fi
```

### 2. Simple Menu System

```bash
#!/bin/bash

echo "Simple File Operations"
echo "1. List files"
echo "2. Show current directory"
echo "3. Show date"
echo "4. Exit"

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        ls
        ;;
    2)
        pwd
        ;;
    3)
        date
        ;;
    4)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
```

## Practice Exercise

Create a script that:

1. Asks for a number
2. Checks if it's:
   - Positive or negative
   - Even or odd
   - Greater than 100 or not
3. Uses both if statements and a case statement

## Tips and Best Practices

1. **Always quote variables** in conditions:

```bash
# Good
if [ "$name" = "John" ]; then

# Bad
if [ $name = "John" ]; then
```

2. **Use double brackets** for more complex conditions:

```bash
if [[ "$name" == "John" && "$age" -ge 18 ]]; then
    echo "Adult John"
fi
```

3. **Check for empty variables**:

```bash
if [ -z "$variable" ]; then
    echo "Variable is empty"
fi
```

4. **Exit codes**:

```bash
if command; then
    echo "Command succeeded"
else
    echo "Command failed"
    exit 1
fi
```

Remember:

- Always use spaces inside brackets `[ ]`
- Use quotes around variables
- Be careful with numeric vs string comparisons
- Test your conditions thoroughly
- Use meaningful error messages
