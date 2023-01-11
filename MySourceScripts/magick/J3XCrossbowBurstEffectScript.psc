scriptName J3XCrossbowBurstEffectScript extends ActiveMagicEffect

actor myTarget
weapon myWeapon

int property clipSize auto ; Nr of bursts
int clip

int property burstSize auto
int burstClipSize

;float property lastFireDelay auto ; Delay between last bolt and taking down the weapon.

float property firingSpeed auto

Event OnEffectStart(Actor Target, Actor Caster)
	myTarget = Target
	myWeapon = myTarget.GetEquippedWeapon()
	;debug.notification("equipped")
	RegisterForAnimationEvent(myTarget, "BowRelease")
	RegisterForAnimationEvent(myTarget, "bowDrawn")
	RegisterForAnimationEvent(myTarget, "AttackStop")
	clip  = clipsize - 1
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	;debug.notification("OnUnequipped")
	UnregisterForAnimationEvent (myTarget, "BowRelease")
	UnregisterForAnimationEvent (myTarget, "bowDrawn")
	UnregisterForAnimationEvent (myTarget, "AttackStop")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.notification(asEventName)
	if (akSource == myTarget)
		if asEventName == "bowDrawn"
			; Debug.SendAnimationEvent(myTarget, "attackStop")
			myWeapon.fire(myTarget)
			
			burstClipSize = burstClipSize
			RegisterForSingleUpdate(firingSpeed)
			gotostate("firing")
		else
			;debug.notification("OnAnimationEvent - other")
			burstClipSize = burstSize
			gotostate("")
		endif
	endif
endEvent



Event OnUpdate()
EndEvent

state firing
	Event OnUpdate() ; This event occurs every five seconds
		if burstClipSize > 0 && clip > 1 || burstClipSize > 1
			myWeapon.fire(myTarget)
		;	Debug.SendAnimationEvent(myTarget, "AttackStart")
			burstClipSize = burstClipSize - 1
			RegisterForSingleUpdate(firingSpeed)
		else
			burstClipSize = burstSize
			if clip > 0
				Debug.SendAnimationEvent(myTarget, "AttackStop")
				clip = clip - 1
			else
				Debug.SendAnimationEvent(myTarget, "AttackRelease")
				clip  = clipsize - 1
			endif
		endif
	EndEvent
	
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.notification(asEventName)
	if (akSource == myTarget)
		if asEventName != "bowDrawn"
			burstClipSize = burstSize
			gotostate("")
		endif
	endif
endEvent
endstate
