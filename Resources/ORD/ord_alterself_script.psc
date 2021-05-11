Scriptname ORD_AlterSelf_Script extends ActiveMagicEffect  

; -----

Int Property ORD_AddIterations Auto
Message Property ORD_AlterSelf_Message Auto
Spell[] Property ORD_AlterSelf_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_AddIterations
		Int j = ORD_AlterSelf_Message.Show()
		akTarget.AddSpell(ORD_AlterSelf_Spell[j], false)
		i += 1
	EndWhile

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_AlterSelf_Spell.Length
		akTarget.RemoveSpell(ORD_AlterSelf_Spell[i])
		i += 1
	EndWhile

EndEvent

; -----