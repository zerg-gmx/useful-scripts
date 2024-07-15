#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Check if a username parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# Get the username parameter
username="$1"

# Check if the username exists
if id "$username" &>/dev/null; then
  # Generate a random password
  random_password=$(openssl rand -base64 12)

  # Print the generated random password
  echo "Generated password: $random_password"

  # Set the user's password using chpasswd
  echo "$username:$random_password" | chpasswd

  echo "Password for user $username has been successfully changed."
else
  echo "User $username does not exist."
fi
