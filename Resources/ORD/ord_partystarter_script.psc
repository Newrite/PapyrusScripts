Scriptname ORD_Partystarter_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_Partystarter_Spell_Proc Auto
Activator Property ORD_Sne_Partystarter_Activator Auto
Sound Property DRScBarrelClose Auto
Actor Property PlayerRef Auto
Spell Property ORD_Sne_Partystarter_Spell_RechargeOnSelf Auto

; -----

ObjectReference TheBarrel

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheBarrel = akTarget.PlaceAtMe(ORD_Sne_Partystarter_Activator)
	TheBarrel.SetAngle(Utility.RandomFloat(-15.0, 15.0), Utility.RandomFloat(-15.0, 15.0), Utility.RandomFloat(-180.0,180.0))
	DRScBarrelClose.Play(TheBarrel)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

;	If akTarget.IsSneaking()
		ORD_Sne_Partystarter_Spell_Proc.RemoteCast(TheBarrel, PlayerRef)
		TheBarrel.Disable()
;	Else
;		TheBarrel.Disable(true)
;	EndIf
	ORD_Sne_Partystarter_Spell_RechargeOnSelf.Cast(PlayerRef)
	TheBarrel.Delete()

EndEvent

; -----