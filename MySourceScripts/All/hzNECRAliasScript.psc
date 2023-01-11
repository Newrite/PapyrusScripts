Scriptname hzNECRAliasScript extends ReferenceAlias

Actor Property PlayerRef Auto

Ammo Property hzNECRDummyArrow Auto

GlobalVariable Property hzNECRBoltLoaded Auto
GlobalVariable Property hzNECRAutoReload Auto
GlobalVariable Property hzNECRStaminaMult Auto

MagicEffect Property hzNECRStaminaPerkME Auto

Message Property hzNECRInitMsg Auto
Message Property hzNECRInitDelayedMsg Auto
Message Property hzNECRRaceSwitchMsgBox Auto

Spell Property hzNECRStaminaDrainSpell Auto

Ammo LastAmmo

Bool bSKSE

;--INIT STATE--

Event OnInit()
	if PlayerRef.GetEquippedItemType(0) == 12
		GoToState("Main")
	else
		hzNECRInitDelayedMsg.Show()
	endif
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Weapon && PlayerRef.GetEquippedItemType(0) == 12
		GoToState("Main")
	endif
EndEvent

;--MAIN STATE--

State Main
	Event OnBeginState()
		Utility.Wait(0.1)
		PlayerRef.AddItem(hzNECRDummyArrow, 1, 1)
		Utility.Wait(0.5)
		PlayerRef.EquipItem(hzNECRDummyArrow, 0, 1)
		Utility.Wait(0.5)
		PlayerRef.RemoveItem(hzNECRDummyArrow, 1, 1)

		RegisterForAnimationEvent(PlayerRef, "arrowRelease")
		RegisterForAnimationEvent(PlayerRef, "reload")
		RegisterForAnimationEvent(PlayerRef, "ReloadFast")
		RegisterForAnimationEvent(PlayerRef, "reloadStop")
		RegisterForAnimationEvent(PlayerRef, "arrowAttach")
		RegisterForAnimationEvent(PlayerRef, "WeapEquip_Out")

		SKSECheck()
		hzNECRInitMsg.Show()
	EndEvent

	Event OnRaceSwitchComplete()
		Utility.Wait(0.1)
		UnRegisterForAnimationEvent(PlayerRef, "arrowRelease")
		UnRegisterForAnimationEvent(PlayerRef, "reload")
		UnRegisterForAnimationEvent(PlayerRef, "ReloadFast")
		UnRegisterForAnimationEvent(PlayerRef, "reloadStop")
		UnRegisterForAnimationEvent(PlayerRef, "arrowAttach")
		UnRegisterForAnimationEvent(PlayerRef, "WeapEquip_Out")

		Utility.Wait(0.1)
		RegisterForAnimationEvent(PlayerRef, "arrowRelease")
		RegisterForAnimationEvent(PlayerRef, "reload")
		RegisterForAnimationEvent(PlayerRef, "ReloadFast")
		RegisterForAnimationEvent(PlayerRef, "reloadStop")
		RegisterForAnimationEvent(PlayerRef, "arrowAttach")
		RegisterForAnimationEvent(PlayerRef, "WeapEquip_Out")

		if PlayerRef.GetAnimationVariableInt("i1stPerson") == 1
			hzNECRRaceSwitchMsgBox.Show()
		endif
	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if PlayerRef.GetEquippedItemType(0) == 12
			if PlayerRef.GetAnimationVariableBool("IsEquipping")
				if asEventName == "arrowAttach" && ReloadCondition()
					PlayerRef.UnequipItem(LastAmmo, 0, 1)
					Utility.Wait(0.01)
					PlayerRef.EquipItem(LastAmmo, 0, 1)
				elseif asEventName == "WeapEquip_Out"
					AutoReload()
				endif
			else
				if hzNECRBoltLoaded.GetValueInt() != 0 && asEventName == "arrowRelease"
					hzNECRBoltLoaded.SetValueInt(0)
					Debug.SendAnimationEvent(PlayerRef, "attackStop")
					AutoReload()
;					debug.messagebox("shot")
				elseif asEventName == "reload" || asEventName == "ReloadFast"
					hzNECRBoltLoaded.SetValueInt(0)
					if bSKSE
						hzNECRStaminaDrainSpell.SetNthEffectMagnitude(0, StaminaCost())
					endif
					hzNECRStaminaDrainSpell.Cast(PlayerRef, PlayerRef)
;					debug.messagebox("reload start")
				elseif asEventName == "reloadStop"
					hzNECRBoltLoaded.SetValueInt(1)
					PlayerRef.DispelSpell(hzNECRStaminaDrainSpell)
;					debug.messagebox("reloaded")
				endif 
			endif
		endif
	EndEvent 

	Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
		if akBaseObject as Ammo
			LastAmmo = akBaseObject as Ammo
		endif
	EndEvent

	Event OnObjectUnEquipped(Form akBaseObject, ObjectReference akReference)
		if akBaseObject as Weapon
			PlayerRef.DispelSpell(hzNECRStaminaDrainSpell)
		endif
	EndEvent

	Event OnPlayerLoadGame()
		SKSECheck()
		if ReloadCondition()
			Debug.SendAnimationEvent(PlayerRef, "reloadStart")	
		endif
	EndEvent
EndState

;--FUNCTIONS--

Function SKSECheck()
	bSKSE = False
	if SKSE.GetVersion()
		bSKSE = True
	endif
EndFunction

Function AutoReload()
	if hzNECRAutoReload.GetValueInt() == 1 && ReloadCondition()
		Utility.Wait(0.25)
		Debug.SendAnimationEvent(PlayerRef, "reloadStart")
	endif
EndFunction

float Function StaminaCost()
	Float fStaminaCost = PlayerRef.GetEquippedWeapon().GetWeight()
	if PlayerRef.HasMagicEffect(hzNECRStaminaPerkME)
		fStaminaCost = fStaminaCost*0.7
	endif

	Int iSkill = PlayerRef.GetAv("Marksman") as Int
	if iSkill > 100
		iSkill = 100
	endif
	fStaminaCost = (fStaminaCost - ((fStaminaCost/200)*iSkill))*hzNECRStaminaMult.GetValue()
;	debug.notification("Stamina cost is "+ fStaminaCost +"")
	return fStaminaCost
EndFunction

bool Function ReloadCondition()
	if hzNECRBoltLoaded.GetValueInt() == 0 && PlayerRef.GetEquippedItemType(0) == 12 && PlayerRef.IsEquipped(LastAmmo)
		return True
	else
		return False
	endif
EndFunction
