.info
	.source "FFAOBGoldbrandActivatorScript.psc"
	.modifyTime 1519728793 ;2018-02-27 17:53:13
	.compileTime 1519728794 ;2018-02-27 17:53:14
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object FFAOBGoldbrandActivatorScript ObjectReference
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::FFAOBGoldbrandTaken_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBGoldbrand1H_var weapon
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBGoldbrandActivatorMessage_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBGoldbrand2H_var weapon
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable Choice Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property FFAOBGoldbrand1H weapon auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBGoldbrand1H_var
			.endProperty
			.property FFAOBGoldbrandTaken globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBGoldbrandTaken_var
			.endProperty
			.property FFAOBGoldbrand2H weapon auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBGoldbrand2H_var
			.endProperty
			.property FFAOBGoldbrandActivatorMessage message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBGoldbrandActivatorMessage_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
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
						.local ::temp3 Int
						.local ::temp4 Bool
						.local ::temp6 Bool
						.local ::temp5 form
					.endLocalTable
					.code
						; line 11
						callmethod GotoState self ::NoneVar "Inactive" ;1 variable args
						; line 12
						callstatic game Getplayer ::temp0 ;0 variable args
						cast ::temp1 ::temp0 
						cmp_eq ::temp2 akActionRef ::temp1 
						jmpf ::temp2 _label0
						; line 13
						callmethod show ::FFAOBGoldbrandActivatorMessage_var ::temp3 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ;9 variable args
						assign Choice ::temp3 
						; line 14
						cmp_eq ::temp4 Choice 0 
						jmpf ::temp4 _label1
						; line 15
						cast ::temp5 ::FFAOBGoldbrand1H_var 
						callmethod AddItem akActionRef ::NoneVar ::temp5 1 false ;3 variable args
						jmp _label2
						; line 16
					_label1:
						cmp_eq ::temp6 Choice 1 
						jmpf ::temp6 _label2
						; line 17
						cast ::temp5 ::FFAOBGoldbrand2H_var 
						callmethod AddItem akActionRef ::NoneVar ::temp5 1 false ;3 variable args
						jmp _label2
						; line 19
					_label2:
						callmethod SetValue ::FFAOBGoldbrandTaken_var ::NoneVar 1.00000 ;1 variable args
						; line 20
						callmethod Disable self ::NoneVar false ;1 variable args
						jmp _label0
						; line 22
					_label0:
						callmethod GotoState self ::NoneVar "" ;1 variable args
					.endCode
				.endFunction ;OnActivate
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
