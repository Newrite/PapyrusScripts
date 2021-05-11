Scriptname ORD_ToggleAb_Script extends activemagiceffect  

; -----

Spell Property ORD_AbilityToToggle Auto

Message Property ORD_AbilityTurnedOff_Message Auto
Message Property ORD_AbilityTurnedOn_Message Auto
ImagespaceModifier Property ORD_Imod Auto
Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.HasSpell(ORD_AbilityToToggle)
		akTarget.RemoveSpell(ORD_AbilityToToggle)
		ORD_AbilityTurnedOff_Message.Show()
		ORD_Imod.Apply()
		ORD_Sound.Play(akTarget)
	Else
		akTarget.AddSpell(ORD_AbilityToToggle, false)
		ORD_AbilityTurnedOn_Message.Show()
		ORD_Imod.Apply()
		ORD_Sound.Play(akTarget)
	EndIf

EndEvent

; -----