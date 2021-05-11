Scriptname ORD_LightOfTheWise_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Enc_LightOfTheWise_Spell_Proc Auto
Sound Property ORD_Enc_LightOfTheWise_Marker_Thunder Auto
Float Property ORD_Delay Auto

; -----

Enchantment PreviousEnchantment = NONE
Int CastCount = 0

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Enchantment)
		CastCount += 1
		If CastCount >= 2 && (akSpell as Enchantment) != PreviousEnchantment
			ORD_Enc_LightOfTheWise_Spell_Proc.Cast(PlayerRef)
			CastCount = 0
			UnregisterForUpdate()
			PreviousEnchantment = NONE
			;ORD_Enc_LightOfTheWise_Marker_Thunder.Play(PlayerRef)
		Else
			PreviousEnchantment = (akSpell as Enchantment)
			RegisterForSingleUpdate(ORD_Delay)
		EndIf

	EndIf

EndEvent

; -----

Event OnUpdate()

	CastCount = 0
	PreviousEnchantment = NONE

EndEvent

; -----