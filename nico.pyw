import os
import time
import subprocess
from importlib.metadata import files
import threading

# config
# ffmpeg_path = "ffmpeg.exe"
# ffmpeg_normalize_path = "ffmpeg-normalize.exe"
# option = " -nt peak -t 0 -c:a libmp3lame -b:a 320k -o "
# conv_mp3_option = " -c:a libmp3lame -vn -b:a 320k "
# input_dir = "put/your/music/dir or files/"
# output_dir = "put/your/music/dir or files/"

# example===3
ffmpeg_path = "ffmpeg.exe"
ffmpeg_normalize_path = "ffmpeg-normalize.exe"
option = " -nt peak -t 0 -c:a libmp3lame -b:a 320k -o "
conv_mp3_option = " -c:a libmp3lame -vn -b:a 320k "
input_dir =  "./youtube/saves/"
output_dir = "./youtube/output/"

# ファイル名にピリオドが入っているファイルは(FOO.HOGE.mp3)正しく処理できません


def normalize():
    '''
    スレッドを使わない実装
    '''
    for pathname, dirnames, filenames in os.walk(input_dir):
        for filename in filenames:
            if(filename.split('.')[-1] != "mp3"):
                # tempディレクトリを作成
                os.makedirs(f"{output_dir}temp/", exist_ok=True)

                print("this is not mp3")
                # もし拡張子がmp3以外ならmp3に変換する これはいけませんね
                name = filename.split('.')[0]
                full_option = ' -i "' + pathname + "/" + name + '.' + filename.split('.')[-1] + '"' + conv_mp3_option + '"' + output_dir + 'temp/' + name + '.mp3"'
                subprocess.call(f'{ffmpeg_path} {full_option}')
                # 改めて㏈改善
                full_option = '"' + output_dir + 'temp/'  + name + '.mp3"' + option + '"' + output_dir + name + '.mp3"'
                subprocess.call(f'{ffmpeg_normalize_path} {full_option}' ,shell=True)


            else:
                # 作業ディレクトリ以下のディレクトリ, ファイルをすべて取得
                full_option = '"' + pathname + "/" + filename + '"' + option + '"' + output_dir + filename + '"'
                print(f'{filename}  prosessing...')
                subprocess.call(f'{ffmpeg_normalize_path} {full_option}' ,shell=True)
                print(f'done!')



def t_normalize(pathname, filename, option, output_dir):
    if(filename.split('.')[-1] != "mp3"):
        # tempディレクトリを作成
        os.makedirs(f"{output_dir}temp/", exist_ok=True)
    
        print("this is not mp3")
        # もし拡張子がmp3以外ならmp3に変換する これはいけませんね
        name = filename.split('.')[0]
        full_option = ' -i "' + pathname + "/" + name + '.' + filename.split('.')[-1] + '"' + conv_mp3_option + '"' + output_dir + 'temp/' + name + '.mp3"'
        subprocess.call(f'{ffmpeg_path} {full_option}')
        # 改めて㏈改善
        full_option = '"' + output_dir + 'temp/'  + name + '.mp3"' + option + '"' + output_dir + name + '.mp3"'
        subprocess.call(f'{ffmpeg_normalize_path} {full_option}' ,shell=True)
    
    
    else:
        # 作業ディレクトリ以下のディレクトリ, ファイルをすべて取得
        full_option = '"' + pathname + "/" + filename + '"' + option + '"' + output_dir + filename + '"'
        print(f'{filename}  prosessing...')
        subprocess.call(f'{ffmpeg_normalize_path} {full_option}' ,shell=True)
        print(f'done!')

def t_main():
    '''
    スレッドを使う実装
    '''
    for pathname, dirnames, filenames in os.walk(input_dir):
        for filename in filenames:
            thread = threading.Thread(name="thread", target=t_normalize, args=(pathname, filename, option, output_dir))
            thread.start()
            time.sleep(2)



if __name__ == "__main__":
    # outputするディレクトリを作成
    os.makedirs(f"{output_dir}", exist_ok=True)
    t_main()
    # normalize()
