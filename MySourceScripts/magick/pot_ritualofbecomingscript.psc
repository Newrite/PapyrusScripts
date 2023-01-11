Scriptname POT_RitualOfBecomingScript extends ActiveMagicEffect  

;-------------------------------------------------

Message Property POT_LichdomRitualCastMessage Auto

Spell Property POT_LichCorruptedSoul Auto
Spell Property POT_LichPhylacteryAbility Auto

SoulGem Property SoulGemBlackFilled Auto

Actor Property PlayerRef Auto 

;-------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
      Game.GetPlayer().RemoveItem(SoulGemBlackFilled, 10 )
			POT_LichdomRitualCastMessage.Show()
			PlayerRef.AddSpell(POT_LichCorruptedSoul, abVerbose = False)
			PlayerRef.AddSpell(POT_LichPhylacteryAbility, abVerbose = False)
EndEvent


