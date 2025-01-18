#!/bin/bash

# todo.sh - To Do List Simple System
# Usage: ./todo.sh [option] [task/id]
# Do ./todo.sh -h for more information


# File to store tasks
TASK_FILE="tasks.txt"
ARCHIVE_FILE="archive.txt"
LAST_ID_FILE="last_id.txt"

# Colors for better readability
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Ensure necessary files exist

if [[ ! -f "$LAST_ID_FILE" ]]; then
  echo 0 > "$LAST_ID_FILE"
fi

if [[ ! -f "$ARCHIVE_FILE" ]]; then
  echo "-¦----¦----------------¦-----¦----------------------------------------------------------------------¦-
 ¦ ID ¦      DATE      ¦ STS ¦ TASK                                                                 ¦
-¦----¦----------------¦-----¦----------------------------------------------------------------------¦-" > "$ARCHIVE_FILE"
 
fi

if [[ ! -f "$TASK_FILE" ]]; then
  echo "-¦----¦----------------¦-----¦----------------------------------------------------------------------¦-
 ¦ ID ¦      DATE      ¦ STS ¦ TASK                                                                 ¦
-¦----¦----------------¦-----¦----------------------------------------------------------------------¦-" > "$TASK_FILE"
 
fi

function get_next_id {
  # Read the last used ID and increment it
  local last_id=$(cat "$LAST_ID_FILE")
  local next_id=$((last_id + 1))
  echo "$next_id" > "$LAST_ID_FILE"
  echo "$next_id"
}

function show_tasks {
  cat "$TASK_FILE"
}

function add_task {
  local id=$(get_next_id)
  task_length=$(echo "$task" | wc -m)
  count=$((69 - task_length))
  repeat=$(printf '%*s' "$count" '' | tr ' ' ' ')
  
  if [[ $id -ge 10 ]]; then
    echo " ¦ $id ¦ $(date +"%m/%d/%y %H:%M") ¦ [ ] ¦ $task $repeat¦" >> "$TASK_FILE"
  else
    echo " ¦ 0$id ¦ $(date +"%m/%d/%y %H:%M") ¦ [ ] ¦ $task $repeat¦" >> "$TASK_FILE"
  fi
  echo "-¦----¦----------------¦-----¦----------------------------------------------------------------------¦-" >> "$TASK_FILE"
  echo "Task added: $task, The length: $task_length"
}

function remove_task {
  if [[ $task -ge 10 ]]; then
    # For task IDs with 2 digits or more
    sed -i "/ ¦ $task ¦ /,+1d" "$TASK_FILE"
  else
    # For task IDs with single digits
    sed -i "/ ¦ 0$task ¦ /,+1d" "$TASK_FILE"
  fi
  echo "Task with ID #$task and its associated line removed."
}

function mark_done {
  if [[ $task -ge 10 ]]; then
    # Match the task ID and replace the status with [x]
    sed -i "/ ¦ $task ¦ /s/\[ \]/[x]/" "$TASK_FILE"
    sed -i "/ ¦ $task ¦ /s/\[-\]/[x]/" "$TASK_FILE"
  else
    # Match the task ID with leading zero and replace the status with [x]
    sed -i "/ ¦ 0$task ¦ /s/\[ \]/[x]/" "$TASK_FILE"
    sed -i "/ ¦ 0$task ¦ /s/\[-\]/[x]/" "$TASK_FILE"
  fi
  echo "Task with ID #$task marked as done."
}

# Main logic
action=$1
task=$2

case $action in
  -all|--all)
    show_tasks
    ;;
  -a|--add)
    if [[ -z "$task" ]]; then
      echo -e "${RED}Error: Please provide a task to add.${RESET}"
    else
      add_task
    fi
    ;;
  -r|--remove)
    if [[ -z "$task" || ! "$task" =~ ^[0-9]+$ ]]; then
      echo -e "${RED}Error: Please provide a valid task ID to remove.${RESET}"
    else
      remove_task
    fi
    ;;
  -d|--done)
    if [[ -z "$task" || ! "$task" =~ ^[0-9]+$ ]]; then
      echo -e "${RED}Error: Please provide a valid task ID to mark as done.${RESET}"
    else
      mark_done
    fi
    ;;
  -s|--skip)
    if [[ -z "$task" || ! "$task" =~ ^[0-9]+$ ]]; then
      echo -e "${RED}Error: Please provide a valid task ID to skip it.${RESET}"
    else
      mark_skip
    fi
    ;;
    -u|--undone)
    if [[ -z "$task" || ! "$task" =~ ^[0-9]+$ ]]; then
      echo -e "${RED}Error: Please provide a valid task ID to mark as undone.${RESET}"
    else
      mark_undone
    fi
    ;;
  -x|--archive)
    archive_done
    ;;
  *)
    echo -e "${RED}Invalid argument. Usage:${RESET}"
    echo "  -all or --all        Show all tasks"
    echo "  -a or --add [task]   Add a new task"
    echo "  -r or --remove [#]   Remove a task by ID"
    echo "  -d or --done [#]     Mark a task as done by ID"
    echo "  -s or --skip [#]     Mark a task as skiped by ID"
    echo "  -u or --undone [#]     Mark a task as undone by ID"
    echo "  -x or --archive      Archive completed tasks"
    ;;
esac
