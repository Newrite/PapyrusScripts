Scriptname ORD_CastAfterDelay_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto
Float Property ORD_Delay Auto
Bool Property ORD_DispelAfter Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	ORD_Spell.Cast(GetTargetActor())

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If ORD_DispelAfter
		akTarget.DispelSpell(ORD_Spell)
	EndIf

EndEvent

; -----