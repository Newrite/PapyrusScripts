.info
	.source "FFAOBFearstruckActivator.psc"
	.modifyTime 1519728769 ;2018-02-27 17:52:49
	.compileTime 1519728770 ;2018-02-27 17:52:50
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object FFAOBFearstruckActivator ObjectReference
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::StaticFearstruckRef_var ObjectReference
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBFearstruck_var armor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property StaticFearstruckRef ObjectReference auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::StaticFearstruckRef_var
			.endProperty
			.property FFAOBFearstruck armor auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBFearstruck_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function OnActivate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akActionRef ObjectReference
					.endParamTable
					.localTable
						.local ::NoneVar None
						.local ::temp0 actor
						.local ::temp1 ObjectReference
						.local ::temp2 Bool
						.local ::temp3 form
					.endLocalTable
					.code
						; line 8
						callmethod GotoState self ::NoneVar "Inactive" ;1 variable args
						; line 9
						callstatic game Getplayer ::temp0 ;0 variable args
						cast ::temp1 ::temp0 
						cmp_eq ::temp2 akActionRef ::temp1 
						jmpf ::temp2 _label0
						; line 10
						callmethod Disable ::StaticFearstruckRef_var ::NoneVar false ;1 variable args
						; line 11
						cast ::temp3 ::FFAOBFearstruck_var 
						callmethod AddItem akActionRef ::NoneVar ::temp3 1 false ;3 variable args
						; line 12
						callmethod Disable self ::NoneVar false ;1 variable args
						jmp _label0
						; line 14
					_label0:
						callmethod GotoState self ::NoneVar "" ;1 variable args
					.endCode
				.endFunction ;OnActivate
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
			.endState
			.state Inactive
				.function OnActivate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akActionRef ObjectReference
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;OnActivate
			.endState
		.endStateTable
	.endObject
.endObjectTable
