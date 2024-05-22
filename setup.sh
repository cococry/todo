git clone https://github.com/recp/cglm
cd cglm
mkdir build
cd build
cmake ..
make
sudo make install
cd ../../
rm -rf cglm
git clone https://github.com/jtanx/libclipboard
cd libclipboard
cmake .
make -j4
sudo make install
cd ..
rm -rf libclipboard
git clone https://github.com/cococry/leif
cd leif
make && sudo make install
cd ..
rm -rf leif
make && sudo make install
echo "====================="
echo "INSTALLATION FINISHED"
echo "====================="
read -p "Do you want to start the app (y/n): " answer

# Convert the answer to lowercase to handle Y/y and N/n
answer=${answer,,}

# Check the user's response
if [[ "$answer" == "y" ]]; then
    echo "Starting..."
    todo
elif [[ "$answer" == "n" ]]; then
    echo "todo has been installed to your system."
    echo "It can be launched from terminal with 'todo'." 
    echo "A .desktop file is also installed so you can find it in your application launcher."

    echo "You can also use a terminal interface for todo:"
    todo --help
else
    echo "Invalid input. Please enter y or n."
fi
