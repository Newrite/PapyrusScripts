Scriptname WB_InvisibleManagerInCombat_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto
GlobalVariable Property WB_Destruction_Crackle_Global Auto
Bool Property bloodMagick Auto
Bool Property SpecialEdition Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	string actorValueName = ""

	if bloodMagick
		actorValueName = "health"
	else
		actorValueName = "magicka"
	endif

	; Ocatos Recital
	Int i = 0
	bool bEnd = false
	While !bEnd && (i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize())

		Spell TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		float costSpell = TheSpell.GetEffectiveMagickaCost(akTarget)
		float actorValue = akTarget.GetAV(actorValueName)
		
		if actorValue >= costSpell
			akTarget.DoCombatSpellApply(TheSpell, akTarget)
			if !SpecialEdition
				akTarget.DamageAV(actorValueName, costSpell)	
			endif
			if SpecialEdition && !bloodMagick
				akTarget.DamageAV(actorValueName, costSpell)
			endif
		else
			bEnd = true
		endif
		
		i += 1	
	EndWhile

	;Debug.Notification("Ocato total cost: " + total_cost)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	; Crackle
	WB_Destruction_Crackle_Global.SetValue(0.0)

EndEvent

; -----