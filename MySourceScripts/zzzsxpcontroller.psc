ScriptName zzzSXPController Extends Quest

GlobalVariable Property GV_XP Auto
GlobalVariable Property GV_RP Auto
Book Property zzzSXPDummyNote Auto
Message Property zzzSXPNotificationMessage Auto
zzzSXPConfig Property XPConfig Auto

float Property GV_StoredXP Auto Hidden
float Property fPlayerLevelBonus = 1.0 Auto Hidden
string Property SXPNotificationColorString Auto Hidden

string[] Property SXPMessageNotification Auto
bool[] Property SXPToggle Auto Hidden

float fStealRecord
float fPrevStealRecord

bool IsLessIntrusiveHUDInstalled

Function GameInit()
	GameReloaded()
EndFunction

Function GameReloaded()
	((Self as Form) as UILIB_1).ShowNotification("", "#FFFFFF")
	StartEventListener()
	IsLessIntrusiveHUDInstalled = GetLessIntrusiveHUDInstalled()
EndFunction

Function StartEventListener()
	RegisterForModEvent( "SXP", "EventHandler" )
EndFunction

Event EventHandler( string eventName, string strArg, float numArg, Form sender )
	if ( eventName != "SXP" )
		return
	endif
	GainModXPMessage(numArg, strArg)
EndEvent

float Function GetXP()
	return GV_XP.GetValue()
EndFunction

float Function GetRestPoint()
	return GV_RP.GetValue()
EndFunction

float Function CalcRestPoint( float f_arg )
	float f_rp = GV_RP.GetValue()
	float f_arg1 = (f_arg * (XPConfig.SXPGeneral[6] - 1.0))
	if ( f_rp <= f_arg1 )
		GV_RP.SetValue( 0.0 )
		return f_rp
	endif
	
	GV_RP.Mod(f_arg1 * -1.0)
	return f_arg1
EndFunction

Function GainModXPMessage(float f, string Msg = "", bool bShow = True)
	float XpRate = XPConfig.SXPGeneral[0] * fPlayerLevelBonus
	
	float fXP = f * XpRate
	fXP += CalcRestPoint( fXP )
	if fXP as Int == 0
		return
	endif
	GainXP(fXP)
	
	if SXPToggle[57] && Msg != ""
		if IsLessIntrusiveHUDInstalled
			zzzSXPDummyNote.SetName(Msg)
			zzzSXPNotificationMessage.Show(fXP)
		else
			((Self as Form) as UILIB_1).ShowNotification("$XPGainMessage{" + Msg + "}{ " + fXP as int + "}", SXPNotificationColorString)
		endif
	endif
EndFunction

Function GainXPMessage(int Index, float f, string Msg = "", bool bShow = True)
	float XpRate = XPConfig.SXPGeneral[0]
	if Index == 55
		XpRate *= (XPConfig.SXPGeneral[2])
	else
		XpRate *= (XPConfig.SXPGeneral[1]) * fPlayerLevelBonus
	endif
	
	float fXP = f
	if Index == 100
		Index = 55
	else
		fXP = f * XpRate
		fXP += CalcRestPoint( fXP )
	endif
	if fXP as int == 0
		return
	endif
	GainXP(fXP)
	
	if Msg == ""
		Msg = SXPMessageNotification[Index]
	endif
	if SXPToggle[Index] && Msg != ""
		if IsLessIntrusiveHUDInstalled
			zzzSXPDummyNote.SetName(Msg)
			zzzSXPNotificationMessage.Show(fXP)
		else
			((Self as Form) as UILIB_1).ShowNotification("$XPGainMessage{" + Msg + "}{ " + fXP as int + "}", SXPNotificationColorString)
		endif
	endif
EndFunction

Function DevilsTradeGainXPMessage(float f)
	string Msg = SXPMessageNotification[55]
	
	GainXP(f)
	if SXPToggle[57]
		if Msg != ""
			if IsLessIntrusiveHUDInstalled
				zzzSXPDummyNote.SetName(Msg)
				zzzSXPNotificationMessage.Show(f)
			else
				((Self as Form) as UILIB_1).ShowNotification("$XPGainMessage{" + Msg + "}{ " + f as int + "}", SXPNotificationColorString)
			endif
		endif
	endif
EndFunction

State Empty
EndState

State Counting
Event OnBeginState()
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
	if fPrevStealRecord == fStealRecord
		GainXPMessage(51, fStealRecord)
		GoToState("Empty")
	else
		fPrevStealRecord = fStealRecord
		RegisterForSingleUpdate(1.0)
	endif
EndEvent

Event OnEndState()
	UnregisterForUpdate()
	fStealRecord = 0.0
	fPrevStealRecord = 0.0
EndEvent
EndState

Function IncreaseStealRecord(float f)
	fStealRecord += f
	if GetState() != "Counting"
		GoToState("Counting")
	endif
EndFunction

Function GainXP( float f_exp )
	GV_XP.Mod( f_exp )
EndFunction

Function UseXP( float f_exp )
	if ( f_exp < 0.0 )
		return
	endif
	float f_rev = f_exp * -1.0
	GV_XP.Mod( f_rev )
	GV_StoredXP += f_exp
EndFunction

bool Function GetLessIntrusiveHUDInstalled()
	if Game.GetModByName("LessIntrusiveHUD.esp") != 255
		return True
	else
		return False
	endif
EndFunction