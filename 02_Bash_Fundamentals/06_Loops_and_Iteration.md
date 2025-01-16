# Loops and Iteration in Bash Scripts

## For Loops

### Basic For Loop

```bash
#!/bin/bash

# Simple counting
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# Using range
for i in {1..5}; do
    echo "Count: $i"
done

# Using step values
for i in {0..10..2}; do  # Counts from 0 to 10 by 2s
    echo "Even number: $i"
done
```

### C-style For Loop

```bash
#!/bin/bash

# Count from 1 to 5
for ((i=1; i<=5; i++)); do
    echo "Counter: $i"
done
```

### Looping Through Files

```bash
#!/bin/bash

# List all txt files
for file in *.txt; do
    echo "Found file: $file"
    # Check if file actually exists
    if [ -f "$file" ]; then
        echo "Size: $(stat -f %z "$file") bytes"
    fi
done
```

## While Loops

### Basic While Loop

```bash
#!/bin/bash

# Count to 5
counter=1
while [ $counter -le 5 ]; do
    echo "Count: $counter"
    ((counter++))
done
```

### Reading File Line by Line

```bash
#!/bin/bash

# Read file line by line
while read -r line; do
    echo "Line: $line"
done < "input.txt"
```

### User Input Loop

```bash
#!/bin/bash

while true; do
    read -p "Enter a number (or 'q' to quit): " input

    if [ "$input" = "q" ]; then
        echo "Goodbye!"
        break
    fi

    echo "You entered: $input"
done
```

## Break and Continue

### Using Break

```bash
#!/bin/bash

# Break example
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        echo "Breaking at 5"
        break
    fi
    echo "Number: $i"
done
```

### Using Continue

```bash
#!/bin/bash

# Skip even numbers
for i in {1..5}; do
    if [ $((i % 2)) -eq 0 ]; then
        continue
    fi
    echo "Odd number: $i"
done
```

## Practical Examples

### 1. File Processor

```bash
#!/bin/bash

# Process all images in current directory
echo "Processing images..."

for image in *.jpg *.png; do
    # Check if file exists and is a file
    if [ -f "$image" ]; then
        echo "Processing: $image"
        # Get file size
        size=$(stat -f %z "$image")
        echo "Size: $size bytes"
    fi
done
```

### 2. Simple Menu System

```bash
#!/bin/bash

while true; do
    echo "
    1. List files
    2. Show date
    3. Show disk usage
    4. Exit
    "
    read -p "Choose an option: " choice

    case $choice in
        1)
            ls -l
            ;;
        2)
            date
            ;;
        3)
            df -h
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac

    echo "Press Enter to continue..."
    read
    clear
done
```

## Nested Loops

```bash
#!/bin/bash

# Multiplication table
for i in {1..5}; do
    for j in {1..5}; do
        result=$((i * j))
        printf "%3d " $result
    done
    echo # New line after each row
done
```

## Practice Exercises

1. Create a script that:

   - Asks for a number
   - Prints its multiplication table
   - Continues asking until user says 'quit'

2. Create a directory scanner that:
   - Lists all files in current directory
   - Shows file type and size
   - Counts total files and directories

## Tips and Best Practices

1. **Always quote variables in loops**:

```bash
for file in *.txt; do
    if [ -f "$file" ]; then  # Quote the variable
        echo "Processing '$file'"
    fi
done
```

2. **Use meaningful loop variables**:

```bash
# Good
for filename in *.txt; do
# Bad
for x in *.txt; do
```

3. **Check for empty loops**:

```bash
files_found=0
for file in *.txt; do
    if [ -f "$file" ]; then
        files_found=1
        # Process file
    fi
done

if [ $files_found -eq 0 ]; then
    echo "No files found"
fi
```

4. **Control loop output**:

```bash
# Show progress for long loops
total=100
for ((i=1; i<=total; i++)); do
    echo -ne "Progress: $i%\r"
    sleep 0.1
done
echo # Final newline
```

Remember:

- Always quote variables
- Check if files exist before processing
- Use appropriate loop type for the task
- Consider using break/continue when needed
- Test loops with different inputs
- Watch for infinite loops
