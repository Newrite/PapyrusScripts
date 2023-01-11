Scriptname POT_LichTransformationFXScript extends ActiveMagicEffect  

Idle Property BleedoutStart Auto
Idle Property BleedoutStop Auto
Actor Property PlayerRef Auto
EffectShader Property DragonrendFXS03 Auto
Explosion Property TurnUndeadMassExplosion Auto
Sound Property MAGRestorationTurnUndeadFire2D Auto
Sound Property NPCDragonPriestCoffinAppearxxxxxxxx Auto

;----------------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)
       PlayerRef.PlayIdle(BleedOutStart)
	Game.ShakeCamera(afStrength = 0.75, afDuration = 7)
	Game.DisablePlayerControls()
       PlayerRef.PlaceAtMe(TurnUndeadMassExplosion)
       MAGRestorationTurnUndeadFire2D.Play(PlayerRef)
       Utility.Wait(1.0)
       DragonrendFXS03.play(PlayerRef)
	Utility.Wait(2.0)
       NPCDragonPriestCoffinAppearxxxxxxxx.Play(PlayerRef)
	imageSpaceModifier.removeCrossFade()
	Utility.Wait(1.0)
	PlayerRef.PlayIdle(BleedOutStop)
	Utility.Wait(1.0)
	DragonrendFXS03.stop(PlayerRef)
       Game.EnablePlayerControls()
EndEvent