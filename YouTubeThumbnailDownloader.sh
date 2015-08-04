#!/bin/bash
#Made by Pandawan / PandawanFr
#http://youtube.com/PandawanFr/
#It is licensed under the Attribution-NonCommercial-ShareAlike 4.0 International 
#Check this link for more info http://creativecommons.org/licenses/by-nc-sa/4.0/
#Script requested by TheRedstoneScientist

prefix="https://i.ytimg.com/vi/" #Link to the yt image database
suffix="/hqdefault.jpg" #Apparently sometimes it's maxresdefault but using hqdefault because it works
basedir=$(dirname $0) #Directory wehre the script is being executed

#colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


echo "${green}Hello and welcome to the Youtube Thumbnail Downloader v1.1 by PandawanFr."

read -p "${green}Do you want to download from a video or playlist ? " choice

if [ "$choice" = "video" ]; then 
	#If you want to download only one video	
	
	read -p "${green}Enter the url of the video : " link
	
	video_url=$(cut -d '=' -f 2 <<< "$link")
	
	full_lnk=$prefix$video_url$suffix
	
	echo "${green}Link to picture: $full_lnk"
	
	curl -o $basedir/$video_url.jpg --silent $full_lnk
	
	echo "${green}Successfully downloaded thumbnail!"
	
	echo "${reset}"

elif [ "$choice" = "playlist" ]; then
	#If you want to download a playlist
	
	read -p "${green}Enter the url of the playlist : " link
	
	#ids=$(curl --silent $link| grep -F '/watch?v='| sed -E 's!.*/watch\?v=([a-zA-Z0-9_-]*).*!\1!'| sort| uniq;) #Not using this one anymore because V is better
	
	ids=(); while read -r; do ids+=("$REPLY"); done < <(curl --silent $link| grep -F '/watch?v='| sed -E 's!.*/watch\?v=([a-zA-Z0-9_-]*).*!\1!'| sort| uniq);
	
	for ((c=0; c<=${#ids[@]}; c++))
	 do
		full_lnk=$prefix${ids[c]}$suffix
		
		#name=$(curl --silent "http://www.youtube.com/watch?v=${ids[c]}"| grep -o '<title>.*</title>'| sed 's/\(<title>\|<\/title>\)//g') 
		
		echo "Downloading $full_lnk [$c/${#ids[@]}]"
		
		curl -o $basedir/${ids[c]}.jpg --silent $full_lnk
		
		curl -o $basedir/$names.jpg --silent $full_lnk
	 done
	
	echo "${green}Successfully downloaded thumbnails!"
	echo "${reset}"

else
	echo "${red}"'Please type "video" or "playlist"'
	
	echo "${reset}"
fi

#Thanks and stuff
echo "${red}Thanks for using Youtube Thumbnail Downloader v1.1 by PandawanFr!"
echo "${red}My YouTube: http://youtube.com/PandawanFr/"
echo "${red}My Twitter: http://twitter.com/PandawanYT/"
echo " "
echo "${red}It is licensed under the Attribution-NonCommercial-ShareAlike 4.0 International"
echo "${red}Check this link for more info http://creativecommons.org/licenses/by-nc-sa/4.0/"
echo "${reset}"