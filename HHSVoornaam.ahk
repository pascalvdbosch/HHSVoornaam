#NoEnv
#SingleInstance, force
#Include JSON.ahk
Process, Priority,, High 
SendMode Input
SetWorkingDir %A_ScriptDir%
FileRead jsonString, data.json
Data := JSON.Load(jsonString)

F1::
oCB := ClipboardAll
Clipboard := ""
Send, ^c
ClipWait, 0, 1
CB := Clipboard
for id_, naam in Data
    If (id_ == CB) {
        f := naam
        ToolTip, %f%
        SetTimer, RemoveToolTip, -1000
    }
ClipBoard := oCB
return

RemoveToolTip:
ToolTip
return