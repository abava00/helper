import os
import time
import subprocess
from importlib.metadata import files
import threading

# option = " -nt peak -t 0 -c:a libmp3lame -b:a 320k -o "
# conv_mp3_option = " -c:a libmp3lame -vn -b:a 320k "
# input_dir = "put/your/music/dir or files/"
# output_dir = "put/your/music/dir or files/"

ffmpeg_path = "ffmpeg.exe"
option = " -af volume=10dB "
input_dir =  "./youtube/output/"
output_dir = "./youtube/output/"

# ファイル名にピリオドが入っているファイルは(FOO.HOGE.mp3)正しく処理できません

def t_normalize(pathname, filename, option, output_dir):
    full_option = '-i "' + pathname + "/" + filename + '"' + option + '"' + output_dir + 'A' + filename + '"'
    subprocess.call(f'{ffmpeg_path} {full_option}' ,shell=True)

def t_main():
    for pathname, dirnames, filenames in os.walk(input_dir):
        for filename in filenames:
            thread = threading.Thread(name="thread", target=t_normalize, args=(pathname, filename, option, output_dir))
            thread.start()
            time.sleep(2)



if __name__ == "__main__":
    os.makedirs(f"{output_dir}", exist_ok=True)
    t_main()
