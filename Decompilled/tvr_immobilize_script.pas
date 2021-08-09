.info
	.source "TVR_Immobilize_Script.psc"
	.modifyTime 1592658404 ;2020-06-20 20:06:44
	.compileTime 1592658405 ;2020-06-20 20:06:45
	.user "maxim"
	.computer "CANOPUS"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object TVR_Immobilize_Script ActiveMagicEffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::TVR_Violence_Descriptor_Chained_var sound
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::BookShelfBook07_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property BookShelfBook07 keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::BookShelfBook07_var
			.endProperty
			.property TVR_Violence_Descriptor_Chained sound auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::TVR_Violence_Descriptor_Chained_var
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
				.function OnEffectFinish
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akTarget Actor
						.param akCaster Actor
					.endParamTable
					.localTable
						.local ::temp10 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 24
						callmethod HasEffectKeyword akTarget ::temp10 ::BookShelfBook07_var ;1 variable args
						not ::temp10 ::temp10 
						jmpf ::temp10 _label0
						; line 25
						callmethod ClearKeepOffsetFromActor akTarget ::NoneVar ;0 variable args
						; line 26
						callmethod SetDontMove akTarget ::NoneVar false ;1 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnEffectFinish
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
						.param akTarget Actor
						.param akCaster Actor
					.endParamTable
					.localTable
						.local ::temp0 Float
						.local ::temp1 Float
						.local ::temp2 Float
						.local ::temp3 Float
						.local ::temp4 Float
						.local ::temp5 Float
						.local ::temp6 Float
						.local ::temp7 Float
						.local ::NoneVar None
						.local ::temp8 objectreference
						.local ::temp9 Int
					.endLocalTable
					.code
						; line 12
						cast ::temp0 0 
						cast ::temp1 0 
						cast ::temp2 0 
						cast ::temp3 0 
						cast ::temp4 0 
						cast ::temp5 0 
						cast ::temp6 50 
						cast ::temp7 100 
						callmethod KeepOffsetFromActor akTarget ::NoneVar akTarget ::temp0 ::temp1 ::temp2 ::temp3 ::temp4 ::temp5 ::temp6 ::temp7 ;9 variable args
						; line 13
						callmethod SetDontMove akTarget ::NoneVar true ;1 variable args
						; line 14
						jmpf ::TVR_Violence_Descriptor_Chained_var _label0
						; line 15
						cast ::temp8 akTarget 
						callmethod Play ::TVR_Violence_Descriptor_Chained_var ::temp9 ::temp8 ;1 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
