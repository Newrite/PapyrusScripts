Scriptname ORD_ThroneOfNirn_Script extends activemagiceffect  

; -----

Static Property ORD_PillarObject Auto
Float Property ORD_PillarTall = 192.0 Auto
Explosion Property ORD_Alt_ThroneOfNirn_Explosion Auto
Float Property ORD_Delay Auto
Spell Property ORD_Alt_ThroneOfNirn_Spell_Ab_Pillar Auto

; -----

ObjectReference ThePillar

; -----

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.RemoveSpell(ORD_Alt_ThroneOfNirn_Spell_Ab_Pillar)
	If ThePillar != NONE
		ThePillar.Disable(true)
		ThePillar.Delete()
	EndIf

EndEvent

; -----

Event OnUpdate()

	Actor TheTarget = GetTargetActor()
	TheTarget.AddSpell(ORD_Alt_ThroneOfNirn_Spell_Ab_Pillar,false)
	ThePillar = TheTarget.PlaceAtMe(ORD_PillarObject, abInitiallyDisabled = true)
	ThePillar.SetScale(0.33)
	ThePillar.SetAngle(0,0,Utility.RandomFloat(-180.0,180.0))
	ThePillar.Enable()
	;TheTarget.MoveTo(TheTarget, 0, 0, ORD_PillarTall)
	TheTarget.MoveTo(TheTarget, 0, 0, 256)

	ThePillar.PlaceAtMe(ORD_Alt_ThroneOfNirn_Explosion)
	TheTarget.RampRumble(0.3, 1.0, 1800)

EndEvent

; -----

; -----