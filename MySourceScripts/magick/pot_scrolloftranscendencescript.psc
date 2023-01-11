Scriptname POT_ScrollOfTranscendenceScript extends ActiveMagicEffect  

;-------------------------------------------------

Message Property POT_LichdomScrollCastMessage Auto

Spell Property POT_LichWeakened01 Auto
Spell Property POT_LichCorruptedSoul Auto

Actor Property PlayerRef Auto 

Event OnInit()

	;Make sure the player is out of combat, then trigger effect
	If PlayerRef.GetCombatState() == 0 && Game.IsMovementControlsEnabled() && Game.IsFightingControlsEnabled()
		POT_LichdomScrollCastMessage.Show()
                PlayerRef.AddSpell(POT_LichWeakened01, abVerbose = False)
		PlayerRef.AddSpell(POT_LichCorruptedSoul, abVerbose = False)
	EndIf

EndEvent

