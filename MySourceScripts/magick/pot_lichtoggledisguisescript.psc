Scriptname POT_LichToggleDisguiseScript extends activemagiceffect 

Spell Property POT_LichDisguiseForm Auto  

Event OnEffectStart(actor Target, actor Caster)
    If Target.HasSpell(POT_LichDisguiseForm)
        Target.RemoveSpell(POT_LichDisguiseForm)
    Else
        Target.AddSpell(POT_LichDisguiseForm, False)
    EndIf
EndEvent

