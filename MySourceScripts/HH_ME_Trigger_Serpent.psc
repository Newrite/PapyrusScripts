Scriptname HH_ME_Trigger_Serpent extends activemagiceffect  

Spell Property HH_DoomStone_ToxcityTouch Auto

Actor Property PlayerRef  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
HH_DoomStone_ToxcityTouch.cast(PlayerRef, akTarget)
endEvent