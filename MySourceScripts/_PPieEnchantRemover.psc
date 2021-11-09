;/ Decompiled by Champollion V1.0.1
Source   : _PPieEnchantRemover.psc
Modified : 2020-12-18 18:20:47
Compiled : 2020-12-18 18:20:50
User     : pixel
Computer : chii-4
/;
scriptName _PPieEnchantRemover extends ActiveMagicEffect

;-- Properties --------------------------------------
message property ppMsgD auto
message property ppMsgA auto
message property ppMsgB auto
message property ppMsgC auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function onEffectStart(actor akTarget, actor akCaster)

	if akTarget == game.GetPlayer()
		form ppWepForm = akTarget.getEquippedObject(1)
		String ppWepName = ppWepForm.getname()
		objectreference ppWepRef = akTarget.dropObject(ppWepForm, 1)
		if (ppWepForm as weapon).getEnchantment()
			debug.notification(ppMsgA.getname())
		elseIf ppWepForm
			if ppWepRef.getEnchantment()
				if ppWepRef
					enchantment ppEnch
					ppWepRef.setEnchantment(ppEnch, 0 as Float)
					debug.notification(ppMsgD.getname())
				endIf
			else
				debug.notification(ppMsgB.getname())
			endIf
		else
			debug.notification(ppMsgC.getname())
		endIf
	endIf
endFunction
