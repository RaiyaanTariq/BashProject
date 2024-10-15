# BashProject
File Organizer Script

The purpose of this Bash script is to assist users in maintaining a neat file structure by automatically classifying files in a given directory according to their kind or creation date. It offers easy-to-follow execution instructions along with choices for organizing files according to criteria like creation date or file extension. The script also includes error handling to handle invalid parameters or missing directories, so users will always receive the proper feedback for any problems they may experience.

The script is run by the following options:
. -d <directory> : Directory to organize 
. -t : Organize the files by type, (default is by date)
. -h : Help information

Example:
1- To organize by type: 

Make a directory "test_directory"
Add different types of files : 1) file1.txt 2)Image1.png 3) document1.pdf
Then run the script using:
./file_organizer.sh -d /path/to/directory -t
Subdirectories will be made for each file type.

2- To organize by date:

Make a directory "test_directory"
Add .txt files : 1) file1.txt 2)file2.txt 3) file3.txt
Then run the script using:
./file_organizer.sh -d /path/to/directory
Subdirectories will be made according to the modification dates.

The Script is made executable by the command: chmod +x file_organizer.sh
