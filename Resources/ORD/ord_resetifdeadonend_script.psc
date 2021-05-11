Scriptname ORD_ResetIfDeadOnEnd_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget.IsDead()
		akCaster.DispelSpell(ORD_Spell)
	EndIf

EndEvent

; -----