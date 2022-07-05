.info
	.source "DesmondPickPocketWidgetManagerEffect.psc"
	.modifyTime 1639159858 ;2021-12-11 01:10:58
	.compileTime 1639159862 ;2021-12-11 01:11:02
	.user "nirn2"
	.computer "WORKSTATION"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object DesmondPickPocketWidgetManagerEffect ActiveMagicEffect
		.userFlags 0 ;none
		.docString "This script constantly updates the widget"
		.autoState 
		.variableTable
			.variable ::ThrowItems_var formlist
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::DPWS_var desmondpickpocketwidgetscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable Player actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ThrowDagger_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::Powder_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ThrowItemBags_var formlist
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::Bottle_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property DPWS desmondpickpocketwidgetscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::DPWS_var
			.endProperty
			.property Powder keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::Powder_var
			.endProperty
			.property Bottle keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::Bottle_var
			.endProperty
			.property ThrowItems formlist auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ThrowItems_var
			.endProperty
			.property ThrowDagger keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ThrowDagger_var
			.endProperty
			.property ThrowItemBags formlist auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ThrowItemBags_var
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
						.param akTarget actor
						.param akCaster actor
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 18
						assign Player akTarget 
						; line 19
						callmethod UpdateThrows self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnEffectStart
				.function OnObjectUnequipped
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akBaseObject form
						.param akReference ObjectReference
					.endParamTable
					.localTable
						.local ::temp6 armor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 73
						cast ::temp6 akBaseObject 
						jmpf ::temp6 _label0
						; line 74
						callmethod UpdateThrows self ::NoneVar ;0 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnObjectUnequipped
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
				.function UpdateThrows
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp0 Int
						.local ::temp1 Bool
						.local i Int
						.local size Int
						.local ::temp2 form
						.local ::temp3 Bool
						.local ::temp4 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 24
						assign i 0 
						; line 25
						callmethod GetSize ::ThrowItemBags_var ::temp0 ;0 variable args
						assign size ::temp0 
						; line 27
					_label5:
						cmp_lt ::temp1 i size 
						jmpf ::temp1 _label0
						; line 29
						callmethod GetAt ::ThrowItemBags_var ::temp2 i ;1 variable args
						cast ::temp2 ::temp2 
						callmethod IsEquipped Player ::temp3 ::temp2 ;1 variable args
						jmpf ::temp3 _label1
						; line 32
						callmethod WornHasKeyword Player ::temp4 ::ThrowDagger_var ;1 variable args
						jmpf ::temp4 _label2
						; line 33
						callmethod GetAt ::ThrowItems_var ::temp2 i ;1 variable args
						cast ::temp2 ::temp2 
						callmethod SetFormCount ::DPWS_var ::NoneVar ::temp2 ;1 variable args
						; line 34
						callmethod SetUIState ::DPWS_var ::NoneVar true ;1 variable args
						; line 35
						callmethod SetDaggers ::DPWS_var ::NoneVar ;0 variable args
						; line 36
						return none 
						jmp _label2
						; line 39
					_label2:
						callmethod WornHasKeyword Player ::temp4 ::Bottle_var ;1 variable args
						jmpf ::temp4 _label3
						; line 40
						callmethod GetAt ::ThrowItems_var ::temp2 i ;1 variable args
						cast ::temp2 ::temp2 
						callmethod SetFormCount ::DPWS_var ::NoneVar ::temp2 ;1 variable args
						; line 41
						callmethod SetUIState ::DPWS_var ::NoneVar true ;1 variable args
						; line 42
						callmethod SetBottles ::DPWS_var ::NoneVar ;0 variable args
						; line 43
						return none 
						jmp _label3
						; line 46
					_label3:
						callmethod WornHasKeyword Player ::temp4 ::Powder_var ;1 variable args
						jmpf ::temp4 _label4
						; line 47
						callmethod GetAt ::ThrowItems_var ::temp2 i ;1 variable args
						cast ::temp2 ::temp2 
						callmethod SetFormCount ::DPWS_var ::NoneVar ::temp2 ;1 variable args
						; line 48
						callmethod SetUIState ::DPWS_var ::NoneVar true ;1 variable args
						; line 49
						callmethod SetPowders ::DPWS_var ::NoneVar ;0 variable args
						; line 50
						return none 
						jmp _label4
					_label4:
						jmp _label1
						; line 55
					_label1:
						iadd ::temp0 i 1 
						assign i ::temp0 
						jmp _label5
						; line 58
					_label0:
						callmethod SetUIState ::DPWS_var ::NoneVar false ;1 variable args
					.endCode
				.endFunction ;UpdateThrows
				.function OnObjectEquipped
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akBaseObject form
						.param akReference ObjectReference
					.endParamTable
					.localTable
						.local ::temp5 armor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 64
						cast ::temp5 akBaseObject 
						jmpf ::temp5 _label0
						; line 65
						callstatic utility WaitMenuMode ::NoneVar 1.00000 ;1 variable args
						; line 66
						callmethod UpdateThrows self ::NoneVar ;0 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnObjectEquipped
			.endState
		.endStateTable
	.endObject
.endObjectTable
