[General]
SyntaxVersion=2
BeginHotkey=9
BeginHotkeyMod=2
PauseHotkey=19
PauseHotkeyMod=0
StopHotkey=114
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=06dfefa1-1d56-4047-8e7d-17f1d975f067
Description=Manametal_fish-1366x768
Enable=0
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
//			BY小可爱			//
//////////////////////////////////


/*
//以1920*1080为例， 其他分率需要自己个改
//这个是红蓝条的第一排的像素点的坐标，也就是耐久条 ，鱼漂的那个 
//注意是第一排的像素点的坐标 别搞错了！
BlueX0 = 841
BlueY0 = 834
BlueX1 = 1076
BlueY1 = 834

//鱼条的眼睛白色右边的黑点 和 黄色框最左边最左上角坐标
FishX0 = 846
FishY0 = 863
FishX1 = 1068
FishY1 = 863
YellowX0 = 842
YellowY0 = 854
YellowX1 = 1051
YellowY1 = 854
*/

BlueX0 = 563
BlueY0 = 521
BlueX1 = 798
BlueY1 = 521

//最下边的条，fish两个Y坐标是一样的鱼眼镜所在的X轴的坐标就是Y坐标。x0坐标是条最左边的x1是最右边
FishX0 = 560
FishY0 = 550
FishX1 = 795
FishY1 = 550
//黄色框所在最左边时的左上角坐标和黄色框在最右边的右上角坐标
YellowX0 = 565
YellowY0 = 541
YellowX1 = 773
YellowY1 = 541



//耐久条的返回线
Dim CenterX
Dim Fish_State

While True
	Fish_State = 0
	RightClick 1
	Call Get_Center
	While Fish_State = 1
		Call Back_Center
		Call Go_fish
	Wend
	Delay 50
Wend



Sub Get_Center
	
//计算耐久条中心
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "C83C28", BlueX, BlueY
	If BlueX > 0 Then 
		TracePrint "Get_Center"
		//TracePrint "找到蓝色"
			
			CenterX = BlueX + 15
			CenterY = BlueY
			Fish_State = 1
			TracePrint "耐久条中心:"
			TracePrint CenterX
			Delay 50
			LeftClick 3
	
	End If
	
End Sub


//如果鱼标在中心的左边就点下右键
Sub Back_Center
	//鱼漂的条
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "d3d3d3", WhiteX, WhiteY
	TracePrint "Back_Center"
	//TracePrint WhiteX - CenterX
	If WhiteX - CenterX < 0 Then 
		RightClick 2
		Delay 200
	ElseIf WhiteX - CenterX > 25 Then
		LeftClick 1
		
		//TracePrint "在右边或中间"
	End If
	
	If WhiteX = -1 Then 
		Fish_State = 0
		RightClick 1
	End If
	
	
End Sub

Sub Go_fish
	TracePrint "Go_fish"
	//鱼条的眼睛白色右边的黑点 和 黄色框最坐上角坐标
	FindColor FishX0, FishY0, FishX1, FishY1, "000000", FishX, FishY
	FindColor YellowX0, YellowY0, YellowX1, YellowY1, "31FFEE", YellowX, YellowY
	
	//这是需要移动的步数 
	number = (YellowX + 4 - FishX) \ 26

	//TracePrint YellowX
	//TracePrint FishX
	//TracePrint number
	If number = 0 Then 
		Call Back_Center
	End If
	If number < 0 Then 
		KeyPress "right",- number
		Delay 25
	ElseIf number > 0 Then
		KeyPress "left", number
		Delay 25
	End If
	
	
End Sub
