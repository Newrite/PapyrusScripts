Scriptname HH_PR_Equiep_Weapon_In_hand extends activemagiceffect  

Actor Property PlayerRef  Auto

MiscObject Property Misc_Throw Auto   

Weapon Property In_Hand Auto   

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PlayerRef.RemoveItem(Misc_Throw, 1)
	PlayerRef.AddItem(In_Hand, 1)
	PlayerRef.EquipItemEx(In_Hand, 1, false, false )
EndEvent