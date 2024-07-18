#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Change to the directory where the script is located
cd "$(dirname "$0")"

# Check if apt is available (for Debian-based distributions)
if hash apt >/dev/null 2>&1; then
  # Install required packages
  sudo apt-get install -y pkg-config libglfw3 libglfw3-dev mesa-common-dev libglu1-mesa-dev libxcb1-dev
  sudo apt autoremove
elif hash dnf >/dev/null 2>&1; then
  # Install required packages (for RHEL-based distributions)
  sudo dnf install -y pkgconfig-glfw3-devel mesa-libGL-devel mesa-libGLU-devel libX11-devel
else
  echo "Error: Neither apt nor dnf package manager found. Cannot install required packages."
  exit 1
fi

# Clone, build, and install cglm
git clone https://github.com/recp/cglm
cd cglm
mkdir build
cd build
cmake ..
make
sudo make install
cd ../../
rm -rf cglm

# Clone, build, and install libclipboard
git clone https://github.com/jtanx/libclipboard
cd libclipboard
cmake .
make -j4
sudo make install
cd ..
rm -rf libclipboard

# Clone, build, and install leif
git clone https://github.com/cococry/leif
cd leif
make
sudo make install
cd ..
rm -rf leif

# Build the main project
make
sudo make install

echo "====================="
echo "INSTALLATION FINISHED"
echo "====================="

# Prompt the user to start the app
read -p "Do you want to start the app (y/n): " answer

# Convert the answer to lowercase to handle Y/y and N/n
answer=${answer,,}

# Check the user's response
if [[ "$answer" == "y" ]]; then
    echo "Starting..."
    todo
elif [[ "$answer" == "n" ]]; then
    echo "todo has been installed to your system."
    echo "It can be launched from the terminal with 'todo'."
    echo "A .desktop file is also installed so you can find it in your application launcher."
    echo "You can also use a terminal interface for todo:"
    todo --help
else
    echo "Invalid input. Please enter y or n."
fi