Scriptname DualWieldParryingSKSEQuestScript extends Quest Conditional

int blockKeyCode = 47			
Actor Property playerRef auto
Idle Property BlockingStart auto
Idle Property StopBlocking auto
bool Property blockkeypressed Auto Conditional
bool really



Function InitializeMod()
	;							Debug.StartScriptProfiling("DualWieldParryingSKSEQuestScript")
	;							Debug.Notification("Initialization started")
	RegisterForKey(blockKeyCode)
	;							Debug.Notification("BlockKeyCode Registered")
	RegisterForControl("Right Attack/Block")
	;							Debug.Notification("Right Attack/Block registered")
	RegisterForControl("Left Attack/Block")
EndFunction


Function setBlockKeyCode(int newKeyCode)
	;							Debug.Notification("setBlockKeyCode started")
	UnregisterForKey(blockKeyCode)
	;							Debug.Notification("unregistered previous key")
	blockKeyCode = newKeyCode
	RegisterForKey(blockKeyCode)
	;							Debug.Notification("registered new key")
EndFunction


Function deactivateMod()
	;							Debug.Notification("deactivateMod started")
	UnregisterForKey(blockKeyCode)
	;							Debug.Notification("unregistered for block key")
	UnregisterForControl("Right Attack/Block")
	;							Debug.Notification("unregistered for Right Attack/Block")
EndFunction
	
Function activateMod()
	;							Debug.Notification("activateMod started")
	RegisterForKey(blockKeyCode)
	;							Debug.Notification("registered blockKeyCode")
	RegisterForControl("Right Attack/Block")
	;							Debug.Notification("registered Right Attack/Block")
	really=False
	blockkeypressed=false
	
EndFunction

Event OnKeyDown(int keyCode)
	;							Debug.Notification("onKeyDown Started")
	blockkeypressed=true
	;If(playerRef.IsWeaponDrawn()||playerRef.GetAnimationVariableBool("IsEquipping"))
		If(keyCode == blockKeyCode)
	;							Debug.Notification("Weapon is drawn and Blockkeycode is pressed")
			While(Input.IsKeyPressed(blockKeyCode) && !playerRef.PlayIdle(BlockingStart))
	;							Debug.Notification("retrying to start blocking")
			Endwhile
	;		If(playerRef.GetAnimationVariableBool("Isblocking"))
	;							Debug.Notification("Successfully started blocking")
	;		Else
	;							Debug.Notification("Unable to start blocking second")
	;		EndIf
		Else
		UnregisterForKey(keyCode)
	;							Debug.Notification("unregistered for wrong key")
		EndIf
	;EndIf
EndEvent

Event OnControlDown(String controlname)
	If(controlname == "Left Attack/Block")
		blockkeypressed=true
		really=true
	EndIf
EndEvent

Event OnKeyUp(int keyCode, float HoldTime)
	;							Debug.Notification("OnKeyUp started")
	blockkeypressed=false||really
	If(keyCode == blockKeyCode)
		while(playerRef.GetAnimationVariableBool("Isblocking"))
			playerRef.PlayIdle(StopBlocking)
	;							Debug.Notification("trying to stop blocking")
		EndWhile
	;	If(!playerRef.GetAnimationVariableBool("Isblocking"))
	;							Debug.Notification("Successfully stopped blocking")
	;	Else
	;							Debug.Notification("Unable to stop blocking")
	;	EndIf

	EndIf
EndEvent


Event OnControlUp(String controlname, float holdtime)
	;							Debug.Notification("Started OnControlUp")
	If(controlname == "Left Attack/Block" )
		blockkeypressed=(false||Input.IsKeyPressed(blockKeyCode))
		really=false
	ElseIf(Input.IsKeyPressed(blockKeyCode))
	;							Debug.Notification("Blockkeycode is pressed")
		While(Input.IsKeyPressed(blockKeyCode) && !playerRef.GetAnimationVariableBool("IsBlocking"))
	;							Debug.Notification("trying to restart blocking")
			playerRef.PlayIdle(BlockingStart)
		EndWhile
	;							Debug.Notification("successfully restarted blocking")
	EndIf
	;							Debug.Notification("OnControlup done")
EndEvent
