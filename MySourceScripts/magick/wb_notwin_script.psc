Scriptname WB_NoTwin_Script extends activemagiceffect  

; -----

Keyword Property WB_Illusion_EvilTwin Auto
Float Property WB_UpdateRate Auto
Spell Property WB_I050_EvilTwin_Spell Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	If TheTarget.HasEffectKeyword(WB_Illusion_EvilTwin)
		TheTarget.DispelSpell(WB_I050_EvilTwin_Spell)
	EndIf
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If TheTarget.HasEffectKeyword(WB_Illusion_EvilTwin)
		TheTarget.DispelSpell(WB_I050_EvilTwin_Spell)
	EndIf

EndEvent

; -----