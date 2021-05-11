Scriptname ORD_BoneCollector_Ab_Script extends activemagiceffect  

; -----

Quest Property ORD_BoneCollector_Quest Auto
Float Property ORD_WaitBeforeStart Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_WaitBeforeStart)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_BoneCollector_Quest.SetStage(200)

EndEvent

; -----

Event OnUpdate()

	ORD_BoneCollector_Quest.SetStage(20)

EndEvent

; -----