
# Check if .bashrc exists in the user's home directory
if [ -f "$HOME/.bashrc" ]; then
    echo "The .bashrc file exists. Appending new environment variables..."
    
    # Append environment variables to .bashrc
    echo 'export HELLO=$HOSTNAME' >> "$HOME/.bashrc"
    echo 'LOCAL=$(whoami)' >> "$HOME/.bashrc"
    
    # Notify the user
    echo "Variables HELLO and LOCAL have been added to .bashrc."
else
    echo "The .bashrc file does not exist in the home directory."
fi
gnome-terminal &  

