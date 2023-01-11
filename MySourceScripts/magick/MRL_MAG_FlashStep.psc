Scriptname MRL_MAG_FlashStep extends activemagiceffect  

Sound Property ShockSound auto

Activator Property EmptyActivator Auto

Spell Property Invis Auto

ImageSpaceModifier Property Imod Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Objectreference Box = akTarget.PlaceAtMe(EmptyActivator)

	Box.MoveTo(akTarget, -120.0 * Math.Sin(akTarget.GetAngleZ()), -120.0 * Math.Cos(akTarget.GetAngleZ()), akTarget.GetHeight() - 25)

	Imod.Apply()
	ShockSound.Play(akCaster)

	akCaster.TranslateToRef(Box, 5000)

	If !akCaster.IsDetectedBy(aktarget)
		Invis.Cast(akCaster, akCaster)
	endif

	Box.Delete()
	Utility.WaitMenuMode(0.5)
	Imod.Remove()
	
endEvent
