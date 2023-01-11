Scriptname POT_DarkSacrificeBlockerScript extends ActiveMagicEffect  

Message Property POT_DarkSacrificeBlockerMessage Auto

;-------------------------------------------------------

event OnEffectStart(Actor akTarget, Actor akCaster)
	if aktarget == game.getPlayer()
		POT_DarkSacrificeBlockerMessage.Show()
	endif
endEvent
 
