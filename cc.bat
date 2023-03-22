@echo off 

REM 選択した値の文字コードに変更します 値を覚えるのが面倒だったので
echo Please choice use number(encord code).
echo !!warn!! Terminal logs may be deleted!!
echo 1 : shift_jis
echo 2 : UTF-8
echo 3 : UTF-16
echo 4 : euc-jp
echo 5 : us-ascill
echo 0 : show help.
echo q : quit.
choice /CS /C  123450q

if %errorlevel% == 1 (
  chcp 932 
  echo done!
)
if %errorlevel% == 2 (
  chcp 65001
  echo done!
)
if %errorlevel% == 3 (
  chcp 1200 
  echo done!
)
if %errorlevel% == 4 (
  chcp 51932
  echo done!
)
if %errorlevel% == 5 (
  chcp 20127
  echo done!
)
if %errorlevel% == 6 (
echo --------------------------------------------------------
echo chcpを打つのが面倒な人向けのコマンドです.
echo 値を選択すると，その値に対応した文字コードに変更されます
echo --------------------------------------------------------
echo if you can not read it. you should choice 2 .
echo.
)
if %errorlevel% == 7 (
  echo have a good day!
)
