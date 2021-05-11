Scriptname ORD_EnteringEnchantingMenu_Script extends activemagiceffect  

; -----

Keyword Property isEnchanting Auto
Actor Property PlayerRef Auto

; gem dust
Spell[] Property ORD_Enc_GemDust_Spell Auto
EffectShader[] Property ORD_Enc_GemDust_FXS Auto

; preserver
Spell Property ORD_Enc_Preserver_Spell_Proc Auto

; arcane nexus
Quest Property ORD_ArcaneNexus_Quest Auto
Spell Property ORD_Enc_ArcaneNexus_Spell_Proc Auto
GlobalVariable Property ORD_Enc_ArcaneNexus_Global_Type Auto

; -----

Event OnGetUp(ObjectReference akFurniture)

	If akFurniture.HasKeyword(isEnchanting)

		ORD_Enc_GemDust_FXS[0].Stop(akFurniture)
		ORD_Enc_GemDust_FXS[1].Stop(akFurniture)
		ORD_Enc_GemDust_FXS[2].Stop(akFurniture)
		ORD_Enc_GemDust_FXS[3].Stop(akFurniture)
		ORD_Enc_GemDust_FXS[4].Stop(akFurniture)
		ORD_Enc_GemDust_FXS[5].Stop(akFurniture)

		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[0])
		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[1])
		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[2])
		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[3])
		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[4])
		PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[5])

		PlayerRef.DispelSpell(ORD_Enc_Preserver_Spell_Proc)
		PlayerRef.DispelSpell(ORD_Enc_ArcaneNexus_Spell_Proc)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[0])
	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[1])
	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[2])
	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[3])
	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[4])
	PlayerRef.DispelSpell( ORD_Enc_GemDust_Spell[5])

	PlayerRef.DispelSpell(ORD_Enc_Preserver_Spell_Proc)
	PlayerRef.DispelSpell(ORD_Enc_ArcaneNexus_Spell_Proc)

	ORD_ArcaneNexus_Quest.Stop()
	ORD_Enc_ArcaneNexus_Global_Type.SetValue(-1)

EndEvent

; -----