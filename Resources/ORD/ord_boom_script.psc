Scriptname ORD_Boom_Script extends ObjectReference  

; -----

Actor Property PlayerRef Auto
Explosion Property ORD_Explosion Auto
Float Property ORD_Damage Auto
Float Property ORD_PushForce Auto
Book Property ORD_Alt_WildSanctuaries_Book_03 Auto

; -----

Event OnRead()

	PlayerRef.PlaceAtMe(ORD_Explosion)
	PlayerRef.DamageAV("Health", ORD_Damage)
	PlayerRef.PushActorAway(PlayerRef, ORD_PushForce)
;	PlayerRef.RemoveItem(ORD_Alt_WildSanctuaries_Book_03,1)

EndEvent

; -----