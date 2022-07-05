.info
	.source "FFAOBBoethiahTombScript.psc"
	.modifyTime 1519725712 ;2018-02-27 17:01:52
	.compileTime 1519725713 ;2018-02-27 17:01:53
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object FFAOBBoethiahTombScript ObjectReference
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::EltonbrandKeyword_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::Message2_var String
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable isOpened Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable ::GoldbrandKeyword_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::Message1_var String
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FearstruckActi_var ObjectReference
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBMainQuest_var quest
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property GoldbrandKeyword keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::GoldbrandKeyword_var
			.endProperty
			.property Message1 String auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::Message1_var
			.endProperty
			.property EltonbrandKeyword keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EltonbrandKeyword_var
			.endProperty
			.property Message2 String auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::Message2_var
			.endProperty
			.property FFAOBMainQuest quest auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBMainQuest_var
			.endProperty
			.property FearstruckActi ObjectReference auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FearstruckActi_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function onLoad
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp0 Bool
						.local ::temp1 Bool
					.endLocalTable
					.code
						; line 13
						not ::temp0 isOpened 
						jmpf ::temp0 _label0
						; line 14
						callmethod playAnimation self ::temp1 "SnapClosed" ;1 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;onLoad
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
						.local ::temp2 actor
						.local ::temp3 ObjectReference
						.local ::temp4 Bool
						.local ::NoneVar None
						.local ::temp5 form
						.local ::temp6 Int
						.local ::temp7 Int
						.local ::temp8 Bool
						.local ::temp9 Bool
					.endLocalTable
					.code
						; line 23
						callstatic game Getplayer ::temp2 ;0 variable args
						cast ::temp3 ::temp2 
						cmp_eq ::temp4 akActionRef ::temp3 
						jmpf ::temp4 _label0
						; line 24
						callmethod GotoState self ::NoneVar "Inactive" ;1 variable args
						; line 25
						cast ::temp5 ::EltonbrandKeyword_var 
						callmethod GetItemCount akActionRef ::temp6 ::temp5 ;1 variable args
						cast ::temp8 ::temp6 
						jmpt ::temp8 _label1
						cast ::temp5 ::GoldbrandKeyword_var 
						callmethod GetItemCount akActionRef ::temp7 ::temp5 ;1 variable args
						cast ::temp8 ::temp7 
					_label1:
						jmpf ::temp8 _label2
						; line 26
						assign isOpened true 
						; line 27
						callmethod playAnimation self ::temp9 "OpenStart" ;1 variable args
						; line 28
						callmethod Enable ::FearstruckActi_var ::NoneVar false ;1 variable args
						; line 29
						callmethod SetStage ::FFAOBMainQuest_var ::temp9 100 ;1 variable args
						jmp _label3
						; line 31
					_label2:
						callmethod GetStage ::FFAOBMainQuest_var ::temp6 ;0 variable args
						comp_gte ::temp9 ::temp6 20 
						jmpf ::temp9 _label4
						; line 32
						callstatic debug Messagebox ::NoneVar ::Message1_var ;1 variable args
						jmp _label5
						; line 34
					_label4:
						callstatic debug Messagebox ::NoneVar ::Message2_var ;1 variable args
						; line 36
					_label5:
						callmethod GotoState self ::NoneVar "" ;1 variable args
					_label3:
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnActivate
				.function onReset
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
						; line 19
						callmethod onLoad self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;onReset
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
