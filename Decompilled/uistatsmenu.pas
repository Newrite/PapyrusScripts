.info
	.source "UIStatsMenu.psc"
	.modifyTime 1406085830 ;2014-07-23 10:23:50
	.compileTime 1427045418 ;2015-03-23 00:30:18
	.user "Brendan"
	.computer "BRENDAN-PC"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object UIStatsMenu UIMenuBase
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable _form Form
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property ROOT_MENU String
				.userFlags 0 ;none
				.docString ""
				.function get
					 ; function type 1
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 3
						return "CustomMenu" 
					.endCode
				.endFunction ;get
			.endProperty
			.property MENU_ROOT String
				.userFlags 0 ;none
				.docString ""
				.function get
					 ; function type 1
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 4
						return "_root.ActorStatsPanelFader.actorStatsPanel." 
					.endCode
				.endFunction ;get
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function UpdateStatsForm
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp2 String
						.local ::temp3 String
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 36
						propget ROOT_MENU self ::temp2 
						propget MENU_ROOT self ::temp3 
						strcat ::temp3 ::temp3 "setActorStatsPanelForm" 
						callstatic ui InvokeForm ::NoneVar ::temp2 ::temp3 _form ;3 variable args
					.endCode
				.endFunction ;UpdateStatsForm
				.function GetMenuName
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 9
						return "UIStatsMenu" 
					.endCode
				.endFunction ;GetMenuName
				.function OnLoadMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param eventName String
						.param strArg String
						.param numArg Float
						.param formArg Form
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 27
						callmethod UpdateStatsForm self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnLoadMenu
				.function GotoState
					 ; function type 0
					.userFlags 0 ;none
					.docString "Function that switches this object to the specified state"
					.return None
					.paramTable
						.param newState String
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						callmethod onEndState self ::NoneVar ;0 variable args
						assign ::State newState 
						callmethod onBeginState self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;GotoState
				.function OpenMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
						.param inForm Form
						.param akReceiver Form
					.endParamTable
					.localTable
						.local ::temp0 Bool
						.local ::temp1 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 13
						assign _form inForm 
						; line 15
						callmethod BlockUntilClosed self ::temp0 ;0 variable args
						not ::temp0 ::temp0 
						cast ::temp0 ::temp0 
						jmpt ::temp0 _label0
						callmethod WaitForReset self ::temp1 ;0 variable args
						not ::temp1 ::temp1 
						cast ::temp0 ::temp1 
					_label0:
						jmpf ::temp0 _label1
						; line 16
						return 0 
						jmp _label1
						; line 19
					_label1:
						callmethod RegisterForModEvent self ::NoneVar "UIStatsMenu_LoadMenu" "OnLoadMenu" ;2 variable args
						; line 20
						callmethod RegisterForModEvent self ::NoneVar "UIStatsMenu_CloseMenu" "OnUnloadMenu" ;2 variable args
						; line 22
						callstatic ui OpenCustomMenu ::NoneVar "statssheetmenu" 0 ;2 variable args
						; line 23
						return 1 
					.endCode
				.endFunction ;OpenMenu
				.function OnUnloadMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param eventName String
						.param strArg String
						.param numArg Float
						.param formArg Form
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 31
						callmethod UnregisterForModEvent self ::NoneVar "UIStatsMenu_LoadMenu" ;1 variable args
						; line 32
						callmethod UnregisterForModEvent self ::NoneVar "UIStatsMenu_CloseMenu" ;1 variable args
					.endCode
				.endFunction ;OnUnloadMenu
				.function GetState
					 ; function type 0
					.userFlags 0 ;none
					.docString "Function that returns the current state"
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						return ::State 
					.endCode
				.endFunction ;GetState
			.endState
		.endStateTable
	.endObject
.endObjectTable
