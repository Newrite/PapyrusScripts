Scriptname ORD_NaturalMagic_Power_Script extends activemagiceffect  

; -----

FormList Property ORD_Alt_NaturalMagic_FormList Auto
ImagespaceModifier Property ORD_Imod Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell TheSpell = ORD_Alt_NaturalMagic_FormList.GetAt(0) as Spell
	If TheSpell
		TheSpell.Cast(akTarget)
		ORD_Imod.Apply()
	Else
		Debug.Trace("ORDINATOR DEBUG: Natural Magic Power does not have a Spell!",1)
	EndIf

EndEvent

; -----