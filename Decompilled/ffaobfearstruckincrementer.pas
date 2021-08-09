.info
	.source "FFAOBFearstruckIncrementer.psc"
	.modifyTime 1518028389 ;2018-02-08 01:33:09
	.compileTime 1518028390 ;2018-02-08 01:33:10
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object FFAOBFearstruckIncrementer activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::PlayerRef_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::myquestscript_var ffaobfearstruckcounterscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property myquestscript ffaobfearstruckcounterscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::myquestscript_var
			.endProperty
			.property PlayerRef actor auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PlayerRef_var
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
				.function OnDying
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akKiller actor
					.endParamTable
					.localTable
						.local ::temp0 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 7
						cmp_eq ::temp0 akKiller ::PlayerRef_var 
						jmpf ::temp0 _label0
						; line 8
						callmethod IncrementCounter ::myquestscript_var ::NoneVar ;0 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnDying
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
