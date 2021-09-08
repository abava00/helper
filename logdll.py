import os
import re
import sys
import urllib.request

def download(savedir, url, names):
# DLL
    c = 0
    file_name = url.split("/")[-1]
    fe = file_name.split(".")[-1] #拡張子
    file_name = file_name.split(".")[0]
    file_name += "_" + str(c) + "." + fe
    for i in names:
        if file_name == i:
            c += 1
            file_name = file_name.split("_")[0]
            file_name += "_" + str(c) + "." + fe

    # if(file_name == "unknown.png"):
    opener = urllib.request.build_opener()
    opener.addheaders = [('User-agent', 'Mozilla/5.0')]
    urllib.request.install_opener(opener)
    urllib.request.urlretrieve(url, os.path.join(save_dir, file_name))
    return file_name


if __name__ == '__main__':
    arg = sys.argv
    ext = ""
    out = ""
    filename = arg[0] #読み取りたいlogファイルをPATHをはってください
    # filename = "" #読み取りたいlogファイルをPATHをはってください
    save_dir = "C:\Users\%USERNAME%\Downloads" #保存したいファイルのPATHを貼ってください
    if save_dir not in os.listdir("./"):
        os.mkdir(save_dir)
    # key = "https"
    key = "https://cdn.discordapp.com"
    number = 0
    close = []

    with open(filename, "r", encoding="utf-8") as f:
        text = f.read()
    pattern = re.compile(key +".+")
    result = pattern.finditer(text)
    for a in result:
        number += 1
        out = out + a.group() + "\n"
        print("downloading..." + a.group())
        close.append(download(save_dir, a.group(), close))

