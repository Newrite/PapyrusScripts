Scriptname ORD_RoguesLuck_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_RoguesLuck_Spell_Proc Auto
EffectShader Property ORD_Sne_RoguesLuck_FXS Auto
Message Property ORD_Sne_RoguesLuck_Message Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akCaster.IsDetectedBy(akTarget)	; bugfix
	If akCaster.IsDetectedBy(akTarget)
		akTarget.StopCombat()
		ORD_Sne_RoguesLuck_FXS.Play(akTarget)
		If akCaster == PlayerRef
			ORD_Sne_RoguesLuck_Message.Show()
		EndIf
		ORD_Sne_RoguesLuck_Spell_Proc.Cast(akCaster)
		; cheat
	EndIf

EndEvent

; -----