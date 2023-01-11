.info
	.source "WB_OcatosRecital2_Script.psc"
	.modifyTime 1429961245 ;2015-04-25 18:27:25
	.compileTime 1429961246 ;2015-04-25 18:27:26
	.user "Maximilian"
	.computer "MONETA"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object WB_OcatosRecital2_Script ActiveMagicEffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::WB_AlterationMetamagic_OcatosRecital_Message_Double_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut_var formlist
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_Message_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_Message_TooMany_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_Imod_Outro_var imagespacemodifier
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_SpellMax_var Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_Message_Fail_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::WB_AlterationMetamagic_OcatosRecital_FormList_var formlist
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property WB_SpellMax Int auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_SpellMax_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_Message_Double message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_Message_Double_var
			.endProperty
			.property WB_AlterationMetamagic_Imod_Outro imagespacemodifier auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_Imod_Outro_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_Message_TooMany message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_Message_TooMany_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_Message message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_Message_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_FormList formlist auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_FormList_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_Message_Fail message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_Message_Fail_var
			.endProperty
			.property WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut formlist auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut_var
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
						.local ::temp0 spell
						.local ::temp1 form
						.local ::temp2 Bool
						.local ::temp3 Bool
						.local EquippedSpell spell
						.local ::temp4 Int
						.local ::temp5 Bool
						.local ::NoneVar None
						.local ::temp6 Float
						.local ::temp7 Float
					.endLocalTable
					.code
						; line 20
						callmethod GetEquippedSpell akTarget ::temp0 0 ;1 variable args
						cast ::temp0 ::temp0 
						assign EquippedSpell ::temp0 
						; line 22
						cast ::temp2 EquippedSpell 
						jmpf ::temp2 _label0
						cast ::temp1 EquippedSpell 
						callmethod HasForm ::WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut_var ::temp2 ::temp1 ;1 variable args
						not ::temp2 ::temp2 
						cast ::temp2 ::temp2 
					_label0:
						cast ::temp2 ::temp2 
						jmpf ::temp2 _label1
						callmethod IsHostile EquippedSpell ::temp3 ;0 variable args
						not ::temp3 ::temp3 
						cast ::temp2 ::temp3 
					_label1:
						jmpf ::temp2 _label2
						; line 23
						callmethod GetSize ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp4 ;0 variable args
						cmp_lt ::temp3 ::temp4 ::WB_SpellMax_var 
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label3
						cast ::temp3 EquippedSpell 
					_label3:
						jmpf ::temp3 _label4
						; line 24
						cast ::temp1 EquippedSpell 
						callmethod HasForm ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp5 ::temp1 ;1 variable args
						jmpf ::temp5 _label5
						; line 25
						callmethod Show ::WB_AlterationMetamagic_OcatosRecital_Message_Double_var ::temp4 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ;9 variable args
						jmp _label6
						; line 27
					_label5:
						callmethod Apply ::WB_AlterationMetamagic_Imod_Outro_var ::NoneVar 1.00000 ;1 variable args
						; line 28
						cast ::temp1 EquippedSpell 
						callmethod AddForm ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::NoneVar ::temp1 ;1 variable args
						; line 29
						callmethod GetSize ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp4 ;0 variable args
						cast ::temp6 ::temp4 
						cast ::temp7 ::WB_SpellMax_var 
						callmethod Show ::WB_AlterationMetamagic_OcatosRecital_Message_var ::temp4 ::temp6 ::temp7 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ;9 variable args
					_label6:
						jmp _label7
						; line 32
					_label4:
						callmethod GetSize ::WB_AlterationMetamagic_OcatosRecital_FormList_var ::temp4 ;0 variable args
						cast ::temp6 ::temp4 
						callmethod Show ::WB_AlterationMetamagic_OcatosRecital_Message_TooMany_var ::temp4 ::temp6 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ;9 variable args
					_label7:
						jmp _label8
						; line 35
					_label2:
						callmethod Show ::WB_AlterationMetamagic_OcatosRecital_Message_Fail_var ::temp4 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ;9 variable args
					_label8
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
			.endState
		.endStateTable
	.endObject
.endObjectTable
