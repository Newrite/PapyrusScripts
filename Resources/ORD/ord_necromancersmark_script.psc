Scriptname ORD_NecromancersMark_Script extends activemagiceffect  

; -----

Float Property ORD_Damage Auto
Float Property ORD_HP Auto
Message Property ORD_Con_BrandOfTheNecromancer_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.ModActorValue("AttackDamageMult", ORD_Damage)
	akTarget.ModActorValue("Health", ORD_HP)
	akTarget.ModActorValue("ConjurationPowerMod", 1337)
	ORD_Con_BrandOfTheNecromancer_Message.Show()

EndEvent

; -----