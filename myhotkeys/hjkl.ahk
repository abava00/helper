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
  Ctrl & h::
    send,{Left}
    ControlGetFocus, fc, A
    if( fc == "DirectUIHWND2" ){
      ControlFocus, DirectUIHWND2, A
      return
    }
    else if( fc == "SysTreeView321" ){
      ControlFocus, SysTreeView321, A
      return
    }
  Ctrl & l::
    send,{Right}
    ControlGetFocus, fc, A
    if( fc == "DirectUIHWND2" ){
      ControlFocus, DirectUIHWND2, A
      return
    }
    else if( fc == "SysTreeView321" ){
      ControlFocus, SysTreeView321, A
      return
    }

;Ctrl & j::{Blind}{Down}
;Ctrl & k::{Blind}{Up}

;remap F1 to F2
F1::F2

return
#IfWinActive

