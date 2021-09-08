:@chcp 65001
: 現在位置までのpathをクリップボードに張り付けられるようにします

: パワーシェルで実装する意味がなくなりました
: #以下を .ps1ファイルで実行有効にすればpowershellでも実装できるよ
: [System.IO.Directory]::SetCurrentDirectory((Get-Location -PSProvider FileSystem).path)
: [System.IO.Directory]::GetCurrentDirectory() | clip

: なのでcmd版で実装しました
: 文字コードは糞
@CD | clip
