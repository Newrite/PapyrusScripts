.info
	.source "TVR_ShadowDance_Script.psc"
	.modifyTime 1592675618 ;2020-06-21 00:53:38
	.compileTime 1592675619 ;2020-06-21 00:53:39
	.user "maxim"
	.computer "CANOPUS"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object TVR_ShadowDance_Script activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::TVR_AngleDelta_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_DistanceInFront_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::PlayerRef_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_Speed_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_ImpactSound_var sound
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property TVR_DistanceInFront Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_DistanceInFront_var
			.endProperty
			.property TVR_AngleDelta Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_AngleDelta_var
			.endProperty
			.property TVR_Speed Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Speed_var
			.endProperty
			.property TVR_ImpactSound sound auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_ImpactSound_var
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
						.local ::temp0 Float
						.local ::temp1 Float
						.local ::temp2 Float
						.local ::temp3 Float
						.local ::temp4 Float
						.local ::NoneVar None
						.local ::temp5 objectreference
						.local ::temp6 Int
						.local TargetAngleZ Float
						.local TargetPosX Float
						.local TargetPosY Float
						.local TargetPosZ Float
						.local EndLocX Float
						.local EndLocY Float
					.endLocalTable
					.code
						; line 18
						callmethod GetAngleZ akTarget ::temp0 ;0 variable args
						fadd ::temp0 ::temp0 ::TVR_AngleDelta_var 
						assign TargetAngleZ ::temp0 
						; line 20
						callmethod GetPositionX akTarget ::temp0 ;0 variable args
						assign TargetPosX ::temp0 
						; line 21
						callmethod GetPositionY akTarget ::temp0 ;0 variable args
						assign TargetPosY ::temp0 
						; line 22
						callmethod GetPositionZ akTarget ::temp0 ;0 variable args
						assign TargetPosZ ::temp0 
						; line 24
						callstatic math Sin ::temp0 TargetAngleZ ;1 variable args
						fmul ::temp0 ::TVR_DistanceInFront_var ::temp0 
						assign EndLocX ::temp0 
						; line 25
						callstatic math Cos ::temp0 TargetAngleZ ;1 variable args
						fmul ::temp0 ::TVR_DistanceInFront_var ::temp0 
						assign EndLocY ::temp0 
						; line 27
						fadd ::temp0 TargetPosX EndLocX 
						fadd ::temp1 TargetPosY EndLocY 
						cast ::temp2 0 
						cast ::temp3 0 
						cast ::temp4 0 
						callmethod TranslateTo akTarget ::NoneVar ::temp0 ::temp1 TargetPosZ ::temp2 ::temp3 TargetAngleZ ::TVR_Speed_var ::temp4 ;8 variable args
						; line 29
						cast ::temp5 akTarget 
						callmethod Play ::TVR_ImpactSound_var ::temp6 ::temp5 ;1 variable args
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
