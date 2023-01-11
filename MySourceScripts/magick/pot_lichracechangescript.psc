Scriptname POT_LichRaceChangeScript extends ActiveMagicEffect

;=====================================================

Actor Property PlayerRef Auto

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
Race Property ArgonianRaceVampire  Auto
Race Property BretonRaceVampire  Auto
Race Property DarkElfRaceVampire  Auto
Race Property HighElfRaceVampire  Auto
Race Property ImperialRaceVampire  Auto
Race Property KhajiitRaceVampire  Auto
Race Property NordRaceVampire  Auto
Race Property OrcRaceVampire  Auto
Race Property RedguardRaceVampire  Auto
Race Property WoodElfRaceVampire  Auto
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
			;Game.GetPlayer().AddToFaction(VampirePCFaction)
      ;              Game.GetPlayer().SetAttackActorOnSight(True)

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
