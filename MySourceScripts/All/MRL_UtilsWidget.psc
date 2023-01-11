Scriptname MRL_UtilsWidget extends SKI_WidgetBase

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

Actor Property PlayerRef Auto

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

string Function GetStatString(string avString)
		
	float currentAv = PlayerRef.GetActorValue(avString)
	float maxAv = currentAv / PlayerRef.GetActorValuePercentage(avString)

	return ((currentAv as int) as string + " / " + ((maxAv as int) as string))
	
EndFunction

Function Render()
	If self.Ready

		  if !Visible
				UI.SetBool(HUD_MENU, WidgetRoot + "._visible", Visible)
			else

				string health = GetStatString("health")
				string stamina = GetStatString("stamina")
				string magicka = GetStatString("magicka")

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
				UI.SetFloat(HUD_MENU, WidgetRoot + "._xscale", Scale)
				UI.SetFloat(HUD_MENU, WidgetRoot + "._yscale", Scale)

			endif

	EndIf
EndFunction

String Function GetWidgetSource()
	Return "skyui/utilwidgets.swf"
EndFunction

String Function GetWidgetType()
	Return "MRL_UtilsWidget"
EndFunction