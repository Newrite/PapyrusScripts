Scriptname ORD_DreamCharm_Script extends activemagiceffect  

; -----

Message Property ORD_Ill_DreamCharm_Message_Success Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetRelationshipRank(akCaster,3)
	ORD_Ill_DreamCharm_Message_Success.Show()
	Utility.Wait(3.0)
	Dispel()

EndEvent

; -----