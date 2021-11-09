.info
	.source "TIF__00060679.psc"
	.modifyTime 1632027889 ;2021-09-19 12:04:49
	.compileTime 1632039114 ;2021-09-19 15:11:54
	.user "nirn2"
	.computer "WORKSTATION"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object TIF__00060679 TopicInfo
		.userFlags 1 ;hidden 
		.docString ""
		.autoState 
		.variableTable
			.variable ::SKLxSmithing2_var book
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property SKLxSmithing2 book auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::SKLxSmithing2_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function Fragment_2
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param akSpeakerRef ObjectReference
					.endParamTable
					.localTable
						.local ::temp0 actor
						.local ::temp1 form
						.local ::NoneVar None
						.local ::temp2 globalvariable
						.local ::temp3 Float
						.local ::temp4 Int
						.local ::temp5 String
						.local ::temp6 quest
						.local ::temp7 Bool
						.local akSpeaker actor
						.local x globalvariable
					.endLocalTable
					.code
						; line 7
						cast ::temp0 akSpeakerRef 
						assign akSpeaker ::temp0 
						; line 9
						callstatic game GetPlayer ::temp0 ;0 variable args
						cast ::temp1 ::SKLxSmithing2_var 
						callmethod RemoveItem ::temp0 ::NoneVar ::temp1 1 false none ;4 variable args
						; line 10
						cast ::temp1 ::SKLxSmithing2_var 
						callmethod additem akSpeaker ::NoneVar ::temp1 1 false ;3 variable args
						; line 11
						callstatic game IncrementSkill ::NoneVar "Smithing" ;1 variable args
						; line 12
						callstatic game GetFormFromFile ::temp1 3427 "zzzSXP.esp" ;2 variable args
						cast ::temp2 ::temp1 
						assign x ::temp2 
						; line 13
						callstatic debug Notification ::NoneVar "РџРѕР»СѓС‡РµРЅРѕ 10000 РѕРїС‹С‚Р° СЂР°Р·" ;1 variable args
						; line 14
						cast ::temp3 10000 
						callmethod Mod x ::temp3 ::temp3 ;1 variable args
						; line 15
						callmethod GetValueInt x ::temp4 ;0 variable args
						cast ::temp5 ::temp4 
						strcat ::temp5 "РўРµРєСѓС‰РёР№ xp: " ::temp5 
						callstatic debug Notification ::NoneVar ::temp5 ;1 variable args
						; line 16
						callmethod GetOwningQuest self ::temp6 ;0 variable args
						callmethod SetStage ::temp6 ::temp7 20 ;1 variable args
					.endCode
				.endFunction ;Fragment_2
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
			.endState
		.endStateTable
	.endObject
.endObjectTable
