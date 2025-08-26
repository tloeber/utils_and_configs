; Install keyboard hook for better key interception (v2 syntax)
InstallKeybdHook()

; Single method to capture Ctrl+Tab with proper task switcher
$^Tab::
{
    Send("{Alt down}{Tab}")
    KeyWait("Ctrl")  ; Wait until Ctrl is released
    Send("{Alt up}")
}

; Keep Ctrl+` as backup
^`::Send("!{Tab}")                   ; Ctrl+` switches windows (backup)
#!Left::                            ; Win+Alt+Left snaps window to left half
{
    WinGetPos(&X, &Y, &W, &H, "A")
    ; Check if window is already snapped to right side
    if (X > A_ScreenWidth//4 && W <= A_ScreenWidth//2 + 50) {
        ; Already snapped right, move directly to left
        WinMove(0, 0, A_ScreenWidth//2, A_ScreenHeight, "A")
    } else {
        ; Try Windows native snapping first
        Send("{LWin down}{Left}{LWin up}")
        Sleep(100)
        ; Check if it worked, if not use direct manipulation
        WinGetPos(&newX, &newY, &newW, &newH, "A")
        if (newW > A_ScreenWidth//2 + 50) {
            WinRestore("A")
            WinMove(0, 0, A_ScreenWidth//2, A_ScreenHeight, "A")
        }
    }
}
#!Right::                           ; Win+Alt+Right snaps window to right half
{
    WinGetPos(&X, &Y, &W, &H, "A")
    ; Check if window is already snapped to left side
    if (X < A_ScreenWidth//4 && W <= A_ScreenWidth//2 + 50) {
        ; Already snapped left, move directly to right
        WinMove(A_ScreenWidth//2, 0, A_ScreenWidth//2, A_ScreenHeight, "A")
    } else {
        ; Try Windows native snapping first
        Send("{LWin down}{Right}{LWin up}")
        Sleep(100)
        ; Check if it worked, if not use direct manipulation
        WinGetPos(&newX, &newY, &newW, &newH, "A")
        if (newW > A_ScreenWidth//2 + 50) {
            WinRestore("A")
            WinMove(A_ScreenWidth//2, 0, A_ScreenWidth//2, A_ScreenHeight, "A")
        }
    }
}
#Left::Send("^{Left}")              ; Win+Left becomes Ctrl+Left (jump one word left)
#Right::Send("^{Right}")            ; Win+Right becomes Ctrl+Right (jump one word right)
^Left::Send("{Home}")               ; Ctrl+Left becomes Home (go to beginning of line)
^Right::Send("{End}")               ; Ctrl+Right becomes End (go to end of line)
^Up::Send("^{Home}")                ; Ctrl+Up becomes Ctrl+Home (go to beginning of document)
^Down::Send("^{End}")               ; Ctrl+Down becomes Ctrl+End (go to end of document)
#+Left::Send("^+{Left}")            ; Win+Shift+Left becomes Ctrl+Shift+Left (select word left)
#+Right::Send("^+{Right}")          ; Win+Shift+Right becomes Ctrl+Shift+Right (select word right)
#!m::Send("+#{Right}")              ; Win+Alt+M becomes Shift+Win+Right (move window to next monitor right)
#!n::Send("+#{Left}")               ; Win+Alt+N becomes Shift+Win+Left (move window to next monitor left)
#!Enter::WinMaximize("A")           ; Win+Alt+Enter maximizes active window
#Backspace::Send("^{Backspace}")    ; Win+Backspace becomes Ctrl+Backspace (delete last word)