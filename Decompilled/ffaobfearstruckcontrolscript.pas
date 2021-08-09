.info
	.source "FFAOBFearstruckControlScript.psc"
	.modifyTime 1518028221 ;2018-02-08 01:30:21
	.compileTime 1518028222 ;2018-02-08 01:30:22
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object FFAOBFearstruckControlScript activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::FFAOBFearstruckMadSpell_var spell
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::PlayerRef_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::FFAOBFearstruckKillCount_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property PlayerRef actor auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PlayerRef_var
			.endProperty
			.property FFAOBFearstruckMadSpell spell auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBFearstruckMadSpell_var
			.endProperty
			.property FFAOBFearstruckKillCount globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::FFAOBFearstruckKillCount_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
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
				.function OnAnimationEvent
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akSource objectreference
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp2 objectreference
						.local ::temp3 Bool
						.local ::temp4 Bool
						.local ::temp5 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 12
						cast ::temp2 ::PlayerRef_var 
						cmp_eq ::temp3 akSource ::temp2 
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label0
						cmp_eq ::temp4 asEventName "bashRelease" 
						cast ::temp3 ::temp4 
					_label0:
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label1
						callmethod GetValue ::FFAOBFearstruckKillCount_var ::temp5 ;0 variable args
						cmp_gt ::temp4 ::temp5 4.00000 
						cast ::temp3 ::temp4 
					_label1:
						jmpf ::temp3 _label2
						; line 13
						cast ::temp2 ::PlayerRef_var 
						callmethod Cast ::FFAOBFearstruckMadSpell_var ::NoneVar ::temp2 none ;2 variable args
						; line 14
						callmethod SetValue ::FFAOBFearstruckKillCount_var ::NoneVar 0.000000 ;1 variable args
						jmp _label2
					_label2
					.endCode
				.endFunction ;OnAnimationEvent
				.function OnEffectStart
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akTarget actor
						.param akCaster actor
					.endParamTable
					.localTable
						.local ::temp0 objectreference
						.local ::temp1 Bool
					.endLocalTable
					.code
						; line 8
						cast ::temp0 ::PlayerRef_var 
						callmethod RegisterForAnimationEvent self ::temp1 ::temp0 "bashRelease" ;2 variable args
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
