Scriptname ORD_Miracle_Proc_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Message Property ORD_Enc_Miracle_Message_Go Auto
Message Property ORD_Enc_Miracle_Message Auto
GlobalVariable Property ORD_Enc_Miracle_Global_IsCompleted Auto
Explosion Property ORD_Enc_Miracle_Explosion Auto
Float Property ORD_PushForce Auto
ReferenceAlias Property ORD_ArcaneNexus Auto

; failsafe
EffectShader[] Property ORD_Enc_GemDust_FXS Auto
Spell[] Property ORD_Enc_GemDust_Spell auto
Spell Property ORD_Enc_Preserver_Spell_Proc Auto
Spell Property ORD_Enc_ArcaneNexus_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Enc_Miracle_Message_Go.Show()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

EndEvent

; -----

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If (akBaseItem as SoulGem)
		ORD_Enc_Miracle_Global_IsCompleted.SetValue(1)
		ORD_Enc_Miracle_Message.Show()
		PlayerRef.PlaceAtMe(ORD_Enc_Miracle_Explosion)
		PlayerRef.PushActorAway(PlayerRef, ORD_PushForce)

		; failsafe in case getting knocked away doesn't count as getting up (it does, but who knows what other mods might do)
		ObjectReference TheNexus = ORD_ArcaneNexus.GetRef()
		ORD_Enc_GemDust_FXS[0].Stop(TheNexus)
		ORD_Enc_GemDust_FXS[1].Stop(TheNexus)
		ORD_Enc_GemDust_FXS[2].Stop(TheNexus)
		ORD_Enc_GemDust_FXS[3].Stop(TheNexus)
		ORD_Enc_GemDust_FXS[4].Stop(TheNexus)
		ORD_Enc_GemDust_FXS[5].Stop(TheNexus)

		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[0])
		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[1])
		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[2])
		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[3])
		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[4])
		PlayerRef.DispelSpell(ORD_Enc_GemDust_Spell[5])

		PlayerRef.DispelSpell(ORD_Enc_Preserver_Spell_Proc)
		PlayerRef.DispelSpell(ORD_Enc_ArcaneNexus_Spell_Proc)

	EndIf

EndEvent

; -----