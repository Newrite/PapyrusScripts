ScriptName MRL_RBB_AddDestructionPotion Extends ActiveMagicEffect

Potion Property ItemToAdd Auto
Potion Property ItemToRemove Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddItem(ItemToAdd, akTarget.GetItemCount(ItemToRemove), true)
	akTarget.RemoveItem(ItemToRemove, akTarget.GetItemCount(ItemToRemove), true)
EndEvent
