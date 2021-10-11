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
  echo "���̃v���O�����̓f�B���N�g���̃u�b�N�}�[�N��o�^�ł����ł�"
  echo ""
  echo "$>cdir.ps1 -help(or -h)        �w���v��\�����܂�"
  echo ""
  echo "$>cdir.ps1 -bookmark(or -b)    �ō�ƃf�B���N�g�����u�b�N�}�[�N�ɓo�^�ł��܂�"
  echo ""
  echo "$>cdir.ps1 -remove(or -r)      �u�b�N�}�[�N���폜�ł��܂�"
  echo ""
  echo "$>cdir.ps1              �u�b�N�}�[�N�����f�B���N�g���ֈړ��ł��܂�"
}


#Bookmark�̒ǉ�
if ($bookmark){
  echo "selected bookmark"
  $here=Get-Location
  Write-Host "registered->"$here

  $f = (Get-Content $filepath) -as [string[]] #Get-Content ��bookmark����PATH�̑��݂���f�B���N�g�����w�肷��
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


#Bookmark�̍폜
if ($remove){
  echo "!!selected remove!!"
  $f = (Get-Content $filepath) -as [string[]]
  if ($f -eq $null){
    echo "�u�b�N�}�[�N���o�^����Ă��܂���"
    echo "do $>cdir.ps1 -help"
    return
  }
  $i=0+1
  foreach ($l in $f) {
      Write-Host $i : $l
      $i++
  }
  $number = Read-Host("�u�폜����vPATH�̔ԍ�����͂�������")
  $f[$number-1]=$null
  $f | Out-File $filepath -Encoding UTF8
  $f=(gc $filepath) | ? {$_.trim() -ne "" }
  $f | Out-File $filepath -Encoding UTF8
  Write-Host "Done!"
}


#Bookmark�����f�B���N�g���ֈړ�����
if ((-not $help) -and (-not $remove) -and (-not $bookmark)){
  $f = (Get-Content $filepath) -as [string[]] #Get-Content ��bookmark����PATH�̑��݂���f�B���N�g�����w�肷��
  if ($f -eq $null){
    echo "�u�b�N�}�[�N���o�^����Ă��܂���"
    echo "do $>cdir.ps1 -help"
    return
  }
  $i=0+1
  foreach ($l in $f) {
      Write-Host $i : $l
      $i++
 }
  $number = Read-Host("PATH�̔ԍ�����͂�������")
  if ($number-1 -eq -1){
    return
    }
  Set-Location -Path $f[$number-1] #�J�����g�f�B���N�g���̈ړ�
}
