Scriptname MRL_TempleBlessingScript extends ObjectReference Conditional  

Spell Property TempleBlessing Auto
Spell Property TempleDispel Auto
Spell Property Cure Auto

MRL_GodsBlessingsHandler Property GodsHandler Auto 

Event OnActivate(ObjectReference akActionRef)

    TempleDispel.Cast(akActionRef, akActionRef)
    Cure.Cast(akActionRef, akActionRef)

    if akActionRef == Game.GetPlayer()

        Utility.Wait(0.25)
	    GodsHandler.AddBlessing(TempleBlessing)

	endif

EndEvent