Scriptname ORD_TheDivineWithin_Script extends activemagiceffect  

; -----

Keyword Property MagicBlessing Auto
Message Property ORD_Res_TheDivineWithin_Message Auto
FormList Property ORD_Res_TheDivineWithin_FormList Auto
Spell Property ORD_Res_TheDivineWithin_Spell_AoE Auto
Actor Property PlayerRef Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akSource as Spell) && akSource.HasKeyword(MagicBlessing)
		ORD_Res_TheDivineWithin_FormList.AddForm(akSource)
		ORD_Res_TheDivineWithin_Spell_AoE.Cast(PlayerRef)
	;	ORD_Res_TheDivineWithin_Message.Show()
		Utility.Wait(0.5)
		ORD_Res_TheDivineWithin_FormList.Revert()
	EndIf

EndEvent

; -----