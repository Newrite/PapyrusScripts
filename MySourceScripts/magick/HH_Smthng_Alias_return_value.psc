Scriptname HH_Smthng_Alias_return_value extends ReferenceAlias  

GlobalVariable Property HH_Global_Old_Smith Auto
GlobalVariable Property HH_Glob_Menu_Swith Auto
Perk Property HH_Perk_to_100_Smith Auto
SPELL Property HH_Smith_Const  Auto  

Event OnInit()
	RegisterForMenu("Crafting Menu")
	Game.GetPlayer().addperk(HH_Perk_to_100_Smith)
EndEvent


Event OnMenuClose(String MenuName)
	If MenuName == "Crafting Menu" && HH_Glob_Menu_Swith.GetValue() !=0
		Game.GetPlayer().RemoveSpell(HH_Smith_Const)
		HH_Glob_Menu_Swith.SetValue(0)
		;Debug.MessageBox("D"+HH_Global_Old_Smith.GetValue())
	EndIf
EndEvent