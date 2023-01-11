ScriptName zzzSXPHelper Extends Quest Conditional

zzzSXPConfig Property XPConfig Auto
zzzSXPController Property XPC Auto
Actor Property PlayerREF Auto
ReferenceAlias Property PrayFurniture Auto
Message Property zzzSXPRestedNotificationMessage Auto

;Sleep
GlobalVariable Property GV_RestPoint Auto
GlobalVariable Property GV_Werewolf Auto
Spell Property doomLoverAbility Auto
int Property PlayerAIDrivenVariable Auto Hidden Conditional
float _LastSleptHours_ = 0.0
int _LastSleepDate_ = -1


;ActionToGainLevel
int _SleepHours_ = 0
int _LastActionDate_ = -1
bool IsLessIntrusiveHUDInstalled

int Property FurnitureMarkerIndex Auto Hidden
Furniture[] Property FurnitureMarker Auto

ObjectReference _PrayREF
ObjectReference Property PrayREF Hidden
	Function Set(ObjectReference ref)
		if _PrayREF
			_PrayREF.Delete()
		endif
		PrayFurniture.Clear()
		if ref
			PrayFurniture.ForceRefTo(ref)
		endif
		_PrayREF = ref
	EndFunction
	ObjectReference Function Get()
		return _PrayREF
	EndFunction
EndProperty

Function GameInit()
	RegisterForSleep()
	GameReloaded()
EndFunction

Function GameReloaded()
	RegisterForModEvent("SXPStartPray", "OnPrayStart")
	RegisterForModEvent("SXPMiddlePray", "OnPrayMiddle")
	RegisterForModEvent("SXPStopPray", "OnPrayStop")
	IsLessIntrusiveHUDInstalled = GetLessIntrusiveHUDInstalled()
EndFunction

Event OnSleepStart( float start_time, float end_time )
	float delta = (end_time - start_time) * 24.0

	float f_floor = Math.Floor(delta)
	float f_nod = delta - f_floor
	_LastSleptHours_ = f_floor
	if ( f_nod > 0.9 )
		_LastSleptHours_ += 1.0
	endif
	
	_SleepHours_ = Math.Floor(_LastSleptHours_)
EndEvent

Event OnSleepStop( bool abInterrupted )	
	if _SleepHours_ == 0
		return
	endif
	
	float f_MaxRestPoint = XPConfig.SXPGeneral[4]
	
	int i_date = GetDate()
	if ( _LastActionDate_ < i_date )
		_LastActionDate_ = i_date
		if (XPConfig.ShouldGive("Sleep", _SleepHours_, abInterrupted))
			if !abInterrupted
				XPConfig.GivePlayerGainedLevels("Sleep", _SleepHours_)
			endif
		endif
	endif
	
	if ( abInterrupted == True )
		return
	endif
	
	if Game.GetPlayer().HasSpell(doomLoverAbility)
		return
	endif
	
	if ( GV_Werewolf.GetValueInt() != 0 )
		return
	endif
	
	if ( XPConfig.SXPGeneral[6] <= 1.0 )
		return
	endif
	
	if (_LastSleepDate_ >= i_date)
		return
	endif
	_LastSleepDate_ = i_date
	
	float f_rp = _LastSleptHours_ * XPConfig.SXPGeneral[5]
	if ( f_rp < 0.0 )
		f_rp = 0.0
	endif
	
	float f_crp = GV_RestPoint.Mod(f_rp)
	if ( f_crp > f_MaxRestPoint )
		GV_RestPoint.SetValue( f_MaxRestPoint )
	endif
	
	if XPC.SXPToggle[56]
		if IsLessIntrusiveHUDInstalled
			zzzSXPRestedNotificationMessage.Show(GV_RestPoint.GetValue(), f_MaxRestPoint)
		else
			((Self as Form) as UILIB_1).ShowNotification("$RPGainMessage{" + GV_RestPoint.GetValue() as int + "}{" + f_MaxRestPoint as int + "}", XPC.SXPNotificationColorString)
		endif
	endif
EndEvent

Event OnPrayStart(string eventName, string strArg, float numArg, Form sender)
	if eventName == "SXPStartPray"
		if !(XPConfig.ShouldGive("Pray"))
			return
		endif
		
		if PlayerREF.IsInCombat()
			return
		endif
		
		int i_date = GetDate()
		if ( _LastActionDate_ >= i_date )
			string sMessage = "$Leveling_Message_2"
			if IsLessIntrusiveHUDInstalled
				Debug.Notification(sMessage)
			else
				((Self as Form) as UILIB_1).ShowNotification(sMessage, XPC.SXPNotificationColorString)
			endif
			return
		endif
		
		if (PlayerREF.GetSitState() != 0)
			string sMessage = "$Leveling_Message_3"
			if IsLessIntrusiveHUDInstalled
				Debug.Notification(sMessage)
			else
				((Self as Form) as UILIB_1).ShowNotification(sMessage, XPC.SXPNotificationColorString)
			endif
			return
		endif
		
		StartPrayAnimation()
	endif
EndEvent

Event OnPrayMiddle(string eventName, string strArg, float numArg, Form sender)
	if eventName == "SXPMiddlePray"
		_LastActionDate_ = GetDate()
		
		int PrayTime = CalcPrayTime()
		if PrayTime > 0	
			XPConfig.GivePlayerGainedLevels("Pray", PrayTime)
		endif

		PlayerAIDrivenVariable = 2
		PlayerREF.EvaluatePackage()
	endif
EndEvent

Event OnPrayStop(string eventName, string strArg, float numArg, Form sender)
	if eventName == "SXPStopPray"
		if PlayerAIDrivenVariable > 0
			PlayerREF.EvaluatePackage()
			Game.SetPlayerAIDriven(False)
			PlayerAIDrivenVariable = 0
		endif
		if PrayREF != None
			PrayREF = None
		endif
	endif
EndEvent

;;--------------------------------------------------------------------------------;;
;; Utility Function
;;--------------------------------------------------------------------------------;;
int Function GetDate() Global
	return Math.Floor(Utility.GetCurrentGameTime())
EndFunction

bool Function GetLessIntrusiveHUDInstalled()
	if Game.GetModByName("LessIntrusiveHUD.esp") != 255
		return True
	else
		return False
	endif
EndFunction

Function StartPrayAnimation()
	if PlayerREF.IsWeaponDrawn()
		Game.DisablePlayerControls(False, True, False, False, False, False, False, False)
		Game.EnablePlayerControls(False, True, False, False, False, False, False, False)
	endif
	
	PlayerAIDrivenVariable = 1
	PlayerREF.SetRestrained()
	int index = 0
	if FurnitureMarkerIndex == FurnitureMarker.Length
		index = Utility.RandomInt(0, (FurnitureMarkerIndex - 1))
	else
		index = FurnitureMarkerIndex
	endif
	PrayREF = PlayerREF.PlaceAtMe(FurnitureMarker[index])
	Game.SetPlayerAIDriven()
	Game.ForceThirdPerson()
	PlayerREF.SetRestrained(False)
EndFunction

int Function CalcPrayTime()		
	float fStartTime = Utility.GetCurrentGameTime()	
	if (XPConfig.ShouldGive("Pray"))
		int iWaitKey = Input.GetMappedKey("Wait")
		Input.TapKey(iWaitKey)
	endif
	
	Utility.Wait(0.5)
	
	float fStopTime = (Utility.GetCurrentGameTime() - fStartTime) * 24
	return Math.Floor(fStopTime)
EndFunction