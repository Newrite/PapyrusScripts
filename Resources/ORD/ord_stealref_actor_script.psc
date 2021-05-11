Scriptname ORD_StealRef_Actor_Script extends ReferenceAlias  

; -----

Spell Property ORD_QuestRunner Auto
Float Property ORD_Delay Auto
LeveledItem Property ORD_Litem Auto
LeveledItem Property ORD_Gold Auto
Int Property ORD_ItemCount Auto
Float Property ORD_ItemCountSkillMult Auto
String Property ORD_Skill Auto
Message Property ORD_Dead Auto
Perk Property ORD_Pic80_CrimeWave_Perk_80_OrdASISExclude Auto
GlobalVariable Property ORD_Pic_ThiefsEye_Global_NextActivate Auto
GlobalVariable Property ORD_Pic_CrimeWave_Global_Counter Auto
GlobalVariable Property ORD_Pic_CrimeWave_Global_Max Auto

; -----

Bool HasAddedItem = false

; -----

Event OnActivate(ObjectReference akActivator)

	Actor PlayerRef = Game.GetPlayer()
	If akActivator == PlayerRef && !HasAddedItem
		HasAddedItem = true
		Self.GetActorRef().AddItem(ORD_Litem, Math.Floor(ORD_ItemCount + (ORD_ItemCountSkillMult * PlayerRef.GetActorValue(ORD_Skill))))
		Self.GetActorRef().AddItem(ORD_Gold)
		Utility.Wait(ORD_Delay)
		PlayerRef.DispelSpell(ORD_QuestRunner)
		Debug.Trace("ORDINATOR DEBUG: Thief's Eye target has been activated", 0)

		; crime wave
		If PlayerRef.HasPerk(ORD_Pic80_CrimeWave_Perk_80_OrdASISExclude)
			If ORD_Pic_CrimeWave_Global_Counter.GetValue() < ORD_Pic_CrimeWave_Global_Max.GetValue()
				ORD_Pic_CrimeWave_Global_Counter.Mod(1)
				Utility.Wait(5.0)
				ORD_Pic_ThiefsEye_Global_NextActivate.SetValue(-1)
				ORD_QuestRunner.Cast(PlayerRef)
				Debug.Trace("ORDINATOR DEBUG: Thief's Eye restarted by Crime Wave", 0)
			Else
				ORD_Pic_CrimeWave_Global_Counter.SetValue(0)
			EndIf
		EndIf

	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	Actor PlayerRef = Game.GetPlayer()
	If !HasAddedItem
		HasAddedItem = true
		Self.GetActorRef().AddItem(ORD_Litem, Math.Floor(ORD_ItemCount + (ORD_ItemCountSkillMult * PlayerRef.GetActorValue(ORD_Skill))))
	EndIf
	ORD_Dead.Show()
	Utility.Wait(ORD_Delay)
	PlayerRef.DispelSpell(ORD_QuestRunner)
	Debug.Trace("ORDINATOR DEBUG: Thief's Eye lost, target dead", 0)

EndEvent

; -----