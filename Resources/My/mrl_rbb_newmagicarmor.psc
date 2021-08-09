Scriptname MRL_RBB_NewMagicArmor extends ActiveMagicEffect

Spell Property MagicArmorSpell Auto

Int Property ScaleWithArmorWithPerk Auto
Int Property ScaleWithoutArmorWithPerk Auto
Int Property ScaleWithArmorWithoutPerk Auto
Int Property ScaleWithoutArmorWithoutPerk Auto

Keyword Property ArmorLight Auto
Keyword Property ArmorHeavy Auto
Keyword Property ArmorShield Auto


Perk Property BlankCheckPerk Auto
Perk Property ImprovedMagicArmor Auto

int BaseManaScale = 0

float damageResistBust = 0.0

bool haveArmor = false
bool havePerk = false

actor effectTarget

Function checkArmorPerk()
    If !effectTarget.HasPerk(BlankCheckPerk)
        
        if effectTarget.WornHasKeyword(ArmorLight) || effectTarget.WornHasKeyword(ArmorHeavy)
            haveArmor = true
        else
            haveArmor = false
        endif

    EndIf

    if effectTarget.HasPerk(ImprovedMagicArmor)
        havePerk = true
    else
        havePerk = false
    endif

EndFunction

Function getBaseManaScale()

    if haveArmor && havePerk
        BaseManaScale = ScaleWithArmorWithPerk
    elseif !haveArmor && !havePerk
        BaseManaScale = ScaleWithoutArmorWithoutPerk
    elseIf havePerk && !haveArmor
        BaseManaScale = ScaleWithoutArmorWithPerk
    else
        BaseManaScale = ScaleWithArmorWithoutPerk
    endif

EndFunction

Function changeDamageResist()

    damageResistBust = effectTarget.GetBaseAV("Magicka") * BaseManaScale
    MagicArmorSpell.SetNthEffectMagnitude(0, damageResistBust)
    effectTarget.AddSpell(MagicArmorSpell, false)
    

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akTarget.HasSpell(MagicArmorSpell)
        akTarget.RemoveSpell(MagicArmorSpell)
    endif
    RegisterForMenu("StatsMenu")
    effectTarget = akTarget
    checkArmorPerk()
    getBaseManaScale()
    changeDamageResist()
endevent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    Utility.Wait(1.5)
    if ( akBaseObject.HasKeyword(ArmorHeavy) || akBaseObject.HasKeyword(ArmorLight) ) && !akBaseObject.HasKeyword(ArmorShield)
        Utility.Wait(1.0)
        effectTarget.RemoveSpell(MagicArmorSpell)
        checkArmorPerk()
        getBaseManaScale()
        changeDamageResist()
    endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    Utility.Wait(1.5)
    if ( akBaseObject.HasKeyword(ArmorHeavy) || akBaseObject.HasKeyword(ArmorLight) ) && !akBaseObject.HasKeyword(ArmorShield)
        effectTarget.RemoveSpell(MagicArmorSpell)
        checkArmorPerk()
        getBaseManaScale()
        changeDamageResist()
    endif
EndEvent

Event OnMenuOpen(String MenuName)
    If MenuName == "StatsMenu"
        effectTarget.RemoveSpell(MagicArmorSpell)
        checkArmorPerk()
        getBaseManaScale()
        changeDamageResist()
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    effectTarget.RemoveSpell(MagicArmorSpell)
    While effectTarget.HasSpell(MagicArmorSpell)
        effectTarget.RemoveSpell(MagicArmorSpell)
    EndWhile
EndEvent
