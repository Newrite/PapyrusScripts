.info
	.source "MCT_AttackDrainsStamina.psc"
	.modifyTime 1613504987 ;2021-02-17 02:49:47
	.compileTime 1613504989 ;2021-02-17 02:49:49
	.user "george"
	.computer "GAME-PC"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object MCT_AttackDrainsStamina ReferenceAlias
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable totalDrain Float
				.userFlags 0 ;none
				.initialValue 0.000000
			.endVariable
			.variable ::MCT_swingStaminaMult_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MCT_swingStaminaRecoverMult_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MCT_swingStaminaRecoverLag_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable swingDrain Float
				.userFlags 0 ;none
				.initialValue 0.000000
			.endVariable
			.variable ::MCT_swingStaminaBase_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property MCT_swingStaminaRecoverMult globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaRecoverMult_var
			.endProperty
			.property MCT_swingStaminaBase globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_swingStaminaBase_var
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
				.function updateSwingDrain
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param actorRef actor
						.param leftHand Bool
					.endParamTable
					.localTable
						.local ::temp8 Float
						.local ::temp9 weapon
						.local ::temp10 Bool
						.local ::temp11 Float
						.local weaponWeight Float
						.local equippedWeapon weapon
					.endLocalTable
					.code
						; line 64
						cast ::temp8 4 
						assign weaponWeight ::temp8 
						; line 65
						callmethod GetEquippedWeapon actorRef ::temp9 leftHand ;1 variable args
						assign equippedWeapon ::temp9 
						; line 66
						cast ::temp9 none 
						cmp_eq ::temp10 equippedWeapon ::temp9 
						not ::temp10 ::temp10 
						jmpf ::temp10 _label0
						; line 67
						callmethod getWeight equippedWeapon ::temp8 ;0 variable args
						assign weaponWeight ::temp8 
						jmp _label0
						; line 69
					_label0:
						callmethod getValue ::MCT_swingStaminaMult_var ::temp8 ;0 variable args
						fmul ::temp8 weaponWeight ::temp8 
						callmethod getValue ::MCT_swingStaminaBase_var ::temp11 ;0 variable args
						fadd ::temp8 ::temp8 ::temp11 
						fadd ::temp11 swingDrain ::temp8 
						assign swingDrain ::temp11 
					.endCode
				.endFunction ;updateSwingDrain
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
						; line 12
						callstatic debug trace ::NoneVar "MCT_AttackDrainsStamina OnInit" 0 ;2 variable args
						; line 13
						callmethod registerKeys self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnInit
				.function OnRaceSwitchComplete
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp3 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 30
						cast ::temp3 5 
						callstatic utility wait ::NoneVar ::temp3 ;1 variable args
						; line 31
						callmethod OnInit self ::NoneVar ;0 variable args
					.endCode
				.endFunction ;OnRaceSwitchComplete
				.function registerKeys
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp0 actor
						.local ::temp1 objectreference
						.local ::temp2 Bool
						.local ::NoneVar None
						.local actorRef actor
					.endLocalTable
					.code
						; line 17
						callstatic game GetPlayer ::temp0 ;0 variable args
						assign actorRef ::temp0 
						; line 18
						cast ::temp1 actorRef 
						callmethod RegisterForAnimationEvent self ::temp2 ::temp1 "bowDrawStart" ;2 variable args
						; line 19
						cast ::temp1 actorRef 
						callmethod RegisterForAnimationEvent self ::temp2 ::temp1 "weaponSwing" ;2 variable args
						; line 20
						cast ::temp1 actorRef 
						callmethod RegisterForAnimationEvent self ::temp2 ::temp1 "weaponLeftSwing" ;2 variable args
						; line 21
						callmethod RegisterForModEvent self ::NoneVar "MCT_drainStamina" "OnDrainStamina" ;2 variable args
					.endCode
				.endFunction ;registerKeys
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
						; line 26
						callmethod RegisterForModEvent self ::NoneVar "MCT_drainStamina" "OnDrainStamina" ;2 variable args
					.endCode
				.endFunction ;OnPlayerLoadGame
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
						.local ::temp4 actor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 36
						callmethod GetActorReference self ::temp4 ;0 variable args
						callmethod drainStamina self ::NoneVar ::temp4 numArg ;2 variable args
					.endCode
				.endFunction ;OnDrainStamina
				.function swing
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param leftHand Bool
					.endParamTable
					.localTable
						.local ::temp6 actor
						.local ::temp7 Bool
						.local actorRef actor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 50
						callmethod GetActorReference self ::temp6 ;0 variable args
						assign actorRef ::temp6 
						; line 51
						cmp_eq ::temp7 swingDrain 0.000000 
						jmpf ::temp7 _label0
						; line 53
						callmethod updateSwingDrain self ::NoneVar actorRef leftHand ;2 variable args
						; line 54
						callmethod drainStamina self ::NoneVar actorRef swingDrain ;2 variable args
						; line 55
						return none 
						jmp _label0
						; line 59
					_label0:
						callmethod drainStamina self ::NoneVar actorRef swingDrain ;2 variable args
						; line 60
						callmethod updateSwingDrain self ::NoneVar actorRef leftHand ;2 variable args
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
					.endParamTable
					.localTable
						.local ::temp12 Bool
						.local ::temp13 Float
						.local currentStamina Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 73
						cmp_lt ::temp12 drainAmount 0.000000 
						jmpf ::temp12 _label0
						; line 74
						return none 
						jmp _label0
						; line 77
					_label0:
						callmethod getActorValue actorRef ::temp13 "Stamina" ;1 variable args
						assign currentStamina ::temp13 
						; line 78
						cmp_gt ::temp12 drainAmount currentStamina 
						jmpf ::temp12 _label1
						; line 79
						fadd ::temp13 totalDrain currentStamina 
						assign totalDrain ::temp13 
						; line 80
						callmethod damageActorValue actorRef ::NoneVar "Stamina" currentStamina ;2 variable args
						jmp _label2
						; line 82
					_label1:
						fadd ::temp13 totalDrain drainAmount 
						assign totalDrain ::temp13 
						; line 83
						callmethod damageActorValue actorRef ::NoneVar "Stamina" drainAmount ;2 variable args
						; line 85
					_label2:
						callmethod GotoState self ::NoneVar "recover" ;1 variable args
					.endCode
				.endFunction ;drainStamina
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
						.local ::temp5 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 41
						cmp_eq ::temp5 asEventName "weaponLeftSwing" 
						jmpf ::temp5 _label0
						; line 42
						callmethod swing self ::NoneVar true ;1 variable args
						jmp _label1
						; line 44
					_label0:
						callmethod swing self ::NoneVar false ;1 variable args
					_label1
					.endCode
				.endFunction ;OnAnimationEvent
			.endState
			.state recover
				.function onBeginState
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp14 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 92
						callmethod getValue ::MCT_swingStaminaRecoverLag_var ::temp14 ;0 variable args
						callmethod registerForSingleUpdate self ::NoneVar ::temp14 ;1 variable args
					.endCode
				.endFunction ;onBeginState
				.function OnUpdate
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp15 actor
						.local ::temp16 Bool
						.local actorRef actor
						.local ::temp17 Float
						.local ::NoneVar None
					.endLocalTable
					.code
						callmethod GetActorReference self ::temp15 ;0 variable args
						assign actorRef ::temp15 
						callmethod GetAnimationVariableBool actorRef ::temp16 "IsAttacking" ;1 variable args
						jmpf ::temp16 _label0
						callmethod getValue ::MCT_swingStaminaRecoverLag_var ::temp17 ;0 variable args
						callmethod registerForSingleUpdate self ::NoneVar ::temp17 ;1 variable args
						jmp _label1
					_label0:
						callmethod GetActorReference self ::temp15 ;0 variable args
						callmethod getValue ::MCT_swingStaminaRecoverMult_var ::temp17 ;0 variable args
						fmul ::temp17 totalDrain ::temp17 
						callmethod restoreActorValue ::temp15 ::NoneVar "Stamina" ::temp17 ;2 variable args
						assign swingDrain 0.000000 
						assign totalDrain 0.000000 
						callmethod GotoState self ::NoneVar "" ;1 variable args
					_label1
					.endCode
				.endFunction ;OnUpdate
			.endState
		.endStateTable
	.endObject
.endObjectTable
