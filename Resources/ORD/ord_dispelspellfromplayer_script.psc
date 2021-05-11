Scriptname ORD_DispelSpellFromPlayer_Script extends activemagiceffect  

; -----

Float Property ORD_Wait Auto
Spell Property ORD_Spell Auto
Actor Property PlayerRef Auto
MagicEffect Property ORD_Effect Auto
Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Wait
		Utility.Wait(ORD_Wait)
	EndIf
	If PlayerRef.HasMagicEffect(ORD_Effect)
		ORD_Sound.Play(akTarget)
		PlayerRef.DispelSpell(ORD_Spell)
	EndIf

EndEvent

; -----