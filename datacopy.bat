@echo off
setlocal

REM あなたが設定する所 path1に同期元のフォルダ名を，path2に同期先のフォルダ名を指定する
REM ///////////////////////////////////////////////////////////////////////
set path1=C:\Users\%USERNAME%\Desktop\test\howto/A
set path2=C:\Users\%USERNAME%\Desktop\test\howto/B
REM ///////////////////////////////////////////////////////////////////////



if EXIST %path1% if EXIST %path2% (

REM  echo "path1 =%path1%"
REM  echo "path2 =%path2%"
  robocopy "%path1%" "%path2%" /s
  robocopy "%path2%" "%path1%" /s

REM  echo 一つ目のパスは =%path1%
REM  echo 2つ目のパスは =%path2%
REM  echo 同期完了したかもしれません

) else (
echo これはHDDのミラーリングがうまくいかなかったときに出力されるはずの文字列です -作者より
echo this massage is miss buckup data. by %USERNAME% 
echo ファイル名があってないでっせ。
pause
)

endlocal

rem 簡易説明
rem ファイルの削除はしないよ
rem path1と2の=の後を変えて同期させるフォルダを指定するよ
rem =の前後はスペース入れない状態で合ってるよ
rem USBで使いたい時はどちらかのpathにUSBを選んでね。

REM 1と2でファイルの内容が食い違った場合は，1のファイルの内容が優先される
REM 1ファイル内:hello 2ファイル内:world の場合
REM 実行後にはどちらも中身がhelloになる
