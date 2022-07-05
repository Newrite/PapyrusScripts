Scriptname HH_CREATE_ITEMS extends activemagiceffect  
Event OnEffectStart(Actor akTarget, Actor akCaster)
Game.GetPlayer().AddItem(Blood, 10)
Game.GetPlayer().AddItem(ALE, 10)
Game.GetPlayer().AddItem(CUBE, 10)
Game.GetPlayer().AddItem(Frost, 10)
Game.GetPlayer().AddItem(Oil, 10, true)
Game.GetPlayer().AddItem(Smoke, 10, true)
Game.GetPlayer().AddItem(Steel, 10, true)
Game.GetPlayer().AddItem(Elf, 10, true)
Game.GetPlayer().AddItem(Glass, 10, true)
Game.GetPlayer().AddItem(DW, 10, true)
Game.GetPlayer().AddItem(Orc, 10, true)
Game.GetPlayer().AddItem(Ebony, 10, true)
Game.GetPlayer().AddItem(Silver, 10, true)
Game.GetPlayer().AddItem(Silver_T2, 10, true)
Game.GetPlayer().AddItem(Daedric, 10, true)
Game.GetPlayer().AddItem(Draconic, 10, true)
Game.GetPlayer().AddItem(Dust_Fire, 10, true)
Game.GetPlayer().AddItem(Dust_Frost, 10, true)
Game.GetPlayer().AddItem(Dust_Shock, 10, true)
;
Game.GetPlayer().AddItem(Steel_1, 1, true)
Game.GetPlayer().AddItem(Elf_1, 1, true)
Game.GetPlayer().AddItem(Glass_1, 1, true)
Game.GetPlayer().AddItem(DW_1, 1, true)
Game.GetPlayer().AddItem(Orc_1, 1, true)
Game.GetPlayer().AddItem(Ebony_1, 1, true)
Game.GetPlayer().AddItem(Silver_1, 1, true)
Game.GetPlayer().AddItem(Silver_T2_1, 1, true)
Game.GetPlayer().AddItem(Daedric_1, 1, true)
Game.GetPlayer().AddItem(HH_DUST_FIRE, 1, true)
Game.GetPlayer().AddItem(HH_DUST_Frost, 1, true)
Game.GetPlayer().AddItem(HH_DUST_Shock, 1, true)
Game.GetPlayer().AddItem(Frost_1, 1, true)
Game.GetPlayer().AddItem(Oil_1, 1, true)
Game.GetPlayer().AddItem(Smoke_1, 1, true)
EndEvent

MiscObject Property Frost  Auto  
MiscObject Property Oil Auto  
MiscObject Property Smoke Auto
MiscObject Property Steel Auto
MiscObject Property Elf Auto
MiscObject Property Glass Auto
MiscObject Property DW Auto
MiscObject Property Orc Auto
MiscObject Property Ebony Auto
MiscObject Property Silver Auto
MiscObject Property Silver_T2 Auto
MiscObject Property Daedric Auto
MiscObject Property Draconic Auto
MiscObject Property  ALE Auto
MiscObject Property  Blood Auto
MiscObject Property  CUBE Auto
MiscObject Property Dust_Fire  Auto  
MiscObject Property Dust_Frost  Auto  
MiscObject Property Dust_Shock  Auto  
Armor Property Frost_1  Auto  
Armor Property Oil_1 Auto  
Armor Property Smoke_1 Auto
Armor Property Steel_1 Auto
Armor Property Elf_1 Auto
Armor Property Glass_1 Auto
Armor Property DW_1 Auto
Armor Property Orc_1 Auto
Armor Property Ebony_1 Auto
Armor Property Silver_1 Auto
Armor Property Silver_T2_1 Auto
Armor Property Daedric_1 Auto
Armor Property Draconic_1 Auto
Armor Property HH_DUST_FIRE Auto
Armor Property HH_DUST_Frost Auto
Armor Property HH_DUST_Shock Auto