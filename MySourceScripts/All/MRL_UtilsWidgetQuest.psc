scriptName MRL_UtilsWidgetQuest extends Quest

MRL_UtilsWidget Property InnerWidget Auto
Float Property UpdateRate = 0.5 Auto
Float Property DefaultUpdateRate = 0.5 Auto

function OnInit()
	self.RegisterForSingleUpdate(UpdateRate)
endFunction

function OnUpdate()
	InnerWidget.Render()
	self.RegisterForSingleUpdate(UpdateRate)
endFunction
