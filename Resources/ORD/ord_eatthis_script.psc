Scriptname ORD_EatThis_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Explosion Property ORD_Des_EatThis_Explosion Auto
Spell Property ORD_Des_EatThis_Spell_Proc Auto
Float Property ORD_DamageFraction Auto
String Property ORD_ResistType Auto
Float Property ORD_BoxZ Auto
Float Property ORD_PushForce Auto
String Property ORD_DrainType Auto
Float Property ORD_Cap Auto
Float Property ORD_MRFudge Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(ORD_Des_EatThis_Explosion)
	ObjectReference TheBox = akCaster.PlaceAtMe(FXEmptyActivator)
	TheBox.MoveTo(akCaster, 0, 0, ORD_BoxZ)
	TheBox.PushActorAway(akTarget, ORD_PushForce)
	ORD_Des_EatThis_Spell_Proc.Cast(akCaster)
	Float DamageDealt = ((akTarget.GetActorValue("Health") * ORD_DamageFraction) * (100 - akTarget.GetActorValue(ORD_ResistType))) / 100
	DamageDealt *= ((100 - (akTarget.GetActorValue("MagicResist") + ORD_MRFudge)) / 100)
	If DamageDealt > 0
		If DamageDealt < ORD_Cap
			akTarget.DamageActorValue(ORD_DrainType, DamageDealt)
		Else
			akTarget.DamageActorValue(ORD_DrainType, ORD_Cap)
		EndIf
	EndIf
	TheBox.Delete()

EndEvent

; -----