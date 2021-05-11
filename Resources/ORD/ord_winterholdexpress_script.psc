Scriptname ORD_WinterholdExpress_Script extends ActiveMagicEffect  

; -----

Keyword Property MagicArmor Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_Alt_WinterholdExpress_Global_IsFlying Auto
Float[] Property ORD_WindhelmX Auto
Float[] Property ORD_WindhelmY Auto
Float[] Property ORD_WindhelmZ Auto

; -----

Int TranslationStage = -1

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(MagicArmor)
		ORD_Alt_WinterholdExpress_Global_IsFlying.SetValue(1)
		TranslationStage = -1
		PlayerRef.TranslateTo(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ() + 1000, 0, 0, 0, 3000)
	EndIf

EndEvent

; -----

Event OnTranslationAlmostComplete()

	TranslationStage += 1
	Debug.Notification("TranslationStage = " + TranslationStage)
	If TranslationStage < 6
		PlayerRef.StopTranslation()
		PlayerRef.TranslateTo(ORD_WindhelmX[TranslationStage], ORD_WindhelmY[TranslationStage], ORD_WindhelmZ[TranslationStage], 0, 0, 0, 3000)
	Else
		ORD_Alt_WinterholdExpress_Global_IsFlying.SetValue(0)
	EndIf	

EndEvent

; -----