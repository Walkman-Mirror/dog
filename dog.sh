function showFile
{

	filename=$1

	content=$(cat "$filename")

	whiptail --msgbox "$content" 20 100 --title "$filename"

}
