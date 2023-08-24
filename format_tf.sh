#!/bin/bash

# Run on root of directory
terraform fmt

# Find all directories starting with "service_"
directories=$(find . -type d -name 'service_*')

# Loop through each directory and run "terraform fmt"
for dir in $directories; do
    echo "Running terraform fmt in $dir"
    pushd "$dir" > /dev/null
    terraform fmt
    popd > /dev/null
done