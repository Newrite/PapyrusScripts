Scriptname ORD_NaturalMagic_Unlearn_Script extends activemagiceffect  

; -----

FormList Property ORD_Alt_NaturalMagic_FormList Auto
Float Property ORD_UpdateRate Auto
Actor Property PlayerRef Auto
Message Property ORD_Alt_NaturalMagic_Message_Unlearn Auto
Spell Property ORD_Alt_NaturalMagic_Spell_Power_Learn Auto
Message Property ORD_Alt_NaturalMagic_Message_Relearn Auto
Spell Property ORD_Alt_NaturalMagic_Spell_Power_Cast Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.AddSpell(ORD_Alt_NaturalMagic_Spell_Power_Learn,false)
	OnUpdate()

EndEvent

; -----

Event OnUpdate()

	If ORD_Alt_NaturalMagic_FormList.GetSize() > 0
		Spell TheSpell = ORD_Alt_NaturalMagic_FormList.GetAt(0) as Spell
		If PlayerRef.HasSpell(TheSpell)
			PlayerRef.UnequipSpell(TheSpell,0)
			PlayerRef.UnequipSpell(TheSpell,1)
			PlayerRef.RemoveSpell(TheSpell)
	;		ORD_Alt_NaturalMagic_Message_Unlearn.Show()
		EndIf
	EndIf
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	UnregisterForUpdate()	;bugfix

	PlayerRef.RemoveSpell(ORD_Alt_NaturalMagic_Spell_Power_Learn)
	PlayerRef.RemoveSpell(ORD_Alt_NaturalMagic_Spell_Power_Cast)
	If ORD_Alt_NaturalMagic_FormList.GetSize() > 0
		Spell TheSpell = ORD_Alt_NaturalMagic_FormList.GetAt(0) as Spell
		If PlayerRef.HasSpell(TheSpell)
			PlayerRef.AddSpell(TheSpell,false)
			ORD_Alt_NaturalMagic_Message_Relearn.Show()
		EndIf
	EndIf
	ORD_Alt_NaturalMagic_FormList.Revert()

EndEvent

; -----