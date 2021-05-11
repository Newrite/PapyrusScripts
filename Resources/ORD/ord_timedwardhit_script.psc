Scriptname ORD_TimedWardHit_Script extends activemagiceffect  

; -----

Spell Property ORD_Res_EyeForAnEye_Spell_Proc_Counter Auto
Actor Property PlayerRef Auto
Message Property ORD_Res_ZealotsWard_Message Auto

; -----

Event OnWardHit(ObjectReference akCaster, Spell akSpell, int aiStatus)

	If aiStatus == 1 && akCaster as Actor && akSpell && akSpell.IsHostile()
		ORD_Res_EyeForAnEye_Spell_Proc_Counter.Cast(PlayerRef, akCaster as Actor)
		ORD_Res_ZealotsWard_Message.Show()
	EndIf

EndEvent

; -----