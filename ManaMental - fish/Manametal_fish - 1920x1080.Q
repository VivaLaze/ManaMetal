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

//���������BUGԭ��ʵ�������������
			github:VivaLaze
//			byС�ɰ�			//
//////////////////////////////////



//��1920*1080Ϊ���� ����������Ҫ�Լ�����
//����Ǻ������ĵ�һ�ŵ����ص�����꣬Ҳ�����;��� ����Ư���Ǹ� 
//����Ǻ����������Ͻ������һ����������ɫ���ص����һ��

//1920*1080
BlueX0 = 841
BlueY0 = 834
BlueX1 = 1076
BlueY1 = 834

//���±ߵ�����fish����Y������һ�������۾����ڵ�X����������Y���ꡣx0������������ߵ�x1�����ұ�
FishX0 = 846
FishY0 = 863
FishX1 = 1068
FishY1 = 863
//��ɫ�����������ʱ�����Ͻ�����ͻ�ɫ�������ұߵ����Ͻ�����
YellowX0 = 842
YellowY0 = 854
YellowX1 = 1051
YellowY1 = 854

//�;���������
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
	TracePrint "����Get_Center"
//�����;�������
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "C83C28", BlueX, BlueY
	If BlueX > 0 And BlueY > 0 Then 
		
		//TracePrint "�ҵ���ɫ"
			
			CenterX = BlueX + 15
			CenterY = BlueY
			Fish_State = 1
			TracePrint "�;�������:"
			TracePrint CenterX
			Delay 50
			LeftClick 2
		
	End If
	
End Sub


//�����������ĵ���߾͵����Ҽ�
Sub Back_Center
	//��Ư����
	FindColor BlueX0, BlueY0, BlueX1, BlueY1, "d3d3d3", WhiteX, WhiteY

	//TracePrint WhiteX - CenterX
	If WhiteX - CenterX < 0 Then 
		RightClick 1
		Delay 150
		//TracePrint "����ߵ�1��"
	Else 
		//TracePrint "���ұ߻��м�"
	End If
	If WhiteX < 0 Then 
		Fish_State = 0
	End If
	
	
End Sub

Sub Go_fish

	//�������۾���ɫ�ұߵĺڵ� �� ��ɫ�������Ͻ�����
	FindColor FishX0, FishY0, FishX1, FishY1, "000000", FishX, FishY
	FindColor YellowX0, YellowY0, YellowX1, YellowY1, "31FFEE", YellowX, YellowY
	
	//������Ҫ�ƶ��Ĳ��� 
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