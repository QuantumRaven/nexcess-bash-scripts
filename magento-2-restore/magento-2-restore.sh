#!/bin/bash

###################################
# Author: Chloe Carpenter
# Creation date: 2022-10-15
# Purpose: Restore Magento 2 sites
###################################

########################
# Handle err function
# for error handling
########################

handle_err () {

  local s=$?; echo "$0:${BASH_LINENO[0]} $BASH_COMMAND"; exit $s;

}

trap handle_err ERR

# Information to be collected before running the script.
cat <<EOF
Before running the script, the following must be collected:

- Acquire existing database name: sudo nkmagento/nkmagento2/nkwordpress info . | grep -i name from within the /chroot/home/$USER/domain.tld/html folder.
- 
EOF