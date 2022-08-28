[General]
SyntaxVersion=2
BeginHotkey=38
BeginHotkeyMod=8
PauseHotkey=19
PauseHotkeyMod=0
StopHotkey=40
StopHotkeyMod=8
RunOnce=1
EnableWindow=
MacroID=f4f904f5-5857-4329-90be-6fe3f95e831a
Description=Manametal_fish
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//////////////////////////////////
//								//

//本程序基于BUG原理实现请勿随意更改
			github:VivaLaze
//			by小可爱			//
//////////////////////////////////



//以1920*1080为例， 其他分率需要自己个改
//这个是红蓝条的第一排的像素点的坐标，也就是耐久条 ，鱼漂的那个 
//这个是红蓝条的左上角坐标第一排有鱼鳔白色像素点的那一排

//1920*1080
BlueX0 = 841
BlueY0 = 834
BlueX1 = 1076
BlueY1 = 834

//最下边的条，fish两个Y坐标是一样的鱼眼镜所在的X轴的坐标就是Y坐标。x0坐标是条最左边的x1是最右边
FishX0 = 846
FishY0 = 863
FishX1 = 1068
FishY1 = 863
//黄色框所在最左边时的左上角坐标和黄色框在最右边的右上角坐标
YellowX0 = 842
YellowY0 = 854
YellowX1 = 1051
YellowY1 = 854

//耐久条的中心
Dim CenterX
Dim Fish_State

While True
	RightClick 1
	Call Get_Center
	While Fish_State = 1
		Call Back_Center
		Call Go_fish
	Wend
Wend



Sub Get_Center
	TracePrint "调用Get_Center"
//计算耐久条中心
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "C83C28", BlueX, BlueY
	If BlueX > 0 And BlueY > 0 Then 
		
		//TracePrint "找到蓝色"
			
			CenterX = BlueX + 15
			CenterY = BlueY
			Fish_State = 1
			TracePrint "耐久条中心:"
			TracePrint CenterX
			Delay 50
			LeftClick 2
		
	End If
	
End Sub


//如果鱼标在中心的左边就点下右键
Sub Back_Center
	//鱼漂的条
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "d3d3d3", WhiteX, WhiteY

	//TracePrint WhiteX - CenterX
	If WhiteX - CenterX < 0 Then 
		RightClick 1
		Delay 150
		//TracePrint "在左边点1下"
	Else 
		//TracePrint "在右边或中间"
	End If
	If WhiteX < 0 Then 
		Fish_State = 0
	End If
	
	
End Sub

Sub Go_fish

	//鱼条的眼睛白色右边的黑点 和 黄色框最坐上角坐标
	FindColor FishX0, FishY0, FishX1, FishY1, "000000", FishX, FishY
	FindColor YellowX0, YellowY0, YellowX1, YellowY1, "31FFEE", YellowX, YellowY
	
	//这是需要移动的步数 
	number = (YellowX + 6 - FishX) \ 24

	//TracePrint YellowX
	//TracePrint FishX
	//TracePrint number
	If FishX <> -1 and number < 0 Then 
		KeyPress "right",- number
		Delay 50
	ElseIf FishX <> 0 and number > 0 Then
		KeyPress "left", number
		Delay 50
	End If
	
	
End Sub
