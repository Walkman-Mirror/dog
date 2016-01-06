#dog


VERSION=0.0.1

function showHelp
{

	about="dog v$VERSION
Whiptail version: $(whiptail --version)
Written by: Tristan B. Kildaire (Deavmi) - (deavmi@disroot.org)
License: GNU GPL v3
Crowbar Developments


Usage:


bash dog.sh --help              Show this page
bash dog.sh --version           Show current version
bash dog.sh [filename]          Graphically viw a file using whiptail"

	whiptail --msgbox "$about" 21 100 --fullbuttons --ok-button "Awesome"

}

function showVersion
{

	echo $VERSION

}

function showFile
{

	filename=$1

	content=$(cat "$filename")

	whiptail --msgbox "$content" 20 100 --title "$filename" --scrolltext

}

function init
{

	if [ $# = 0 ]
	then
		echo "Use --help for a list of commands."
	elif [ $# = 1 ]
	then
		if [ "$1" = "--help" ]
		then
			showHelp
		elif [ "$1" = "--version" ]
		then
			showVersion
		else
			if [ -f "$1" ]
			then
				showFile "$1"
			else
				echo "File '$1' not found!"
			fi
		fi
	else
		echo "Unknown commands $@! Use --help for a list of commands."
	fi

}

init $@
