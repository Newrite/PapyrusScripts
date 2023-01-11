Scriptname HH_On_Alias_Return_Smithing   

Perk Property HH_kostil Auto

Event OnInit()
 	Game.GetPlayer().RegisterForMenu("ContainerMenu")
	Game.GetPlayer().addperk(HH_kostil)
		Debug.Notification("Load ip")
EndEvent
 
 
Event OnMenuClose(String MenuName)
	If MenuName == "Crafting Menu"
		Debug.MessageBox("Closed")
	EndIf
EndEvent


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
  debug.messagebox("OHH")
if abHitBlocked==true
debug.messagebox("Bloced")
endif
EndEvent