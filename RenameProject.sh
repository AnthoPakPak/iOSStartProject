#!/bin/bash

#ACK needs to be installed on the machine (brew install rename ack)

read -p "Do you really want to rename your project $1 to $2 ? (y/n) " -n 1 -r
echo #new line

if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
	echo "Renaming $1 project to $2..."

	find . -name "$1*" -print0 | xargs -0 rename --subst-all "$1" "$2"
	find . -name "$1*" -print0 | xargs -0 rename --subst-all "$1" "$2"

	echo "Following output should be empty :"
	find . -name "$1*" #this output should be empty
	echo "-----End of output-----"

	ack --literal --files-with-matches "$1" --print0 | xargs -0 sed -i '' "s/$1/$2/g"

	echo "Following output should be empty :"
	ack --literal "$1"
	echo "-----End of output-----"


	echo -e "Next steps :
	- Run pod install
	- (Optional) Add $2-MainFolder to your git repository
	- (Optional) Copy this project's .gitignore file to your repository
	- Open your fresh new $2.xcworkspace and you are done!"

	read -p "Do you want me to run pod install for you ? (y/n) " -n 1 -r
	echo #new line
	if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
		pod install
	fi

else 
	echo "Cancel renaming."
	exit 0
fi