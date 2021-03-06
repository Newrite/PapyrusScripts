Scriptname dunLabyrinthianElementalDoor extends ObjectReference  

import Utility

EffectShader Property FrostIceFormFXShader02  Auto  
keyword property magicDamageFire auto
explosion property crExplosionFrostSM auto

EVENT onLoad()
	FrostIceFormFXShader02.play(self)
	gotostate("active")
endEVENT

STATE active
	EVENT OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		if akEffect.hasKeyword(magicDamageFire) == TRUE
			gotoState("inactive")
			wait(0.1)
			placeAtMe(crExplosionFrostSM)
			getLinkedRef().disable(true)
			wait(0.15)
			FrostIceFormFXShader02.stop(self)	
			playAnimation("Open")
		endif
	endEVENT
endSTATE

STATE inactive
	;  nothing here
endSTATE
