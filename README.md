# WindowSwitcherByScroll

A simple AutoHotkey v2 script that replicates the **hot corner window switching behavior from GNOME (Linux desktop environment)**.
When you hover your mouse over the top-left corner of the screen and scroll the mouse wheel, it cycles through open windows — almost like in GNOME Shell.

## Features

* Scroll down to cycle windows forward (`Ctrl + Alt + Tab`)
* Scroll up to cycle windows backward (`Ctrl + Alt + Shift + Tab`)
* Hover detection in a configurable screen corner (default: top-left 100×40 px)
* Automatically confirms window selection after a short timeout (default: 700 ms)

## Requirements

* [AutoHotkey v2](https://www.autohotkey.com/) (this script **will not work** with v1)
* Windows OS

## Installation

1. Install AutoHotkey v2.
2. Save the script as `WindowSwitcherByScroll.ahk`.
3. Double-click the file to run it, or place it in the Startup folder for autoload.

## Configuration

You can customize:

* `cornerX`, `cornerY`: size of the active top-left screen area.
* `timeoutDuration`: delay before the window selection is confirmed.

Example:

```ahk
global cornerX := 150
global cornerY := 50
global timeoutDuration := 1000
```
