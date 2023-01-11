Scriptname MRL_UITestQuest extends Quest  

string[] Options

Event OnUpdate()

	Options[0] = "���� �����"
	Options[1] = "���� �������"
	Options[2] = "���� ��������������"
	Options[3] = "������������� ���� ������"
	Options[4] = "���������� �����"
	Options[5] = "���� �� ������"
	Options[6] = "���� �� ������"
	Options[7] = "����������"
	Options[8] = "���� ���-�����"
	Options[9] = "���� ���������"

	int isInput = ((self as Form) as uilib_1).ShowList("�������� ����������� ��� ������", Options, -1, 0)

	Debug.Notification("Choose is " + Options[isInput] + " input number: " + isInput)
	Utility.WaitMenuMode(1.0)
	RegisterForSingleUpdate(5.0)
EndEvent

Event OnInit()
	Utility.WaitMenuMode(5.0)
	Options = new string[10]

	((self as Form) as uilib_1).ShowTextInput("Hello")
	
	RegisterForSingleUpdate(5.0)

EndEvent