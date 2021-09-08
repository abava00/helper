:REM vimとVScodeのカンペを表示するよ


@echo off
REM echo %%1 = %1


cd C:\Users\%USERNAME%\Desktop\sheet



if "%2" == "note" (
  if "%1" == "vim" (
    start notepad.exe Vim_learn.txt
    goto end
    )
  if "%1" == "vs" (
    start notepad.exe VScode_learn.txt
    goto end
    )
  goto error
  )


if "%1" == "vim" (
REM echo This is VIM
  code Vim_learn.txt
  goto end
  )

if "%1" == "vs" (
REM echo This is VS
  code VScode_learn.txt
  goto end
  )



:error
REM echo This is NULL
   echo 第 1 引数は vim もしくは vs にしてね
   echo 第 2 引数は note にするとメモ帳で開くよ


:end
