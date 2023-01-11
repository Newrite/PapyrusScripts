Scriptname POT_NetherLichdomBlockerScript extends activemagiceffect  

MagicEffect Property POT_ResurrectionEffect Auto
ReferenceAlias Property POT_Player Auto
Actor Property PlayerRef Auto
Message Property POT_ResurrectedMessage Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	If PlayerRef.HasMagicEffect(POT_ResurrectionEffect)
		POT_Player.ForceRefTo(PlayerRef)
		POT_ResurrectedMessage.Show()
	EndIf

EndEvent