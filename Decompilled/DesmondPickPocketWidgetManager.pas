.info
	.source "DesmondPickPocketWidgetManager.psc"
	.modifyTime 1639131419 ;2021-12-10 17:16:59
	.compileTime 1639131425 ;2021-12-10 17:17:05
	.user "nirn2"
	.computer "WORKSTATION"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object DesmondPickPocketWidgetManager Quest
		.userFlags 0 ;none
		.docString "This script constantly updates the widget"
		.autoState 
		.variableTable
			.variable ::EquipHandler_var spell
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::DPWS_var desmondpickpocketwidgetscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property DPWS desmondpickpocketwidgetscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::DPWS_var
			.endProperty
			.property EquipHandler spell auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EquipHandler_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function OnInit
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp0 actor
						.local ::temp1 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 9
						callstatic game GetPlayer ::temp0 ;0 variable args
						callmethod AddSpell ::temp0 ::temp1 ::EquipHandler_var true ;2 variable args
						; line 10
						callmethod RegisterForSingleUpdate self ::NoneVar 1.00000 ;1 variable args
					.endCode
				.endFunction ;OnInit
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
				.function OnUpdate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 14
						callmethod updateStatus ::DPWS_var ::NoneVar ;0 variable args
						; line 15
						callmethod RegisterForSingleUpdate self ::NoneVar 1.00000 ;1 variable args
					.endCode
				.endFunction ;OnUpdate
			.endState
		.endStateTable
	.endObject
.endObjectTable
