#!/bin/bash

# Function to display menu options
display_menu() {
    echo "File Manipulation Menu"
    echo "1. Copy file"
    echo "2. Move file"
    echo "3. Delete file"
    echo "4. Exit"
}

# Function to copy file
copy_file() {
    source_file="$1"
    destination_dir="$2"
    cp "$source_file" "$destination_dir"
    echo "File copied successfully."
}

# Function to move file
move_file() {
    source_file="$1"
    destination_dir="$2"
    mv "$source_file" "$destination_dir"
    echo "File moved successfully."
}

# Function to delete file
delete_file() {
    file_to_delete="$1"
    rm "$file_to_delete"
    echo "File deleted successfully."
}

shift $((OPTIND - 1))
# Main script
if [ $# -eq 0 ]; then
    while true; do
        display_menu
        echo "Enter your choice:"
        read choice
        case $choice in
            1) echo "Enter source file path:"
               read source_file
               echo "Enter destination directory:"
               read destination_dir
               copy_file "$source_file" "$destination_dir" ;;
            2) echo "Enter source file path:"
               read source_file
               echo "Enter destination directory:"
               read destination_dir
               move_file "$source_file" "$destination_dir" ;;
            3) echo "Enter file path to delete:"
               read file_to_delete
               delete_file "$file_to_delete" ;;
            4) echo "Exiting program."; exit ;;
            *) echo "Invalid option. Please choose a number from 1 to 4." ;;
        esac
    done
else
	case $1 in
            -c) copy_file "$2" "$3" ;;
            -m) move_file "$2" "$3" ;;
            -d) delete_file "$2" ;;
            *) echo "Invalid option. Usage: ./manipulation.sh -c|-m|-d source_file destination_file" ;;
        esac
fi
