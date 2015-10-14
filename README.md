# YouTube Thumbnail Downloader
The YouTube Thumbnail Downloader allows you to download any thumbnails from a youtube video.

![Logo](https://copy.com/qqVptxSE6NaQSv0K/YoutubeThumbnailDownloader256.png)

This script was requested by TheRedstoneScientist.

Please not that this script has only been tested on a mac, it does work on Linux. 
I do not know if this script works on Windows (windows users please try it and tell me).

#Latest Update - 1.3.2
Ok, there are a lot of small changes here. First of all I added file support, IDK if it works really well but it should. You can now give a link to a html page on your computer. Another addition is the support of /s ("/") videos which had a / in their name would not save because / is a character used for directory changes in computer "language". So "/"s are now replaced by "|", which are very similar and don't cause any problems!

#BIG Update - 1.2
New update! Hooray! This update will change the file's name from ytid.jpg to nameofvideo.jpg fo example, this file: GI9t7Qj_azI.jpg will instead be called Heads | Only one command vanilla mod.jpg 

Note that all names will have underscores instead of spaces and the ' and other special characters will be replaced by a weird code. Also, if the script get stucks on a certain file, you may have to start the process again as the script crashed, restarting (the script) will usually fix the problem.  

#How to use it
First of all in your terminal type chmod a+x, add a space, do not press enter yet, drag and drop the script to your terminal, now press enter.
Launch the script by double clicking it or opening it from the terminal.
The script will ask you wether you want to download from a video or a playlist


If you want only one video:
  type "video"
  then copy the link to the video and paste it in the terminal
  
If you want to download the thumbnail of all the videos in a playlist:
  type "playlist"
  copy the link of the playlist (note do not copy the link of a video that's in the playlist, to be sure that it's the right link, make sure the link starts like that: https://www.youtube.com/playlist?list=)
  Paste it in the terminal, you will see the id of the video that's currently being downloaded and the progress (It should look like that: Downloading *link* [4/10]).

The script will then download the thumnbail(s) in the same directory it's in and they will have the name of the YT id of the video (I am currently searching for a way to get the name of the video, if you know how to do that, please make a pull request).
When the script returns "Successfully downloaded thumbnail(s)!" then you are done. 

#License

This script is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International.
Check this link for more info http://creativecommons.org/licenses/by-nc-sa/4.0/

#About Me

My YouTube: http://youtube.com/PandawanFr/

My Twitter: http://twitter.com/PandawanYT/
