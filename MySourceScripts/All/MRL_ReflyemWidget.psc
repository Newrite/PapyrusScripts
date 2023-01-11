Scriptname MRL_ReflyemWidget extends SKI_WidgetBase

import f314PF_PrintF

bool Property Visible = true Auto

float Property Scale = 100.0 Auto

float Property PosHealthX = 110.0 Auto
float Property PosStaminaX = 110.0 Auto
float Property PosMagickaX = 110.0 Auto

float Property PosHealthY = 600.0 Auto
float Property PosStaminaY = 660.0 Auto
float Property PosMagickaY = 630.0 Auto

float Property DefaultScale = 100.0 Auto

float Property DefaultPosHealthX = 110.0 Auto
float Property DefaultPosStaminaX = 110.0 Auto
float Property DefaultPosMagickaX = 110.0 Auto

float Property DefaultPosHealthY = 600.0 Auto
float Property DefaultPosStaminaY = 660.0 Auto
float Property DefaultPosMagickaY = 630.0 Auto

GlobalVariable Property HealthRegen Auto
GlobalVariable Property MagickaRegen Auto
GlobalVariable Property StaminaRegen Auto

function SetDefaultPositionHealthX()
	PosHealthX = DefaultPosHealthX
endFunction

function SetDefaultPositionHealthY()
	PosHealthY = DefaultPosHealthY
endFunction

function SetDefaultPositionStaminaX()
	PosStaminaX = DefaultPosStaminaX
endFunction

function SetDefaultPositionStaminaY()
	PosStaminaY = DefaultPosStaminaY
endFunction

function SetDefaultPositionMagickaX()
	PosMagickaX = DefaultPosMagickaX
endFunction

function SetDefaultPositionMagickaY()
	PosMagickaY = DefaultPosMagickaY
endFunction

function SetDefaultScale()
	Scale = DefaultScale
endFunction

Function Render()
	If self.Ready

		  if !Visible
				UI.SetBool(HUD_MENU, WidgetRoot + "._visible", Visible)
			else

				string health = PrintF1("%.2f", HealthRegen.GetValue() as string)
				string stamina = PrintF1("%.2f", StaminaRegen.GetValue() as string)
				string magicka = PrintF1("%.2f", MagickaRegen.GetValue() as string)

				UI.InvokeString(HUD_MENU, WidgetRoot + ".setHealthText", health)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setStaminaText", stamina)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setMagickaText", magicka)

				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setHealthY", PosHealthY)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setHealthX", PosHealthX)

				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setStaminaY", PosStaminaY)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setStaminaX", PosStaminaX)

				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setMagickaY", PosMagickaY)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setMagickaX", PosMagickaX)

				UI.SetBool(HUD_MENU, WidgetRoot + "._visible", Visible)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".healthText._xscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".healthText._yscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".magickaText._xscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".magickaText._yscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".staminaText._xscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + ".staminaText._yscale", Scale)

			endif

	EndIf
EndFunction

String Function GetWidgetSource()
	Return "skyui/mrlreflyem.swf"
EndFunction

String Function GetWidgetType()
	Return "MRL_ReflyemWidget"
EndFunction