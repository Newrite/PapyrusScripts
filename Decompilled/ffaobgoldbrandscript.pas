.info
	.source "FFAOBGoldbrandScript.psc"
	.modifyTime 1519433987 ;2018-02-24 07:59:47
	.compileTime 1519433988 ;2018-02-24 07:59:48
	.user "borja"
	.computer "DESKTOP-BORJA"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object FFAOBGoldbrandScript ActiveMagicEffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::selfref_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ValidWeapons_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MySpell_var spell
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::ChargeCost_var Float
				.userFlags 0 ;none
				.initialValue 30.0000
			.endVariable
		.endVariableTable
		.propertyTable
			.property ChargeCost Float auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ChargeCost_var
			.endProperty
			.property selfref actor auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::selfref_var
			.endProperty
			.property MySpell spell auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MySpell_var
			.endProperty
			.property ValidWeapons keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::ValidWeapons_var
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
						.local ::temp0 objectreference
						.local ::temp1 Bool
					.endLocalTable
					.code
						; line 9
						assign ::selfref_var akCaster 
						; line 10
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "AttackPowerStanding_FXStart" ;2 variable args
						; line 11
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "AttackPowerRight_FXStart" ;2 variable args
						; line 12
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "AttackPowerLeft_FXStart" ;2 variable args
						; line 13
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "AttackPowerBackward_FXStart" ;2 variable args
						; line 14
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "AttackPowerForward_FXStart" ;2 variable args
						; line 15
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "WeaponSwing" ;2 variable args
						; line 16
						cast ::temp0 akCaster 
						callmethod registerForAnimationEvent self ::temp1 ::temp0 "WeaponLeftSwing" ;2 variable args
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
				.function OnAnimationEvent
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akSource objectreference
						.param EventName String
					.endParamTable
					.localTable
						.local ::temp2 Bool
						.local ::temp3 Bool
						.local ::temp4 Bool
						.local ::temp7 weapon
						.local PowerAttack Bool
						.local ::temp5 objectreference
						.local ::temp6 objectreference
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 22
						callmethod GetAnimationVariableBool ::selfref_var ::temp2 "bAllowRotation" ;1 variable args
						assign PowerAttack ::temp2 
						; line 23
						cmp_eq ::temp2 EventName "AttackPowerStanding_FXStart" 
						cast ::temp4 ::temp2 
						jmpt ::temp4 _label0
						cmp_eq ::temp3 EventName "AttackPowerForward_FXStart" 
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label1
						callmethod IsSprinting ::selfref_var ::temp4 ;0 variable args
						cast ::temp3 ::temp4 
					_label1:
						cast ::temp4 ::temp3 
					_label0:
						cast ::temp3 ::temp4 
						jmpt ::temp3 _label2
						cmp_eq ::temp2 EventName "AttackPowerRight_FXStart" 
						cast ::temp2 ::temp2 
						jmpt ::temp2 _label3
						cmp_eq ::temp3 EventName "AttackPowerLeft_FXStart" 
						cast ::temp2 ::temp3 
					_label3:
						cast ::temp3 ::temp2 
					_label2:
						cast ::temp2 ::temp3 
						jmpt ::temp2 _label4
						cmp_eq ::temp4 EventName "AttackPowerBackward_FXStart" 
						cast ::temp2 ::temp4 
					_label4:
						jmpf ::temp2 _label5
						; line 24
						cast ::temp5 ::selfref_var 
						cast ::temp6 none 
						callmethod Cast ::MySpell_var ::NoneVar ::temp5 ::temp6 ;2 variable args
						; line 25
						callmethod DamageActorValue ::selfref_var ::NoneVar "RightItemCharge" ::ChargeCost_var ;2 variable args
						jmp _label6
						; line 26
					_label5:
						cmp_eq ::temp3 EventName "WeaponSwing" 
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label7
						callmethod GetEquippedWeapon ::selfref_var ::temp7 false ;1 variable args
						callmethod HasKeyword ::temp7 ::temp4 ::ValidWeapons_var ;1 variable args
						cast ::temp3 ::temp4 
					_label7:
						cast ::temp4 ::temp3 
						jmpf ::temp4 _label8
						cast ::temp4 PowerAttack 
					_label8:
						jmpf ::temp4 _label9
						; line 27
						cast ::temp6 ::selfref_var 
						cast ::temp5 none 
						callmethod Cast ::MySpell_var ::NoneVar ::temp6 ::temp5 ;2 variable args
						; line 28
						callmethod DamageActorValue ::selfref_var ::NoneVar "RightItemCharge" ::ChargeCost_var ;2 variable args
						jmp _label6
						; line 29
					_label9:
						cmp_eq ::temp3 EventName "WeaponLeftSwing" 
						cast ::temp3 ::temp3 
						jmpf ::temp3 _label10
						callmethod GetEquippedWeapon ::selfref_var ::temp7 true ;1 variable args
						callmethod HasKeyword ::temp7 ::temp4 ::ValidWeapons_var ;1 variable args
						cast ::temp3 ::temp4 
					_label10:
						cast ::temp4 ::temp3 
						jmpf ::temp4 _label11
						cast ::temp4 PowerAttack 
					_label11:
						jmpf ::temp4 _label6
						; line 30
						cast ::temp5 ::selfref_var 
						cast ::temp6 none 
						callmethod Cast ::MySpell_var ::NoneVar ::temp5 ::temp6 ;2 variable args
						; line 31
						callmethod DamageActorValue ::selfref_var ::NoneVar "LeftItemCharge" ::ChargeCost_var ;2 variable args
						jmp _label6
					_label6
					.endCode
				.endFunction ;OnAnimationEvent
			.endState
		.endStateTable
	.endObject
.endObjectTable
