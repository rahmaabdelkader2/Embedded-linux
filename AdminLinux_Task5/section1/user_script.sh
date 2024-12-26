#!/bin/bash

# Define user and group names
USERNAME="yourName"
GROUPNAME="FamilyName"

# Check if the group exists
if grep -q "^$GROUPNAME:" /etc/group; then
    echo "Group '$GROUPNAME' already exists."
else
    # Create the group
    groupadd "$GROUPNAME"
    echo "Group '$GROUPNAME' created."
fi

# Check if the user exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
else
    # Create the user and add them to the group
    useradd -m -g "$GROUPNAME" "$USERNAME"
    echo "User '$USERNAME' created and added to group '$GROUPNAME'."
fi

# Display user information
echo "User Information:"
id "$USERNAME"

# Display group information
echo "Group Information:"
getent group "$GROUPNAME"

