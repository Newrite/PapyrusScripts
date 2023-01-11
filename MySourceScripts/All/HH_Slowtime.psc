Scriptname HH_Slowtime extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
Game.DisablePlayerControls(true,true,false,false,false,false,false,false)
Utility.WaitMenuMode(6.0)
self.Dispel()
Game.GetPlayer().DispelSpell(This)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
Game.EnablePlayerControls()
float cst = Game.GetPlayer().GetActorValue("Stamina") 
float X70 = cst*0.3
akTarget.DamageActorValue("Stamina", X70)
endEvent



SPELL Property This  Auto  