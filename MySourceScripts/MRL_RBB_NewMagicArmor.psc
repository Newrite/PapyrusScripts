Scriptname MRL_RBB_NewMagicArmor extends ActiveMagicEffect

Spell Property MagicArmorSpell Auto

Int Property ScaleWithArmorWithPerk Auto
Int Property ScaleWithoutArmorWithPerk Auto
Int Property ScaleWithArmorWithoutPerk Auto
Int Property ScaleWithoutArmorWithoutPerk Auto

Keyword Property ArmorLight Auto
Keyword Property ArmorHeavy Auto
Keyword Property ArmorShield Auto


Perk Property ImprovedMagicArmor Auto

int BaseManaScale = 0

float damageResistBust = 0.0

bool haveArmor = false
bool havePerk = false

actor effectTarget

int[] Function GetSlots()

    int[] slots = new int[10]

    slots[0] = 0x00000001
    slots[1] = 0x00000002
    slots[2] = 0x00000004
    slots[3] = 0x00000008
    slots[4] = 0x00000010
    slots[5] = 0x00000080
    slots[6] = 0x00000100
    slots[7] = 0x00000800
    slots[8] = 0x00001000
    slots[9] = 0x00002000

    return slots

EndFunction

bool Function FindArmor()

    int[] slots = GetSlots()

    int i = slots.Length

    while i
        i = i - 1
        Form A = effectTarget.GetWornForm(slots[i])

        if (A.HasKeyword(ArmorHeavy) || A.HasKeyword(ArmorLight)) && !A.HasKeyword(ArmorShield)

            return true

        endif

    endWhile

    return false

EndFunction

Function checkArmorPerk()
        
    if FindArmor()
        haveArmor = true
    else
        haveArmor = false
    endif

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
    if (akBaseObject.HasKeyword(ArmorHeavy) || akBaseObject.HasKeyword(ArmorLight)) && !akBaseObject.HasKeyword(ArmorShield)
        Utility.Wait(1.0)
        effectTarget.RemoveSpell(MagicArmorSpell)
        checkArmorPerk()
        getBaseManaScale()
        changeDamageResist()
    endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    if (akBaseObject.HasKeyword(ArmorHeavy) || akBaseObject.HasKeyword(ArmorLight)) && !akBaseObject.HasKeyword(ArmorShield)
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
