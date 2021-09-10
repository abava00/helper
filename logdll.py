import os
import re
import sys
import urllib.request
import threading

class logdll:
    def __init__(self, filename):
        self.filename = filename
        self.save_dir = "save3" # 保存したいファイルのPATHを貼ってください
        if self.save_dir not in os.listdir("./"):
            os.mkdir(self.save_dir)
        self.key = "https://cdn.discordapp.com" # パターンの識別
        self.number = 0
        self.close = {}

        with open(filename, "r", encoding="utf-8") as f:
            text = f.read()
        pattern = re.compile(self.key +".+")
        self.result = pattern.finditer(text)

        for a in self.result:
            url_tx = a.group().split()
            for i in range(len(url_tx)):
                self.number += 1
                thread = threading.Thread(name="thread"+str(self.number), target=self.multi, args=(url_tx[i],))
                thread.start()
            # print(f'現在のスレッド数 : {threading.active_count()}')

    def download(self, url):
    # DLL
        file_name = url.split("/")[-1] # ディレクトリと分割
        file_name_org = file_name
        fe = file_name.split(".")[-1] # fe = 拡張子
        file_name = file_name.split(".")[0] # ファイル名
        if file_name_org in self.close:
            self.close[file_name_org] += 1
            c = self.close[file_name_org]
        else:
            c = 0
            self.close[file_name_org] = 0
        file_name += "_" + str(c) + "." + fe # ファイル名に番号を追加


        # if(file_name == "unknown.png"):
        opener = urllib.request.build_opener()
        opener.addheaders = [('User-agent', 'Mozilla/5.0')]
        urllib.request.install_opener(opener)
        urllib.request.urlretrieve(url, os.path.join(self.save_dir, file_name))
        return file_name

    def multi(self, arg):
        print("downloading..." + arg)
        try:
            self.download(arg)
            # self.close.append(self.download(arg, self.close))
        except Exception as e:
            print(e)

if __name__ == '__main__':
    logdl = logdll(sys.argv[1]) # 読み取りたいlogファイルをPATHをはってください
