# Special thanks to B

'''
平文の中に
https://cdn.discordapp.com
の文字列が存在するそのファイルをダウンロードします

ファイル名_1.拡張子 で保存され1,2,3・・・と加算されます

'''
import os
import re
import sys
import urllib.request
import threading

# 0: 名前+添え字で保存されます
# 1: 投稿時の日時で保存されます
SAVE_FILE_NAME = 0

class logdll:
    global SAVE_FILE_NAME

    def __init__(self, filename):
        self.filename = filename
        self.save_dir = "save" # 保存したいファイルのPATH
        self.key = "https://cdn.discordapp.com" # パターンの識別

        if SAVE_FILE_NAME == 0:
            # 保存ディレクトリが存在しない場合作成する
            if self.save_dir not in os.listdir("./"):
                os.mkdir(self.save_dir)
            self.number = 0
            self.close = {}

            try:
                with open(filename, "r", encoding="utf-8") as f:
                    text = f.read()
            except FileNotFoundError:
                print("ファイルのPATHを入力してください")
                sys.exit()
            pattern = re.compile(self.key +".+")
            self.result = pattern.finditer(text)

            for a in self.result:
                url_tx = a.group().split()
                for i in range(len(url_tx)):
                    self.number += 1
                    thread = threading.Thread(name="thread"+str(self.number), target=self.multi, args=(url_tx[i],))
                    thread.start()
                # print(f'現在のスレッド数 : {threading.active_count()}')

        elif SAVE_FILE_NAME == 1:
            try:
                with open(filename, "r", encoding="utf-8") as f:
                    text = f.readlines()
            except FileNotFoundError:
                print("ファイルのPATHを入力してください")
                sys.exit()
            lines_strip = [line.strip() for line in text]
            self.enc = '.*' + self.key + '.*'
            find = [line for line in lines_strip if re.match(self.enc, line)]
            days = ["", ""]
            for i in find:
                days[0] = (i.split(" ")[1])# 投稿日時
                days[1] = ((i.split(" ")[2]).split(".")[0])# 投稿日時
                url = (i.split(" ")[-1])# 添付ファイルURL
                thread = threading.Thread(name="thread", target=self.multi2, args=(days,url))
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

        opener = urllib.request.build_opener()
        opener.addheaders = [('User-agent', 'Mozilla/5.0')]
        urllib.request.install_opener(opener)
        urllib.request.urlretrieve(url, os.path.join(self.save_dir, file_name))
        return file_name

    def downloadTime(self, day, url):
    # DLL2
        days = day[0].split("-")[0] + day[0].split("-")[1] + day[0].split("-")[2]
        times = day[1].split(":")[0] + day[1].split(":")[1] + day[1].split(":")[2]
        file_name = days + "T" + times + "." + url.split(".")[-1]

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

    def multi2(self, arg, arg2):
        print("downloading..." + arg2)
        # print(arg)
        try:
            self.downloadTime(arg, arg2)
        except Exception as e:
            print(e)


if __name__ == '__main__':

    '''
    この部分が余りにもひどい
    '''
    # 引き数の個数を確かめる
    try:
        sys.argv[2]
    except: # 引き数が1つの時
        try:
            pwd = sys.argv[1]
        except IndexError:
            print("ファイルのPATHを入力してください")
            sys.exit()
        SAVE_FILE_NAME = 0
        logdl = logdll(pwd)
        sys.exit()

    # 引き数が2つの時の第1引数を確かめる
    try:
        int(sys.argv[1])
    except:
        print("これは適さない引き数です")
        sys.exit()

    n = int(sys.argv[1])
    if (-1 < n and n < 2):
        SAVE_FILE_NAME = n
    else:
        print("範囲外です\n(0: 添付ファイル名保存\n 1: 投稿日時名で保存)")
        sys.exit()

    logdl = logdll(sys.argv[2])