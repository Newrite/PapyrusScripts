Scriptname POT_BoneTyrantTransformationScript extends activemagiceffect  

;=====================================================

Actor Property PlayerRef Auto

Armor Property POT_LichBoneTyrantSkin Auto

Explosion Property MGEyeOpenExplosion Auto

Perk Property POT_LichBoneTyrantActivationBlocker Auto

Race Property POT_PreviousRace Auto  
Race Property POT_BoneTyrantRace Auto

Spell Property POT_LichBoneTyrantDeathGrip Auto
Spell Property POT_LichBoneTyrantSoulClutch Auto
Spell Property POT_LichBoneTyrantPlaceholder Auto

;=====================================================

Event OnEffectStart(Actor akTarget, Actor akCaster)
                    utility.wait(1)
                    Game.SetBeastForm(True)
                    Game.ForceThirdPerson()
                    Game.GetPlayer().AddPerk(POT_LichBoneTyrantActivationBlocker)
                    PlayerRef.placeatme(MGEyeOpenExplosion)

			POT_PreviousRace = Game.GetPlayer().GetRace()
                    Game.GetPlayer().SetRace(POT_BoneTyrantRace)		
                    
                    PlayerRef.EquipSpell(POT_LichBoneTyrantDeathGrip, 0)
                    PlayerRef.EquipSpell(POT_LichBoneTyrantSoulClutch, 1)
                    PlayerRef.EquipSpell(POT_LichBoneTyrantPlaceholder, 2)

EndEvent

;=====================================================

Event OnEffectFinish(Actor akTarget, Actor akCaster)
                    utility.wait(1)
                    Game.SetBeastForm(False)
                    Game.GetPlayer().RemovePerk(POT_LichBoneTyrantActivationBlocker)
                    PlayerRef.placeatme(MGEyeOpenExplosion)

	              POT_BoneTyrantRace = Game.GetPlayer().GetRace()
                    Game.GetPlayer().SetRace(POT_PreviousRace)		
		
                    PlayerRef.UnequipSpell(POT_LichBoneTyrantDeathGrip, 0)
                    PlayerRef.UnequipSpell(POT_LichBoneTyrantSoulClutch, 1)
                    PlayerRef.UnequipSpell(POT_LichBoneTyrantPlaceholder, 2)
EndEvent
