scriptName J3XCrossbowSemiEffectScript extends ActiveMagicEffect

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
	
	;RegisterForAnimationEvent(myTarget, "AttackRelease")
	
	clip = clipSize - 1
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	UnregisterForAnimationEvent (myTarget, "BowRelease")
	UnregisterForAnimationEvent (myTarget, "bowDrawn")
	UnregisterForAnimationEvent (myTarget, "AttackStop")
	
	;UnregisterForAnimationEvent (myTarget, "AttackRelease")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	gotostate("reload")
	if (akSource == myTarget)
		if asEventName == "bowDrawn"
	;	if asEventName == "AttackRelease"
			if clip > 0
				Debug.SendAnimationEvent(myTarget, "attackStop")
				myWeapon.fire(myTarget)
				clip = clip - 1
			else
				clip = clipSize - 1
				Debug.SendAnimationEvent(myTarget, "AttackRelease")
			endif
		endif
	endif
	gotostate("")
endEvent

; Mutex lock
state reload
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	endEvent
endstate
