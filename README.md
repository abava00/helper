## My little help program ##
私が日常生活をおくる中で，欲しくなったファイルを追加していきます

### noice-WhiteNoiseMaker.c
指定された音ファイルを流し続けます
```
> WhiteNoiseMaker.c
```
#### setting
WhiteNoiseMaker.c内の6行目に音ファイルを指定する

`PlaySound(TEXT("C:\\Users\\%USERNAME%\\Desktop\\sheet\\noise\\Wnoise.wav"), NULL, SND_FILENAME | SND_SYNC);`

### cc.bat ###
選択した文字コードでcmd(powershell)を再起動します
```
> cc.bat
```

### cdir.ps1 ###
ディレクトリのブックマークを作成します

1. ブックマークの追加

```
> cdir.ps1 -bookmark(or -b)
```

2. ブックマークの削除
```
> cdir.ps1 -remove(or -r)  
```

3. ブックマークしたディレクトリへ移動
```
> cdir.ps1
```
#### setting
cdir.ps1内の4行目にbookmarkを記述したtempファイルを作成する(初期値はUsers直下)

`$filepath="$env:XDG_CONFIG_HOME\.filebookmark"`


### cheat.bat ###
vimとVScodeのショートカットキーのカンニングペーパーを表示します
(同じファイル階層にVim_learn.txtとCScode_learn.txtが必要)

1. VScode(vim)のカンペをVScodeで起動する
```
> cheat.bat vs(vim)
```

2. VScode(vim)のカンペをメモ帳で起動する
```
> cheat.bat vs(vim) note
```

### datacopy.bat ###
2つのディレクトリの内容を共有します
```
> datacopy.bat
```
#### setting ####
datacopy.bat 内6,7行目のpath1, 2を目標ディレクトリに変更する
Linuxのファイル入出力的な感じ

`set path1=C:\Users\%USERNAME%\Desktop\test\howto/A`

`set path2=C:\Users\%USERNAME%\Desktop\test\howto/B`

### inout.bat
ファイルの結果をファイルに出力したり，ファイルから値を取得します
```
> inout.bat [コマンド] w [出力ファイル]
```
```
> inout.bat [コマンド] r [入力ファイル]
```
```
> inout.bat [コマンド] r [入力ファイル] w [出力ファイル]
```

### javace.ps1
javaの文字コードをエンコードしてコンパイルします(InteiJが必要)
```
> javece.pa1 [ソースファイル].java
```

### logdll.py
コード内で定義したパターンが目標文書中に存在する場合ダウンロードします
今回はDiscordのlogからダウンロードすることを目的にしています
```
> py logdll.py [目標文書]
```
#### setting
logdll.py内の19行目の保存先ディレクトリを設定する

`self.save_dir = "save" `

logdll.py内の24行目をキーとして設定する

`self.key = "https://cdn.discordapp.com"`


### mc.bat
mkdir と cd を同時にします
```
> mc.bat [ディレクトリ名]
```

### open.bat
エクスプローラーでカレントディレクトリを開きます
```
> open.bat
```

### pc.bat
カレントディレクトリのPATHをクリップボードに保存します
```
> pc.bat
```

### wpf.bat
wpfでwindowsアプリケーションを起動する際に用いることができます(不完全)
```
wpf.bat [ソースコード].cs
```

### ydl.bat
youtube-dl を用いてmp3で出力することを簡易化します

```
> ydl.bat
[ydl.bat]> URL: [YoutubeのURL]
```
```
\
|--ydl.bat(本プログラム)
|
|--youtubedl
|      |
|      |--youtube-dl.exe(実際に動く実行ファイル)
|      |
|      |--saves(保存先ディレクトリ)
:
```
