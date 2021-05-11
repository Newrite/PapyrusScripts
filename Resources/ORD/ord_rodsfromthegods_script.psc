Scriptname ORD_RodsFromTheGods_Script extends activemagiceffect  

; -----

Float Property ORD_Delay Auto

; -----

Int Count = 0
Enchantment PreviousEnchantment = NONE

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Enchantment)
		Count += 1
		If Count >= 2 && (akSpell as Enchantment) != PreviousEnchantment
			; cast
			UnregisterforUpdate()
			Count = 0
			PreviousEnchantment = NONE
		Else
			PreviousEnchantment = (akSpell as Enchantment)
			RegisterForUpdate(ORD_Delay)
		EndIf
	EndIf

EndEvent

; -----

Event OnUpdate()

	Count = 0
	PreviousEnchantment = NONE

EndEvent

; -----