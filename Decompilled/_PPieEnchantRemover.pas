.info
	.source "_PPieEnchantRemover.psc"
	.modifyTime 1608290447 ;2020-12-18 18:20:47
	.compileTime 1608290450 ;2020-12-18 18:20:50
	.user "pixel"
	.computer "chii-4"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object _PPieEnchantRemover ActiveMagicEffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::ppMsgA_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ppMsgD_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ppMsgC_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ppMsgB_var message
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property ppMsgD message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ppMsgD_var
			.endProperty
			.property ppMsgA message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ppMsgA_var
			.endProperty
			.property ppMsgB message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ppMsgB_var
			.endProperty
			.property ppMsgC message auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ppMsgC_var
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
				.function onEffectStart
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akTarget actor
						.param akCaster actor
					.endParamTable
					.localTable
						.local ::temp0 actor
						.local ::temp1 Bool
						.local ::temp2 form
						.local ::temp3 String
						.local ::temp4 objectreference
						.local ::temp5 weapon
						.local ::temp6 enchantment
						.local ppWepForm form
						.local ppWepName String
						.local ppWepRef objectreference
						.local ::NoneVar None
						.local ::temp7 enchantment
						.local ::temp8 Float
						.local ppEnch enchantment
					.endLocalTable
					.code
						; line 8
						callstatic game GetPlayer ::temp0 ;0 variable args
						cmp_eq ::temp1 akTarget ::temp0 
						jmpf ::temp1 _label0
						; line 9
						callmethod getEquippedObject akTarget ::temp2 1 ;1 variable args
						assign ppWepForm ::temp2 
						; line 10
						callmethod getname ppWepForm ::temp3 ;0 variable args
						assign ppWepName ::temp3 
						; line 12
						callmethod dropObject akTarget ::temp4 ppWepForm 1 ;2 variable args
						assign ppWepRef ::temp4 
						; line 14
						cast ::temp5 ppWepForm 
						callmethod getEnchantment ::temp5 ::temp6 ;0 variable args
						jmpf ::temp6 _label1
						; line 16
						callmethod getname ::ppMsgA_var ::temp3 ;0 variable args
						callstatic debug notification ::NoneVar ::temp3 ;1 variable args
						jmp _label2
						; line 17
					_label1:
						jmpf ppWepForm _label3
						; line 18
						callmethod getEnchantment ppWepRef ::temp7 ;0 variable args
						jmpf ::temp7 _label4
						; line 20
						jmpf ppWepRef _label5
						; line 23
						cast ::temp8 0 
						callmethod setEnchantment ppWepRef ::NoneVar ppEnch ::temp8 ;2 variable args
						; line 24
						callmethod getname ::ppMsgD_var ::temp3 ;0 variable args
						callstatic debug notification ::NoneVar ::temp3 ;1 variable args
						jmp _label5
					_label5:
						jmp _label6
						; line 28
					_label4:
						callmethod getname ::ppMsgB_var ::temp3 ;0 variable args
						callstatic debug notification ::NoneVar ::temp3 ;1 variable args
					_label6:
						jmp _label2
						; line 32
					_label3:
						callmethod getname ::ppMsgC_var ::temp3 ;0 variable args
						callstatic debug notification ::NoneVar ::temp3 ;1 variable args
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;onEffectStart
			.endState
		.endStateTable
	.endObject
.endObjectTable
