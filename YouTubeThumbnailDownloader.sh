#!/bin/bash
#Made by Pandawan / PandawanFr
#http://youtube.com/PandawanFr/
#It is licensed under the Attribution-NonCommercial-ShareAlike 4.0 International 
#Check this link for more info http://creativecommons.org/licenses/by-nc-sa/4.0/
#Script requested by TheRedstoneScientist

prefix="https://i.ytimg.com/vi/" #Link to the yt image database
suffix="/hqdefault.jpg" #Apparently sometimes it's maxresdefault but using hqdefault because it works
basedir=$(dirname $0) #Directory where the script is being executed

#colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


echo "${green}Hello and welcome to the Youtube Thumbnail Downloader v1.3 by PandawanFr."
echo "${red}Update 1.3: Added File support (experimental)"

read -p "${green}Do you want to download from a video, a playlist or a file ? " choice

if [ "$choice" = "video" ]; then 
	#If you want to download only one video	
	
	read -p "${green}Enter the url of the video : " link
	
	video_url=$(cut -d '=' -f 2 <<< "$link")
	
	full_lnk=$prefix$video_url$suffix
	
	name=$(curl --silent "$link"| grep -o '<meta property="og:title" content=".*">'| sed -e 's/<meta property="og:title" content="\(.*\)">/\1/'| tr " " _ | tr '/' '|')
	echo $link
	
	echo "${green}Downloading: $name.jpg"
	
	curl -o $basedir/$name.jpg --silent $full_lnk
	
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
		
		name=$(curl --silent "https://www.youtube.com/watch?v=${ids[c]}"| grep -o '<meta property="og:title" content=".*">'| sed -e 's/<meta property="og:title" content="\(.*\)">/\1/'| tr " " _)
		#echo $name > $basedir/hello.txt
		
		#echo "Downloading $full_lnk [$c/${#ids[@]}]"
		echo "Downloading $name.jpg [$c/${#ids[@]}]"
		
		#curl -o $basedir/${ids[c]}.jpg --silent $full_lnk
		
		curl -o $basedir/$name.jpg --silent $full_lnk
	 done
	
	echo "${green}Successfully downloaded thumbnails!"
	echo "${reset}"
	
elif [ "$choice" = "file" ]; then
	#If you want to download a playlist
	
	read -p "${green}Enter the path to the file : " link
	
	#ids=$(curl --silent $link| grep -F '/watch?v='| sed -E 's!.*/watch\?v=([a-zA-Z0-9_-]*).*!\1!'| sort| uniq;) #Not using this one anymore because V is better
	
	ids=(); while read -r; do ids+=("$REPLY"); done < <(curl --silent 'file://$link'| grep -F '/watch?v='| sed -E 's!.*/watch\?v=([a-zA-Z0-9_-]*).*!\1!'| sort| uniq);
	
	for ((c=0; c<=${#ids[@]}; c++))
	 do
		full_lnk=$prefix${ids[c]}$suffix
		
		name=$(curl --silent "https://www.youtube.com/watch?v=${ids[c]}"| grep -o '<meta property="og:title" content=".*">'| sed -e 's/<meta property="og:title" content="\(.*\)">/\1/'| tr " " _)
		#echo $name > $basedir/hello.txt
		
		#echo "Downloading $full_lnk [$c/${#ids[@]}]"
		echo "Downloading $name.jpg [$c/${#ids[@]}]"
		
		#curl -o $basedir/${ids[c]}.jpg --silent $full_lnk
		
		curl -o $basedir/$name.jpg --silent $full_lnk
	 done
	
	echo "${green}Successfully downloaded thumbnails!"
	echo "${reset}"

else
	echo "${red}"'Please type "video" or "playlist"'
	
	echo "${reset}"
fi

#Thanks and stuff
echo "${red}Thanks for using Youtube Thumbnail Downloader v1.3 by PandawanFr!"
echo "${red}My YouTube: http://youtube.com/PandawanFr/"
echo "${red}My Twitter: http://twitter.com/PandawanYT/"
echo " "
echo "${red}It is licensed under the Attribution-NonCommercial-ShareAlike 4.0 International"
echo "${red}Check this link for more info http://creativecommons.org/licenses/by-nc-sa/4.0/"
echo "${reset}"