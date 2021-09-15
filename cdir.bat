@echo off
REM User settings------------
REM bookmarks save and temp file(you can change this file path)
set filepath=%HOMEPATH%.filebookmark
set tempfile=%filepath%_temp_
REM -------------------

rem init tempファイルが存在しない時
if not exist %filepath% (
  echo "not_exist"
  echo %filepath%
  type nul>%filepath%
  goto help
  exit
)



rem 引き数が入力されたとき
if not "%~1"=="" (
  if "%~1"=="-help" goto help
  if "%~1"=="-h" goto help
  if "%~1"=="-bookmark" goto bookmark
  if "%~1"=="-b" goto bookmark
  if "%~1"=="-remove" goto remove
  if "%~1"=="-r" goto remove
  exit
)

rem 引き数が入力されなかったとき
rem Bookmarkしたディレクトリへ移動する
:move
  rem bookmarkが存在しているか確認
  for %%F in (%filepath%) do (
    REM 0バイトなら正常終了
    if %%~zF==0 (
      echo ブックマークが登録されていません
      echo do $>cdir.bat -help
      exit
    )
  )

  set count=0
  setlocal enabledelayedexpansion
  rem 一覧表示
  for /f "delims=" %%a in (%filepath%) do (
    set /a count=!count!+1
    echo !count! : %%a
  )
  rem 番号取得
  set /a count=0
  echo PATHの番号を入力してください
  set /P deletenum=



  for /f "delims=" %%b in (%filepath%) do (
    set /a count=!count!+1

    if %deletenum%==!count! (
      echo %%b
      cd /d %%b
      chdir /d %%b
      powershell
      echo Done
      exit
    )
  )
  endlocal









rem help
:help
  echo selected help
  echo このプログラムはディレクトリのブックマークを登録できるやつです
  echo,
  echo $^>cdir.bat -help^(or -h^)        ヘルプを表示します
  echo,
  echo $^>cdir.bat -bookmark^(or -b^)    で作業ディレクトリをブックマークに登録できます
  echo,
  echo $^>cdir.bat -remove^(or -r^)      ブックマークを削除できます
  echo,
  echo $^>cdir.bat              ブックマークしたディレクトリへ移動できます
  echo,
  exit


rem add bookmark
:bookmark
  echo selected bookmark
  set here=%cd%
  echo registered-^>%here%

  rem 既に登録されているかどうかの判定
  for /f "delims=" %%a in (%filepath%) do (
    if %%a==%here% (
      echo This directory is already registered.
      exit
    )
  )

  rem 新規登録
  rem echoを括弧で囲むと行の最後に半角空白が入らなくなる
  (echo %here%) >> %filepath%
  echo Done!
  exit


rem remove bookmark
:remove
  echo !!selected remove!!

  rem bookmarkが存在しているか確認
  for %%F in (%filepath%) do (
    REM 0バイトなら正常終了
    if %%~zF==0 (
      echo ブックマークが登録されていません
      echo do $>cdir.ps1 -help
      exit
    )
  )

  set count=0
  setlocal enabledelayedexpansion
  rem 一覧表示
  for /f "delims=" %%a in (%filepath%) do (
    set /a count=!count!+1
    echo !count! : %%a
  )

  rem 番号取得
  set /a count=0
  echo 「削除する」PATHの番号を入力してください
  set /P deletenum=

  for /f "delims=" %%b in (%filepath%) do (
    set /a count=!count!+1
    if %deletenum%==!count! (
      rem 該当行削除
      echo %%b
      type nul>%tempfile%
      findstr /vx %%b %filepath%>%tempfile%
      copy %tempfile% %filepath%>nul
      del %tempfile%
      echo Done!
      exit
    )
  )
  endlocal

