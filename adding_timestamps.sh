# How does this script benefit? This shell-script puts a timestamp of creation
#                               on every file in a folder and it's subfolders.
#                               This is good for naming photos particularly as soon as a creation
#                               time tags are often being deleted by some editing programs
#                               (e.g. after any changes in Apple Photos, iCloud Photos etc.).
#                               So, this script saves a ton of personal time!
# How to run this script? 1) write your desirable suffix for files
#                         2) copy a path to your folder with photos or any other content to be renamed
#                         3) write in your terminal "sh adding_timestamps.sh /path/to/your/folder/"
# What could be reworked? 1) Program could keep the same extension, and suffix will be only before extension
#                         2) Program could skip folder's names
#                         3) It's better if suffix could being given through terminal, not in a file

suffix="_yoursuffix.jpeg"
echo "Working with a folder: $1"
for file_name in $1/*; do
	echo "  Working with a file: $file_name"
	birth_time=$(stat -f %SB -t %y-%m-%d-%Hh%Mm%Ss  $file_name)
	echo "  Birth Time of this file:  $birth_time"
	new_fileName="$birth_time$suffix"
	echo "  New FileName: " "$new_fileName"
	mv $file_name $1/$new_fileName
	echo "  You should see a file renamed with timestamp on it."
	echo "  "
done
