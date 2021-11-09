Scriptname MultiMagicMultiShotScript extends activemagiceffect  

VisualEffect Property MultiVisualMenu01  Auto
VisualEffect Property MultiVisualMenu02  Auto
VisualEffect Property MultiVisualMenu03  Auto
VisualEffect Property MultiVisualMenu04  Auto

GlobalVariable Property MultiSet Auto

Sound Property multiSoundSet01  Auto
Sound Property multiSoundSet02  Auto

Event OnEffectStart(Actor Target, Actor Caster)

	if MultiSet.getValue() == 0
		MultiVisualMenu01.play(Caster,2)
		multiSoundSet01.play(Caster)
		MultiSet.setValue(1)
	elseif MultiSet.getValue() == 1
		MultiVisualMenu02.play(Caster,2)
		multiSoundSet02.play(Caster)
		MultiSet.setValue(2)
 	elseif MultiSet.getValue() == 2
		MultiVisualMenu03.play(Caster,2)
		multiSoundSet01.play(Caster)
		MultiSet.setValue(3)
	elseif MultiSet.getValue() == 3
		MultiVisualMenu04.play(Caster,2)
		multiSoundSet02.play(Caster)
		MultiSet.setValue(0)
	endif

EndEvent