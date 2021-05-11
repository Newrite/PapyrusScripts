Scriptname ORD_Skystrike_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Float Property ORD_Delay Auto
Float Property ORD_Z Auto
Int Property ORD_Cost Auto
FormList Property ORD_Arc_Skystrike_FormList Auto
Spell Property ORD_Arc_Skystrike_Spell_Proc Auto
Spell[] Property ORD_Arc_Skystrike_Spell_ProcBow Auto
Actor Property PlayerRef Auto
Explosion Property ORD_Arc_Skystrike_Explosion Auto
Ammo[] Property ORD_AmmoTypes Auto
Message Property ORD_Arc_Skystrike_WrongArrows Auto

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower >= 1.0 && Weather.GetSkyMode() == 3 && PlayerRef.GetAngleX() < -89.0 &&  PlayerRef.GetItemCount(akAmmo) >= ORD_Cost

		Int AmmoFound = ORD_AmmoTypes.Find(akAmmo)
		If AmmoFound >= 0

			ORD_Arc_Skystrike_Spell_Proc.Cast(PlayerRef)
			PlayerRef.RemoveItem(akAmmo, ORD_Cost, true)

			Utility.Wait(ORD_Delay)

			ObjectReference TheBox = PlayerRef.PlaceAtMe(FXEmptyActivator)
			TheBox.MoveTo(PlayerRef, 0, 0, ORD_Z)
			TheBox.PlaceAtMe(ORD_Arc_Skystrike_Explosion)

			Float NumberOfTargets = ORD_Arc_Skystrike_FormList.GetSize()
			If NumberOfTargets > 0
				Actor VictimActor
				Int i
				If NumberOfTargets > ORD_Cost 
					While i < ORD_Cost 
						VictimActor = ORD_Arc_Skystrike_FormList.GetAt(i) as Actor
						ORD_Arc_Skystrike_Spell_ProcBow[AmmoFound].RemoteCast(TheBox, PlayerRef, VictimActor)
						i += 1
					EndWhile
				Else
					While i < ORD_Arc_Skystrike_FormList.GetSize()
						VictimActor = ORD_Arc_Skystrike_FormList.GetAt(i) as Actor
						ORD_Arc_Skystrike_Spell_ProcBow[AmmoFound].RemoteCast(TheBox, PlayerRef, VictimActor)
						i += 1
					EndWhile
				EndIf
				ORD_Arc_Skystrike_FormList.Revert()
				Utility.Wait(1.0)
			EndIf
			TheBox.Delete()

		Else
			ORD_Arc_Skystrike_WrongArrows.Show()
		EndIf
		ORD_Arc_Skystrike_FormList.Revert()

	EndIf

EndEvent

; -----