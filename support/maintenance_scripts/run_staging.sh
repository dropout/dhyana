#!/bin/bash

# Check if the script file path is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <node_script_path>"
  exit 1
fi

# Override with FIREBASE_SERVICE_ACCOUNT_FILE to use a differently named key.
JSON_FILE="${FIREBASE_SERVICE_ACCOUNT_FILE:-../../../stepstones-staging-firebase-adminsdk.json}"
NODE_SCRIPT="$1"

# Check if the JSON file exists
if [ ! -f "$JSON_FILE" ]; then
  echo "Error: JSON file '$JSON_FILE' not found."
  exit 1
fi

# Check if the Node.js script exists
# if [ ! -f "$NODE_SCRIPT" ]; then
#   echo "Error: Node.js script '$NODE_SCRIPT' not found."
#   exit 1
# fi

# Read the content of the JSON file
JSON_CONTENT=$(cat "$JSON_FILE")

# Forward the content to the Node.js script
FIREBASE_SERVICE_ACCOUNT="$JSON_CONTENT" bash -c "$NODE_SCRIPT"; exit
