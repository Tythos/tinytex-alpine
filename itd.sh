#!/bin/sh
echo Installing TeX dependencies...

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <package_list_file>"
    exit 1
fi

package_list_file="$1"

# Check if the package list file exists
if [ ! -f "$package_list_file" ]; then
    echo "Error: Package list file '$package_list_file' not found."
    exit 1
fi

# Read each line of the package list file and install the packages
while IFS= read -r package; do
    echo "Installing package: $package"
    tlmgr install "$package"
done < "$package_list_file"

echo "All packages installed successfully."
