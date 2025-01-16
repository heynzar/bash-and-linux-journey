# Working with Numbers and Strings in Bash Scripts

## Basic Arithmetic Operations

### Using let and expr

```bash
#!/bin/bash

# Using let
let a=5+3
let b=10-2
let c=4*3
let d=20/4

echo "Results using let:"
echo "5 + 3 = $a"
echo "10 - 2 = $b"
echo "4 * 3 = $c"
echo "20 / 4 = $d"

# Using expr (note the spaces and escape character for multiplication)
result=$(expr 10 + 5)
product=$(expr 5 \* 3)
echo "Result using expr: $result"
echo "Product using expr: $product"
```

### Using Double Parentheses

```bash
#!/bin/bash

# Arithmetic with (( ))
a=$((5 + 3))
b=$((10 - 2))
c=$((4 * 3))
d=$((20 / 4))
power=$((2 ** 3))  # Exponentiation

echo "Results using (( )):"
echo "5 + 3 = $a"
echo "10 - 2 = $b"
echo "4 * 3 = $c"
echo "20 / 4 = $d"
echo "2 ** 3 = $power"
```

## String Operations

### String Length

```bash
#!/bin/bash

text="Hello World"
length=${#text}
echo "The string '$text' is $length characters long"
```

### String Concatenation

```bash
#!/bin/bash

first_name="John"
last_name="Doe"

# Method 1: Simple concatenation
full_name="$first_name $last_name"

# Method 2: Using string append
greeting="Hello, "
greeting+="$full_name"

echo "$greeting"
```

### Substring Operations

```bash
#!/bin/bash

text="Hello World"

# Extract substring (starting position:length)
part=${text:0:5}    # Gets "Hello"
part2=${text:6:5}   # Gets "World"

echo "First word: $part"
echo "Second word: $part2"

# Extract from position to end
rest=${text:6}      # Gets "World"
echo "From position 6: $rest"
```

## Practical Examples

### 1. Simple Calculator

```bash
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (+,-,*,/): " operation

case $operation in
    "+")
        result=$((num1 + num2))
        ;;
    "-")
        result=$((num1 - num2))
        ;;
    "*")
        result=$((num1 * num2))
        ;;
    "/")
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero!"
            exit 1
        fi
        result=$((num1 / num2))
        ;;
    *)
        echo "Invalid operation"
        exit 1
        ;;
esac

echo "Result: $result"
```

### 2. String Manipulator

```bash
#!/bin/bash

read -p "Enter a sentence: " sentence

# Get string length
echo "Length: ${#sentence}"

# Convert to uppercase
echo "Uppercase: ${sentence^^}"

# Convert to lowercase
echo "Lowercase: ${sentence,,}"

# First 10 characters
echo "First 10 chars: ${sentence:0:10}"

# Replace spaces with dashes
echo "With dashes: ${sentence// /-}"
```

## Common String Operations

### String Comparison

```bash
#!/bin/bash

string1="hello"
string2="world"

if [ "$string1" = "$string2" ]; then
    echo "Strings are equal"
else
    echo "Strings are different"
fi

# Check if string is empty
if [ -z "$string1" ]; then
    echo "String is empty"
fi

# Check if string is not empty
if [ -n "$string1" ]; then
    echo "String is not empty"
fi
```

### Pattern Matching

```bash
#!/bin/bash

email="user@example.com"

# Check if string matches pattern
if [[ $email == *"@"* ]]; then
    echo "Valid email format"
fi

# Remove prefix
username=${email%@*}
echo "Username: $username"

# Remove suffix
domain=${email#*@}
echo "Domain: $domain"
```

## Practice Exercises

1. Create a script that:

   - Takes a number and calculates its square and cube
   - Shows the result with proper formatting

2. Create a string manipulation script that:
   - Takes a full name as input
   - Separates first and last name
   - Shows the initials
   - Counts total characters excluding spaces

## Tips and Best Practices

1. **Always validate numeric input**:

```bash
#!/bin/bash

read -p "Enter a number: " num
if [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Valid number"
else
    echo "Not a valid number"
    exit 1
fi
```

2. **Handle division by zero**:

```bash
if [ "$divisor" -eq 0 ]; then
    echo "Error: Cannot divide by zero"
    exit 1
fi
```

3. **Use proper string comparisons**:

```bash
# For string equality
if [ "$string1" = "$string2" ]

# For pattern matching
if [[ "$string" == *pattern* ]]
```

Remember:

- Be careful with spaces in string operations
- Always quote your variables
- Use proper arithmetic operators
- Validate input before processing
- Consider edge cases (empty strings, division by zero)
