ScriptName BloodPotionReuseScript Extends ActiveMagicEffect
 
MiscObject Property ItemToAdd Auto
Int Property ItemCount = 1 Auto
Bool Property Silent = False Auto
 
Event OnEffectStart(Actor Target, Actor Caster)
    Caster.AddItem(ItemToAdd, ItemCount, Silent)
EndEvent