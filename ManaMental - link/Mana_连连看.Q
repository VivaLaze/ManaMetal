[General]
SyntaxVersion=2
BeginHotkey=112
BeginHotkeyMod=0
PauseHotkey=19
PauseHotkeyMod=0
StopHotkey=114
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=3cbe64e8-0fe9-498f-af8d-847dba182a67
Description=Mana_line
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]

x0 = 1076
y0 = 743

fx0 = 812
fy0 = 631
//by小可爱
//github: VivaLaze
For y = 0 To 3
	For x = 0 To 7
		colors1 = GetPixelColor(x0 - x * 38, y0 - y * 38)
		If colors1 <> "595959" Then 
			
			For y_2 = 0 To 3
				For x_2 = 0 To 7
					Ifcolor fx0 + x_2 * 38, fy0 + y_2 * 38,colors1,0 Then
					
						MoveTo x0 - x * 38, y0 - y * 38
						LeftClick 1
						MoveTo fx0 + x_2 * 38, fy0 + y_2 * 38
						LeftClick 1
						
					End If
							
				Next
			Next
		End If
	Next
Next
