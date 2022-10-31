#!/bin/bash

##################################
# Author: Chloe Carpenter
# Creation date: 2022-10-15
# Purpose: Canned email responses
##################################

# Trap function for error handling
handle_err() {
    local s=$?
    echo "$0:${BASH_LINENO[0]} $BASH_COMMAND"
    exit "$s"
}

trap handle_err ERR

##################
# Email functions
##################

# Apology - For when customers wait extended periods of time without a response.
apology() {
    read -rep "Customer name or team: " name
    read -rep "What is being done: " update

    xclip -selection clipboard <<EOF
${name},

My apologies for the .

${update}

[add signature]
EOF
}

# Authorization - Request customer to auth before proceeding with troubleshooting.
authorization() {
    read -rep "Authorization link: " auth

    xclip -selection clipboard <<EOF
Hello,

I will be happy to assist you with this request but before I do so, can you please authenticate this ticket by clicking on the link below and logging in with your current account credentials:

${auth}

We require all requests to be authenticated for your protection so only authorized individuals may make changes to or obtain information about your account. In the future, you can avoid taking this extra step by submitting a ticket via our customer portal located here:

https://my.liquidweb.com

Thank you
EOF
}

# Following-up - Providing customer with a/an update(s) throughout troubleshooting process.
follow-up() {
read -rep "Customer name or use team: " name
read -rep "Follow-up: " followup

xclip -selection clipboard <<EOF
${name},

Thank you for your continued patience.

Upon conferring with my colleagues, I confirmed the following:

${followup}

If you need further assistance, please reach out by directly responding to this email and I or my colleagues would be happy to answer any additional questions.

[add signature]
EOF
}

# Initial response - Use when creating new tickets during/after a live interaction or responding to tickets with the "New" status.
initial-response() {
read -rep "Customer name or use team: " name
read -rep "Support: Nexcess, MWPv2, Cloud Sites, Premium Business Email: " support
read -rep "Domain: " domain
read -rep "Issue: " issue

xclip -selection clipboard <<EOF
${name},

Thank you for contacting ${support} support!

My name is {name} and I will be helping you with your inquiry for ${domain}.

${issue}

If It becomes necessary, I'll contact you with any questions or requests for further information.

Otherwise, I aim to update you in some form or fashion within the next two hours.

[add signature]
EOF
}

# Information request - Advise customer that we're still looking into the issue and need more inforamtion from them.
info-request() {
read -rep "Customer name or use team: " name
read -rep "Gather additional info: " details

xclip -selection clipboard <<EOF
${name},

Thank you for your continued patience.

${details}

[add signature]
EOF
}

# Picking-up - Advising the customer that you will be taking over the case.
picking-up() {
read -rep "Customer name or use team: " name

xclip -selection clipboard <<EOF
${name},

My name is {name} and I'll be picking up where my colleagues left off.

If it becomes necessary, I'll contact you with any questions or requests for further information.

Otherwise, I aim to update you in some form or fashion within the next two hours.

[add signature]
EOF
}

# Resolve - Inform the cutomer that the issue has been fixed and the ticket will be marked as resolved.
resolve() {
    read -rep "Customer name or use team: " name

    xclip -selection clipboard <<EOF
${name},

I'm glad we were able to assist.

As the original issue has been fixed, I'll mark the ticket as resolved.

If you need further assistance, please reach out by directly responding to this email and I or my colleagues would be happy to answer any additional questions.

[add signature]
EOF
}

# Thanks - Send a thank you to the customer for provding additional information.
thanks() {
    read -rep "Customer name or use team: " name

    xclip -selection clipboard <<EOF
${name},

Thank you for the additional information.

I'll provide you with an update within 2 hours or reach out with more questions as needed.

[add signature]
EOF
}

# Custom menu for picking an email
menu() {
    clear
    printf "
    ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │1. Apology - Apologize for any delays                                                                                │
    │2. Authorization - Request auth from customer                                                                        │
    │3. Follow-up - Provide customer with findings                                                                        │
    │4. Initial response - For live interaction tickets or tickets listed as New                                          │
    │5. Information request - Start time, replication steps, etc.                                                         │
    │6. Picking up - Let customer know ticket is being picked up                                                          │
    │7. Resolve - All issues have been fixed                                                                              │
    │8. Thanks - Thank customer for additional info                                                                       │
    └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    \n"
    read -rep "Which email response do you wish to use? "
    case "${REPLY}" in
        1)
            apology
            exit
            ;;
        2)
            authenticate
            exit
            ;;
        3)
            follow-up
            exit
            ;;
        4)
            initial-response
            exit
            ;;
        5)
            info-request
            exit
            ;;
        6)
            picking-up
            exit
            ;;
        7)
            resolve
            exit
            ;;
        8)
            thanks
            exit
            ;;
    esac
}

menu
