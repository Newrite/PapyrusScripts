Scriptname REQ_SpecialEquipment extends Actor
{this script can be attached to templated actors which require special items, but inherit their inventory}

MiscObject[] Property misc Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property misc_amount Auto
Key[] Property keys Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property keys_amount Auto
Armor[] Property armors Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property armors_amount Auto
Weapon[] Property weapons Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property weapons_amount Auto
Light[] Property lights Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property lights_amount Auto
Book[] Property books Auto
{items the actor should get, "Amount" with the same index controls the item count}
Int[] Property books_amount Auto

Bool Initdone = False

Event OnLoad()
	If Self != None && !InitDone
		int i = 0
		If misc[0] != None
			While i < misc.Length
				Self.Additem(misc[i], misc_amount[i])
				i += 1
			EndWhile
		EndIf
		i = 0
		If keys[0] != None
			While i < keys.Length
				Self.Additem(keys[i], keys_amount[i])
				i += 1
			EndWhile
		EndIf
		i = 0
		If armors[0] != None
			While i < armors.Length
				Self.Additem(armors[i], armors_amount[i])
				i += 1
			EndWhile
		EndIf
		i = 0
		If weapons[0] != None
			While i < weapons.Length
				Self.Additem(weapons[i], weapons_amount[i])
				i += 1
			EndWhile
		EndIf
		i = 0
		If lights[0] != None
			While i < lights.Length
				Self.Additem(lights[i], lights_amount[i])
				i += 1
			EndWhile
		EndIf
		i = 0
		If books[0] != None
			While i < books.Length
				Self.Additem(books[i], books_amount[i])
				i += 1
			EndWhile
		EndIf
		InitDone = True
	EndIf
EndEvent
