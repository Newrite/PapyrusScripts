.info
	.source "MCT_AttackDrainsStamina.psc"
	.modifyTime 1613708311 ;2021-02-19 11:18:31
	.compileTime 1613708328 ;2021-02-19 11:18:48
	.user "newrite"
	.computer "WINDOWS"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object MCT_AttackDrainsStamina ReferenceAlias
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::MCT_swingStaminaMult_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable totalDrain Float
				.userFlags 0 ;none
				.initialValue 0.000000
			.endVariable
			.variable draintwo Float
				.userFlags 0 ;none
				.initialValue 15.0000
			.endVariable
			.variable ::MCT_swingStaminaBase_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable drainone Float
				.userFlags 0 ;none
				.initialValue 10.0000
			.endVariable
			.variable ::WeapTypeBoundArrow_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable swingDrain Float
				.userFlags 0 ;none
				.initialValue 0.000000
			.endVariable
			.variable ::MCT_swingStaminaRecoverMult_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::healthDrainWeapon_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::boundWeapon_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MCT_swingStaminaRecoverLag_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property MCT_swingStaminaBase globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaBase_var
			.endProperty
			.property healthDrainWeapon keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::healthDrainWeapon_var
			.endProperty
			.property WeapTypeBoundArrow keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::WeapTypeBoundArrow_var
			.endProperty
			.property boundWeapon keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::boundWeapon_var
			.endProperty
			.property MCT_swingStaminaRecoverMult globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaRecoverMult_var
			.endProperty
			.property MCT_swingStaminaRecoverLag globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaRecoverLag_var
			.endProperty
			.property MCT_swingStaminaMult globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaMult_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function OnInit
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 106
						callmethod registerKeys self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnInit
				.function OnPlayerLoadGame
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 144
						callmethod RegisterForModEvent self ::NoneVar "MCT_drainStamina" "OnDrainStamina" ;2 variable args
					.endCode
				.endFunction ;OnPlayerLoadGame
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
				.function swing
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param leftHand Bool
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp18 actor
						.local ::temp19 weapon
						.local ::temp20 Bool
						.local actorRef actor
						.local equippedWeapon weapon
						.local ::temp21 Int
						.local ::NoneVar None
						.local ::temp22 Float
					.endLocalTable
					.code
						; line 123
						callmethod GetActorReference self ::temp18 ;0 variable args
						assign actorRef ::temp18 
						; line 124
						callmethod GetEquippedWeapon actorRef ::temp19 leftHand ;1 variable args
						assign equippedWeapon ::temp19 
						; line 125
						callmethod HasKeyword equippedWeapon ::temp20 ::boundWeapon_var ;1 variable args
						jmpf ::temp20 _label0
						; line 126
						callmethod GetWeaponType equippedWeapon ::temp21 ;0 variable args
						cast ::temp21 ::temp21 
						callmethod drainMagicka self ::NoneVar actorRef ::temp21 asEventName ;3 variable args
						; line 127
						return none 
						jmp _label0
						; line 129
					_label0:
						callmethod HasKeyword equippedWeapon ::temp20 ::healthDrainWeapon_var ;1 variable args
						jmpf ::temp20 _label1
						; line 130
						callmethod getWeight equippedWeapon ::temp22 ;0 variable args
						cast ::temp22 ::temp22 
						fdiv ::temp22 ::temp22 2.00000 
						callmethod drainHealth self ::NoneVar actorRef ::temp22 asEventName ;3 variable args
						; line 131
						return none 
						jmp _label1
						; line 133
					_label1:
						cmp_eq ::temp20 swingDrain 0.000000 
						jmpf ::temp20 _label2
						; line 134
						callmethod updateSwingDrain self ::NoneVar actorRef leftHand equippedWeapon ;3 variable args
						; line 135
						callmethod drainStamina self ::NoneVar actorRef swingDrain asEventName ;3 variable args
						; line 136
						return none 
						jmp _label2
						; line 138
					_label2:
						callmethod drainStamina self ::NoneVar actorRef swingDrain asEventName ;3 variable args
						; line 139
						callmethod updateSwingDrain self ::NoneVar actorRef leftHand equippedWeapon ;3 variable args
					.endCode
				.endFunction ;swing
				.function drainStamina
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param actorRef actor
						.param drainAmount Float
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp7 Bool
						.local ::temp8 Float
						.local ::temp9 Bool
						.local currentStamina Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 68
						cmp_lt ::temp7 drainAmount 0.000000 
						jmpf ::temp7 _label0
						; line 69
						return none 
						jmp _label0
						; line 71
					_label0:
						callmethod getActorValue actorRef ::temp8 "Stamina" ;1 variable args
						assign currentStamina ::temp8 
						; line 72
						cmp_gt ::temp7 drainAmount currentStamina 
						jmpf ::temp7 _label1
						; line 73
						fadd ::temp8 totalDrain currentStamina 
						assign totalDrain ::temp8 
						; line 74
						callmethod damageActorValue actorRef ::NoneVar "Stamina" currentStamina ;2 variable args
						jmp _label2
						; line 76
					_label1:
						fadd ::temp8 totalDrain drainAmount 
						assign totalDrain ::temp8 
						; line 77
						callmethod damageActorValue actorRef ::NoneVar "Stamina" drainAmount ;2 variable args
						; line 79
					_label2:
						cmp_eq ::temp7 asEventName "bowDrawStart" 
						cast ::temp7 ::temp7 
						jmpt ::temp7 _label3
						cmp_eq ::temp9 asEventName "reload" 
						cast ::temp7 ::temp9 
					_label3:
						cast ::temp7 ::temp7 
						jmpt ::temp7 _label4
						cmp_eq ::temp9 asEventName "ReloadFast" 
						cast ::temp7 ::temp9 
					_label4:
						cast ::temp7 ::temp7 
						jmpf ::temp7 _label5
						callmethod WornHasKeyword actorRef ::temp9 ::WeapTypeBoundArrow_var ;1 variable args
						cast ::temp7 ::temp9 
					_label5:
						jmpf ::temp7 _label6
						; line 80
						callmethod damageActorValue actorRef ::NoneVar "Magicka" drainone ;2 variable args
						jmp _label6
						; line 82
					_label6:
						callmethod GotoState self ::NoneVar "recover" ;1 variable args
					.endCode
				.endFunction ;drainStamina
				.function OnRaceSwitchComplete
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp0 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 29
						cast ::temp0 5 
						callstatic utility wait ::NoneVar ::temp0 ;1 variable args
						; line 30
						callmethod OnInit self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnRaceSwitchComplete
				.function updateSwingDrain
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param actorRef actor
						.param leftHand Bool
						.param equippedWeapon weapon
					.endParamTable
					.localTable
						.local ::temp14 Float
						.local ::temp15 weapon
						.local ::temp16 Bool
						.local ::temp17 Float
						.local weaponWeight Float
					.endLocalTable
					.code
						; line 111
						cast ::temp14 4 
						assign weaponWeight ::temp14 
						; line 112
						cast ::temp15 none 
						cmp_eq ::temp16 equippedWeapon ::temp15 
						not ::temp16 ::temp16 
						jmpf ::temp16 _label0
						; line 113
						callmethod getWeight equippedWeapon ::temp14 ;0 variable args
						assign weaponWeight ::temp14 
						jmp _label0
						; line 115
					_label0:
						callmethod getValue ::MCT_swingStaminaMult_var ::temp14 ;0 variable args
						fmul ::temp14 weaponWeight ::temp14 
						callmethod getValue ::MCT_swingStaminaBase_var ::temp17 ;0 variable args
						fadd ::temp14 ::temp14 ::temp17 
						fadd ::temp17 swingDrain ::temp14 
						assign swingDrain ::temp17 
					.endCode
				.endFunction ;updateSwingDrain
				.function registerKeys
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp10 actor
						.local ::temp11 objectreference
						.local ::temp12 Bool
						.local ::NoneVar None
						.local actorRef actor
					.endLocalTable
					.code
						; line 87
						callmethod GetActorReference self ::temp10 ;0 variable args
						assign actorRef ::temp10 
						; line 88
						cast ::temp11 actorRef 
						callmethod RegisterForAnimationEvent self ::temp12 ::temp11 "bowDrawStart" ;2 variable args
						; line 89
						cast ::temp11 actorRef 
						callmethod RegisterForAnimationEvent self ::temp12 ::temp11 "weaponSwing" ;2 variable args
						; line 90
						cast ::temp11 actorRef 
						callmethod RegisterForAnimationEvent self ::temp12 ::temp11 "weaponLeftSwing" ;2 variable args
						; line 91
						cast ::temp11 actorRef 
						callmethod RegisterForAnimationEvent self ::temp12 ::temp11 "reload" ;2 variable args
						; line 92
						cast ::temp11 actorRef 
						callmethod RegisterForAnimationEvent self ::temp12 ::temp11 "ReloadFast" ;2 variable args
						; line 93
						callmethod RegisterForModEvent self ::NoneVar "MCT_drainStamina" "OnDrainStamina" ;2 variable args
					.endCode
				.endFunction ;registerKeys
				.function drainMagicka
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param actorRef actor
						.param weaponType Int
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp2 Bool
						.local ::temp3 Bool
						.local ::NoneVar None
						.local ::temp4 Float
					.endLocalTable
					.code
						; line 44
						comp_gte ::temp2 weaponType 0 
						cast ::temp2 ::temp2 
						jmpf ::temp2 _label0
						cmp_lte ::temp3 weaponType 4 
						cast ::temp2 ::temp3 
					_label0:
						jmpf ::temp2 _label1
						; line 45
						callmethod damageActorValue actorRef ::NoneVar "Magicka" drainone ;2 variable args
						; line 46
						return none 
						jmp _label1
						; line 48
					_label1:
						cmp_eq ::temp3 asEventName "bowDrawStart" 
						cast ::temp3 ::temp3 
						jmpt ::temp3 _label2
						cmp_eq ::temp2 asEventName "reload" 
						cast ::temp3 ::temp2 
					_label2:
						cast ::temp3 ::temp3 
						jmpt ::temp3 _label3
						cmp_eq ::temp2 asEventName "ReloadFast" 
						cast ::temp3 ::temp2 
					_label3:
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label4
						callmethod WornHasKeyword actorRef ::temp2 ::WeapTypeBoundArrow_var ;1 variable args
						cast ::temp3 ::temp2 
					_label4:
						jmpf ::temp3 _label5
						; line 49
						fadd ::temp4 draintwo drainone 
						callmethod damageActorValue actorRef ::NoneVar "Magicka" ::temp4 ;2 variable args
						; line 50
						return none 
						jmp _label5
						; line 52
					_label5:
						callmethod damageActorValue actorRef ::NoneVar "Magicka" draintwo ;2 variable args
					.endCode
				.endFunction ;drainMagicka
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
				.function OnDrainStamina
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param eventName String
						.param strArg String
						.param numArg Float
						.param sender Form
					.endParamTable
					.localTable
						.local ::temp13 actor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 98
						callmethod GetActorReference self ::temp13 ;0 variable args
						callmethod drainStamina self ::NoneVar ::temp13 numArg eventName ;3 variable args
					.endCode
				.endFunction ;OnDrainStamina
				.function OnAnimationEvent
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akSource objectreference
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp1 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 35
						cmp_eq ::temp1 asEventName "weaponLeftSwing" 
						jmpf ::temp1 _label0
						; line 36
						callmethod swing self ::NoneVar true asEventName ;2 variable args
						jmp _label1
						; line 38
					_label0:
						callmethod swing self ::NoneVar false asEventName ;2 variable args
					_label1
					.endCode
				.endFunction ;OnAnimationEvent
				.function drainHealth
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param actorRef actor
						.param toDrain Float
						.param asEventName String
					.endParamTable
					.localTable
						.local ::temp5 Bool
						.local ::NoneVar None
						.local ::temp6 Bool
					.endLocalTable
					.code
						; line 56
						cmp_lte ::temp5 toDrain 0.000000 
						jmpf ::temp5 _label0
						; line 57
						return none 
						jmp _label0
						; line 59
					_label0:
						callmethod damageActorValue actorRef ::NoneVar "Health" toDrain ;2 variable args
						; line 60
						cmp_eq ::temp5 asEventName "bowDrawStart" 
						cast ::temp5 ::temp5 
						jmpt ::temp5 _label1
						cmp_eq ::temp6 asEventName "reload" 
						cast ::temp5 ::temp6 
					_label1:
						cast ::temp5 ::temp5 
						jmpt ::temp5 _label2
						cmp_eq ::temp6 asEventName "ReloadFast" 
						cast ::temp5 ::temp6 
					_label2:
						cast ::temp5 ::temp5 
						jmpf ::temp5 _label3
						callmethod WornHasKeyword actorRef ::temp6 ::WeapTypeBoundArrow_var ;1 variable args
						cast ::temp5 ::temp6 
					_label3:
						jmpf ::temp5 _label4
						; line 61
						callmethod damageActorValue actorRef ::NoneVar "Magicka" drainone ;2 variable args
						jmp _label4
					_label4
					.endCode
				.endFunction ;drainHealth
			.endState
			.state recover
				.function OnUpdate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp23 actor
						.local ::temp24 Bool
						.local actorRef actor
						.local ::temp25 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 152
						callmethod GetActorReference self ::temp23 ;0 variable args
						assign actorRef ::temp23 
						; line 153
						callmethod GetAnimationVariableBool actorRef ::temp24 "IsAttacking" ;1 variable args
						jmpf ::temp24 _label0
						; line 154
						callmethod getValue ::MCT_swingStaminaRecoverLag_var ::temp25 ;0 variable args
						callmethod registerForSingleUpdate self ::NoneVar ::temp25 ;1 variable args
						jmp _label1
						; line 156
					_label0:
						callmethod GetActorReference self ::temp23 ;0 variable args
						callmethod getValue ::MCT_swingStaminaRecoverMult_var ::temp25 ;0 variable args
						fmul ::temp25 totalDrain ::temp25 
						callmethod restoreActorValue ::temp23 ::NoneVar "Stamina" ::temp25 ;2 variable args
						; line 157
						assign swingDrain 0.000000 
						; line 158
						assign totalDrain 0.000000 
						; line 159
						callmethod GotoState self ::NoneVar "" ;1 variable args
					_label1
					.endCode
				.endFunction ;OnUpdate
				.function onBeginState
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp26 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						callmethod getValue ::MCT_swingStaminaRecoverLag_var ::temp26 ;0 variable args
						callmethod registerForSingleUpdate self ::NoneVar ::temp26 ;1 variable args
					.endCode
				.endFunction ;onBeginState
			.endState
		.endStateTable
	.endObject
.endObjectTable
