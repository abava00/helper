@echo off
REM @chcp 65001

REM   コマンド名前 Any.exe
REM echo %1 
REM   出力か入力か上書きか追記か < > >>
REM echo %2
REM   < の場合入力ファイル名, >> > の場合出力ファイル名
REM echo %3
REM   第２引数が < だった場合 >> > を検出する
REM echo %4
REM   第２引数が < だった場合出力ファイル名 
REM echo %5

REM 説明
if "%1" == "-h" (
  goto readme
)
if "%1" == "--help" (
  goto readme
)


REM 処理
if "%1" == "" (
  echo.
  echo  Not exist No1 argument 1
  goto error
)

REM 第2引数の処理
if "%2" == "" (
  echo.
  echo Not exist No2 argument 1
  goto error
)
if "%2" == "r" (
  goto input
)
if "%2" == "w" (
  goto output
)
if "%2" == "ow" (
  goto overwrite
)
if "%2" == "ww" (
  goto overwrite
)

REM 第3引数の処理
:input
(
  if "%3" == "" (
    echo.
    echo Not exist No3 argument 1
    goto error
  ) 
  if not "%3" == "" (
    %1 < %3 
    echo.
    echo done input 2
    goto to
  )
)

:output
(
  if "%3" == "" (
    echo.
    echo Not exist No3 argument 1
    goto error
  )
  if not "%3" == "" (
    %1 > %3
    echo.
    echo done output 3
  )
  goto end
)

:overwrite
(
  if "%3" == "" (
    echo.
    echo Not exist No3 argument 1
    goto error
  )
  if not "%3" == "" (
    %1 >> %3
    echo.
    echo done overwrite 4
  )
  goto end
)

REM 第4引数の処理
:to
if "%4" == "" (
  goto end
)
if "%4" == "w" (
  goto late_output
)
if "%4" == "ow" (
  goto late_overwrite
)
if "%4" == "ww" (
  goto late_overwrite
)

REM 第5引数の処理
:late_output
(
  if "%5" == "" (
    echo.
    echo Not exist No5 argument 1
    goto end
  )
  if not "%5" == "" (
    %1 < %3 > %5
    echo.
    echo done input, output 23
    goto end
  )
)

:late_overwrite
(
  if "%5" == "" (
    echo.
    echo Not exist No5 argument 1
    goto end
  )
  if not "%5" == "" (
    %1 < %3 >> %5
    echo.
    echo done input, overwrite 24
    goto end
  )
)

:readme
echo.
echo if you want to do
echo ^$COMMAND ^< READFILE ^>(or ^>^>) WRITELIFE
echo like Linux
echo use this
echo ^$inout COMMAND r READFILE w(or ow) WRITELIFE
echo.
echo ----Correspondence table-----
echo ^|   on Linux   ^|  on this   ^|
echo -----------------------------
echo ^|      ^<       ^|     r      ^|
echo ^|      ^>       ^|     w      ^|
echo ^|     ^>^>       ^|   ow(ww)   ^|
echo -----------------------------

:error
echo.
echo If you need help -h or --help.



:end
