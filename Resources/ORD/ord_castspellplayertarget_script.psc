Scriptname ORD_CastSpellPlayerTarget_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto
Actor Property PlayerRef Auto
Message Property ORD_Message Auto
ImagespaceModifier Property ORD_Imod Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.DoCombatSpellApply(ORD_Spell, akTarget)
	If ORD_Message
		ORD_Message.Show()
	EndIf
	If ORD_Imod
		ORD_Imod.Apply()
	EndIf

EndEvent

; -----