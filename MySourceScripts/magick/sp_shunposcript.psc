Scriptname SP_ShunpoScript extends activemagiceffect  
Sound Property Shocksound auto
Activator Property FXEmptyActivator Auto
Spell Property ThisInvis Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
  Debug.Trace("Magic effect was started on " + akTarget)

	Objectreference box = aktarget.placeatme(FXEmptyactivator)

Box.MoveTo(aktarget, -120.0 * Math.Sin(akTarget.GetAngleZ()), -120.0 * Math.Cos(akTarget.GetAngleZ()), akTarget.GetHeight() - 25)
	Imod.apply()
	Shocksound.play(akcaster)
	Akcaster.translatetoref(Box, 5000)
	If !akcaster.IsDetectedBy(aktarget)
	Thisinvis.cast(akcaster)
	endif
	Box.delete()
	utility.wait(0.5)
	Imod.remove()
endEvent

ImageSpaceModifier Property Imod  Auto  
