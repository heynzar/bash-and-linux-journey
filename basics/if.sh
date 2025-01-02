#!/bin/bash

# 👇🏻 Syntax
# if [ condition ]; then
#   commands
# elif [ condition ]; then
#   commands
# else
#   commands
# fi

# 👇🏻 Practice
echo "What is your name?"
read name
echo "What is your profession?"
read profession
echo "Enter your website link: (if you don't have one, enter 0)"
read website

if [ "$website" = "0" ]; then
  echo "I'm $name, a $profession."
else
  echo "I'm $name, a $profession, this is my website: $website."
fi