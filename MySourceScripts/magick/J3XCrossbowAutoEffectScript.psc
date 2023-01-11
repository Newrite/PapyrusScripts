scriptName J3XCrossbowAutoEffectScript extends ActiveMagicEffect

actor myTarget
weapon myWeapon

int property clipSize auto
int clip

float property firingSpeed auto

Event OnEffectStart(Actor Target, Actor Caster)
	myTarget = Target
	myWeapon = myTarget.GetEquippedWeapon()
	RegisterForAnimationEvent(myTarget, "BowRelease")
	RegisterForAnimationEvent(myTarget, "bowDrawn")
	RegisterForAnimationEvent(myTarget, "AttackStop")
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	UnregisterForAnimationEvent (myTarget, "BowRelease")
	UnregisterForAnimationEvent (myTarget, "bowDrawn")
	UnregisterForAnimationEvent (myTarget, "AttackStop")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == myTarget)
		if asEventName == "bowDrawn"
			clip = clipSize
			RegisterForSingleUpdate(firingSpeed)
			gotostate("firing")
		else
			gotostate("")
		endif
	endif
endEvent

Event OnUpdate()
EndEvent

state firing
	Event OnUpdate() ; This event occurs every five seconds
		if clip > 0
			myWeapon.fire(myTarget)
			clip = clip - 1
			RegisterForSingleUpdate(firingSpeed)
		else
			Debug.SendAnimationEvent(myTarget, "AttackRelease")
		endif
	EndEvent
	
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.notification(asEventName)
	if (akSource == myTarget)
		if asEventName != "bowDrawn"
			gotostate("")
		endif
	endif
endEvent
endstate
