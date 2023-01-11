.info
	.source "TVR_Pull_Script.psc"
	.modifyTime 1592730986 ;2020-06-21 16:16:26
	.compileTime 1592730987 ;2020-06-21 16:16:27
	.user "maxim"
	.computer "CANOPUS"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object TVR_Pull_Script activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::TVR_Hit_var sound
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_DistanceInFront_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::TVR_Speed_var Float
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property TVR_Speed Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Speed_var
			.endProperty
			.property TVR_DistanceInFront Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_DistanceInFront_var
			.endProperty
			.property TVR_Hit sound auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Hit_var
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
						.local ::temp1 Float
						.local ::temp2 Float
						.local ::NoneVar None
						.local ::temp3 objectreference
						.local ::temp4 Int
						.local CasterAngle Float
						.local XLoc Float
						.local YLoc Float
						.local ZLoc Float
					.endLocalTable
					.code
						; line 15
						callmethod GetAngleZ akCaster ::temp0 ;0 variable args
						assign CasterAngle ::temp0 
						; line 17
						callmethod GetPositionX akCaster ::temp0 ;0 variable args
						callstatic math Sin ::temp1 CasterAngle ;1 variable args
						fmul ::temp1 ::TVR_DistanceInFront_var ::temp1 
						fadd ::temp0 ::temp0 ::temp1 
						assign XLoc ::temp0 
						; line 18
						callmethod GetPositionY akCaster ::temp1 ;0 variable args
						callstatic math Cos ::temp0 CasterAngle ;1 variable args
						fmul ::temp0 ::TVR_DistanceInFront_var ::temp0 
						fadd ::temp1 ::temp1 ::temp0 
						assign YLoc ::temp1 
						; line 19
						callmethod GetPositionZ akCaster ::temp0 ;0 variable args
						assign ZLoc ::temp0 
						; line 20
						cast ::temp1 180 
						fadd ::temp0 CasterAngle ::temp1 
						cast ::temp1 0 
						cast ::temp2 0 
						callmethod TranslateTo akTarget ::NoneVar XLoc YLoc ZLoc ::temp1 ::temp2 ::temp0 ::TVR_Speed_var 0.000000 ;8 variable args
						; line 22
						cast ::temp3 akTarget 
						callmethod Play ::TVR_Hit_var ::temp4 ::temp3 ;1 variable args
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
