.info
	.source "WB_InvisibleManagerInCombat_Script.psc"
	.modifyTime 1558874405 ;2019-05-26 19:40:05
	.compileTime 1558874444 ;2019-05-26 19:40:44
	.user "PewPewPew"
	.computer "DESKTOP-Q3BIL1T"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object wb_invisiblemanagerincombat_script activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::WB_Destruction_Crackle_Global_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_FormList_var formlist
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
			.property WB_Destruction_Crackle_Global globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_Destruction_Crackle_Global_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
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
						.local ::temp1 Bool
						.local ::temp2 Int
						.local ::temp3 Bool
						.local total_cost Float
						.local Magicka Float
						.local i Int
						.local bEnd Bool
						.local ::temp4 form
						.local ::temp5 spell
						.local TheSpell spell
						.local ::temp6 objectreference
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 12
						assign total_cost 0.000000 
						; line 13
						callmethod GetAV akTarget ::temp0 "Magicka" ;1 variable args
						assign Magicka ::temp0 
						; line 16
						assign i 0 
						; line 17
						assign bEnd false 
						; line 18
					_label4:
						not ::temp1 bEnd 
						cast ::temp1 ::temp1 
						jmpf ::temp1 _label0
						callmethod GetSize ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp2 ;0 variable args
						cmp_lt ::temp3 i ::temp2 
						cast ::temp1 ::temp3 
					_label0:
						jmpf ::temp1 _label1
						; line 19
						callmethod GetAt ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp4 i ;1 variable args
						cast ::temp5 ::temp4 
						assign TheSpell ::temp5 
						; line 20
						callmethod GetEffectiveMagickaCost TheSpell ::temp2 akTarget ;1 variable args
						cast ::temp0 ::temp2 
						fadd ::temp0 total_cost ::temp0 
						assign total_cost ::temp0 
						; line 22
						comp_gte ::temp3 Magicka total_cost 
						jmpf ::temp3 _label2
						; line 23
						cast ::temp6 akTarget 
						callmethod Cast TheSpell ::NoneVar ::temp6 none ;2 variable args
						jmp _label3
						; line 25
					_label2:
						assign bEnd true 
						; line 28
					_label3:
						iadd ::temp2 i 1 
						assign i ::temp2 
						jmp _label4
						; line 31
					_label1:
						callmethod DamageAV akTarget ::NoneVar "Magicka" total_cost ;2 variable args
					.endCode
				.endFunction ;OnEffectStart
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
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 41
						callmethod SetValue ::WB_Destruction_Crackle_Global_var ::NoneVar 0.000000 ;1 variable args
					.endCode
				.endFunction ;OnEffectFinish
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
		.endStateTable
	.endObject
.endObjectTable
