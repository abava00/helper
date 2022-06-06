#IfWinActive,ahk_exe Explorer.EXE
;Move jhkl
Ctrl & j::
  send,{Down}
  ControlFocus, DirectUIHWND2, A
  return
Ctrl & k::
  send,{Up}
  ControlFocus, DirectUIHWND2, A
  return
Ctrl & h::
  send,{Left}
  ControlFocus, DirectUIHWND2, A
  return
Ctrl & l::
  send,{Right}
  ControlFocus, DirectUIHWND2, A
  return
;Ctrl & j::{Blind}{Down}
;Ctrl & k::{Blind}{Up}

;remap F1 to F2
F1::F2

return
#IfWinActive

