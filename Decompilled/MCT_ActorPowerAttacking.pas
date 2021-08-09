.info
	.source "MCT_ActorPowerAttacking.psc"
	.modifyTime 1608606438 ;2020-12-22 10:07:18
	.compileTime 1608606439 ;2020-12-22 10:07:19
	.user "george"
	.computer "GAME-PC"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object MCT_ActorPowerAttacking activemagiceffect
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::player_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MCT_PowerAttackedSlow01TimeSpell_var spell
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::MCT_PowerAttackedSlowTimePerk_var perk
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::statChecker_var mct_statcheckerquest
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property MCT_PowerAttackedSlowTimePerk perk auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_PowerAttackedSlowTimePerk_var
			.endProperty
			.property player actor auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::player_var
			.endProperty
			.property MCT_PowerAttackedSlow01TimeSpell spell auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::MCT_PowerAttackedSlow01TimeSpell_var
			.endProperty
			.property statChecker mct_statcheckerquest auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::statChecker_var
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
						.param akTarget actor
						.param akCaster actor
					.endParamTable
					.localTable
						.local ::NoneVar None
						.local ::temp0 objectreference
						.local ::temp1 actor
						.local ::temp2 Bool
					.endLocalTable
					.code
						; line 12
						callmethod addPerk ::player_var ::NoneVar ::MCT_PowerAttackedSlowTimePerk_var ;1 variable args
						; line 13
						cast ::temp0 ::player_var 
						callmethod DoCombatSpellApply ::player_var ::NoneVar ::MCT_PowerAttackedSlow01TimeSpell_var ::temp0 ;2 variable args
						; line 14
						assign ::temp1 akTarget 
						propset powerAttacker ::statChecker_var ::temp1 
						; line 15
						callmethod resetAttacker ::statChecker_var ::NoneVar ;0 variable args
						; line 17
						callstatic utility wait ::NoneVar 0.700000 ;1 variable args
						; line 18
						callmethod removePerk ::player_var ::NoneVar ::MCT_PowerAttackedSlowTimePerk_var ;1 variable args
						; line 19
						callmethod DispelSpell ::player_var ::temp2 ::MCT_PowerAttackedSlow01TimeSpell_var ;1 variable args
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
