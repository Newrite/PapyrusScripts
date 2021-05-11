Scriptname ORD_HawksPerch_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRateSpan Auto
Spell Property ORD_Arc_HawksPerch_Spell_Proc Auto
Message Property ORD_Arc_HawksPerch_Message Auto
Actor PRoperty PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; user is standing still
	RegisterForSingleUpdate(ORD_UpdateRateSpan)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Arc_HawksPerch_Spell_Proc)

EndEvent

; -----

Event OnUpdate()

	Actor TargetActor = GetTargetActor()
	ORD_Arc_HawksPerch_Spell_Proc.Cast(TargetActor)
	If TargetActor == PlayerRef
		ORD_Arc_HawksPerch_Message.Show()
	EndIf

EndEvent

; -----