Scriptname ORD_ThePowerIsMine2_Script extends activemagiceffect  

; -----

Quest Property ORD_ThePowerIsMine_Quest Auto
Float Property ORD_DispelTimer Auto
Sound Property ORD_Des_ThePowerIsMine_Marker_Activate Auto
Spell Property ORD_Des_ThePowerIsMine_Spell_Bomb Auto
Float Property ORD_BombDelay Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_ThePowerIsMine_Quest.Start()
	ORD_Des_ThePowerIsMine_Marker_Activate.Play(akTarget)
	RegisterForSingleUpdate(ORD_DispelTimer)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(ORD_BombDelay)
	ORD_Des_ThePowerIsMine_Spell_Bomb.Cast(akCaster)

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----