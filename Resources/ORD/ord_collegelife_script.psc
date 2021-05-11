Scriptname ORD_CollegeLife_Script extends ActiveMagicEffect  

; -----

Int Property ORD_DelayMin Auto
Int Property ORD_DelayMax Auto
Message Property ORD_Alt_CollegeLife_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdateGameTime(Utility.RandomInt(ORD_DelayMin, ORD_DelayMax))

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

EndEvent

; -----

Event OnUpdateGameTime()

	ORD_Alt_CollegeLife_Message.Show()
	Game.GetPlayer().ModAV("AlterationPowerMod", 1.0)
	RegisterForSingleUpdateGameTime(Utility.RandomInt(ORD_DelayMin, ORD_DelayMax))

EndEvent

; -----