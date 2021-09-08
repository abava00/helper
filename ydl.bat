@echo off
cd /d %~dp0

:restart

set OPTIONS= -f "bestaudio[ext=m4a]" -o "youtubedl\saves\%%(title)s.%%(ext)s"

set /p URL=URL:

youtubedl\youtube-dl.exe %OPTIONS% "%URL%"

goto restart
