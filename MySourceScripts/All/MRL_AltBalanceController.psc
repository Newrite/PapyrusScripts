ScriptName MRL_AltBalanceController Extends Quest

FormList Property Perks Auto
FormList Property Spells Auto

Function AddSpells()
  int size = Spells.GetSize()
  int index = 0
  while index < size
    Spell s = Spells.GetAt(index) as Spell
    if s
      Game.GetPlayer().AddSpell(s, false)
    endif
    index = index + 1
  endwhile
EndFunction

Function AddPerks()
  int size = Perks.GetSize()
  int index = 0
  while index < size
    Perk p = Perks.GetAt(index) as Perk
    if p
      Game.GetPlayer().AddPerk(p)
    endif
    index = index + 1
  endwhile
EndFunction

Event OnInit()
  Utility.WaitMenuMode(1.0)
  AddPerks()
  AddSpells()
EndEvent
