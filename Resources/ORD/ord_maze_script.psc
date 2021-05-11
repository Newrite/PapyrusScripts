Scriptname ORD_Maze_Script extends ActiveMagicEffect  

; -----

Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetGhost(true)
	If akTarget != PlayerRef
		akTarget.EnableAI(false)
	Else
		Utility.Wait(0.1)
		akTarget.SetDontMove(true)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.SetGhost(false)
	If akTarget != PlayerRef
		akTarget.EnableAI()
	Else
		akTarget.SetDontMove(false)
	EndIf

EndEvent

; -----