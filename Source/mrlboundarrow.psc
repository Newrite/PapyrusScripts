Scriptname mrlboundarrow extends ActiveMagicEffect

Ammo Property boundAmmo Auto

Event OnEffectStart(Actor ckTarget, Actor ckCaster)

    Utility.Wait(0.2)
    ckCaster.AddItem(boundAmmo, 100, true)
	Utility.Wait(0.2)
	ckCaster.EquipItem(boundAmmo, true, true)

EndEvent

Event OnEffectFinish(Actor ckTarget, Actor ckCaster)

		ckCaster.RemoveItem(boundAmmo, ckCaster.getItemCount(boundAmmo), true)
	test()
EndEvent