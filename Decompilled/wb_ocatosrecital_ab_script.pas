.info
	.source "WB_OcatosRecital_Ab_Script.psc"
	.modifyTime 1429960955 ;2015-04-25 18:22:35
	.compileTime 1429960956 ;2015-04-25 18:22:36
	.user "Maximilian"
	.computer "MONETA"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object WB_OcatosRecital_Ab_Script activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable i Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_FormList_var formlist
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable TheSpell Spell
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property WB_AlterationMetamagic_OcatosRecital_FormList formlist auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_FormList_var
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
						.local ::temp0 Int
						.local ::temp1 Bool
						.local ::temp2 form
						.local ::temp3 Spell
						.local ::temp4 objectreference
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 16
						assign i 0 
						; line 17
					_label1:
						callmethod GetSize ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp0 ;0 variable args
						cmp_lt ::temp1 i ::temp0 
						jmpf ::temp1 _label0
						; line 18
						callmethod GetAt ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp2 i ;1 variable args
						cast ::temp3 ::temp2 
						assign TheSpell ::temp3 
						; line 19
						cast ::temp4 akTarget 
						callmethod Cast TheSpell ::NoneVar ::temp4 none ;2 variable args
						; line 20
						iadd ::temp0 i 1 
						assign i ::temp0 
						jmp _label1
					_label0
					.endCode
				.endFunction ;OnEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
