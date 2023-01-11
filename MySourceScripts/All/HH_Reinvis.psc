Scriptname HH_Reinvis extends activemagiceffect  
Spell Property Reinv  Auto 
Event onEffectStart(actor Target, actor Caster)
Reinv.cast(Game.GetPlayer(), Game.GetPlayer())
EndEvent