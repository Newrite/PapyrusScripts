Scriptname ORD_One_LimitBreak_Modifier_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_One_LimitBreak_Global_Count Auto
Spell Property ORD_One_ShakeTheHeavens_Spell_Proc Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_One_MassiveAttack_Global_Count_Max Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_One_LimitBreak_Global_Count.GetValue() >= ORD_One_MassiveAttack_Global_Count_Max.GetValue()
		ORD_One_LimitBreak_Global_Count.SetValue(0)
		akTarget.RampRumble(0.25, 0.25, 1500)
;		ORD_One_ShakeTheHeavens_Spell_Proc.Cast(PlayerRef)
;	Else
;		PlayerRef.DispelSpell(ORD_One_ShakeTheHeavens_Spell_Proc)
	EndIf

EndEvent

; -----