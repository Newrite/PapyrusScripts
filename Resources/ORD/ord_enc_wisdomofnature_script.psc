Scriptname ORD_Enc_WisdomOfNature_Script extends activemagiceffect  

; -----

Faction Property KynesPeaceFaction Auto
MagicEffect Property MQpathToHHShrineEffect Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddToFaction(KynesPeaceFaction)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !akTarget.HasMagicEffect(MQpathToHHShrineEffect)
		akTarget.RemoveFromFaction(KynesPeaceFaction)
	EndIf

EndEvent

; -----