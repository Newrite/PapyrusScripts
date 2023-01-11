Scriptname POT_LichDisguiseScript extends activemagiceffect  

;=====================================================

Actor Property PlayerRef Auto

Explosion Property MGEyeOpenExplosion Auto

Faction Property VampirePCFaction Auto

Race Property ArgonianRace  Auto  
Race Property BretonRace  Auto  
Race Property DarkElfRace  Auto  
Race Property HighElfRace  Auto  
Race Property ImperialRace  Auto  
Race Property KhajiitRace  Auto  
Race Property NordRace  Auto  
Race Property OrcRace  Auto 
Race Property RedguardRace  Auto  
Race Property WoodElfRace  Auto  
Race Property POT_ArgonianRaceLich  Auto  
Race Property POT_BretonRaceLich  Auto 
Race Property POT_DarkElfRaceLich  Auto
Race Property POT_HighElfRaceLich  Auto  
Race Property POT_ImperialRaceLich  Auto
Race Property POT_KhajiitRaceLich Auto 
Race Property POT_NordRaceLich  Auto 
Race Property POT_OrcRaceLich  Auto  
Race Property POT_RedguardRaceLich  Auto 
Race Property POT_WoodElfRaceLich  Auto   

;=====================================================

Event OnEffectStart(Actor akTarget, Actor akCaster)
			Game.GetPlayer().RemoveFromFaction(VampirePCFaction)
                    Game.GetPlayer().SetAttackActorOnSight(False)
                    PlayerRef.PlaceAtMe(MGEyeOpenExplosion)          

			if (Game.GetPlayer().GetRace() == POT_ArgonianRaceLich)
				Game.GetPlayer().SetRace(ArgonianRace)
			elseif (Game.GetPlayer().GetRace() == POT_BretonRaceLich)
				Game.GetPlayer().SetRace(BretonRace) 
			elseif (Game.GetPlayer().GetRace() == POT_DarkElfRaceLich)
				Game.GetPlayer().SetRace(DarkElfRace) 
			elseif (Game.GetPlayer().GetRace() == POT_HighELfRaceLich)
				Game.GetPlayer().SetRace(HighELfRace) 
          		elseif (Game.GetPlayer().GetRace() == POT_ImperialRaceLich)
			      	Game.GetPlayer().SetRace(ImperialRace)  	
			elseif (Game.GetPlayer().GetRace() == POT_KhajiitRaceLich)
				Game.GetPlayer().SetRace(KhajiitRace) 	
			elseif (Game.GetPlayer().GetRace() == POT_NordRaceLich)
				Game.GetPlayer().SetRace(NordRace) 	
			elseif (Game.GetPlayer().GetRace() == POT_OrcRaceLich) 
				Game.GetPlayer().SetRace(OrcRace) 
			elseif (Game.GetPlayer().GetRace() == POT_RedguardRaceLich)
				Game.GetPlayer().SetRace(RedguardRace) 	
			elseif (Game.GetPlayer().GetRace() == POT_WoodElfRaceLich)
				Game.GetPlayer().SetRace(WoodElfRace) 
                EndIf
EndEvent	

;=====================================================

Event OnEffectFinish(Actor akTarget, Actor akCaster)
              	Game.GetPlayer().AddToFaction(VampirePCFaction)
                    Game.GetPlayer().SetAttackActorOnSight(True)
                    PlayerRef.PlaceAtMe(MGEyeOpenExplosion)   

			if (Game.GetPlayer().GetRace() == ArgonianRace)
				Game.GetPlayer().SetRace(POT_ArgonianRaceLich)
			elseif (Game.GetPlayer().GetRace() == BretonRace)
				Game.GetPlayer().SetRace(POT_BretonRaceLich) 
			elseif (Game.GetPlayer().GetRace() == DarkElfRace)
				Game.GetPlayer().SetRace(POT_DarkElfRaceLich) 
			elseif (Game.GetPlayer().GetRace() == HighELfRace)
				Game.GetPlayer().SetRace(POT_HighELfRaceLich) 
          		elseif (Game.GetPlayer().GetRace() == ImperialRace)
			      	Game.GetPlayer().SetRace(POT_ImperialRaceLich)  	
			elseif (Game.GetPlayer().GetRace() == KhajiitRace)
				Game.GetPlayer().SetRace(POT_KhajiitRaceLich) 	
			elseif (Game.GetPlayer().GetRace() == NordRace)
				Game.GetPlayer().SetRace(POT_NordRaceLich) 	
			elseif (Game.GetPlayer().GetRace() == OrcRace) 
				Game.GetPlayer().SetRace(POT_OrcRaceLich) 
			elseif (Game.GetPlayer().GetRace() == RedguardRace)
				Game.GetPlayer().SetRace(POT_RedguardRaceLich) 	
			elseif (Game.GetPlayer().GetRace() == WoodElfRace)
				Game.GetPlayer().SetRace(POT_WoodElfRaceLich) 
                EndIf
               
EndEvent	