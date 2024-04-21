#!/bin/bash
#
# Script Name: reset_admin_pass_portainer.sh
# Description: This script performs the reset for admin user's password
#
# Author: Amaury Borges Souza
# Date: April 21, 2024
# Version: 1.0
#
# Usage:
#   ./reset_admin_pass_portainer.sh [options]
#
# Options:
#   -h, --help          Display this help message and exit
#   -v, --version       Display script version and exit
#   -f, --file <path>   Specify input file path (required)
#   -o, --output <path> Specify output file path (optional)
#   -d, --debug         Enable debug mode for verbose output
#   -q, --quiet         Suppress all non-error output
#   -t, --threshold <value>
#                       Set a threshold value (default: 10)
#
# Example:
#   ./my_script.sh -f input.txt -o output.txt -d
#
# Notes:
# - This script requires Bash to run.
# - Ensure that necessary permissions are granted to execute this script.
#
# Bash Scripts starts here...
#
# List all the Docker containers
docker container ls

# Stop the Portainer container by running this command:
docker container stop 233

# Run the helper using the command below (you'll need to mount the Portainer data volume):
docker pull portainer/helper-reset-password
docker run --rm -v portainer_data:/data portainer/helper-reset-password

# You will a similar output like below
2024/04/21 07:36:33 [WARN] Unable to retrieve user with ID 1, will try to create, err: object not found inside the database
2024/04/21 07:36:33 Admin user admin-u0512b3f0v4dqk7o successfully created
2024/04/21 07:36:33 Use the following password to login: Sr#]YL_6D0k8Pd{pA9^|}F32j5J4I=av

# Start the Docker Portainer container
docker start "233"
