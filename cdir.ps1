Param([switch]$help, [switch]$bookmark, [switch]$remove)
#User settings------------
#bookmarks save file(you can change this file path)
$filepath="$env:XDG_CONFIG_HOME\.filebookmark"
#-------------------


#init
if (-not (Test-Path $filepath)){
  echo "" > $filepath
  $f=(gc $filepath) | ? {$_.trim() -ne "" }
  $f | Out-File $filepath -Encoding UTF8
  $help = $True
}


#help
if ($help){
  echo "selected help"
  echo "このプログラムはディレクトリのブックマークを登録できるやつです"
  echo ""
  echo "$>cdir.ps1 -help(or -h)        ヘルプを表示します"
  echo ""
  echo "$>cdir.ps1 -bookmark(or -b)    で作業ディレクトリをブックマークに登録できます"
  echo ""
  echo "$>cdir.ps1 -remove(or -r)      ブックマークを削除できます"
  echo ""
  echo "$>cdir.ps1              ブックマークしたディレクトリへ移動できます"
}


#Bookmarkの追加
if ($bookmark){
  echo "selected bookmark"
  $here=Get-Location
  Write-Host "registered->"$here

  $f = (Get-Content $filepath) -as [string[]] #Get-Content にbookmarkしたPATHの存在するディレクトリを指定する
  $i=0+1
  foreach ($l in $f) {
      if ($here -like $l){
        echo "This directory is already registered."
        return
      }
      $i++
  }

  Write-Output $here | Add-Content $filepath -Encoding Default
  Write-Host "Done!"
}


#Bookmarkの削除
if ($remove){
  echo "!!selected remove!!"
  $f = (Get-Content $filepath) -as [string[]]
  if ($f -eq $null){
    echo "ブックマークが登録されていません"
    echo "do $>cdir.ps1 -help"
    return
  }
  $i=0+1
  foreach ($l in $f) {
      Write-Host $i : $l
      $i++
  }
  $number = Read-Host("「削除する」PATHの番号を入力ください")
  $f[$number-1]=$null
  $f | Out-File $filepath -Encoding UTF8
  $f=(gc $filepath) | ? {$_.trim() -ne "" }
  $f | Out-File $filepath -Encoding UTF8
  Write-Host "Done!"
}


#Bookmarkしたディレクトリへ移動する
if ((-not $help) -and (-not $remove) -and (-not $bookmark)){
  $f = (Get-Content $filepath) -as [string[]] #Get-Content にbookmarkしたPATHの存在するディレクトリを指定する
  if ($f -eq $null){
    echo "ブックマークが登録されていません"
    echo "do $>cdir.ps1 -help"
    return
  }
  $i=0+1
  foreach ($l in $f) {
      Write-Host $i : $l
      $i++
 }
  $number = Read-Host("PATHの番号を入力ください")
  if ($number-1 -eq -1){
    return
    }
  Set-Location -Path $f[$number-1] #カレントディレクトリの移動
}
