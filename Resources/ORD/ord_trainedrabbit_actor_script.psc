Scriptname ORD_TrainedRabbit_Actor_Script extends ObjectReference  

; -----

Spell Property ORD_Pic_TrainedRabbit_Spell Auto
Message Property ORD_Pic_TrainedRabbit_Message_Dead Auto

; -----

Event OnDying()

	Game.GetPlayer().DispelSpell(ORD_Pic_TrainedRabbit_Spell)

EndEvent

; -----