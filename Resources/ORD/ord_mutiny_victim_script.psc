Scriptname ORD_Mutiny_Victim_Script extends ReferenceAlias  

; -----

Spell Property ORD_Pic_Mutiny_Spell Auto

; -----

Event OnDying(Actor akKiller)

	Game.GetPlayer().DispelSpell(ORD_Pic_Mutiny_Spell)

EndEvent

; -----