Scriptname ORD_FrozenTomb_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Spell Property ORD_Des_FrozenTomb_Spell_Proc Auto

; -----

ObjectReference TheBox
Bool Fail = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akTarget.IsDead() == false)
		Fail = false
		TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
		TheBox.MoveTo(akTarget, 0, 0, 32)
		akTarget.EnableAI(false)
		akTarget.StartDeferredKill()
		akTarget.SetRestrained(true)
		Utility.Wait(0.2)
		ORD_Des_FrozenTomb_Spell_Proc.Cast(akCaster)
	Else
		Fail = true
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !Fail
		akTarget.EnableAI(true)
		akTarget.SetRestrained(false)
		akTarget.MoveTo(TheBox)
		akTarget.EndDeferredKill()
		If akTarget.IsDead()
			akCaster.DispelSpell(ORD_Des_FrozenTomb_Spell_Proc)
		Else
			akCaster.PushActorAway(akTarget, 1)
		EndIf
		TheBox.Disable()
	EndIf

EndEvent

; -----

Event OnDeath(Actor akKiller)

	RegisterForSingleUpdate(2.0)

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----