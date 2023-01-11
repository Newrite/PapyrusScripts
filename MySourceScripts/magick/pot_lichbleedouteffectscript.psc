Scriptname POT_LichBleedoutEffectScript extends ActiveMagicEffect  

Idle Property BleedOutStart Auto
Idle Property BleedOutStop Auto
Actor Property PlayerRef Auto

;----------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)
	Game.ForceThirdPerson()
	Game.DisablePlayerControls()
	PlayerRef.PlayIdle(BleedOutStart)
	Utility.Wait(2.0)
	PlayerRef.PlayIdle(BleedOutStop)
	Utility.Wait(1.5)

; Take the controls away from the evil TX12001 and give them back to the player.
      Game.EnablePlayerControls()

EndEvent