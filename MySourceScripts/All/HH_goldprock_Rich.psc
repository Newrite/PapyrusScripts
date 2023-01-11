Scriptname HH_goldprock_Rich extends activemagiceffect  

Event onEffectStart(actor Target, actor Caster)
if Target.GetItemCount(INV)<1
int random = Utility.RandomInt(100, 150)
Target.additem(Gold,random, true)
endif
Target.additem(Inv,1, true)
EndEvent

MiscObject Property INV  Auto  
MiscObject Property Gold  Auto