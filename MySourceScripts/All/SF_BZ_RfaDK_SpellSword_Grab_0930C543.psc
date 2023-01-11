
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BZ_RfaDK_SpellSword_Grab_0930C543 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Utility.waitmenumode(0.5)
BZ_RfaDK_Alduin_SpellSword .Placeatme(SummonValorTargetFXActivator)
Utility.waitmenumode(0.5)
BZ_RfaDK_Alduin_SpellSword.Resurrect()
BZ_RfaDK_Alduin_SpellSword.Disable()
Utility.waitmenumode(0.1)
BZ_RfaDK_Alduin_SpellSword.enable()
Utility.waitmenumode(0.6)
BZ_RfaDK_SpellSword_G.SetValue(2)
BZ_RfaDK_Alduin_SpellSword.AddItem(BZ_RfaDK_SpellSword_Stage_2_Sword_Black, 1 )
BZ_RfaDK_Alduin_SpellSword.AddItem(BZ_RfaDK_SpellSword_Stage_2_Sword_White, 1 )
Utility.waitmenumode(0.1)
BZ_RfaDK_Alduin_SpellSword.UnequipItem(BZ_RfaDK_Alduin_SpellSword_Dragonbone_Mace)
BZ_RfaDK_Alduin_SpellSword.RemoveItem(BZ_RfaDK_Alduin_SpellSword_Dragonbone_Mace)
Utility.waitmenumode(0.1)
BZ_RfaDK_Alduin_SpellSword.UnequipSpell(BZ_RfaDK_Alduin_SpellSWord_Wave_Purply, 0)
BZ_RfaDK_Alduin_SpellSword.RemoveSpell(BZ_RfaDK_Alduin_SpellSWord_Wave_Purply)
Utility.waitmenumode(0.5)
BZ_RfaDK_Alduin_SpellSword.EquipItem(BZ_RfaDK_SpellSword_Stage_2_Sword_Black, true)
BZ_RfaDK_Alduin_SpellSword.EquipItem(BZ_RfaDK_SpellSword_Stage_2_Sword_White, true)
BZ_RfaDK_Alduin_SpellSword.QueueNiNodeUpdate()
BZ_RfaDK_Alduin_SpellSword_Base.SetCombatStyle(BZ_RfaDK_Alduin_SpellSword_CombatStyle.GetAt(1) as CombatStyle)
BZ_RfaDK_Alduin_SpellSword.AddPerk(Mirel_RfaDK_PerkImmunityBleed)
BZ_RfaDK_SpellSword_Sun_Fire.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ActorBase Property BZ_RfaDK_Alduin_SpellSword_Base auto 
Actor Property BZ_RfaDK_Alduin_SpellSword auto 
ObjectReference Property Marker auto
Activator Property SummonValorTargetFXActivator auto
GlobalVariable Property BZ_RfaDK_SpellSword_G  Auto 
Weapon Property BZ_RfaDK_SpellSword_Stage_2_Sword_Black  Auto 
Weapon Property BZ_RfaDK_SpellSword_Stage_2_Sword_White  Auto  
Weapon Property BZ_RfaDK_Alduin_SpellSword_Dragonbone_Mace  Auto  
Spell Property BZ_RfaDK_Alduin_SpellSWord_Wave_Purply  Auto  
FormList Property BZ_RfaDK_Alduin_SpellSword_CombatStyle Auto	
Scene Property	BZ_RfaDK_SpellSword_Sun_Fire Auto	
Perk Property Mirel_RfaDK_PerkImmunityBleed Auto	