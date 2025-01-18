#!/bin/bash

# system_info.sh - Comprehensive system information reporter

# Function to create horizontal line
create_line() {
    printf "%$(tput cols)s\n" | tr ' ' '-'
}

# Function to get CPU information
get_cpu_info() {
    echo "CPU Information:"
    echo "Processor: $(grep "model name" /proc/cpuinfo | head -n1 | cut -d':' -f2)"
    echo "CPU Cores: $(nproc)"
    echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
}

# Function to get memory information
get_memory_info() {
    echo "Memory Information:"
    free -h | awk 'NR==2{printf "Total: %s\nUsed: %s\nFree: %s\n", $2, $3, $4}'
}

# Function to get disk information
get_disk_info() {
    echo "Disk Usage:"
    df -h | grep '^/dev/' | awk '{printf "Partition: %s\nTotal: %s\nUsed: %s\nFree: %s\n", $1, $2, $3, $4}'
}

# Function to get system uptime
get_uptime() {
    echo "System Uptime:"
    uptime -p
}

# Main script
echo "System Information Report"
echo "Generated on: $(date)"
create_line

# Display system information
echo "Hostname: $(hostname)"
echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo "Kernel: $(uname -r)"
create_line

# Display detailed information
get_cpu_info
create_line

get_memory_info
create_line

get_disk_info
create_line

get_uptime