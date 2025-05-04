#Requires AutoHotkey v2.0
CoordMode("Mouse", "Screen")

; Global variable for the timer
global menuTimerObj := ""     ; Timer object for closing the menu
global timeoutDuration := 700 ; Timeout in milliseconds
global cornerX := 100
global cornerY := 40

; Condition: mouse is in the top-left corner
#HotIf MouseIsInTopLeftCorner()
WheelDown:: {
    global menuTimerObj, timeoutDuration
    Send("^!{Tab}") ; Ctrl+Alt+Tab (switch forward)
    ; Stop the previous timer if it exists
    if menuTimerObj {
        SetTimer(menuTimerObj, "Off")
    }
    ; Start a new timer to close the menu
    menuTimerObj := SetTimer(SelectWindow, -Abs(timeoutDuration))
}

WheelUp:: {
    global menuTimerObj, timeoutDuration
    Send("^!+{Tab}") ; Ctrl+Alt+Shift+Tab (switch backward)
    ; Stop the previous timer if it exists
    if menuTimerObj {
        SetTimer(menuTimerObj, "Off")
    }
    ; Start a new timer to close the menu
    menuTimerObj := SetTimer(SelectWindow, -Abs(timeoutDuration))
}
#HotIf

; Function to confirm the window selection
SelectWindow() {
    global menuTimerObj
    Send("{Enter}") ; Confirm window selection
    menuTimerObj := "" ; Reset timer
}

; Function to cancel the timer
CancelTimer() {
    global menuTimerObj
    if menuTimerObj {
        SetTimer(menuTimerObj, "Off") ; Stop the timer
        menuTimerObj := ""
    }
}

; Function to check if mouse is in the top-left corner (0-cornerX, 0-cornerY)
MouseIsInTopLeftCorner() {
    global cornerX, cornerY
    MouseGetPos(&x, &y)
    return (x >= 0 && x <= cornerX && y >= 0 && y <= cornerY)
}
