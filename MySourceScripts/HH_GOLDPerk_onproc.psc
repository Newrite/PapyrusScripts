Scriptname HH_GOLDPerk_onproc extends activemagiceffect  

Event onEffectStart(actor Target, actor Caster)
if Target.GetItemCount(INV)<1
int random = Utility.RandomInt(50, 75)
Target.additem(Gold,random, true)
endif
Target.additem(Inv,1, true)
EndEvent

MiscObject Property INV  Auto  
MiscObject Property Gold  Auto