Scriptname ORD_OtherDualCastSources_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Des_OtherDualCastSources_Global_DualCastFlag Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Des_OtherDualCastSources_Global_DualCastFlag.Mod(1.0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Des_OtherDualCastSources_Global_DualCastFlag.Mod(-1.0)

EndEvent

; -----