#!/bin/bash

########################################
# Author: Chloe Carpenter
# Creation date: 2022-10-15
# Purpose: Create detailed help request
########################################

########################
# Handle err function
# for error handling
########################

handle_err () {
  local s=$?; echo "$0:${BASH_LINENO[0]} $BASH_COMMAND"; exit $s;
}

trap handle_err ERR

help() {
  read -rep "Ticket number: " TICKET
  read -rep "Account number: " ACCT
  read -rep "Domain(s): " DOMAINS
  read -rep "CNAME target: " CNAME
  read -rep "Host (Cloud/SIP/Dedicated/IP): " HOST
  read -rep "App (WordPress, Magento, etc.): " APP
  read -rep "Type (Production/Development): " TYPE
  read -rep "Prominence (High/Normal): " PROM
  read -rep "Customer's goal: " CGOAL  

  xclip -selection clipboard <<EOF
  Ticket: ${TICKET}
  Account: ${ACCT}
  Domain(s): ${DOMAINS}
  CNAME target: ${CNAME}
  Host: ${HOST}
  App: ${APP}
  Type: ${TYPE}
  Prominence: ${PROM}

  Customer's goal: ${CGOAL}
EOF
}

help