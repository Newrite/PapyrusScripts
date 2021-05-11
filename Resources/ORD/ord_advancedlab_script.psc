Scriptname ORD_AdvancedLab_Script extends activemagiceffect  

; -----

Keyword Property isAlchemy Auto
Actor Property PlayerRef Auto
Spell Property ORD_Alc_AdvancedLab_Spell_Proc Auto
Quest Property ORD_AdvancedLab_Quest Auto
GlobalVariable Property ORD_Alc_AdvancedLab_Global_Type Auto

; lab skeever
Perk Property ORD_Alc40_LabSkeever_Perk_40 Auto
Spell Property ORD_Alc_LabSkeever_Spell_Proc Auto

; -----

Event OnGetUp(ObjectReference akFurniture)

	If akFurniture.HasKeyword(isAlchemy)
		PlayerRef.DispelSpell(ORD_Alc_AdvancedLab_Spell_Proc)
		If PlayerRef.HasPerk(ORD_Alc40_LabSkeever_Perk_40)
			ORD_Alc_LabSkeever_Spell_Proc.Cast(PlayerRef)
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_AdvancedLab_Quest.Stop()
	ORD_Alc_AdvancedLab_Global_Type.SetValue(-1)
	PlayerRef.DispelSpell(ORD_Alc_LabSkeever_Spell_Proc)

EndEvent

; -----
