Scriptname BoundCrossbowScript extends ActiveMagicEffect

Weapon Property boundCrossbow Auto
Ammo Property boundAmmo Auto
SPELL Property spellBoundCrossbow Auto

Event OnEffectStart(Actor ckTarget, Actor ckCaster)

    Utility.Wait(0.2)
    ckCaster.EquipItem(boundCrossbow, false, true)
    ckCaster.AddItem(boundAmmo, 100, true)
	ckCaster.EquipItem(boundAmmo, true, true)

EndEvent

Event OnEffectFinish(Actor ckTarget, Actor ckCaster)

    if (ckCaster.GetEquippedWeapon() == boundCrossbow)
		ckCaster.EquipSpell(spellBoundCrossbow, 0)
		ckCaster.RemoveItem(boundAmmo, ckCaster.getItemCount(boundAmmo), true)
    else
		ckCaster.RemoveItem(boundCrossbow, 1, true)
		ckCaster.RemoveItem(boundAmmo, ckCaster.getItemCount(boundAmmo), true)
    endif

EndEvent