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
; �趨���ڼ�صĲ��� 
SetTitleMatchMode, 2 ;�趨ahkƥ�䴰�ڱ����, 2�����ڲ���
DetectHiddenWindows, On ; ������صĴ��� 

Menu,tray,icon,%A_WorkingDir%\hooktab.ico  ; �ڴ��崴��ǰ��ʾͼ�� 
traytip, ,HookTab Start!��,2,1

; config 

;---------------
;======================���д��ڣ��л�����,����
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

#z::reload        ;��������
; ����everything  
; TODO:���ú󴰿ڸ������� 

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

;��������vim
#v::
{
	run,c:\syncbox\Soft\Vim\vim73\gvim.exe,,Max
}
Return

; ����totalcommand,�滻��win+e
#e::
{
	IfWinnotExist,ahk_class TTOTAL_CMD
	{
		run,TOTALCMD.EXE,c:\syncbox\Soft\TotalCmd,max
		winactivate
	}
	else IfWinNotActive,ahk_class TTOTAL_CMD
	; freecommander ����ģʽ���ڴ��� 
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
; ����evernote 
#w::
{
	IfWinnotExist,ge4los@gmail.com - ӡ��ʼ� ahk_class ENMainFrame
	{
		run,Evernote.exe,c:\soft\Evernote\Evernote,max
		winactivate
	}
	else IfWinNotActive,ge4los@gmail.com - ӡ��ʼ� ahk_class ENMainFrame
		{
		Winactivate,ge4los@gmail.com - ӡ��ʼ� ahk_class ENMainFrame
		winshow
		}
	else
	{
		Winminimize,ge4los@gmail.com - ӡ��ʼ� ahk_class ENMainFrame
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
