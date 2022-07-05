.info
	.source "TVR_PercentageDamage_Script.psc"
	.modifyTime 1593198673 ;2020-06-27 02:11:13
	.compileTime 1593198674 ;2020-06-27 02:11:14
	.user "maxim"
	.computer "CANOPUS"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object TVR_PercentageDamage_Script activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::TVR_ImodDiv_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_Value_var String
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_Fraction_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_Imod_var imagespacemodifier
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property TVR_Value String auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Value_var
			.endProperty
			.property TVR_Imod imagespacemodifier auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Imod_var
			.endProperty
			.property TVR_ImodDiv Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_ImodDiv_var
			.endProperty
			.property TVR_Fraction Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Fraction_var
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
				.function OnEffectStart
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akTarget Actor
						.param akCaster Actor
					.endParamTable
					.localTable
						.local ::temp0 Float
						.local ::NoneVar None
						.local CurrentActorValue Float
						.local ::temp1 Bool
						.local ImodStrength Float
					.endLocalTable
					.code
						; line 14
						callmethod GetActorValue akCaster ::temp0 ::TVR_Value_var ;1 variable args
						assign CurrentActorValue ::temp0 
						; line 15
						fmul ::temp0 CurrentActorValue ::TVR_Fraction_var 
						callmethod DamageActorValue akCaster ::NoneVar ::TVR_Value_var ::temp0 ;2 variable args
						; line 16
						jmpf ::TVR_Imod_var _label0
						; line 17
						fdiv ::temp0 CurrentActorValue ::TVR_ImodDiv_var 
						assign ImodStrength ::temp0 
						; line 18
						cmp_gt ::temp1 ImodStrength 1.50000 
						jmpf ::temp1 _label1
						; line 19
						callmethod Apply ::TVR_Imod_var ::NoneVar 1.50000 ;1 variable args
						jmp _label2
						; line 21
					_label1:
						callmethod Apply ::TVR_Imod_var ::NoneVar ImodStrength ;1 variable args
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
