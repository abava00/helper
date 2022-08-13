@echo off
setlocal
set CurrentDirectory="%~dp0"
rem cd /d %~dp0

set savePATH=youtube\saves
rem set downloader=youtubedl.exe
set downloader=yt-dlp.exe
set ytPATH=youtube\%downloader%

%ytPATH% -U

:restart

set OPTIONS= -f "bestaudio[ext=m4a]" -o %savePATH%"\%%(title)s.%%(ext)s"

set /p URL=URL:

%ytPATH% %OPTIONS% "%URL%"

goto restart
