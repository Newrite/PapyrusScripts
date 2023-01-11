Scriptname POT_NetherLichFXScript extends activemagiceffect  

;======================================================

Actor Property PlayerRef Auto

Float Property AlphaValue auto

Explosion Property FXDragonPriestSmallExplosion Auto
Explosion Property MGEyeRemoveExplosion Auto

Idle Property BleedOutStart Auto
Idle Property BleedOutStop Auto

Sound Property MAGRestorationTurnUndeadFire2D Auto

VisualEffect Property FXWispAttachEffect Auto

;======================================================

Event OnEffectStart(Actor Target, Actor Caster)
	PlayerRef.PlaceAtMe(FXDragonPriestSmallExplosion)
       PlayerRef.SetAlpha(AlphaValue)
        FXWispAttachEffect.Play(PlayerRef)
	imageSpaceModifier.removeCrossFade()
EndEvent

;======================================================

Event OnEffectFinish(Actor Target, Actor Caster)
       Game.DisablePlayerControls()
       PlayerRef.PlaceAtMe(MGEyeRemoveExplosion)
       FXWispAttachEffect.Stop(PlayerRef)
       MAGRestorationTurnUndeadFire2D.Play(PlayerRef)
       Utility.Wait(2.0)
       PlayerRef.SetAlpha(1.0)
       imageSpaceModifier.removeCrossFade()
       Game.EnablePlayerControls()
EndEvent

