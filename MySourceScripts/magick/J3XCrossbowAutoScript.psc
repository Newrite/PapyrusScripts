Scriptname J3XCrossbowAutoScript extends ObjectReference  

spell property crossbowSpell auto

; Fix idea from RolandSir
Perk Property QuickshotPerk auto
Int PlayerHasPerk = 0


Event OnEquipped(Actor akActor)
	akActor.addSpell(crossbowSpell,false)
	
	if (akActor == Game.GetPlayer() && Game.GetPlayer().HasPerk(QuickshotPerk))
		PlayerHasPerk = 1
		Game.GetPlayer().RemovePerk(QuickshotPerk)
	endif
endEvent

Event OnUnequipped(Actor akActor)
	akActor.removeSpell(crossbowSpell)
	
	if (akActor == Game.GetPlayer() && PlayerHasPerk == 1)
		Game.GetPlayer().AddPerk(QuickshotPerk)
	endif
endEvent
