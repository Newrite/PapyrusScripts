Scriptname HH_melle_enc_Uscript extends ActiveMagicEffect  

Actor Property PlayerRef  Auto
Spell Property SpellToApply Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
;Debug.Notification("Эффект есть")
;if akCaster==PlayerRef
;Debug.Notification("Всё работет")
;endif
SpellToApply.Cast(akCaster, akTarget)
EndEvent
