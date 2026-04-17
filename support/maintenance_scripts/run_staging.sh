#!/bin/bash

# Check if the script file path is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <node_script_path>"
  exit 1
fi

JSON_FILE="../../../dhyana-staging-firebase-adminsdk-4e5rk-ad73a1a3e1.json"
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
