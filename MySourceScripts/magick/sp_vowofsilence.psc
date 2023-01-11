Scriptname SP_VowofSilence extends activemagiceffect  
Actor Caster
actor target
float property xpup auto
bool iscasting = false
Event onupdate()
if iscasting
target.interruptcast()
registerforsingleupdate(0.1)
endif
endevent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	iscasting = true
  target = aktarget
If Caster == game.getplayer()
		Game.AdvanceSkill("Illusion", XPUP)
	EndIf

	registerforsingleupdate(0.1)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
  Debug.Trace("Magic effect was started on " + akTarget)
	iscasting = false
endEvent