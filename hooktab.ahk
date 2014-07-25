;=======================================================================
; AutoHotkey Version: 1.x
; Author:             ge4los ge4los@gmail.com
; Filename:		hooktab.ahk
; Script Function:
; Version:
; Last modified:	2011-07-17 22:35
;=======================================================================


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; 设定窗口监控的参数 
SetTitleMatchMode, 2 ;设定ahk匹配窗口标题的, 2；便于操作
DetectHiddenWindows, On ; 检测隐藏的窗口 

Menu,tray,icon,%A_WorkingDir%\hooktab.ico  ; 在窗体创建前显示图标 
traytip, ,HookTab Start!哈,2,1

; config 

;---------------
;======================呼叫窗口，切换窗口,分屏
#!Left::
{
	SysGet MonitorWorkArea,Monitor
	SysGet, Mon1, Monitorworkarea, 1
	WinMove,A,,0, 0,(mon1right-mon1left)/2,mon1bottom
}
Return
#!Right::
{
	SysGet MonitorWorkArea,Monitor
	SysGet, Mon1, Monitorworkarea, 1
	WinMove,A,,mon1right/2, 0,mon1right/2,mon1bottom
}
Return
#!up::
{
	SysGet MonitorWorkArea,Monitor
	SysGet, Mon1, Monitorworkarea, 1
	WinMaximize,A,,,
}
Return
#!down::
{
	SysGet MonitorWorkArea,Monitor
	SysGet, Mon1, Monitorworkarea, 1
	Winminimize,A,,,
}
Return
; end 

#z::reload        ;调试重启
; 调用everything  
; TODO:调用后窗口更新问题 

#f::
IfWinnotExist,ahk_class EVERYTHING
{
	run,c:\syncbox\Soft\Everything\Everything.exe
}
	else IfWinNotActive,ahk_class EVERYTHING
	{
		WinActivate,ahk_class EVERYTHING 
	}
else
{
	Winminimize,Everything ahk_class EVERYTHING
	winhide,Everything ahk_class EVERYTHING
}
return

;最大会运行vim
#v::
{
	run,c:\syncbox\Soft\Vim\vim73\gvim.exe,,Max
}
Return

; 启动totalcommand,替换掉win+e
#e::
{
	IfWinnotExist,ahk_class TTOTAL_CMD
	{
		run,TOTALCMD.EXE,c:\syncbox\Soft\TotalCmd,max
		winactivate
	}
	else IfWinNotActive,ahk_class TTOTAL_CMD
	; freecommander 激活模式存在错误 
		{
		Winactivate,ahk_class TTOTAL_CMD 
		Winshow,ahk_class TTOTAL_CMD
		}
	else
	{
		WinMinimize,ahk_class TTOTAL_CMD
	}
}
return
; 启动evernote 
#w::
{
	IfWinnotExist,ge4los@gmail.com - 印象笔记 ahk_class ENMainFrame
	{
		run,Evernote.exe,c:\soft\Evernote\Evernote,max
		winactivate
	}
	else IfWinNotActive,ge4los@gmail.com - 印象笔记 ahk_class ENMainFrame
		{
		Winactivate,ge4los@gmail.com - 印象笔记 ahk_class ENMainFrame
		winshow
		}
	else
	{
		Winminimize,ge4los@gmail.com - 印象笔记 ahk_class ENMainFrame
		winhide
	}
}
return
;Find and Run Robot 2 | Sunday April 28, 2013  -  5:19 PM ahk_class TMainForm
;  
#q::
{
    ; C:\syncbox\soft\FindAndRunRobotPortable\FindAndRunRobot.exe
    IfWinnotExist,Find and Run Robot 2 ahk_class TMainForm
	{
		run,C:\syncbox\soft\FindAndRunRobotPortable\FindAndRunRobot.exe
        winactivate

	}
	else IfWinNotActive,Find and Run Robot 2 ahk_class TMainForm
		{
		; Winactivate,Find and Run Robot 2 ahk_class TMainForm
        send !{SPACE}
		; winshow
		}
	else
	{
		; Winminimize,Find and Run Robot 2 ahk_class TMainForm
		; winhide
        send !{SPACE}
	}

}
return
