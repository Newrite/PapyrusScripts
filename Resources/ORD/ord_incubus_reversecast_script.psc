Scriptname ORD_Incubus_ReverseCast_Script extends activemagiceffect  

; -----

Float Property ORD_Mult Auto
Message Property ORD_Ill_Incubus_Message_Fade Auto

; -----

Float Skill01
Float Skill02
Float Skill03
Float Skill04
Float Skill05
Float Skill06
Float Skill07
Float Skill08
Float Skill09
Float Skill10
Float Skill11
Float Skill12
Float Skill13
Float Skill14
Float Skill15
Float Skill16
Float Skill17
Float Skill18

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Skill01 = akCaster.GetAV("Alteration") * ORD_Mult
	Skill02 = akCaster.GetAV("Conjuration") * ORD_Mult
	Skill03 = akCaster.GetAV("Destruction") * ORD_Mult
	Skill04 = akCaster.GetAV("Illusion") * ORD_Mult
	Skill05 = akCaster.GetAV("Restoration") * ORD_Mult
	Skill06 = akCaster.GetAV("Enchanting") * ORD_Mult
	Skill07 = akCaster.GetAV("Alchemy") * ORD_Mult
	Skill08 = akCaster.GetAV("LightArmor") * ORD_Mult
	Skill09 = akCaster.GetAV("Sneak") * ORD_Mult
	Skill10 = akCaster.GetAV("Speechcraft") * ORD_Mult
	Skill11 = akCaster.GetAV("Lockpicking") * ORD_Mult
	Skill12 = akCaster.GetAV("Pickpocket") * ORD_Mult
	Skill13 = akCaster.GetAV("HeavyArmor") * ORD_Mult
	Skill14 = akCaster.GetAV("Smithing") * ORD_Mult
	Skill15 = akCaster.GetAV("OneHanded") * ORD_Mult
	Skill16 = akCaster.GetAV("TwoHanded") * ORD_Mult
	Skill17 = akCaster.GetAV("Block") * ORD_Mult
	Skill18 = akCaster.GetAV("Marksman") * ORD_Mult

	akTarget.ModAV("Alteration", Skill01)
	akTarget.ModAV("Conjuration", Skill02)
	akTarget.ModAV("Destruction", Skill03)
	akTarget.ModAV("Illusion", Skill04)
	akTarget.ModAV("Restoration", Skill05)
	akTarget.ModAV("Enchanting", Skill06)
	akTarget.ModAV("Alchemy", Skill07)
	akTarget.ModAV("LightArmor", Skill08)
	akTarget.ModAV("Alteration", Skill09)
	akTarget.ModAV("Speechcraft", Skill10)
	akTarget.ModAV("Lockpicking", Skill11)
	akTarget.ModAV("Pickpocket", Skill12)
	akTarget.ModAV("HeavyArmor", Skill13)
	akTarget.ModAV("Smithing", Skill14)
	akTarget.ModAV("OneHanded", Skill15)
	akTarget.ModAV("TwoHanded", Skill16)
	akTarget.ModAV("Block", Skill17)
	akTarget.ModAV("Marksman", Skill18)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModAV("Alteration", -Skill01)
	akTarget.ModAV("Conjuration", -Skill02)
	akTarget.ModAV("Destruction", -Skill03)
	akTarget.ModAV("Illusion", -Skill04)
	akTarget.ModAV("Restoration", -Skill05)
	akTarget.ModAV("Enchanting", -Skill06)
	akTarget.ModAV("Alchemy", -Skill07)
	akTarget.ModAV("LightArmor", -Skill08)
	akTarget.ModAV("Alteration", -Skill09)
	akTarget.ModAV("Speechcraft", -Skill10)
	akTarget.ModAV("Lockpicking", -Skill11)
	akTarget.ModAV("Pickpocket", -Skill12)
	akTarget.ModAV("HeavyArmor", -Skill13)
	akTarget.ModAV("Smithing", -Skill14)
	akTarget.ModAV("OneHanded", -Skill15)
	akTarget.ModAV("TwoHanded", -Skill16)
	akTarget.ModAV("Block", -Skill17)
	akTarget.ModAV("Marksman", -Skill18)

	ORD_Ill_Incubus_Message_Fade.Show()

EndEvent

; -----