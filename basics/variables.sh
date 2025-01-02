#!/bin/bash
# 👆🏻 Shebang line (first line of script)

# 👇🏻 The Variables
name="NZAR"
website="nzar.dev"
profession="Software Engineer"

# 👇🏻 echo => print
echo "I'm $name, a $profession, this is my website: $website."

# 👇🏻 Special Variables
echo "$0 this is name of the script."
echo "$1,$2,... this is  arguments passed to the script."
echo "$# this is the number of arguments passed to the script."
echo "$? this is the exit status of the last command executed." 
# $?=0 -> Success, or $?=not 0 -> Failure