Scriptname HH_Press_button extends Quest  

GlobalVariable Property HH_Key Auto

int blockKeyCode = 45	

Actor Property PlayerRef  Auto

Spell Property HH_CD_SPEll_for_condition  Auto

Spell Property HH_CD_SPEll_for_weapon_equiep  Auto

Spell Property HH_Throw_Exmple  Auto

Spell Property HH_1_CD_Right_hand  Auto 

KeyWord Property HH_KW_FOR_Conditions Auto

KeyWord Property HH_KW_ON_CD Auto

KeyWord Property HH_TW Auto

KeyWord Property HH_KW_CD_Right_Hand Auto 

FormList Property HH_Form_weapon Auto

FormList Property HH_Form_spell Auto

FormList Property HH_Form_Misc Auto

spell Throw_Spell

MiscObject Misc_Throw

Function InitializeMod()
								;Debug.Notification("Initialization started")
	RegisterForKey(blockKeyCode)
      RegisterForKey(1)
								;Debug.Notification("BlockKeyCode Registered")
	RegisterForControl("Right Attack/Block")
								;Debug.Notification("Right Attack/Block registered")
      setBlockKeyCode()
EndFunction

Function setBlockKeyCode()
								;Debug.Notification("setBlockKeyCode started")
	UnregisterForKey(blockKeyCode)
								;Debug.Notification("unregistered previous key")
	if HH_Key.GetValueInt()!=0
       blockKeyCode = HH_Key.GetValueInt()
	RegisterForKey(blockKeyCode)
      endif
								;Debug.Notification("registered new key")
	RegisterForAnimationEvent(playerRef, "SoundPlay.NPCHumanCombatTorchBash")
EndFunction

Event OnKeyDown(Int KeyCode)
	if !(playerRef.HasMagicEffectWithKeyword(HH_KW_ON_CD))
		if KeyCode==1
			setBlockKeyCode()
		endif
			if KeyCode==blockKeyCode
				self.GotoState("Busy")
				HH_CD_SPEll_for_condition.cast(playerRef, playerRef)
				;Debug.Notification("Правильный кейкод")
				self.GotoState("")
			endif
	endif
EndEvent

Event OnKeyUp(Int KeyCode, Float HoldTime)
 if KeyCode==blockKeyCode&&HoldTime>=1.5
	HH_CD_SPEll_for_weapon_equiep.cast(playerRef, playerRef)
	RegisterForAnimationEvent(playerRef, "SoundPlay.NPCHumanCombatTorchBash")
 endif
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
if !(playerRef.HasMagicEffectWithKeyword(HH_KW_CD_Right_Hand))
	if asEventName == "SoundPlay.NPCHumanCombatTorchBash"
		;debug.Notification(asEventName)
		weapon WeaponR = PlayerRef.GetEquippedWeapon(false)
		if WeaponR.HasKeyword(HH_TW)
			;debug.Notification("Throw")
			int i = HH_Form_weapon.Find(WeaponR)
			if i > -1
				Throw_Spell = HH_Form_spell.GetAt(i) as spell
				Misc_Throw = HH_Form_Misc.GetAt(i) as MiscObject 
				if PlayerRef.GetItemCount(Misc_Throw) > 0
					Throw_Spell.cast(PlayerRef)
					HH_1_CD_Right_hand.cast(PlayerRef)
					PlayerRef.RemoveItem(Misc_Throw, 1)
				else
					Throw_Spell.cast(PlayerRef)
					HH_1_CD_Right_hand.cast(PlayerRef)
					PlayerRef.RemoveItem(WeaponR, 1)
				endif
			endif
		endif
	endif
endif
EndEvent

state busy
Event OnKeyDown(Int KeyCode)
;		Debug.Notification("Занят в стет")
	;Empty function;
EndEvent

Event OnKeyUp(Int KeyCode, Float HoldTime)
;Empty function
;Debug.Notification("Занят в стет")
EndEvent
endState