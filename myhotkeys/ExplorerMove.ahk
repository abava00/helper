#NoTrayIcon

#IfWinActive,ahk_exe Explorer.EXE

;toggle control
  Ctrl & G::
    ControlGetFocus, focusedControl, A
    if( focusedControl == "DirectUIHWND2" )
    {
      ControlFocus, SysTreeView321, A
      return
    }
    if( focusedControl == "SysTreeView321" )
    {
      ControlFocus, DirectUIHWND2, A
      return
    }
    return

  Ctrl & F::
    ControlGetFocus, focusedControl, A
    if( focusedControl == "DirectUIHWND2" )
    {
      ControlFocus, ToolbarWindow323, A
      return
    }
    if( focusedControl == "ToolbarWindow323" )
    {
      ControlFocus, DirectUIHWND2, A
      return
    }
    return

;Move jhkl
  Ctrl & j::
    send,{Down}
    ControlGetFocus, fc, A
    if( fc == "DirectUIHWND2" ){
      ControlFocus, DirectUIHWND2, A
      return
    }
    else if( fc == "SysTreeView321" ){
      ControlFocus, SysTreeView321, A
      return
    }
  Ctrl & k::
    send,{Up}
    ControlGetFocus, fc, A
    if( fc == "DirectUIHWND2" ){
      ControlFocus, DirectUIHWND2, A
      return
    }
    else if( fc == "SysTreeView321" ){
      ControlFocus, SysTreeView321, A
      return
    }

; move history
  Ctrl & h::send, {Browser_Back}
  Ctrl & l::send, {Browser_Forward}
; move hierarchy.
  Alt & k::send, !{Up}
  Alt & j::send, {Browser_Back}

;move tab(QtTabBer)
  Alt & l::send, ^{Tab}
  Alt & h::send, ^+{Tab}

;remap F1 to F2
F1::F2

; Enter
Ctrl & Space::
  send,{Enter}

return
#IfWinActive


; Ctrl + jk
; 項目を上下に移動する
; Ctrl + hl
; ページ遷移履歴を言ったり戻ったりする
; Alt + kj
; ファイル階層の上に戻る(jは履歴をさかのぼる操作と同じ(項目がわからないので))
; Alt + hl
; タブを移動する
; Ctrl + space
; ファイルを選択する
