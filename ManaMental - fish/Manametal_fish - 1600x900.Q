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
MacroID=0a9e8b45-fdd2-4b68-8713-df6404eb3a8a
Description=Manametal_fish-1600x900
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

//���������BUGԭ��ʵ�������������
			github:VivaLaze
//			BYС�ɰ�				//
//////////////////////////////////


/*
//��1920*1080Ϊ���� ����������Ҫ�Լ�����
//����Ǻ������ĵ�һ�ŵ����ص�����꣬Ҳ�����;��� ����Ư���Ǹ� 
//ע���ǵ�һ�ŵ����ص������ �����ˣ�
BlueX0 = 841
BlueY0 = 834
BlueX1 = 1076
BlueY1 = 834

//�������۾���ɫ�ұߵĺڵ� �� ��ɫ������������Ͻ�����
FishX0 = 846
FishY0 = 863
FishX1 = 1068
FishY1 = 863
YellowX0 = 842
YellowY0 = 854
YellowX1 = 1051
YellowY1 = 854
*/


//����Ǻ����������Ͻ�����
BlueX0 = 682
BlueY0 = 653
BlueX1 = 916
BlueY1 = 653

//���±ߵ�����fish����Y������һ�������۾����ڵ�X����������Y���ꡣx0������������ߵ�x1�����ұ�
FishX0 = 684
FishY0 = 682
FishX1 = 914
FishY1 = 682
//��ɫ�����������ʱ�����Ͻ�����ͻ�ɫ�������ұߵ����Ͻ�����
YellowX0 = 683
YellowY0 = 673
YellowX1 = 892
YellowY1 = 673



//�;����ķ�����
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
	
//�����;�������
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "C83C28", BlueX, BlueY
	If BlueX > 0 Then 
		TracePrint "Get_Center"
		//TracePrint "�ҵ���ɫ"
			
			CenterX = BlueX + 15
			CenterY = BlueY
			Fish_State = 1
			TracePrint "�;�������:"
			TracePrint CenterX
			Delay 50
			LeftClick 3
	
	End If
	
End Sub


//�����������ĵ���߾͵����Ҽ�
Sub Back_Center
	//��Ư����
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "d3d3d3", WhiteX, WhiteY
	TracePrint "Back_Center"
	//TracePrint WhiteX - CenterX
	If WhiteX - CenterX < 0 Then 
		RightClick 2
		Delay 200
	ElseIf WhiteX - CenterX > 25 Then
		LeftClick 1
		
		//TracePrint "���ұ߻��м�"
	End If
	
	If WhiteX = -1 Then 
		Fish_State = 0
		RightClick 1
	End If
	
	
End Sub

Sub Go_fish
	TracePrint "Go_fish"
	//�������۾���ɫ�ұߵĺڵ� �� ��ɫ�������Ͻ�����
	FindColor FishX0, FishY0, FishX1, FishY1, "000000", FishX, FishY
	FindColor YellowX0, YellowY0, YellowX1, YellowY1, "31FFEE", YellowX, YellowY
	
	//������Ҫ�ƶ��Ĳ��� 
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