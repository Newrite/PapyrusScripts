Scriptname ORD_SpreadBlessings_Script extends activemagiceffect  

; -----

Keyword Property MagicBlessing Auto
FormList Property ORD_Res_Evangelist_FormList Auto
Spell Property ORD_Res_Evangelist_Spell_Proc Auto
Float Property ORD_Delay Auto
Float Property ORD_Delay2 Auto
Actor Property PlayerRef Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akSource.HasKeyword(MagicBlessing)
		If (akSource as Spell)
			ORD_Res_Evangelist_FormList.Revert()
			ORD_Res_Evangelist_FormList.AddForm(akSource)
			Utility.Wait(ORD_Delay)
			ORD_Res_Evangelist_Spell_Proc.Cast(PlayerRef)
			Utility.Wait(ORD_Delay2)
			ORD_Res_Evangelist_FormList.Revert()
		EndIf
	EndIf

EndEvent

; -----