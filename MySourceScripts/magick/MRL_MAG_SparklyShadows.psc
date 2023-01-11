Scriptname MRL_MAG_SparklyShadows extends ActiveMagicEffect

Spell Property Invis Auto

Event OnDying(Actor akKiller)

  if akKiller == Game.GetPlayer()
    Invis.Cast(akKiller, akKiller)
  endif

  self.Dispel()
  
EndEvent