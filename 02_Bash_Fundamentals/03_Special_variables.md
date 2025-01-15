# Shell Script Variables Guide

## Special Shell Variables

### 1. Positional Parameters

These variables are used to access script arguments:

```bash
# Script: script.sh
#!/bin/bash

$0    # Script name
$1    # First argument
$2    # Second argument
$3    # Third argument
${10} # Tenth argument (note the braces for two digits)
$#    # Number of arguments
$*    # All arguments as a single string
$@    # All arguments as separate strings
$?    # Exit status of last command (0=success, non-zero=failure)
$$    # Current process ID (PID)
$!    # PID of last background process
$_    # Last argument of previous command

# Examples:
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "All arguments: $*"
echo "Exit status of last command: $?"
echo "Current PID: $$"
```

### 2. Examples Using Positional Parameters

```bash
#!/bin/bash

# Example 1: Basic usage
echo "Running script: $0"
echo "Hello, $1!"
echo "Your age is $2"

# Example 2: Checking number of arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 name age"
    exit 1
fi

# Example 3: Processing all arguments
echo "All arguments: $*"
for arg in "$@"; do
    echo "Argument: $arg"
done

# Example 4: Using shift to process arguments
while [ $# -gt 0 ]; do
    echo "Processing: $1"
    shift
done
```

### 3. Common Use Cases

```bash
#!/bin/bash

# Check if script has enough arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

# Save last command's exit status
cp file1 file2
status=$?
if [ $status -ne 0 ]; then
    echo "Copy failed with status: $status"
fi

# Use current PID in temporary files
temp_file="/tmp/myapp_$$_temp.txt"

# Check last background process
long_running_command &
echo "Background process PID: $!"
```

### 4. Parameter Expansion and Default Values

```bash
#!/bin/bash

# Default values
name=${1:-"Unknown"}           # Use "Unknown" if $1 is unset
age=${2:=25}                   # Set $2 to 25 if unset
location=${3:?"Location required"} # Error if $3 is unset
comment=${4:+", $4"}          # Use ", $4" if $4 is set

# Length of parameter
echo "Name length: ${#1}"

# Substring
echo "First 3 letters: ${1:0:3}"

# Pattern matching
filename=${1%.txt}            # Remove .txt extension
basename=${1##*/}             # Get filename from path
```

## Best Practices 🌟

1. **Argument Handling**

   ```bash
   #!/bin/bash

   # Check required arguments
   if [ $# -lt 2 ]; then
       echo "Usage: $0 source_file destination_file"
       exit 1
   fi

   # Use meaningful names
   source_file=$1
   dest_file=$2
   ```

2. **Exit Status Handling**

   ```bash
   #!/bin/bash

   # Always check critical commands
   critical_command
   if [ $? -ne 0 ]; then
       echo "Error: critical_command failed"
       exit 1
   fi
   ```

3. **Safe Parameter Expansion**

   ```bash
   #!/bin/bash

   # Always quote variables
   echo "Processing file: \"$1\""

   # Use braces for clarity
   echo "Hello, ${name}!"
   ```

## Common Patterns 📝

```bash
#!/bin/bash

# Process files given as arguments
for file in "$@"; do
    if [ -f "$file" ]; then
        echo "Processing: $file"
    fi
done

# Use getopts for option parsing
while getopts "hv:f:" opt; do
    case $opt in
        h) show_help;;
        v) version="$OPTARG";;
        f) filename="$OPTARG";;
        ?) echo "Invalid option";;
    esac
done
```

## Troubleshooting Tips 🔧

1. **Debugging Variables**

   ```bash
   #!/bin/bash

   # Print all arguments
   echo "Args: $@"

   # Show variable value
   echo "VAR=${VAR:-undefined}"

   # Enable debug mode
   set -x
   ```

2. **Common Issues**

   ```bash
   # Unquoted variables with spaces
   file="my file.txt"
   cat $file        # Wrong
   cat "$file"      # Correct

   # Missing default values
   echo "Hello, ${name:-World}"  # Safe
   ```

Remember:

- Always quote variables when using them
- Check number of arguments before using them
- Use meaningful names for clarity
- Consider using default values for optional parameters
- Test your scripts with various inputs
