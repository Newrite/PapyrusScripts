.info
	.source "nwsFollowerUILIBScript.psc"
	.modifyTime 1631653455 ;2021-09-15 04:04:15
	.compileTime 1631653514 ;2021-09-15 04:05:14
	.user "nethe"
	.computer "DESKTOP-DNDELIE"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object nwsFollowerUILIBScript Quest
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::UIPos0_var Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIMagicka Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::nwsChestPort_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::actSkillStr_var String[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIActor_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIStamina Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::nwsChestAllowed_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::varScript_var nwsfollowervariablescript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::myPlayer_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIFolCnt Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIAll_var Bool
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::favScript_var nwsfollowerfavscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::setsScript_var nwsfollowersetsscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIHeath Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::nwsFollowerSettings_var Quest
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::controlScript_var nwsfollowercontrollerscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIint Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIType_var Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIspellTarget_var actor
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::historyScript_var nwsfollowerhistoryscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::nwsFollowerXStorage_var Quest
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::GameDaysPassed_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIPick Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::boxScript_var nwsfollowersandboxscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::nwsFollowerHistory_var Quest
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable tookTorches Bool
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::homeScript_var nwsfollowerhomescript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIAlias_var referencealias
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::UIShowAttackMsg_var Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::mountScript_var nwsfollowermountsscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::mcmScript_var nwsfollowermcmscript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::storageScript_var nwsfollowerstoragescript
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UIChoices String[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable UISlots Int[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::isRetreat_var Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable favPick Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property GameDaysPassed globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::GameDaysPassed_var
			.endProperty
			.property UIType Int auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIType_var
			.endProperty
			.property nwsChestAllowed globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::nwsChestAllowed_var
			.endProperty
			.property mountScript nwsfollowermountsscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::mountScript_var
			.endProperty
			.property UIspellTarget actor auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIspellTarget_var
			.endProperty
			.property nwsFollowerHistory Quest auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::nwsFollowerHistory_var
			.endProperty
			.property homeScript nwsfollowerhomescript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::homeScript_var
			.endProperty
			.property isRetreat Int auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::isRetreat_var
			.endProperty
			.property UIAll Bool auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIAll_var
			.endProperty
			.property actSkillStr String[] auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::actSkillStr_var
			.endProperty
			.property UIPos0 Int auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIPos0_var
			.endProperty
			.property UIShowAttackMsg Int auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIShowAttackMsg_var
			.endProperty
			.property favScript nwsfollowerfavscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::favScript_var
			.endProperty
			.property myPlayer actor auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::myPlayer_var
			.endProperty
			.property varScript nwsfollowervariablescript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::varScript_var
			.endProperty
			.property UIActor actor auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIActor_var
			.endProperty
			.property nwsFollowerXStorage Quest auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::nwsFollowerXStorage_var
			.endProperty
			.property mcmScript nwsfollowermcmscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::mcmScript_var
			.endProperty
			.property nwsFollowerSettings Quest auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::nwsFollowerSettings_var
			.endProperty
			.property nwsChestPort globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::nwsChestPort_var
			.endProperty
			.property UIAlias referencealias auto
				.userFlags 1 ;hidden 
				.docString ""
				.autovar ::UIAlias_var
			.endProperty
			.property controlScript nwsfollowercontrollerscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::controlScript_var
			.endProperty
			.property setsScript nwsfollowersetsscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::setsScript_var
			.endProperty
			.property boxScript nwsfollowersandboxscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::boxScript_var
			.endProperty
			.property storageScript nwsfollowerstoragescript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::storageScript_var
			.endProperty
			.property historyScript nwsfollowerhistoryscript auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::historyScript_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function DisplayLooting
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp432 faction
						.local ::temp433 Bool
						.local ::temp436 Bool
						.local ::temp437 Bool
						.local myRank Int
						.local ::temp434 Int
						.local ::temp435 String
					.endLocalTable
					.code
						; line 2063
						assign myRank -1 
						; line 2064
						propget nwsFF_GatherFac ::varScript_var ::temp432 
						callmethod IsInFaction ::UIActor_var ::temp433 ::temp432 ;1 variable args
						jmpf ::temp433 _label0
						; line 2065
						propget nwsFF_GatherFac ::varScript_var ::temp432 
						callmethod GetFactionRank ::UIActor_var ::temp434 ::temp432 ;1 variable args
						cast ::temp434 ::temp434 
						assign myRank ::temp434 
						jmp _label0
						; line 2067
					_label0:
						cmp_eq ::temp433 myRank -1 
						jmpf ::temp433 _label1
						; line 2068
						assign ::temp435 "$FF_LootingTypeOff" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2069
					_label1:
						cmp_eq ::temp436 myRank 0 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label3
						cmp_eq ::temp437 myRank 11 
						cast ::temp436 ::temp437 
					_label3:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label4
						cmp_eq ::temp437 myRank 22 
						cast ::temp436 ::temp437 
					_label4:
						jmpf ::temp436 _label5
						; line 2070
						assign ::temp435 "$FF_LootingType0" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2071
					_label5:
						cmp_eq ::temp437 myRank 1 
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label6
						cmp_eq ::temp436 myRank 12 
						cast ::temp437 ::temp436 
					_label6:
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label7
						cmp_eq ::temp436 myRank 23 
						cast ::temp437 ::temp436 
					_label7:
						jmpf ::temp437 _label8
						; line 2072
						assign ::temp435 "$FF_LootingType1" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2073
					_label8:
						cmp_eq ::temp436 myRank 2 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label9
						cmp_eq ::temp437 myRank 13 
						cast ::temp436 ::temp437 
					_label9:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label10
						cmp_eq ::temp437 myRank 24 
						cast ::temp436 ::temp437 
					_label10:
						jmpf ::temp436 _label11
						; line 2074
						assign ::temp435 "$FF_LootingType2" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2075
					_label11:
						cmp_eq ::temp437 myRank 3 
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label12
						cmp_eq ::temp436 myRank 14 
						cast ::temp437 ::temp436 
					_label12:
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label13
						cmp_eq ::temp436 myRank 25 
						cast ::temp437 ::temp436 
					_label13:
						jmpf ::temp437 _label14
						; line 2076
						assign ::temp435 "$FF_LootingType3" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2077
					_label14:
						cmp_eq ::temp436 myRank 4 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label15
						cmp_eq ::temp437 myRank 15 
						cast ::temp436 ::temp437 
					_label15:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label16
						cmp_eq ::temp437 myRank 26 
						cast ::temp436 ::temp437 
					_label16:
						jmpf ::temp436 _label17
						; line 2078
						assign ::temp435 "$FF_LootingType4" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2079
					_label17:
						cmp_eq ::temp437 myRank 5 
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label18
						cmp_eq ::temp436 myRank 16 
						cast ::temp437 ::temp436 
					_label18:
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label19
						cmp_eq ::temp436 myRank 27 
						cast ::temp437 ::temp436 
					_label19:
						jmpf ::temp437 _label20
						; line 2080
						assign ::temp435 "$FF_LootingType5" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2081
					_label20:
						cmp_eq ::temp436 myRank 6 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label21
						cmp_eq ::temp437 myRank 17 
						cast ::temp436 ::temp437 
					_label21:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label22
						cmp_eq ::temp437 myRank 28 
						cast ::temp436 ::temp437 
					_label22:
						jmpf ::temp436 _label23
						; line 2082
						assign ::temp435 "$FF_LootingType6" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2083
					_label23:
						cmp_eq ::temp437 myRank 7 
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label24
						cmp_eq ::temp436 myRank 18 
						cast ::temp437 ::temp436 
					_label24:
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label25
						cmp_eq ::temp436 myRank 29 
						cast ::temp437 ::temp436 
					_label25:
						jmpf ::temp437 _label26
						; line 2084
						assign ::temp435 "$FF_LootingType7" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2085
					_label26:
						cmp_eq ::temp436 myRank 8 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label27
						cmp_eq ::temp437 myRank 19 
						cast ::temp436 ::temp437 
					_label27:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label28
						cmp_eq ::temp437 myRank 30 
						cast ::temp436 ::temp437 
					_label28:
						jmpf ::temp436 _label29
						; line 2086
						assign ::temp435 "$FF_LootingType8" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2087
					_label29:
						cmp_eq ::temp437 myRank 9 
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label30
						cmp_eq ::temp436 myRank 20 
						cast ::temp437 ::temp436 
					_label30:
						cast ::temp437 ::temp437 
						jmpt ::temp437 _label31
						cmp_eq ::temp436 myRank 31 
						cast ::temp437 ::temp436 
					_label31:
						jmpf ::temp437 _label32
						; line 2088
						assign ::temp435 "$FF_LootingType9" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2089
					_label32:
						cmp_eq ::temp436 myRank 10 
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label33
						cmp_eq ::temp437 myRank 21 
						cast ::temp436 ::temp437 
					_label33:
						cast ::temp436 ::temp436 
						jmpt ::temp436 _label34
						cmp_eq ::temp437 myRank 32 
						cast ::temp436 ::temp437 
					_label34:
						jmpf ::temp436 _label2
						; line 2090
						assign ::temp435 "$FF_LootingType10" 
						iadd ::temp434 ::UIPos0_var 5 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label2
						; line 2093
					_label2:
						comp_gte ::temp437 myRank 22 
						jmpf ::temp437 _label35
						; line 2094
						assign ::temp435 "$FF_SendLootType2" 
						iadd ::temp434 ::UIPos0_var 6 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label36
						; line 2095
					_label35:
						comp_gte ::temp436 myRank 11 
						jmpf ::temp436 _label37
						; line 2096
						propget nwsFF_storedFac ::setsScript_var ::temp432 
						callmethod IsInFaction ::UIActor_var ::temp433 ::temp432 ;1 variable args
						jmpf ::temp433 _label38
						; line 2097
						assign ::temp435 "$FF_SendLootType1alt" 
						iadd ::temp434 ::UIPos0_var 6 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label39
						; line 2099
					_label38:
						assign ::temp435 "$FF_SendLootType1" 
						iadd ::temp434 ::UIPos0_var 6 
						array_setelement UIChoices ::temp434 ::temp435 
					_label39:
						jmp _label36
						; line 2101
					_label37:
						cmp_gt ::temp433 myRank -1 
						jmpf ::temp433 _label40
						; line 2102
						assign ::temp435 "$FF_SendLootType0" 
						iadd ::temp434 ::UIPos0_var 6 
						array_setelement UIChoices ::temp434 ::temp435 
						jmp _label36
						; line 2104
					_label40:
						assign ::temp435 "$FF_SendLootTypeOff" 
						iadd ::temp434 ::UIPos0_var 6 
						array_setelement UIChoices ::temp434 ::temp435 
					_label36
					.endCode
				.endFunction ;DisplayLooting
				.function UICmdOneNPC
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp62 actor
						.local ::temp63 Bool
						.local ::temp64 Int
						.local ::temp65 String[]
						.local ::temp66 String
						.local ::temp67 String
						.local ::temp68 String
						.local ::temp69 actorbase
						.local ::temp70 class
						.local ::temp71 voicetype
						.local ::temp72 form
						.local ::temp75 uilib_1
						.local UICount Int
						.local classTxt String
						.local allowVoice Bool
						.local voiceForm form
						.local rdoList formList
						.local ::temp73 formList
						.local ::temp74 Bool
						.local ::temp76 Bool
						.local ::temp77 spell
						.local ::temp78 objectreference
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 302
						assign UICount 0 
						; line 303
						cast ::temp62 none 
						cmp_eq ::temp63 ::UIspellTarget_var ::temp62 
						not ::temp63 ::temp63 
						jmpf ::temp63 _label0
						; line 304
						assign UICount 1 
						jmp _label0
						; line 308
					_label0:
						iadd ::temp64 7 UICount 
						callstatic utility CreateStringArray ::temp65 ::temp64 "" ;2 variable args
						assign UIChoices ::temp65 
						; line 310
						cast ::temp67 UIHeath 
						strcat ::temp67 "Health: " ::temp67 
						strcat ::temp67 ::temp67 ", Magicka: " 
						cast ::temp68 UIMagicka 
						strcat ::temp68 ::temp67 ::temp68 
						strcat ::temp67 ::temp68 ", Stamina: " 
						cast ::temp68 UIStamina 
						strcat ::temp68 ::temp67 ::temp68 
						strcat ::temp67 ::temp68 " [x]" 
						assign ::temp66 ::temp67 
						array_setelement UIChoices 0 ::temp66 
						; line 311
						callmethod GetActorBase ::UIActor_var ::temp69 ;0 variable args
						callmethod GetClass ::temp69 ::temp70 ;0 variable args
						callmethod GetName ::temp70 ::temp68 ;0 variable args
						assign classTxt ::temp68 
						; line 312
						cmp_eq ::temp63 classTxt "dremora" 
						jmpf ::temp63 _label1
						; line 313
						assign classTxt "Warrior" 
						jmp _label1
						; line 315
					_label1:
						callmethod GetLevel ::UIActor_var ::temp64 ;0 variable args
						cast ::temp67 ::temp64 
						strcat ::temp68 "Level " ::temp67 
						strcat ::temp67 ::temp68 " " 
						strcat ::temp68 ::temp67 classTxt 
						strcat ::temp67 ::temp68 " [x]" 
						assign ::temp66 ::temp67 
						array_setelement UIChoices 1 ::temp66 
						; line 317
						cast ::temp62 none 
						cmp_eq ::temp63 ::UIspellTarget_var ::temp62 
						not ::temp63 ::temp63 
						jmpf ::temp63 _label2
						; line 318
						callmethod GetActorName self ::temp66 ::UIspellTarget_var ;1 variable args
						strcat ::temp67 "Followers Attack: " ::temp66 
						assign ::temp68 ::temp67 
						array_setelement UIChoices 2 ::temp68 
						jmp _label2
						; line 321
					_label2:
						assign allowVoice false 
						; line 322
						callmethod GetVoiceType ::UIActor_var ::temp71 ;0 variable args
						cast ::temp72 ::temp71 
						assign voiceForm ::temp72 
						; line 324
						propget rdoActive ::varScript_var ::temp63 
						cast ::temp63 ::temp63 
						jmpf ::temp63 _label3
						cast ::temp63 voiceForm 
					_label3:
						jmpf ::temp63 _label4
						; line 325
						callstatic game GetFormFromFile ::temp72 1144444 "Relationship Dialogue Overhaul.esp" ;2 variable args
						cast ::temp73 ::temp72 
						assign rdoList ::temp73 
						; line 326
						callmethod Find rdoList ::temp64 voiceForm ;1 variable args
						cmp_eq ::temp74 ::temp64 -1 
						not ::temp74 ::temp74 
						jmpf ::temp74 _label5
						; line 327
						assign allowVoice true 
						jmp _label5
					_label5:
						jmp _label4
						; line 330
					_label4:
						propget VoicesFollowerAll ::varScript_var ::temp73 
						callmethod Find ::temp73 ::temp64 voiceForm ;1 variable args
						cmp_eq ::temp74 ::temp64 -1 
						not ::temp74 ::temp74 
						cast ::temp63 ::temp74 
						jmpt ::temp63 _label6
						cast ::temp63 allowVoice 
					_label6:
						jmpf ::temp63 _label7
						; line 331
						assign ::temp66 "$FF_ForceFollower" 
						iadd ::temp64 UICount 2 
						array_setelement UIChoices ::temp64 ::temp66 
						jmp _label8
						; line 333
					_label7:
						assign ::temp68 "$FF_NoForceFollower" 
						iadd ::temp64 UICount 2 
						array_setelement UIChoices ::temp64 ::temp68 
						; line 336
					_label8:
						assign allowVoice false 
						; line 337
						propget rdoActive ::varScript_var ::temp74 
						jmpf ::temp74 _label9
						; line 338
						callstatic game GetFormFromFile ::temp72 1144443 "Relationship Dialogue Overhaul.esp" ;2 variable args
						cast ::temp73 ::temp72 
						assign rdoList ::temp73 
						; line 339
						callmethod Find rdoList ::temp64 voiceForm ;1 variable args
						cmp_eq ::temp63 ::temp64 -1 
						not ::temp63 ::temp63 
						jmpf ::temp63 _label10
						; line 340
						assign allowVoice true 
						jmp _label10
					_label10:
						jmp _label9
						; line 343
					_label9:
						propget VoicesMarriageAll ::varScript_var ::temp73 
						callmethod Find ::temp73 ::temp64 voiceForm ;1 variable args
						cmp_eq ::temp63 ::temp64 -1 
						not ::temp63 ::temp63 
						cast ::temp74 ::temp63 
						jmpt ::temp74 _label11
						cast ::temp74 allowVoice 
					_label11:
						jmpf ::temp74 _label12
						; line 344
						assign ::temp67 "$FF_ForceMarry" 
						iadd ::temp64 UICount 3 
						array_setelement UIChoices ::temp64 ::temp67 
						jmp _label13
						; line 346
					_label12:
						assign ::temp66 "$FF_NoForceMarry" 
						iadd ::temp64 UICount 3 
						array_setelement UIChoices ::temp64 ::temp66 
						; line 349
					_label13:
						assign ::temp68 "$FF_SkillMenu" 
						iadd ::temp64 UICount 4 
						array_setelement UIChoices ::temp64 ::temp68 
						; line 350
						assign ::temp67 "$FF_SpellMenu" 
						iadd ::temp64 UICount 5 
						array_setelement UIChoices ::temp64 ::temp67 
						; line 351
						assign ::temp66 "$FF_SubAll" 
						iadd ::temp64 UICount 6 
						array_setelement UIChoices ::temp64 ::temp66 
						; line 353
						cast ::temp72 self 
						cast ::temp75 ::temp72 
						callmethod GetActorName self ::temp68 ::UIActor_var ;1 variable args
						callmethod ShowList ::temp75 ::temp64 ::temp68 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp64 
						; line 354
						cmp_gt ::temp63 UIPick 0 
						jmpf ::temp63 _label14
						; line 356
						iadd ::temp64 UICount 1 
						cmp_eq ::temp74 UIPick ::temp64 
						jmpf ::temp74 _label15
						; line 357
						cast ::temp62 none 
						cmp_eq ::temp76 ::UIspellTarget_var ::temp62 
						not ::temp76 ::temp76 
						jmpf ::temp76 _label16
						; line 358
						propget nwsAttackTargetSpell ::varScript_var ::temp77 
						cast ::temp78 ::myPlayer_var 
						callmethod Cast ::temp77 ::NoneVar ::temp78 none ;2 variable args
						jmp _label16
					_label16:
						jmp _label17
						; line 361
					_label15:
						iadd ::temp64 UICount 2 
						cmp_eq ::temp76 UIPick ::temp64 
						jmpf ::temp76 _label18
						; line 362
						callmethod ForceFollower ::controlScript_var ::NoneVar ;0 variable args
						jmp _label17
						; line 363
					_label18:
						iadd ::temp64 UICount 3 
						cmp_eq ::temp76 UIPick ::temp64 
						jmpf ::temp76 _label19
						; line 364
						callmethod ForceMarry ::controlScript_var ::NoneVar ;0 variable args
						jmp _label17
						; line 366
					_label19:
						iadd ::temp64 UICount 4 
						cmp_eq ::temp76 UIPick ::temp64 
						jmpf ::temp76 _label20
						; line 367
						callmethod UISkills self ::NoneVar ;0 variable args
						jmp _label17
						; line 368
					_label20:
						iadd ::temp64 UICount 5 
						cmp_eq ::temp76 UIPick ::temp64 
						jmpf ::temp76 _label21
						; line 369
						callmethod UISpells self ::NoneVar ;0 variable args
						jmp _label17
						; line 370
					_label21:
						iadd ::temp64 UICount 6 
						cmp_eq ::temp76 UIPick ::temp64 
						jmpf ::temp76 _label17
						; line 371
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label17
					_label17:
						jmp _label14
					_label14
					.endCode
				.endFunction ;UICmdOneNPC
				.function UIWaitAllSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp107 String[]
						.local ::temp108 String
						.local ::temp109 form
						.local ::temp110 uilib_1
						.local ::temp111 Int
						.local ::temp112 Bool
						.local ::temp113 Bool
						.local ::temp114 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 539
						callstatic utility CreateStringArray ::temp107 5 "" ;2 variable args
						assign UIChoices ::temp107 
						; line 540
						assign ::temp108 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp108 
						; line 541
						assign ::temp108 "$FF_AllWait" 
						array_setelement UIChoices 1 ::temp108 
						; line 542
						assign ::temp108 "$FF_AllFollowM" 
						array_setelement UIChoices 2 ::temp108 
						; line 543
						assign ::temp108 "$FF_AllBehind" 
						array_setelement UIChoices 3 ::temp108 
						; line 544
						assign ::temp108 "$FF_Back" 
						array_setelement UIChoices 4 ::temp108 
						; line 545
						cast ::temp109 self 
						cast ::temp110 ::temp109 
						callmethod ShowList ::temp110 ::temp111 "$FF_WaitMenu" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp111 
						; line 547
						cmp_gt ::temp112 UIPick 0 
						jmpf ::temp112 _label0
						; line 548
						cmp_eq ::temp113 UIPick 1 
						jmpf ::temp113 _label1
						; line 549
						callmethod WaitAll ::controlScript_var ::NoneVar ;0 variable args
						jmp _label2
						; line 550
					_label1:
						cmp_eq ::temp114 UIPick 2 
						jmpf ::temp114 _label3
						; line 551
						callmethod FollowAll ::controlScript_var ::NoneVar ;0 variable args
						jmp _label2
						; line 552
					_label3:
						cmp_eq ::temp114 UIPick 3 
						jmpf ::temp114 _label4
						; line 553
						callmethod BehindAllEffect ::controlScript_var ::NoneVar ;0 variable args
						jmp _label2
						; line 554
					_label4:
						cmp_eq ::temp114 UIPick 4 
						jmpf ::temp114 _label2
						; line 555
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIWaitAllSub
				.function UIHomeBase
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp289 String[]
						.local ::temp290 String
						.local ::temp291 faction
						.local ::temp292 Bool
						.local ::temp296 form
						.local ::temp297 uilib_1
						.local hInd Int
						.local homeName String
						.local hLoc Int
						.local ::temp293 Int
						.local maxNumBases Int
						.local ::temp294 Bool
						.local ::temp295 String
						.local totalSlots Int
						.local emptySlots Int
						.local ::temp298 Bool
						.local ::NoneVar None
						.local ::temp299 Int[]
						.local ::temp300 Int
					.endLocalTable
					.code
						; line 1293
						callstatic utility CreateStringArray ::temp289 23 "" ;2 variable args
						assign UIChoices ::temp289 
						; line 1294
						assign ::temp290 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp290 
						; line 1296
						assign hInd 0 
						; line 1298
						assign hLoc -1 
						; line 1299
						propget nwsFF_HomeFac ::varScript_var ::temp291 
						callmethod IsInFaction ::UIActor_var ::temp292 ::temp291 ;1 variable args
						jmpf ::temp292 _label0
						; line 1300
						propget nwsFF_HomeFac ::varScript_var ::temp291 
						callmethod GetFactionRank ::UIActor_var ::temp293 ::temp291 ;1 variable args
						cast ::temp293 ::temp293 
						assign hLoc ::temp293 
						jmp _label0
						; line 1303
					_label0:
						propget maxBases ::homeScript_var ::temp293 
						assign maxNumBases ::temp293 
						; line 1305
					_label5:
						cmp_lt ::temp292 hInd maxNumBases 
						jmpf ::temp292 _label1
						; line 1306
						cmp_lt ::temp294 hInd 9 
						jmpf ::temp294 _label2
						; line 1307
						iadd ::temp293 hInd 1 
						cast ::temp290 ::temp293 
						strcat ::temp290 "0" ::temp290 
						strcat ::temp290 ::temp290 " - " 
						propget nwsHBNames ::homeScript_var ::temp289 
						array_getlement ::temp295 ::temp289 hInd 
						strcat ::temp290 ::temp290 ::temp295 
						assign homeName ::temp290 
						jmp _label3
						; line 1309
					_label2:
						iadd ::temp293 hInd 1 
						cast ::temp295 ::temp293 
						strcat ::temp290 ::temp295 " - " 
						propget nwsHBNames ::homeScript_var ::temp289 
						array_getlement ::temp295 ::temp289 hInd 
						strcat ::temp290 ::temp290 ::temp295 
						assign homeName ::temp290 
						; line 1311
					_label3:
						cmp_eq ::temp294 hLoc hInd 
						jmpf ::temp294 _label4
						; line 1312
						strcat ::temp295 homeName " (current)" 
						assign homeName ::temp295 
						jmp _label4
						; line 1314
					_label4:
						assign ::temp290 homeName 
						iadd ::temp293 hInd 1 
						array_setelement UIChoices ::temp293 ::temp290 
						; line 1315
						iadd ::temp293 hInd 1 
						assign hInd ::temp293 
						jmp _label5
						; line 1317
					_label1:
						assign ::temp295 "$FF_FolBaseRemSel" 
						array_setelement UIChoices 21 ::temp295 
						; line 1318
						assign ::temp290 "$FF_Back" 
						array_setelement UIChoices 22 ::temp290 
						; line 1320
						propget maxHomeSlots ::homeScript_var ::temp293 
						assign totalSlots ::temp293 
						; line 1321
						propget nwsBaseTotal ::homeScript_var ::temp293 
						isub ::temp293 totalSlots ::temp293 
						assign emptySlots ::temp293 
						; line 1323
						cast ::temp296 self 
						cast ::temp297 ::temp296 
						cast ::temp295 emptySlots 
						strcat ::temp290 "Set Home Base (" ::temp295 
						strcat ::temp295 ::temp290 " slots left)" 
						callmethod ShowList ::temp297 ::temp293 ::temp295 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp293 
						; line 1325
						cmp_gt ::temp294 UIPick 0 
						jmpf ::temp294 _label6
						; line 1326
						cmp_eq ::temp292 UIPick 21 
						jmpf ::temp292 _label7
						; line 1327
						propget nwsFF_HomeFac ::varScript_var ::temp291 
						callmethod IsInFaction ::UIActor_var ::temp298 ::temp291 ;1 variable args
						jmpf ::temp298 _label8
						; line 1328
						callmethod SetFollowerHome ::homeScript_var ::NoneVar 0 ::UIActor_var true ;3 variable args
						; line 1329
						callmethod UINotifyPlayer self ::NoneVar "$FF_FolBaseRemove" 3 ;2 variable args
						jmp _label8
					_label8:
						jmp _label9
						; line 1331
					_label7:
						cmp_eq ::temp298 UIPick 22 
						jmpf ::temp298 _label10
						; line 1332
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label9
						; line 1334
					_label10:
						propget nwsHomeLocSet ::homeScript_var ::temp299 
						isub ::temp293 UIPick 1 
						array_getlement ::temp300 ::temp299 ::temp293 
						cmp_eq ::temp298 ::temp300 1 
						jmpf ::temp298 _label9
						; line 1335
						isub ::temp293 UIPick 1 
						callmethod SetFollowerHome ::homeScript_var ::NoneVar ::temp293 ::UIActor_var false ;3 variable args
						; line 1336
						callmethod UINotifyPlayer self ::NoneVar "$FF_FolAssignBase" 3 ;2 variable args
						jmp _label9
					_label9:
						jmp _label6
					_label6
					.endCode
				.endFunction ;UIHomeBase
				.function UIMoralitySub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp230 String[]
						.local ::temp231 String
						.local ::temp232 form
						.local ::temp233 uilib_1
						.local ::temp234 Int
						.local ::temp235 Bool
						.local ::temp236 Bool
						.local ::temp237 Bool
						.local ::NoneVar None
						.local ::temp238 faction
						.local ::temp239 Float
					.endLocalTable
					.code
						; line 1082
						callstatic utility CreateStringArray ::temp230 6 "" ;2 variable args
						assign UIChoices ::temp230 
						; line 1083
						assign ::temp231 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp231 
						; line 1084
						assign ::temp231 "$FF_Morality1" 
						array_setelement UIChoices 1 ::temp231 
						; line 1085
						assign ::temp231 "$FF_Morality2" 
						array_setelement UIChoices 2 ::temp231 
						; line 1086
						assign ::temp231 "$FF_Morality3" 
						array_setelement UIChoices 3 ::temp231 
						; line 1087
						assign ::temp231 "$FF_Morality4" 
						array_setelement UIChoices 4 ::temp231 
						; line 1088
						assign ::temp231 "$FF_Back" 
						array_setelement UIChoices 5 ::temp231 
						; line 1089
						cast ::temp232 self 
						cast ::temp233 ::temp232 
						callmethod ShowList ::temp233 ::temp234 "$FF_SetMorality" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp234 
						; line 1091
						cmp_gt ::temp235 UIPick 0 
						jmpf ::temp235 _label0
						; line 1092
						cmp_gt ::temp236 UIPick 0 
						cast ::temp236 ::temp236 
						jmpf ::temp236 _label1
						cmp_lt ::temp237 UIPick 5 
						cast ::temp236 ::temp237 
					_label1:
						jmpf ::temp236 _label2
						; line 1093
						jmpf ::UIAll_var _label3
						; line 1094
						isub ::temp234 UIPick 1 
						callmethod DoTaskAll ::controlScript_var ::NoneVar 31 ::temp234 ;2 variable args
						; line 1095
						callmethod UINotifyPlayer self ::NoneVar "$FF_MoralSetAll" 2 ;2 variable args
						; line 1096
						callmethod UITraitAllSub self ::NoneVar ;0 variable args
						jmp _label4
						; line 1098
					_label3:
						propget nwsFF_MoralFac ::varScript_var ::temp238 
						callmethod IsInFaction ::UIActor_var ::temp237 ::temp238 ;1 variable args
						not ::temp237 ::temp237 
						jmpf ::temp237 _label5
						; line 1099
						propget nwsFF_MoralFac ::varScript_var ::temp238 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp238 ;1 variable args
						jmp _label5
						; line 1101
					_label5:
						propget nwsFF_MoralFac ::varScript_var ::temp238 
						isub ::temp234 UIPick 1 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp238 ::temp234 ;2 variable args
						; line 1102
						isub ::temp234 UIPick 1 
						cast ::temp239 ::temp234 
						callmethod SetActorValue ::UIActor_var ::NoneVar "Morality" ::temp239 ;2 variable args
						; line 1103
						callmethod UINotifyPlayer self ::NoneVar "$FF_MoralSet" 2 ;2 variable args
						; line 1104
						callmethod UITraitSub self ::NoneVar ;0 variable args
					_label4:
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIMoralitySub
				.function UICmdOneMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myActor actor
					.endParamTable
					.localTable
						.local ::temp26 referencealias
						.local ::temp27 Float
						.local ::temp28 Int
						.local ::temp29 faction
						.local ::temp30 Bool
						.local ::temp31 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 152
						assign ::UIActor_var myActor 
						; line 153
						callmethod FetchAlias self ::temp26 ::UIActor_var ;1 variable args
						assign ::UIAlias_var ::temp26 
						; line 155
						callmethod GetActorValue ::UIActor_var ::temp27 "Health" ;1 variable args
						cast ::temp28 ::temp27 
						assign UIHeath ::temp28 
						; line 156
						callmethod GetActorValue ::UIActor_var ::temp27 "Magicka" ;1 variable args
						cast ::temp28 ::temp27 
						assign UIMagicka ::temp28 
						; line 157
						callmethod GetActorValue ::UIActor_var ::temp27 "Stamina" ;1 variable args
						cast ::temp28 ::temp27 
						assign UIStamina ::temp28 
						; line 159
						propget nwsFF_FollowerFac ::varScript_var ::temp29 
						callmethod IsInFaction ::UIActor_var ::temp30 ::temp29 ;1 variable args
						jmpf ::temp30 _label0
						; line 160
						assign ::UIType_var 0 
						; line 161
						callmethod UICmdOneFollower self ::NoneVar ;0 variable args
						jmp _label1
						; line 162
					_label0:
						propget PotentialFollowerFaction ::varScript_var ::temp29 
						callmethod IsInFaction ::UIActor_var ::temp31 ::temp29 ;1 variable args
						jmpf ::temp31 _label2
						; line 163
						assign ::UIType_var 1 
						; line 164
						callmethod UICmdOnePotential self ::NoneVar ;0 variable args
						jmp _label1
						; line 166
					_label2:
						assign ::UIType_var 2 
						; line 167
						callmethod UICmdOneNPC self ::NoneVar ;0 variable args
					_label1
					.endCode
				.endFunction ;UICmdOneMenu
				.function OnUpdate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 51
						assign ::isRetreat_var 0 
					.endCode
				.endFunction ;OnUpdate
				.function UITraitSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp168 String[]
						.local ::temp169 actorbase
						.local ::temp170 class
						.local ::temp171 String
						.local ::temp172 Bool
						.local ::temp173 Int
						.local ::temp174 String
						.local ::temp178 Float
						.local ::temp179 form
						.local ::temp180 uilib_1
						.local classTxt String
						.local regardRankStr String
						.local ::NoneVar None
						.local ::temp175 faction
						.local ::temp176 Bool
						.local ::temp177 followeraliasscript
						.local regardRank Int
						.local myRank Int
						.local chString String
					.endLocalTable
					.code
						; line 783
						callstatic utility CreateStringArray ::temp168 9 "" ;2 variable args
						assign UIChoices ::temp168 
						; line 785
						callmethod GetActorBase ::UIActor_var ::temp169 ;0 variable args
						callmethod GetClass ::temp169 ::temp170 ;0 variable args
						callmethod GetName ::temp170 ::temp171 ;0 variable args
						assign classTxt ::temp171 
						; line 786
						cmp_eq ::temp172 classTxt "dremora" 
						jmpf ::temp172 _label0
						; line 787
						assign classTxt "Warrior" 
						jmp _label0
						; line 789
					_label0:
						callmethod GetLevel ::UIActor_var ::temp173 ;0 variable args
						cast ::temp174 ::temp173 
						strcat ::temp174 "Level " ::temp174 
						strcat ::temp174 ::temp174 " " 
						strcat ::temp174 ::temp174 classTxt 
						strcat ::temp174 ::temp174 " [x]" 
						assign ::temp171 ::temp174 
						array_setelement UIChoices 0 ::temp171 
						; line 791
						assign regardRankStr "Disabled" 
						; line 792
						propget nwsUseRegard ::controlScript_var ::temp173 
						cmp_eq ::temp172 ::temp173 1 
						jmpf ::temp172 _label1
						; line 793
						callmethod SetRegardFaction ::controlScript_var ::NoneVar ::UIAlias_var ;1 variable args
						; line 794
						assign regardRankStr "Indifferent" 
						; line 795
						assign regardRank 0 
						; line 796
						propget nwsFF_RegardFac ::varScript_var ::temp175 
						callmethod IsInFaction ::UIActor_var ::temp176 ::temp175 ;1 variable args
						jmpf ::temp176 _label2
						; line 797
						propget nwsFF_RegardFac ::varScript_var ::temp175 
						callmethod GetFactionRank ::UIActor_var ::temp173 ::temp175 ;1 variable args
						cast ::temp173 ::temp173 
						assign regardRank ::temp173 
						jmp _label2
						; line 799
					_label2:
						propget actRegard ::mcmScript_var ::temp168 
						array_getlement ::temp171 ::temp168 regardRank 
						callstatic stringutil Substring ::temp174 ::temp171 1 0 ;3 variable args
						assign regardRankStr ::temp174 
						; line 800
						cast ::temp171 regardRank 
						strcat ::temp174 " (Rank " ::temp171 
						strcat ::temp171 ::temp174 ", Points " 
						cast ::temp177 ::UIAlias_var 
						propget regardTotal ::temp177 ::temp173 
						cast ::temp174 ::temp173 
						strcat ::temp174 ::temp171 ::temp174 
						strcat ::temp171 ::temp174 ")" 
						strcat ::temp174 regardRankStr ::temp171 
						assign regardRankStr ::temp174 
						jmp _label1
						; line 803
					_label1:
						strcat ::temp174 "Regard: " regardRankStr 
						assign ::temp171 ::temp174 
						array_setelement UIChoices 1 ::temp171 
						; line 809
						propget nwsFF_RoleFac ::varScript_var ::temp175 
						callmethod GetFactionRank ::UIActor_var ::temp173 ::temp175 ;1 variable args
						cmp_eq ::temp176 ::temp173 1 
						jmpf ::temp176 _label3
						; line 810
						assign ::temp171 "$FF_RoleHealer" 
						array_setelement UIChoices 2 ::temp171 
						jmp _label4
						; line 811
					_label3:
						propget nwsFF_RoleFac ::varScript_var ::temp175 
						callmethod GetFactionRank ::UIActor_var ::temp173 ::temp175 ;1 variable args
						cmp_eq ::temp172 ::temp173 2 
						jmpf ::temp172 _label5
						; line 812
						assign ::temp174 "$FF_RoleTank" 
						array_setelement UIChoices 2 ::temp174 
						jmp _label4
						; line 814
					_label5:
						assign ::temp171 "$FF_RoleStandard" 
						array_setelement UIChoices 2 ::temp171 
						; line 817
					_label4:
						assign myRank -1 
						; line 818
						assign chString "$FF_CStyle0" 
						; line 819
						propget nwsFF_CSFac ::varScript_var ::temp175 
						callmethod IsInFaction ::UIActor_var ::temp172 ::temp175 ;1 variable args
						jmpf ::temp172 _label6
						; line 820
						propget nwsFF_CSFac ::varScript_var ::temp175 
						callmethod GetFactionRank ::UIActor_var ::temp173 ::temp175 ;1 variable args
						cast ::temp173 ::temp173 
						assign myRank ::temp173 
						jmp _label6
						; line 822
					_label6:
						cmp_eq ::temp176 myRank 0 
						jmpf ::temp176 _label7
						; line 823
						assign chString "$FF_CStyle1" 
						jmp _label8
						; line 824
					_label7:
						cmp_eq ::temp172 myRank 1 
						jmpf ::temp172 _label9
						; line 825
						assign chString "$FF_CStyle2" 
						jmp _label8
						; line 826
					_label9:
						cmp_eq ::temp172 myRank 2 
						jmpf ::temp172 _label10
						; line 827
						assign chString "$FF_CStyle3" 
						jmp _label8
						; line 828
					_label10:
						cmp_eq ::temp172 myRank 3 
						jmpf ::temp172 _label11
						; line 829
						assign chString "$FF_CStyle4" 
						jmp _label8
						; line 830
					_label11:
						cmp_eq ::temp172 myRank 4 
						jmpf ::temp172 _label12
						; line 831
						assign chString "$FF_CStyle5" 
						jmp _label8
						; line 832
					_label12:
						cmp_eq ::temp172 myRank 5 
						jmpf ::temp172 _label13
						; line 833
						assign chString "$FF_CStyle6" 
						jmp _label8
						; line 834
					_label13:
						cmp_eq ::temp172 myRank 6 
						jmpf ::temp172 _label14
						; line 835
						assign chString "$FF_CStyle7" 
						jmp _label8
						; line 836
					_label14:
						cmp_eq ::temp172 myRank 7 
						jmpf ::temp172 _label15
						; line 837
						assign chString "$FF_CStyle8" 
						jmp _label8
						; line 838
					_label15:
						cmp_eq ::temp172 myRank 8 
						jmpf ::temp172 _label16
						; line 839
						assign chString "$FF_CStyle9" 
						jmp _label8
						; line 840
					_label16:
						cmp_eq ::temp172 myRank 9 
						jmpf ::temp172 _label8
						; line 841
						assign chString "$FF_CStyle10" 
						jmp _label8
						; line 843
					_label8:
						assign ::temp174 chString 
						array_setelement UIChoices 3 ::temp174 
						; line 845
						callmethod GetActorValue ::UIActor_var ::temp178 "Aggression" ;1 variable args
						cast ::temp173 ::temp178 
						assign myRank ::temp173 
						; line 846
						cmp_eq ::temp172 myRank 0 
						jmpf ::temp172 _label17
						; line 847
						assign chString "$FF_Unaggressive" 
						jmp _label18
						; line 849
					_label17:
						assign chString "$FF_Aggressive" 
						; line 851
					_label18:
						assign ::temp171 chString 
						array_setelement UIChoices 4 ::temp171 
						; line 853
						callmethod GetActorValue ::UIActor_var ::temp178 "Assistance" ;1 variable args
						cast ::temp173 ::temp178 
						assign myRank ::temp173 
						; line 854
						cmp_eq ::temp176 myRank 0 
						jmpf ::temp176 _label19
						; line 855
						assign chString "$FF_AssistNobody" 
						jmp _label20
						; line 856
					_label19:
						cmp_eq ::temp172 myRank 1 
						jmpf ::temp172 _label21
						; line 857
						assign chString "$FF_AssistAllies" 
						jmp _label20
						; line 859
					_label21:
						assign chString "$FF_AssistFriends" 
						; line 861
					_label20:
						assign ::temp174 chString 
						array_setelement UIChoices 5 ::temp174 
						; line 863
						callmethod GetActorValue ::UIActor_var ::temp178 "Confidence" ;1 variable args
						cast ::temp173 ::temp178 
						assign myRank ::temp173 
						; line 864
						cmp_eq ::temp172 myRank 0 
						jmpf ::temp172 _label22
						; line 865
						assign chString "$FF_ConCoward" 
						jmp _label23
						; line 866
					_label22:
						cmp_eq ::temp176 myRank 1 
						jmpf ::temp176 _label24
						; line 867
						assign chString "$FF_ConCautious" 
						jmp _label23
						; line 868
					_label24:
						cmp_eq ::temp176 myRank 2 
						jmpf ::temp176 _label25
						; line 869
						assign chString "$FF_ConAverage" 
						jmp _label23
						; line 870
					_label25:
						cmp_eq ::temp176 myRank 3 
						jmpf ::temp176 _label26
						; line 871
						assign chString "$FF_ConBrave" 
						jmp _label23
						; line 873
					_label26:
						assign chString "$FF_ConFoolhardy" 
						; line 875
					_label23:
						assign ::temp171 chString 
						array_setelement UIChoices 6 ::temp171 
						; line 876
						callmethod GetActorValue ::UIActor_var ::temp178 "Morality" ;1 variable args
						cast ::temp173 ::temp178 
						assign myRank ::temp173 
						; line 877
						cmp_eq ::temp176 myRank 0 
						jmpf ::temp176 _label27
						; line 878
						assign chString "$FF_MoralAny" 
						jmp _label28
						; line 879
					_label27:
						cmp_eq ::temp172 myRank 1 
						jmpf ::temp172 _label29
						; line 880
						assign chString "$FF_MoralEnemy" 
						jmp _label28
						; line 881
					_label29:
						cmp_eq ::temp172 myRank 2 
						jmpf ::temp172 _label30
						; line 882
						assign chString "$FF_MoralProperty" 
						jmp _label28
						; line 884
					_label30:
						assign chString "$FF_MoralNo" 
						; line 886
					_label28:
						assign ::temp174 chString 
						array_setelement UIChoices 7 ::temp174 
						; line 887
						assign ::temp171 "$FF_Back" 
						array_setelement UIChoices 8 ::temp171 
						; line 888
						cast ::temp179 self 
						cast ::temp180 ::temp179 
						callmethod ShowList ::temp180 ::temp173 "$FF_TraitsTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp173 
						; line 890
						jmpf UIPick _label31
						; line 891
						cmp_eq ::temp172 UIPick 1 
						jmpf ::temp172 _label32
						; line 892
						callmethod UITraitSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 893
					_label32:
						cmp_eq ::temp176 UIPick 2 
						jmpf ::temp176 _label34
						; line 894
						callmethod UIRoleSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 895
					_label34:
						cmp_eq ::temp176 UIPick 3 
						jmpf ::temp176 _label35
						; line 896
						callmethod UICStyleSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 897
					_label35:
						cmp_eq ::temp176 UIPick 4 
						jmpf ::temp176 _label36
						; line 898
						assign ::UIAll_var false 
						; line 899
						callmethod UIAggressionSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 900
					_label36:
						cmp_eq ::temp176 UIPick 5 
						jmpf ::temp176 _label37
						; line 901
						assign ::UIAll_var false 
						; line 902
						callmethod UIAssistanceSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 903
					_label37:
						cmp_eq ::temp176 UIPick 6 
						jmpf ::temp176 _label38
						; line 904
						assign ::UIAll_var false 
						; line 905
						callmethod UIConfidenceSub self ::NoneVar ;0 variable args
						jmp _label33
						; line 906
					_label38:
						cmp_eq ::temp176 UIPick 7 
						jmpf ::temp176 _label39
						; line 907
						assign ::UIAll_var false 
						; line 908
						callmethod UIMoralitySub self ::NoneVar ;0 variable args
						jmp _label33
						; line 909
					_label39:
						cmp_eq ::temp176 UIPick 8 
						jmpf ::temp176 _label33
						; line 910
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label33
					_label33:
						jmp _label31
					_label31
					.endCode
				.endFunction ;UITraitSub
				.function UIHeadwearSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp267 String[]
						.local ::temp268 String
						.local ::temp269 faction
						.local ::temp270 Bool
						.local ::temp273 form
						.local ::temp274 uilib_1
						.local ::temp271 Int
						.local ::temp272 Bool
						.local ::temp275 followeraliasscript
						.local ::temp276 form
						.local ::NoneVar None
						.local ::temp277 Bool
						.local ::temp278 Bool
					.endLocalTable
					.code
						; line 1209
						callstatic utility CreateStringArray ::temp267 5 "" ;2 variable args
						assign UIChoices ::temp267 
						; line 1210
						assign ::temp268 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp268 
						; line 1211
						assign ::temp268 "$FF_HeadSetNone" 
						array_setelement UIChoices 1 ::temp268 
						; line 1213
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod IsInFaction ::UIActor_var ::temp270 ::temp269 ;1 variable args
						jmpf ::temp270 _label0
						; line 1214
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod GetFactionRank ::UIActor_var ::temp271 ::temp269 ;1 variable args
						cmp_eq ::temp272 ::temp271 1 
						jmpf ::temp272 _label1
						; line 1215
						assign ::temp268 "$FF_HeadCombatOff" 
						array_setelement UIChoices 2 ::temp268 
						; line 1216
						assign ::temp268 "$FF_NoHelmOn" 
						array_setelement UIChoices 3 ::temp268 
						jmp _label2
						; line 1218
					_label1:
						assign ::temp268 "$FF_HeadCombatOn" 
						array_setelement UIChoices 2 ::temp268 
						; line 1219
						assign ::temp268 "$FF_NoHelmOff" 
						array_setelement UIChoices 3 ::temp268 
					_label2:
						jmp _label3
						; line 1222
					_label0:
						assign ::temp268 "$FF_HeadCombatOff" 
						array_setelement UIChoices 2 ::temp268 
						; line 1223
						assign ::temp268 "$FF_NoHelmOff" 
						array_setelement UIChoices 3 ::temp268 
						; line 1225
					_label3:
						assign ::temp268 "$FF_Back" 
						array_setelement UIChoices 4 ::temp268 
						; line 1226
						cast ::temp273 self 
						cast ::temp274 ::temp273 
						callmethod ShowList ::temp274 ::temp271 "$FF_HeadwearTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp271 
						; line 1228
						jmpf UIPick _label4
						; line 1229
						cmp_eq ::temp272 UIPick 1 
						jmpf ::temp272 _label5
						; line 1230
						cast ::temp276 none 
						assign ::temp273 ::temp276 
						cast ::temp275 ::UIAlias_var 
						propset wornHelmet ::temp275 ::temp273 
						; line 1231
						callmethod UINotifyPlayer self ::NoneVar "$FF_HeadwearCleared" 0 ;2 variable args
						jmp _label6
						; line 1232
					_label5:
						cmp_eq ::temp270 UIPick 2 
						jmpf ::temp270 _label7
						; line 1233
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod IsInFaction ::UIActor_var ::temp277 ::temp269 ;1 variable args
						jmpf ::temp277 _label8
						; line 1234
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod GetFactionRank ::UIActor_var ::temp271 ::temp269 ;1 variable args
						cmp_eq ::temp278 ::temp271 1 
						jmpf ::temp278 _label9
						; line 1235
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp269 0 ;2 variable args
						jmp _label10
						; line 1237
					_label9:
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp269 ;1 variable args
					_label10:
						jmp _label11
						; line 1240
					_label8:
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp269 ;1 variable args
						; line 1241
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp269 0 ;2 variable args
						; line 1243
					_label11:
						callmethod UINotifyPlayer self ::NoneVar "$FF_HeadwearApplied" 0 ;2 variable args
						; line 1244
						cast ::temp275 ::UIAlias_var 
						callmethod CheckFollower ::temp275 ::NoneVar 0.500000 false false ;3 variable args
						jmp _label6
						; line 1245
					_label7:
						cmp_eq ::temp278 UIPick 3 
						jmpf ::temp278 _label12
						; line 1246
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod IsInFaction ::UIActor_var ::temp277 ::temp269 ;1 variable args
						jmpf ::temp277 _label13
						; line 1247
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod GetFactionRank ::UIActor_var ::temp271 ::temp269 ;1 variable args
						cmp_eq ::temp270 ::temp271 0 
						jmpf ::temp270 _label14
						; line 1248
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp269 1 ;2 variable args
						jmp _label15
						; line 1250
					_label14:
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp269 ;1 variable args
					_label15:
						jmp _label16
						; line 1253
					_label13:
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp269 ;1 variable args
						; line 1254
						propget nwsFF_HelmFac ::varScript_var ::temp269 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp269 1 ;2 variable args
						; line 1256
					_label16:
						callmethod UINotifyPlayer self ::NoneVar "$FF_HeadwearApplied" 0 ;2 variable args
						; line 1257
						cast ::temp275 ::UIAlias_var 
						callmethod CheckFollower ::temp275 ::NoneVar 0.500000 false false ;3 variable args
						jmp _label6
						; line 1258
					_label12:
						cmp_eq ::temp270 UIPick 4 
						jmpf ::temp270 _label6
						; line 1259
						callmethod UIInventory self ::NoneVar ;0 variable args
						jmp _label6
					_label6:
						jmp _label4
					_label4
					.endCode
				.endFunction ;UIHeadwearSub
				.function UISkills
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::NoneVar None
						.local ::temp93 String[]
						.local ::temp94 Int[]
						.local ::temp95 Bool
						.local ::temp105 form
						.local ::temp106 uilib_1
						.local index Int
						.local mySkillVal Int[]
						.local mySkill String[]
						.local ::temp96 Int
						.local ::temp97 String
						.local ::temp98 Float
						.local ::temp99 Int
						.local ::temp100 String
						.local Index2 Int
						.local swapInt Int
						.local swapStr String
						.local ::temp101 Bool
						.local ::temp102 Int
						.local ::temp103 Bool
						.local ::temp104 String
					.endLocalTable
					.code
						; line 477
						callmethod GetSkillNames self ::NoneVar ;0 variable args
						; line 478
						callstatic utility CreateStringArray ::temp93 20 "" ;2 variable args
						assign UIChoices ::temp93 
						; line 479
						assign index 0 
						; line 483
						array_create ::temp94 18 
						assign mySkillVal ::temp94 
						; line 484
						array_create ::temp93 18 
						assign mySkill ::temp93 
						; line 486
					_label1:
						cmp_lt ::temp95 index 18 
						jmpf ::temp95 _label0
						; line 487
						propget actSkills ::mcmScript_var ::temp93 
						array_getlement ::temp97 ::temp93 index 
						callmethod GetActorValue ::UIActor_var ::temp98 ::temp97 ;1 variable args
						cast ::temp99 ::temp98 
						assign ::temp96 ::temp99 
						array_setelement mySkillVal index ::temp96 
						; line 488
						array_getlement ::temp100 ::actSkillStr_var index 
						assign ::temp97 ::temp100 
						array_setelement mySkill index ::temp97 
						; line 489
						iadd ::temp96 index 1 
						assign index ::temp96 
						jmp _label1
						; line 492
					_label0:
						assign index 0 
						; line 493
						assign Index2 17 
						; line 497
					_label6:
						cmp_gt ::temp95 Index2 0 
						jmpf ::temp95 _label2
						; line 498
						assign index 0 
						; line 499
					_label5:
						cmp_lt ::temp101 index Index2 
						jmpf ::temp101 _label3
						; line 500
						array_getlement ::temp99 mySkillVal index 
						iadd ::temp96 index 1 
						array_getlement ::temp102 mySkillVal ::temp96 
						cmp_lt ::temp103 ::temp99 ::temp102 
						jmpf ::temp103 _label4
						; line 502
						array_getlement ::temp96 mySkillVal index 
						assign swapInt ::temp96 
						; line 503
						array_getlement ::temp97 mySkill index 
						assign swapStr ::temp97 
						; line 505
						iadd ::temp102 index 1 
						array_getlement ::temp96 mySkillVal ::temp102 
						assign ::temp99 ::temp96 
						array_setelement mySkillVal index ::temp99 
						; line 506
						iadd ::temp102 index 1 
						array_getlement ::temp97 mySkill ::temp102 
						assign ::temp100 ::temp97 
						array_setelement mySkill index ::temp100 
						; line 508
						assign ::temp96 swapInt 
						iadd ::temp99 index 1 
						array_setelement mySkillVal ::temp99 ::temp96 
						; line 509
						assign ::temp100 swapStr 
						iadd ::temp102 index 1 
						array_setelement mySkill ::temp102 ::temp100 
						jmp _label4
						; line 511
					_label4:
						iadd ::temp99 index 1 
						assign index ::temp99 
						jmp _label5
						; line 513
					_label3:
						isub ::temp96 Index2 1 
						assign Index2 ::temp96 
						jmp _label6
						; line 516
					_label2:
						assign index 0 
						; line 518
						assign ::temp97 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp97 
						; line 519
					_label8:
						cmp_lt ::temp103 index 18 
						jmpf ::temp103 _label7
						; line 520
						array_getlement ::temp97 mySkill index 
						strcat ::temp97 ::temp97 " (" 
						array_getlement ::temp99 mySkillVal index 
						cast ::temp104 ::temp99 
						strcat ::temp104 ::temp97 ::temp104 
						strcat ::temp97 ::temp104 ")" 
						assign ::temp100 ::temp97 
						iadd ::temp102 index 1 
						array_setelement UIChoices ::temp102 ::temp100 
						; line 521
						iadd ::temp96 index 1 
						assign index ::temp96 
						jmp _label8
						; line 523
					_label7:
						assign ::temp104 "$FF_Back" 
						array_setelement UIChoices 19 ::temp104 
						; line 525
						cast ::temp105 self 
						cast ::temp106 ::temp105 
						callmethod ShowList ::temp106 ::temp102 "$FF_SkillTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp102 
						; line 526
						cmp_gt ::temp101 UIPick 0 
						jmpf ::temp101 _label9
						; line 527
						cmp_eq ::temp95 ::UIType_var 1 
						jmpf ::temp95 _label10
						; line 528
						callmethod UICmdOnePotential self ::NoneVar ;0 variable args
						jmp _label11
						; line 529
					_label10:
						cmp_eq ::temp103 ::UIType_var 2 
						jmpf ::temp103 _label12
						; line 530
						callmethod UICmdOneNPC self ::NoneVar ;0 variable args
						jmp _label11
						; line 532
					_label12:
						callmethod UICmdOneFollower self ::NoneVar ;0 variable args
					_label11:
						jmp _label9
					_label9
					.endCode
				.endFunction ;UISkills
				.function UICraftingSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp369 String[]
						.local ::temp370 String
						.local ::temp371 faction
						.local ::temp372 Bool
						.local ::temp376 form
						.local ::temp377 uilib_1
						.local ::temp373 Int
						.local ::temp374 Bool
						.local ::temp375 Bool
						.local arrowRank Int
						.local ::NoneVar None
						.local ::temp378 Bool
						.local ::temp379 Bool
						.local ::temp380 Bool
						.local ::mangled_arrowrank_0 Int
					.endLocalTable
					.code
						; line 1677
						callstatic utility CreateStringArray ::temp369 7 "" ;2 variable args
						assign UIChoices ::temp369 
						; line 1678
						assign ::temp370 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp370 
						; line 1679
						propget nwsFF_CraftTorchFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp372 ::temp371 ;1 variable args
						jmpf ::temp372 _label0
						; line 1680
						assign ::temp370 "$FF_CraftTorchOn" 
						array_setelement UIChoices 1 ::temp370 
						jmp _label1
						; line 1682
					_label0:
						assign ::temp370 "$FF_CraftTorchOff" 
						array_setelement UIChoices 1 ::temp370 
						; line 1684
					_label1:
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp372 ::temp371 ;1 variable args
						jmpf ::temp372 _label2
						; line 1685
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod GetFactionRank ::UIActor_var ::temp373 ::temp371 ;1 variable args
						cast ::temp373 ::temp373 
						assign arrowRank ::temp373 
						; line 1686
						cmp_eq ::temp374 arrowRank 0 
						cast ::temp374 ::temp374 
						jmpt ::temp374 _label3
						cmp_eq ::temp375 arrowRank 2 
						cast ::temp374 ::temp375 
					_label3:
						jmpf ::temp374 _label4
						; line 1687
						assign ::temp370 "$FF_CraftArrowsOn" 
						array_setelement UIChoices 2 ::temp370 
						jmp _label5
						; line 1689
					_label4:
						assign ::temp370 "$FF_CraftBoltsOn" 
						array_setelement UIChoices 2 ::temp370 
					_label5:
						jmp _label6
						; line 1692
					_label2:
						assign ::temp370 "$FF_CraftArrowsOff" 
						array_setelement UIChoices 2 ::temp370 
						; line 1694
					_label6:
						propget nwsFF_CraftPotionFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp375 ::temp371 ;1 variable args
						jmpf ::temp375 _label7
						; line 1695
						assign ::temp370 "$FF_CraftPotionsOn" 
						array_setelement UIChoices 3 ::temp370 
						jmp _label8
						; line 1697
					_label7:
						assign ::temp370 "$FF_CraftPotionsOff" 
						array_setelement UIChoices 3 ::temp370 
						; line 1699
					_label8:
						propget nwsFF_CraftSharpFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp374 ::temp371 ;1 variable args
						jmpf ::temp374 _label9
						; line 1700
						assign ::temp370 "$FF_SharpWeaponsOn" 
						array_setelement UIChoices 4 ::temp370 
						jmp _label10
						; line 1702
					_label9:
						assign ::temp370 "$FF_SharpWeaponsOff" 
						array_setelement UIChoices 4 ::temp370 
						; line 1704
					_label10:
						propget nwsFF_TavernFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp372 ::temp371 ;1 variable args
						jmpf ::temp372 _label11
						; line 1705
						assign ::temp370 "$FF_DrinkOn" 
						array_setelement UIChoices 5 ::temp370 
						jmp _label12
						; line 1707
					_label11:
						assign ::temp370 "$FF_DrinkOff" 
						array_setelement UIChoices 5 ::temp370 
						; line 1709
					_label12:
						assign ::temp370 "$FF_Back" 
						array_setelement UIChoices 6 ::temp370 
						; line 1710
						cast ::temp376 self 
						cast ::temp377 ::temp376 
						callmethod ShowList ::temp377 ::temp373 "$FF_CraftTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp373 
						; line 1712
						cmp_gt ::temp375 UIPick 0 
						jmpf ::temp375 _label13
						; line 1713
						cmp_eq ::temp374 UIPick 1 
						jmpf ::temp374 _label14
						; line 1714
						propget nwsFF_CraftTorchFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp372 ::temp371 ;1 variable args
						jmpf ::temp372 _label15
						; line 1715
						propget nwsFF_CraftTorchFac ::varScript_var ::temp371 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						jmp _label16
						; line 1717
					_label15:
						propget nwsFF_CraftTorchFac ::varScript_var ::temp371 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						; line 1718
						propget nwsFF_CraftTorchFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 0 ;2 variable args
						; line 1720
					_label16:
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label17
						; line 1721
					_label14:
						cmp_eq ::temp372 UIPick 2 
						jmpf ::temp372 _label18
						; line 1722
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp378 ::temp371 ;1 variable args
						jmpf ::temp378 _label19
						; line 1723
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod GetFactionRank ::UIActor_var ::temp373 ::temp371 ;1 variable args
						cast ::temp373 ::temp373 
						assign ::mangled_arrowrank_0 ::temp373 
						; line 1724
						cmp_eq ::temp379 ::mangled_arrowrank_0 0 
						cast ::temp379 ::temp379 
						jmpt ::temp379 _label20
						cmp_eq ::temp380 ::mangled_arrowrank_0 2 
						cast ::temp379 ::temp380 
					_label20:
						jmpf ::temp379 _label21
						; line 1725
						iadd ::temp373 ::mangled_arrowrank_0 1 
						assign ::mangled_arrowrank_0 ::temp373 
						; line 1726
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 ::mangled_arrowrank_0 ;2 variable args
						jmp _label22
						; line 1728
					_label21:
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
					_label22:
						jmp _label23
						; line 1731
					_label19:
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						; line 1732
						propget nwsFF_CraftArrowFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 0 ;2 variable args
						; line 1734
					_label23:
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label17
						; line 1735
					_label18:
						cmp_eq ::temp380 UIPick 3 
						jmpf ::temp380 _label24
						; line 1736
						propget nwsFF_CraftPotionFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp379 ::temp371 ;1 variable args
						jmpf ::temp379 _label25
						; line 1737
						propget nwsFF_CraftPotionFac ::varScript_var ::temp371 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						jmp _label26
						; line 1739
					_label25:
						propget nwsFF_CraftPotionFac ::varScript_var ::temp371 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						; line 1740
						propget nwsFF_CraftPotionFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 0 ;2 variable args
						; line 1742
					_label26:
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label17
						; line 1743
					_label24:
						cmp_eq ::temp378 UIPick 4 
						jmpf ::temp378 _label27
						; line 1744
						propget nwsFF_CraftSharpFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp372 ::temp371 ;1 variable args
						jmpf ::temp372 _label28
						; line 1745
						propget nwsFF_CraftSharpFac ::varScript_var ::temp371 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						jmp _label29
						; line 1747
					_label28:
						propget nwsFF_CraftSharpFac ::varScript_var ::temp371 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						; line 1748
						propget nwsFF_CraftSharpFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 0 ;2 variable args
						; line 1750
					_label29:
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label17
						; line 1751
					_label27:
						cmp_eq ::temp379 UIPick 5 
						jmpf ::temp379 _label30
						; line 1752
						propget nwsFF_TavernFac ::varScript_var ::temp371 
						callmethod IsInFaction ::UIActor_var ::temp380 ::temp371 ;1 variable args
						jmpf ::temp380 _label31
						; line 1753
						propget nwsFF_TavernFac ::varScript_var ::temp371 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						jmp _label32
						; line 1755
					_label31:
						propget nwsFF_TavernFac ::varScript_var ::temp371 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp371 ;1 variable args
						; line 1756
						propget nwsFF_TavernFac ::varScript_var ::temp371 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp371 0 ;2 variable args
						; line 1758
					_label32:
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label17
						; line 1759
					_label30:
						cmp_eq ::temp372 UIPick 6 
						jmpf ::temp372 _label17
						; line 1760
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label17
					_label17:
						jmp _label13
					_label13
					.endCode
				.endFunction ;UICraftingSub
				.function GetSkillNames
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp469 String[]
						.local ::temp470 String
					.endLocalTable
					.code
						; line 2193
						array_create ::temp469 18 
						assign ::actSkillStr_var ::temp469 
						; line 2194
						assign ::temp470 " Alchemy" 
						array_setelement ::actSkillStr_var 0 ::temp470 
						; line 2195
						assign ::temp470 " Alteration" 
						array_setelement ::actSkillStr_var 1 ::temp470 
						; line 2196
						assign ::temp470 " Block" 
						array_setelement ::actSkillStr_var 2 ::temp470 
						; line 2197
						assign ::temp470 " Conjuration" 
						array_setelement ::actSkillStr_var 3 ::temp470 
						; line 2198
						assign ::temp470 " Destruction" 
						array_setelement ::actSkillStr_var 4 ::temp470 
						; line 2199
						assign ::temp470 " Enchanting" 
						array_setelement ::actSkillStr_var 5 ::temp470 
						; line 2200
						assign ::temp470 " Heavy Armor" 
						array_setelement ::actSkillStr_var 6 ::temp470 
						; line 2201
						assign ::temp470 " Illusion" 
						array_setelement ::actSkillStr_var 7 ::temp470 
						; line 2202
						assign ::temp470 " Light Armor" 
						array_setelement ::actSkillStr_var 8 ::temp470 
						; line 2203
						assign ::temp470 " Lockpicking" 
						array_setelement ::actSkillStr_var 9 ::temp470 
						; line 2204
						assign ::temp470 " Archery" 
						array_setelement ::actSkillStr_var 10 ::temp470 
						; line 2205
						assign ::temp470 " One-Handed" 
						array_setelement ::actSkillStr_var 11 ::temp470 
						; line 2206
						assign ::temp470 " Pickpocket" 
						array_setelement ::actSkillStr_var 12 ::temp470 
						; line 2207
						assign ::temp470 " Restoration" 
						array_setelement ::actSkillStr_var 13 ::temp470 
						; line 2208
						assign ::temp470 " Smithing" 
						array_setelement ::actSkillStr_var 14 ::temp470 
						; line 2209
						assign ::temp470 " Sneak" 
						array_setelement ::actSkillStr_var 15 ::temp470 
						; line 2210
						assign ::temp470 " Speech" 
						array_setelement ::actSkillStr_var 16 ::temp470 
						; line 2211
						assign ::temp470 " Two-Handed" 
						array_setelement ::actSkillStr_var 17 ::temp470 
					.endCode
				.endFunction ;GetSkillNames
				.function UICmdOneFollower
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp32 String[]
						.local ::temp33 String
						.local ::temp34 String
						.local ::temp35 String
						.local ::temp36 Float
						.local ::temp37 Float
						.local ::temp38 Bool
						.local ::temp39 actorbase
						.local ::temp40 Int
						.local ::temp41 form
						.local ::temp42 uilib_1
						.local UICount Int
						.local ::temp43 Bool
						.local ::temp44 Bool
						.local ::NoneVar None
						.local ::temp45 Bool
						.local ::temp46 faction
						.local ::temp47 Bool
					.endLocalTable
					.code
						; line 172
						callstatic utility CreateStringArray ::temp32 14 "" ;2 variable args
						assign UIChoices ::temp32 
						; line 173
						cast ::temp34 UIHeath 
						strcat ::temp34 "Health: " ::temp34 
						strcat ::temp34 ::temp34 ", Magicka: " 
						cast ::temp35 UIMagicka 
						strcat ::temp35 ::temp34 ::temp35 
						strcat ::temp34 ::temp35 ", Stamina: " 
						cast ::temp35 UIStamina 
						strcat ::temp35 ::temp34 ::temp35 
						strcat ::temp34 ::temp35 " [x]" 
						assign ::temp33 ::temp34 
						array_setelement UIChoices 0 ::temp33 
						; line 174
						assign ::temp35 "$FF_SkillMenu" 
						array_setelement UIChoices 1 ::temp35 
						; line 175
						assign ::temp33 "$FF_SpellMenu" 
						array_setelement UIChoices 2 ::temp33 
						; line 176
						assign ::temp34 "$FF_Traits" 
						array_setelement UIChoices 3 ::temp34 
						; line 177
						assign ::temp35 "$FF_DoFavor" 
						array_setelement UIChoices 4 ::temp35 
						; line 178
						callmethod GetActorValue ::UIActor_var ::temp36 "WaitingForPlayer" ;1 variable args
						cast ::temp37 0 
						cmp_eq ::temp38 ::temp36 ::temp37 
						not ::temp38 ::temp38 
						jmpf ::temp38 _label0
						; line 179
						assign ::temp33 "$FF_IsWaiting" 
						array_setelement UIChoices 5 ::temp33 
						jmp _label1
						; line 181
					_label0:
						assign ::temp34 "$FF_IsFollowing" 
						array_setelement UIChoices 5 ::temp34 
						; line 183
					_label1:
						assign ::temp35 "$FF_InvMenu" 
						array_setelement UIChoices 6 ::temp35 
						; line 184
						assign ::temp33 "$FF_Range" 
						array_setelement UIChoices 7 ::temp33 
						; line 185
						assign ::temp34 "$FF_SetCraft" 
						array_setelement UIChoices 8 ::temp34 
						; line 186
						assign ::temp35 "$FF_Extras" 
						array_setelement UIChoices 9 ::temp35 
						; line 187
						assign UICount 10 
						; line 188
						callmethod GetActorBase ::UIActor_var ::temp39 ;0 variable args
						callmethod IsUnique ::temp39 ::temp38 ;0 variable args
						jmpf ::temp38 _label2
						; line 189
						assign ::temp33 "$FF_SetHomeBase" 
						array_setelement UIChoices 10 ::temp33 
						; line 190
						assign ::temp34 "$FF_LoadSaveTweaks" 
						array_setelement UIChoices 11 ::temp34 
						; line 191
						assign UICount 12 
						jmp _label2
						; line 193
					_label2:
						assign ::temp35 "$FF_Dismiss" 
						array_setelement UIChoices UICount ::temp35 
						; line 194
						assign ::temp33 "$FF_SubAll" 
						iadd ::temp40 UICount 1 
						array_setelement UIChoices ::temp40 ::temp33 
						; line 195
						cast ::temp41 self 
						cast ::temp42 ::temp41 
						callmethod GetActorName self ::temp34 ::UIActor_var ;1 variable args
						callmethod ShowList ::temp42 ::temp40 ::temp34 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp40 
						; line 197
						cmp_gt ::temp38 UIPick 0 
						jmpf ::temp38 _label3
						; line 198
						cmp_eq ::temp43 UIPick 1 
						jmpf ::temp43 _label4
						; line 199
						callmethod UISkills self ::NoneVar ;0 variable args
						jmp _label5
						; line 200
					_label4:
						cmp_eq ::temp44 UIPick 2 
						jmpf ::temp44 _label6
						; line 201
						callmethod UISpells self ::NoneVar ;0 variable args
						jmp _label5
						; line 202
					_label6:
						cmp_eq ::temp44 UIPick 3 
						jmpf ::temp44 _label7
						; line 203
						callmethod UITraitSub self ::NoneVar ;0 variable args
						jmp _label5
						; line 204
					_label7:
						cmp_eq ::temp44 UIPick 4 
						jmpf ::temp44 _label8
						; line 205
						callmethod SetDoingFavor ::UIActor_var ::NoneVar true ;1 variable args
						jmp _label5
						; line 206
					_label8:
						cmp_eq ::temp44 UIPick 5 
						jmpf ::temp44 _label9
						; line 207
						assign ::UIAll_var false 
						; line 208
						callmethod GetActorValue ::UIActor_var ::temp37 "WaitingForPlayer" ;1 variable args
						cast ::temp36 0 
						cmp_eq ::temp45 ::temp37 ::temp36 
						not ::temp45 ::temp45 
						jmpf ::temp45 _label10
						; line 209
						callmethod FollowerFollowMe ::controlScript_var ::NoneVar ::UIActor_var 1 ;2 variable args
						jmp _label11
						; line 211
					_label10:
						callmethod FollowerWaitHere ::controlScript_var ::NoneVar ::UIActor_var 1 0 ;3 variable args
					_label11:
						jmp _label5
						; line 213
					_label9:
						cmp_eq ::temp45 UIPick 6 
						jmpf ::temp45 _label12
						; line 214
						callmethod UIInventory self ::NoneVar ;0 variable args
						jmp _label5
						; line 215
					_label12:
						cmp_eq ::temp44 UIPick 7 
						jmpf ::temp44 _label13
						; line 216
						callmethod UIRangeSub self ::NoneVar ;0 variable args
						jmp _label5
						; line 217
					_label13:
						cmp_eq ::temp45 UIPick 8 
						jmpf ::temp45 _label14
						; line 218
						callmethod UICraftingSub self ::NoneVar ;0 variable args
						jmp _label5
						; line 219
					_label14:
						cmp_eq ::temp44 UIPick 9 
						jmpf ::temp44 _label15
						; line 220
						callmethod UIUtility self ::NoneVar ;0 variable args
						jmp _label5
						; line 221
					_label15:
						cmp_eq ::temp45 UIPick 10 
						cast ::temp45 ::temp45 
						jmpf ::temp45 _label16
						cmp_gt ::temp44 UICount 10 
						cast ::temp45 ::temp44 
					_label16:
						jmpf ::temp45 _label17
						; line 222
						callmethod UIHomeBase self ::NoneVar ;0 variable args
						jmp _label5
						; line 223
					_label17:
						cmp_eq ::temp44 UIPick 11 
						cast ::temp44 ::temp44 
						jmpf ::temp44 _label18
						cmp_gt ::temp45 UICount 10 
						cast ::temp44 ::temp45 
					_label18:
						jmpf ::temp44 _label19
						; line 224
						callmethod UILoadSaveTweaks self ::NoneVar ;0 variable args
						jmp _label5
						; line 225
					_label19:
						cmp_eq ::temp45 UIPick UICount 
						jmpf ::temp45 _label20
						; line 226
						propget nwsFF_ImportFac ::varScript_var ::temp46 
						callmethod IsInFaction ::UIActor_var ::temp44 ::temp46 ;1 variable args
						jmpf ::temp44 _label21
						; line 227
						callmethod ExportAction ::controlScript_var ::NoneVar ::UIActor_var 1 1 ;3 variable args
						jmp _label22
						; line 228
					_label21:
						propget nwsFF_GuardFaction ::varScript_var ::temp46 
						callmethod IsInFaction ::UIActor_var ::temp47 ::temp46 ;1 variable args
						jmpf ::temp47 _label23
						; line 229
						callmethod DismissGuardAction ::controlScript_var ::NoneVar ::UIActor_var 1 1 ;3 variable args
						jmp _label22
						; line 231
					_label23:
						callmethod RemoveAction ::controlScript_var ::NoneVar ::UIActor_var 0 1 ;3 variable args
					_label22:
						jmp _label5
						; line 233
					_label20:
						iadd ::temp40 UICount 1 
						cmp_eq ::temp47 UIPick ::temp40 
						jmpf ::temp47 _label5
						; line 234
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label5
					_label5:
						jmp _label3
					_label3
					.endCode
				.endFunction ;UICmdOneFollower
				.function UINotifyPlayer
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myMsg String
						.param myColor Int
					.endParamTable
					.localTable
						.local ::temp463 Int
						.local ::temp464 Bool
						.local ::temp465 Bool
						.local ::temp466 Bool
						.local ::temp467 form
						.local ::temp468 uilib_1
						.local ::NoneVar None
						.local myColorStr String
					.endLocalTable
					.code
						; line 2176
						propget nwsColorMsg ::controlScript_var ::temp463 
						cmp_eq ::temp464 ::temp463 1 
						jmpf ::temp464 _label0
						; line 2177
						assign myColorStr "#FFC9AE" 
						; line 2178
						cmp_eq ::temp465 myColor 1 
						jmpf ::temp465 _label1
						; line 2179
						assign myColorStr "#BBD5FF" 
						jmp _label2
						; line 2180
					_label1:
						cmp_eq ::temp466 myColor 2 
						jmpf ::temp466 _label3
						; line 2181
						assign myColorStr "#3FFEC0" 
						jmp _label2
						; line 2182
					_label3:
						cmp_eq ::temp466 myColor 3 
						jmpf ::temp466 _label2
						; line 2183
						assign myColorStr "#FFDFA4" 
						jmp _label2
						; line 2185
					_label2:
						cast ::temp467 self 
						cast ::temp468 ::temp467 
						callmethod ShowNotification ::temp468 ::NoneVar myMsg myColorStr ;2 variable args
						jmp _label4
						; line 2187
					_label0:
						callstatic debug notification ::NoneVar myMsg ;1 variable args
					_label4
					.endCode
				.endFunction ;UINotifyPlayer
				.function GetCooldown
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
						.param nextTime Float
					.endParamTable
					.localTable
						.local ::temp459 Float
						.local ::temp460 Int
						.local ::temp461 String
						.local ::temp462 String
						.local hoursFloat Float
						.local hoursStr String
					.endLocalTable
					.code
						; line 2168
						callmethod GetValue ::GameDaysPassed_var ::temp459 ;0 variable args
						fsub ::temp459 nextTime ::temp459 
						fdiv ::temp459 ::temp459 0.0400000 
						assign hoursFloat ::temp459 
						; line 2169
						cast ::temp459 100 
						fmul ::temp459 hoursFloat ::temp459 
						fadd ::temp459 ::temp459 0.500000 
						callstatic math floor ::temp460 ::temp459 ;1 variable args
						cast ::temp459 ::temp460 
						fdiv ::temp459 ::temp459 100.000 
						assign hoursFloat ::temp459 
						; line 2170
						cast ::temp461 hoursFloat 
						cast ::temp462 hoursFloat 
						callstatic stringutil Find ::temp460 ::temp462 "." 0 ;3 variable args
						iadd ::temp460 ::temp460 2 
						callstatic stringutil Substring ::temp462 ::temp461 0 ::temp460 ;3 variable args
						assign hoursStr ::temp462 
						; line 2171
						return hoursStr 
					.endCode
				.endFunction ;GetCooldown
				.function UISendInput
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
						.param myTitle String
						.param myText String
					.endParamTable
					.localTable
						.local ::temp456 form
						.local ::temp457 uilib_1
						.local ::temp458 String
						.local myString String
					.endLocalTable
					.code
						; line 2163
						cast ::temp456 self 
						cast ::temp457 ::temp456 
						callmethod ShowTextInput ::temp457 ::temp458 myTitle myText ;2 variable args
						assign myString ::temp458 
						; line 2164
						return myString 
					.endCode
				.endFunction ;UISendInput
				.function GetLocName
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
						.param lookAct actor
					.endParamTable
					.localTable
						.local ::temp451 cell
						.local ::temp454 Bool
						.local myName String
						.local actCell cell
						.local ::temp452 String
						.local ::temp453 String
						.local ::temp455 location
						.local actLoc location
					.endLocalTable
					.code
						; line 2143
						callmethod GetParentCell lookAct ::temp451 ;0 variable args
						assign actCell ::temp451 
						; line 2144
						jmpf actCell _label0
						; line 2145
						callmethod GetName actCell ::temp452 ;0 variable args
						jmpf ::temp452 _label1
						; line 2146
						callmethod GetName actCell ::temp453 ;0 variable args
						assign myName ::temp453 
						jmp _label1
					_label1:
						jmp _label0
						; line 2149
					_label0:
						cmp_eq ::temp454 myName "" 
						jmpf ::temp454 _label2
						; line 2151
						callmethod GetCurrentLocation lookAct ::temp455 ;0 variable args
						assign actLoc ::temp455 
						; line 2152
						jmpf actLoc _label3
						; line 2153
						callmethod GetName actLoc ::temp453 ;0 variable args
						assign myName ::temp453 
						jmp _label3
					_label3:
						jmp _label2
						; line 2156
					_label2:
						cmp_eq ::temp454 myName "" 
						jmpf ::temp454 _label4
						; line 2157
						assign myName "Tamriel" 
						jmp _label4
						; line 2159
					_label4:
						return myName 
					.endCode
				.endFunction ;GetLocName
				.function UIRangeSubAll
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp133 String[]
						.local ::temp134 String
						.local ::temp135 form
						.local ::temp136 uilib_1
						.local ::temp137 Int
						.local ::temp138 Bool
						.local ::temp139 Bool
						.local ::temp140 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 598
						callstatic utility CreateStringArray ::temp133 4 "" ;2 variable args
						assign UIChoices ::temp133 
						; line 599
						assign ::temp134 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp134 
						; line 600
						assign ::temp134 "$FF_AllFollowRange" 
						array_setelement UIChoices 1 ::temp134 
						; line 601
						assign ::temp134 "$FF_AllCombatRange" 
						array_setelement UIChoices 2 ::temp134 
						; line 602
						assign ::temp134 "$FF_Back" 
						array_setelement UIChoices 3 ::temp134 
						; line 603
						cast ::temp135 self 
						cast ::temp136 ::temp135 
						callmethod ShowList ::temp136 ::temp137 "$FF_RangeTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp137 
						; line 605
						cmp_gt ::temp138 UIPick 0 
						jmpf ::temp138 _label0
						; line 606
						cmp_eq ::temp139 UIPick 1 
						jmpf ::temp139 _label1
						; line 607
						assign ::UIAll_var true 
						; line 608
						callmethod UIRangeDist self ::NoneVar 0 ;1 variable args
						jmp _label2
						; line 609
					_label1:
						cmp_eq ::temp140 UIPick 2 
						jmpf ::temp140 _label3
						; line 610
						assign ::UIAll_var true 
						; line 611
						callmethod UIRangeDist self ::NoneVar 1 ;1 variable args
						jmp _label2
						; line 612
					_label3:
						cmp_eq ::temp140 UIPick 3 
						jmpf ::temp140 _label2
						; line 613
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIRangeSubAll
				.function UITeachSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp159 String[]
						.local ::temp160 String
						.local ::temp161 spell
						.local ::temp163 form
						.local ::temp164 uilib_1
						.local ::temp165 Int
						.local mySpell spell
						.local ::temp162 String
						.local ::temp166 Bool
						.local ::temp167 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 752
						callstatic utility CreateStringArray ::temp159 4 "" ;2 variable args
						assign UIChoices ::temp159 
						; line 753
						assign ::temp160 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp160 
						; line 754
						assign ::temp160 "$FF_TeachNoneL" 
						array_setelement UIChoices 1 ::temp160 
						; line 755
						callmethod GetEquippedSpell ::myPlayer_var ::temp161 0 ;1 variable args
						assign mySpell ::temp161 
						; line 756
						jmpf mySpell _label0
						; line 757
						callmethod GetName mySpell ::temp162 ;0 variable args
						strcat ::temp162 "Teach (Left): " ::temp162 
						assign ::temp160 ::temp162 
						array_setelement UIChoices 1 ::temp160 
						jmp _label0
						; line 759
					_label0:
						assign ::temp160 "$FF_TeachNoneR" 
						array_setelement UIChoices 2 ::temp160 
						; line 760
						callmethod GetEquippedSpell ::myPlayer_var ::temp161 1 ;1 variable args
						assign mySpell ::temp161 
						; line 761
						jmpf mySpell _label1
						; line 762
						callmethod GetName mySpell ::temp160 ;0 variable args
						strcat ::temp160 "Teach (Right): " ::temp160 
						assign ::temp162 ::temp160 
						array_setelement UIChoices 2 ::temp162 
						jmp _label1
						; line 764
					_label1:
						assign ::temp162 "$FF_Back" 
						array_setelement UIChoices 3 ::temp162 
						; line 765
						cast ::temp163 self 
						cast ::temp164 ::temp163 
						callmethod ShowList ::temp164 ::temp165 "$FF_TeachTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp165 
						; line 767
						jmpf UIPick _label2
						; line 768
						cmp_eq ::temp166 UIPick 1 
						jmpf ::temp166 _label3
						; line 769
						callmethod GetEquippedSpell ::myPlayer_var ::temp161 0 ;1 variable args
						jmpf ::temp161 _label4
						; line 770
						callmethod TeachSpell ::controlScript_var ::NoneVar ::UIActor_var 0 ;2 variable args
						jmp _label4
					_label4:
						jmp _label5
						; line 772
					_label3:
						cmp_eq ::temp167 UIPick 2 
						jmpf ::temp167 _label6
						; line 773
						callmethod GetEquippedSpell ::myPlayer_var ::temp161 1 ;1 variable args
						jmpf ::temp161 _label7
						; line 774
						callmethod TeachSpell ::controlScript_var ::NoneVar ::UIActor_var 1 ;2 variable args
						jmp _label7
					_label7:
						jmp _label5
						; line 776
					_label6:
						cmp_eq ::temp167 UIPick 3 
						jmpf ::temp167 _label5
						; line 777
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label5
					_label5:
						jmp _label2
					_label2
					.endCode
				.endFunction ;UITeachSub
				.function UIUtility
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp256 String[]
						.local ::temp257 String
						.local ::temp258 Bool
						.local ::temp259 spell
						.local ::temp260 Bool
						.local ::temp261 form
						.local ::temp262 uilib_1
						.local ::temp263 Int
						.local doAdd Bool
						.local ::NoneVar None
						.local ::temp264 Bool
						.local ::temp265 Bool
						.local ::temp266 objectreference
					.endLocalTable
					.code
						; line 1162
						callstatic utility CreateStringArray ::temp256 6 "" ;2 variable args
						assign UIChoices ::temp256 
						; line 1163
						assign ::temp257 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp257 
						; line 1165
						assign doAdd false 
						; line 1166
						callmethod FindFavorite ::favScript_var ::temp258 ::UIActor_var false ;2 variable args
						jmpf ::temp258 _label0
						; line 1167
						assign ::temp257 "$FF_FavoriteRemove" 
						array_setelement UIChoices 1 ::temp257 
						jmp _label1
						; line 1169
					_label0:
						assign doAdd true 
						; line 1170
						assign ::temp257 "$FF_FavoriteAdd" 
						array_setelement UIChoices 1 ::temp257 
						; line 1173
					_label1:
						assign ::temp257 "$FF_Teach" 
						array_setelement UIChoices 2 ::temp257 
						; line 1174
						callmethod GetEquippedSpell ::myPlayer_var ::temp259 0 ;1 variable args
						not ::temp258 ::temp259 
						cast ::temp258 ::temp258 
						jmpf ::temp258 _label2
						callmethod GetEquippedSpell ::myPlayer_var ::temp259 1 ;1 variable args
						not ::temp260 ::temp259 
						cast ::temp258 ::temp260 
					_label2:
						jmpf ::temp258 _label3
						; line 1175
						assign ::temp257 "$FF_TeachInvalid" 
						array_setelement UIChoices 2 ::temp257 
						jmp _label3
						; line 1177
					_label3:
						assign ::temp257 "$FF_Push" 
						array_setelement UIChoices 3 ::temp257 
						; line 1178
						assign ::temp257 "$FF_Behind" 
						array_setelement UIChoices 4 ::temp257 
						; line 1179
						assign ::temp257 "$FF_Back" 
						array_setelement UIChoices 5 ::temp257 
						; line 1180
						cast ::temp261 self 
						cast ::temp262 ::temp261 
						callmethod ShowList ::temp262 ::temp263 "$FF_ExtrasTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp263 
						; line 1182
						jmpf UIPick _label4
						; line 1183
						cmp_eq ::temp260 UIPick 1 
						jmpf ::temp260 _label5
						; line 1184
						jmpf doAdd _label6
						; line 1185
						callmethod UIPickFavorite self ::NoneVar 2 true ::UIActor_var ;3 variable args
						jmp _label7
						; line 1187
					_label6:
						callmethod FindFavorite ::favScript_var ::temp258 ::UIActor_var true ;2 variable args
						; line 1188
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavoritesRemoved" 0 ;2 variable args
						; line 1189
						callmethod RecordHistory ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						; line 1190
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
					_label7:
						jmp _label8
						; line 1192
					_label5:
						cmp_eq ::temp258 UIPick 2 
						jmpf ::temp258 _label9
						; line 1193
						callmethod GetEquippedSpell ::myPlayer_var ::temp259 0 ;1 variable args
						not ::temp264 ::temp259 
						cast ::temp264 ::temp264 
						jmpf ::temp264 _label10
						callmethod GetEquippedSpell ::myPlayer_var ::temp259 1 ;1 variable args
						not ::temp265 ::temp259 
						cast ::temp264 ::temp265 
					_label10:
						jmpf ::temp264 _label11
						; line 1194
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label12
						; line 1196
					_label11:
						callmethod UITeachSub self ::NoneVar ;0 variable args
					_label12:
						jmp _label8
						; line 1198
					_label9:
						cmp_eq ::temp265 UIPick 3 
						jmpf ::temp265 _label13
						; line 1199
						propget nwsStaggerAlly ::varScript_var ::temp259 
						cast ::temp266 ::UIActor_var 
						callmethod Cast ::temp259 ::NoneVar ::temp266 none ;2 variable args
						jmp _label8
						; line 1200
					_label13:
						cmp_eq ::temp264 UIPick 4 
						jmpf ::temp264 _label14
						; line 1201
						callmethod MoveFollower ::boxScript_var ::NoneVar ::UIActor_var 0 false 256.000 ;4 variable args
						jmp _label8
						; line 1202
					_label14:
						cmp_eq ::temp258 UIPick 5 
						jmpf ::temp258 _label8
						; line 1203
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label8
					_label8:
						jmp _label4
					_label4
					.endCode
				.endFunction ;UIUtility
				.function UIRangeDist
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myOpt Int
					.endParamTable
					.localTable
						.local ::temp150 String[]
						.local ::temp155 Bool
						.local ::temp151 String
						.local ::temp152 form
						.local ::temp153 uilib_1
						.local ::temp154 Int
						.local ::temp156 Bool
						.local ::temp157 Bool
						.local ::NoneVar None
						.local ::temp158 Bool
					.endLocalTable
					.code
						; line 661
						callstatic utility CreateStringArray ::temp150 5 "" ;2 variable args
						assign UIChoices ::temp150 
						; line 662
						jmpf ::UIAll_var _label0
						; line 663
						assign ::temp151 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp151 
						; line 664
						assign ::temp151 "$FF_AllRangeClose" 
						array_setelement UIChoices 1 ::temp151 
						; line 665
						assign ::temp151 "$FF_AllRangeMedium" 
						array_setelement UIChoices 2 ::temp151 
						; line 666
						assign ::temp151 "$FF_AllRangeFar" 
						array_setelement UIChoices 3 ::temp151 
						; line 667
						assign ::temp151 "$FF_Back" 
						array_setelement UIChoices 4 ::temp151 
						jmp _label1
						; line 669
					_label0:
						assign ::temp151 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp151 
						; line 670
						assign ::temp151 "$FF_RangeClose" 
						array_setelement UIChoices 1 ::temp151 
						; line 671
						assign ::temp151 "$FF_RangeMedium" 
						array_setelement UIChoices 2 ::temp151 
						; line 672
						assign ::temp151 "$FF_RangeFar" 
						array_setelement UIChoices 3 ::temp151 
						; line 673
						assign ::temp151 "$FF_Back" 
						array_setelement UIChoices 4 ::temp151 
						; line 675
					_label1:
						jmpf myOpt _label2
						; line 676
						cast ::temp152 self 
						cast ::temp153 ::temp152 
						callmethod ShowList ::temp153 ::temp154 "$FF_CombatRange" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp154 
						jmp _label3
						; line 678
					_label2:
						cast ::temp152 self 
						cast ::temp153 ::temp152 
						callmethod ShowList ::temp153 ::temp154 "$FF_FollowRange" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp154 
						; line 681
					_label3:
						cmp_gt ::temp155 UIPick 0 
						cast ::temp155 ::temp155 
						jmpf ::temp155 _label4
						cast ::temp155 myOpt 
					_label4:
						jmpf ::temp155 _label5
						; line 682
						cmp_eq ::temp156 UIPick 1 
						jmpf ::temp156 _label6
						; line 683
						jmpf ::UIAll_var _label7
						; line 684
						callmethod SetCbtRangeAll ::controlScript_var ::NoneVar 1 ;1 variable args
						; line 685
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetCloseAllCbt" 2 ;2 variable args
						jmp _label8
						; line 687
					_label7:
						callmethod SetCbtRange ::controlScript_var ::NoneVar ::UIActor_var 1 ;2 variable args
						; line 688
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetCloseCbt" 2 ;2 variable args
					_label8:
						jmp _label9
						; line 690
					_label6:
						cmp_eq ::temp157 UIPick 2 
						jmpf ::temp157 _label10
						; line 691
						jmpf ::UIAll_var _label11
						; line 692
						callmethod SetCbtRangeAll ::controlScript_var ::NoneVar 0 ;1 variable args
						; line 693
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetMedAllCbt" 2 ;2 variable args
						jmp _label12
						; line 695
					_label11:
						callmethod SetCbtRange ::controlScript_var ::NoneVar ::UIActor_var 0 ;2 variable args
						; line 696
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetMedCbt" 2 ;2 variable args
					_label12:
						jmp _label9
						; line 698
					_label10:
						cmp_eq ::temp157 UIPick 3 
						jmpf ::temp157 _label9
						; line 699
						jmpf ::UIAll_var _label13
						; line 700
						callmethod SetCbtRangeAll ::controlScript_var ::NoneVar 2 ;1 variable args
						; line 701
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetFarAllCbt" 2 ;2 variable args
						jmp _label14
						; line 703
					_label13:
						callmethod SetCbtRange ::controlScript_var ::NoneVar ::UIActor_var 2 ;2 variable args
						; line 704
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetFarCbt" 2 ;2 variable args
					_label14:
						jmp _label9
						; line 707
					_label9:
						comp_gte ::temp157 UIPick 1 
						jmpf ::temp157 _label15
						; line 708
						jmpf ::UIAll_var _label16
						; line 709
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label17
						; line 711
					_label16:
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
					_label17:
						jmp _label15
					_label15:
						jmp _label18
						; line 714
					_label5:
						cmp_gt ::temp156 UIPick 0 
						jmpf ::temp156 _label18
						; line 715
						cmp_eq ::temp157 UIPick 1 
						jmpf ::temp157 _label19
						; line 716
						jmpf ::UIAll_var _label20
						; line 717
						callmethod SetRangeAll ::controlScript_var ::NoneVar 1 ;1 variable args
						; line 718
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetCloseAll" 2 ;2 variable args
						jmp _label21
						; line 720
					_label20:
						callmethod SetRange ::controlScript_var ::NoneVar ::UIActor_var 1 ;2 variable args
						; line 721
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetClose" 2 ;2 variable args
					_label21:
						jmp _label22
						; line 723
					_label19:
						cmp_eq ::temp158 UIPick 2 
						jmpf ::temp158 _label23
						; line 724
						jmpf ::UIAll_var _label24
						; line 725
						callmethod SetRangeAll ::controlScript_var ::NoneVar 0 ;1 variable args
						; line 726
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetMedAll" 2 ;2 variable args
						jmp _label25
						; line 728
					_label24:
						callmethod SetRange ::controlScript_var ::NoneVar ::UIActor_var 0 ;2 variable args
						; line 729
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetMed" 2 ;2 variable args
					_label25:
						jmp _label22
						; line 731
					_label23:
						cmp_eq ::temp158 UIPick 3 
						jmpf ::temp158 _label22
						; line 732
						jmpf ::UIAll_var _label26
						; line 733
						callmethod SetRangeAll ::controlScript_var ::NoneVar 2 ;1 variable args
						; line 734
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetFarAll" 2 ;2 variable args
						jmp _label27
						; line 736
					_label26:
						callmethod SetRange ::controlScript_var ::NoneVar ::UIActor_var 2 ;2 variable args
						; line 737
						callmethod UINotifyPlayer self ::NoneVar "$FF_RangeSetFar" 2 ;2 variable args
					_label27:
						jmp _label22
						; line 740
					_label22:
						comp_gte ::temp158 UIPick 1 
						jmpf ::temp158 _label28
						; line 741
						jmpf ::UIAll_var _label29
						; line 742
						callmethod UIRangeSubAll self ::NoneVar ;0 variable args
						jmp _label30
						; line 744
					_label29:
						callmethod UIRangeSub self ::NoneVar ;0 variable args
					_label30:
						jmp _label28
					_label28:
						jmp _label18
					_label18
					.endCode
				.endFunction ;UIRangeDist
				.function UIFavoriteAction
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myOpt Int
					.endParamTable
					.localTable
						.local ::temp350 String[]
						.local ::temp351 String
						.local ::temp352 form
						.local ::temp353 uilib_1
						.local ::temp354 Int
						.local ::temp355 Bool
						.local ::temp356 Bool
						.local ::temp358 Bool
						.local ::NoneVar None
						.local ::temp357 objectreference
						.local ::temp359 Bool
					.endLocalTable
					.code
						; line 1628
						callstatic utility CreateStringArray ::temp350 5 "" ;2 variable args
						assign UIChoices ::temp350 
						; line 1629
						assign ::temp351 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp351 
						; line 1630
						assign ::temp351 "$FF_TravelTo" 
						array_setelement UIChoices 1 ::temp351 
						; line 1631
						assign ::temp351 "$FF_CallToYou" 
						array_setelement UIChoices 2 ::temp351 
						; line 1632
						assign ::temp351 "$FF_FavoriteRemove" 
						array_setelement UIChoices 3 ::temp351 
						; line 1633
						assign ::temp351 "$FF_Back" 
						array_setelement UIChoices 4 ::temp351 
						; line 1634
						cast ::temp352 self 
						cast ::temp353 ::temp352 
						callmethod GetActorName self ::temp351 ::UIActor_var ;1 variable args
						callmethod ShowList ::temp353 ::temp354 ::temp351 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp354 
						; line 1635
						cmp_gt ::temp355 UIPick 0 
						jmpf ::temp355 _label0
						; line 1636
						cmp_eq ::temp356 UIPick 1 
						jmpf ::temp356 _label1
						; line 1637
						callmethod UINotifyPlayer self ::NoneVar "$FF_Teleporting" 3 ;2 variable args
						; line 1638
						callstatic utility Wait ::NoneVar 1.00000 ;1 variable args
						; line 1639
						cast ::temp357 ::UIActor_var 
						callmethod MoveTo ::myPlayer_var ::NoneVar ::temp357 0.000000 0.000000 0.000000 true ;5 variable args
						jmp _label2
						; line 1640
					_label1:
						cmp_eq ::temp358 UIPick 2 
						jmpf ::temp358 _label3
						; line 1641
						callmethod UINotifyPlayer self ::NoneVar "$FF_CallFollower" 3 ;2 variable args
						; line 1642
						callstatic utility Wait ::NoneVar 0.500000 ;1 variable args
						; line 1643
						callmethod MoveFollower ::boxScript_var ::NoneVar ::UIActor_var 1 false 256.000 ;4 variable args
						jmp _label2
						; line 1644
					_label3:
						cmp_eq ::temp358 UIPick 3 
						jmpf ::temp358 _label4
						; line 1645
						callmethod FindFavorite ::favScript_var ::temp359 ::UIActor_var true ;2 variable args
						; line 1646
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavoritesRemoved" 0 ;2 variable args
						; line 1647
						callmethod RecordHistory ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						; line 1648
						callmethod GetListName ::favScript_var ::temp351 myOpt ;1 variable args
						callmethod UIPickFavActor self ::NoneVar myOpt ::temp351 ;2 variable args
						jmp _label2
						; line 1649
					_label4:
						cmp_eq ::temp359 UIPick 4 
						jmpf ::temp359 _label2
						; line 1650
						callmethod GetListName ::favScript_var ::temp351 myOpt ;1 variable args
						callmethod UIPickFavActor self ::NoneVar myOpt ::temp351 ;2 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIFavoriteAction
				.function UITeleportSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myOpt Int
					.endParamTable
					.localTable
						.local ::temp312 actor[]
						.local ::temp313 actor
						.local ::temp314 String[]
						.local ::temp315 String
						.local ::temp316 Bool
						.local ::temp317 form
						.local ::temp318 uilib_1
						.local ::temp319 Int
						.local doAdd Bool
						.local ::temp320 Bool
						.local ::temp322 Bool
						.local ::NoneVar None
						.local ::temp321 objectreference
						.local ::temp323 Bool
					.endLocalTable
					.code
						; line 1375
						jmpf ::UIActor_var _label0
						; line 1376
						propget historyActors ::historyScript_var ::temp312 
						array_getlement ::temp313 ::temp312 myOpt 
						assign ::UIActor_var ::temp313 
						; line 1377
						callstatic utility CreateStringArray ::temp314 5 "" ;2 variable args
						assign UIChoices ::temp314 
						; line 1378
						assign ::temp315 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp315 
						; line 1379
						assign ::temp315 "$FF_TravelTo" 
						array_setelement UIChoices 1 ::temp315 
						; line 1380
						assign ::temp315 "$FF_CallToYou" 
						array_setelement UIChoices 2 ::temp315 
						; line 1382
						assign doAdd false 
						; line 1383
						callmethod FindFavorite ::favScript_var ::temp316 ::UIActor_var false ;2 variable args
						jmpf ::temp316 _label1
						; line 1384
						assign ::temp315 "$FF_FavoriteRemove" 
						array_setelement UIChoices 3 ::temp315 
						jmp _label2
						; line 1386
					_label1:
						assign doAdd true 
						; line 1387
						assign ::temp315 "$FF_FavoriteAdd" 
						array_setelement UIChoices 3 ::temp315 
						; line 1389
					_label2:
						assign ::temp315 "$FF_Back" 
						array_setelement UIChoices 4 ::temp315 
						; line 1390
						cast ::temp317 self 
						cast ::temp318 ::temp317 
						callmethod GetActorName self ::temp315 ::UIActor_var ;1 variable args
						callmethod ShowList ::temp318 ::temp319 ::temp315 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp319 
						; line 1392
						cmp_gt ::temp316 UIPick 0 
						jmpf ::temp316 _label3
						; line 1393
						cmp_eq ::temp320 UIPick 1 
						jmpf ::temp320 _label4
						; line 1394
						callmethod UINotifyPlayer self ::NoneVar "$FF_Teleporting" 3 ;2 variable args
						; line 1395
						callstatic utility Wait ::NoneVar 1.00000 ;1 variable args
						; line 1396
						cast ::temp321 ::UIActor_var 
						callmethod MoveTo ::myPlayer_var ::NoneVar ::temp321 0.000000 0.000000 0.000000 true ;5 variable args
						jmp _label5
						; line 1397
					_label4:
						cmp_eq ::temp322 UIPick 2 
						jmpf ::temp322 _label6
						; line 1398
						callmethod UINotifyPlayer self ::NoneVar "$FF_CallFollower" 3 ;2 variable args
						; line 1399
						callstatic utility Wait ::NoneVar 0.500000 ;1 variable args
						; line 1400
						callmethod MoveFollower ::boxScript_var ::NoneVar ::UIActor_var 1 false 256.000 ;4 variable args
						jmp _label5
						; line 1401
					_label6:
						cmp_eq ::temp322 UIPick 3 
						jmpf ::temp322 _label7
						; line 1402
						jmpf doAdd _label8
						; line 1403
						callmethod UIPickFavorite self ::NoneVar 3 true ::UIActor_var ;3 variable args
						jmp _label9
						; line 1405
					_label8:
						callmethod FindFavorite ::favScript_var ::temp323 ::UIActor_var true ;2 variable args
						; line 1406
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavoritesRemoved" 0 ;2 variable args
						; line 1407
						callmethod RecordHistory ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						; line 1409
					_label9:
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label5
						; line 1411
					_label7:
						cmp_eq ::temp323 UIPick 4 
						jmpf ::temp323 _label5
						; line 1412
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label5
					_label5:
						jmp _label3
					_label3:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UITeleportSub
				.function FetchAlias
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return referencealias
					.paramTable
						.param myActor actor
					.endParamTable
					.localTable
						.local ::temp438 Bool
						.local index Int
						.local follower actor
						.local checkAlias referencealias
						.local foundAlias referencealias
						.local stopLook Bool
						.local ::temp439 Quest
						.local ::temp440 alias
						.local ::temp441 referencealias
						.local ::temp445 Int
						.local ::temp446 Bool
						.local ::temp442 objectreference
						.local ::temp443 actor
						.local ::temp444 Bool
					.endLocalTable
					.code
						; line 2111
						assign index 0 
						; line 2115
						assign stopLook false 
						; line 2117
					_label4:
						not ::temp438 stopLook 
						jmpf ::temp438 _label0
						; line 2118
						propget DialogueFollower ::varScript_var ::temp439 
						callmethod GetAlias ::temp439 ::temp440 index ;1 variable args
						cast ::temp441 ::temp440 
						assign checkAlias ::temp441 
						; line 2119
						jmpf checkAlias _label1
						; line 2120
						callmethod GetReference checkAlias ::temp442 ;0 variable args
						cast ::temp443 ::temp442 
						assign follower ::temp443 
						; line 2121
						cmp_eq ::temp444 myActor follower 
						jmpf ::temp444 _label2
						; line 2122
						assign foundAlias checkAlias 
						; line 2123
						assign stopLook true 
						jmp _label2
					_label2:
						jmp _label1
						; line 2126
					_label1:
						iadd ::temp445 index 1 
						assign index ::temp445 
						; line 2127
						comp_gte ::temp444 index 12 
						cast ::temp444 ::temp444 
						jmpt ::temp444 _label3
						cmp_eq ::temp446 stopLook true 
						cast ::temp444 ::temp446 
					_label3:
						assign stopLook ::temp444 
						jmp _label4
						; line 2129
					_label0:
						return foundAlias 
					.endCode
				.endFunction ;FetchAlias
				.function UILootSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp409 String[]
						.local ::temp410 faction
						.local ::temp411 Bool
						.local ::temp413 String
						.local ::temp414 Bool
						.local ::temp415 form
						.local ::temp416 uilib_1
						.local myRank Int
						.local ::temp412 Int
						.local ::temp417 Bool
						.local ::temp418 Bool
						.local ::NoneVar None
						.local ::temp419 Bool
						.local rankMod Int
					.endLocalTable
					.code
						; line 1917
						callstatic utility CreateStringArray ::temp409 14 "" ;2 variable args
						assign UIChoices ::temp409 
						; line 1919
						assign myRank -1 
						; line 1920
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod IsInFaction ::UIActor_var ::temp411 ::temp410 ;1 variable args
						jmpf ::temp411 _label0
						; line 1921
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod GetFactionRank ::UIActor_var ::temp412 ::temp410 ;1 variable args
						cast ::temp412 ::temp412 
						assign myRank ::temp412 
						jmp _label0
						; line 1923
					_label0:
						assign ::temp413 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp413 
						; line 1924
						cmp_eq ::temp411 myRank -1 
						jmpf ::temp411 _label1
						; line 1925
						assign ::temp413 "$FF_LootingOffOn" 
						array_setelement UIChoices 1 ::temp413 
						jmp _label2
						; line 1927
					_label1:
						assign ::temp413 "$FF_LootingOff" 
						array_setelement UIChoices 1 ::temp413 
						; line 1929
					_label2:
						cmp_eq ::temp411 myRank 0 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label3
						cmp_eq ::temp414 myRank 11 
						cast ::temp411 ::temp414 
					_label3:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label4
						cmp_eq ::temp414 myRank 22 
						cast ::temp411 ::temp414 
					_label4:
						jmpf ::temp411 _label5
						; line 1930
						assign ::temp413 "$FF_LootingOn0" 
						array_setelement UIChoices 2 ::temp413 
						jmp _label6
						; line 1932
					_label5:
						assign ::temp413 "$FF_Looting0" 
						array_setelement UIChoices 2 ::temp413 
						; line 1934
					_label6:
						cmp_eq ::temp414 myRank 1 
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label7
						cmp_eq ::temp411 myRank 12 
						cast ::temp414 ::temp411 
					_label7:
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label8
						cmp_eq ::temp411 myRank 23 
						cast ::temp414 ::temp411 
					_label8:
						jmpf ::temp414 _label9
						; line 1935
						assign ::temp413 "$FF_LootingOn1" 
						array_setelement UIChoices 3 ::temp413 
						jmp _label10
						; line 1937
					_label9:
						assign ::temp413 "$FF_Looting1" 
						array_setelement UIChoices 3 ::temp413 
						; line 1939
					_label10:
						cmp_eq ::temp411 myRank 2 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label11
						cmp_eq ::temp414 myRank 13 
						cast ::temp411 ::temp414 
					_label11:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label12
						cmp_eq ::temp414 myRank 24 
						cast ::temp411 ::temp414 
					_label12:
						jmpf ::temp411 _label13
						; line 1940
						assign ::temp413 "$FF_LootingOn2" 
						array_setelement UIChoices 4 ::temp413 
						jmp _label14
						; line 1942
					_label13:
						assign ::temp413 "$FF_Looting2" 
						array_setelement UIChoices 4 ::temp413 
						; line 1944
					_label14:
						cmp_eq ::temp414 myRank 3 
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label15
						cmp_eq ::temp411 myRank 14 
						cast ::temp414 ::temp411 
					_label15:
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label16
						cmp_eq ::temp411 myRank 25 
						cast ::temp414 ::temp411 
					_label16:
						jmpf ::temp414 _label17
						; line 1945
						assign ::temp413 "$FF_LootingOn3" 
						array_setelement UIChoices 5 ::temp413 
						jmp _label18
						; line 1947
					_label17:
						assign ::temp413 "$FF_Looting3" 
						array_setelement UIChoices 5 ::temp413 
						; line 1949
					_label18:
						cmp_eq ::temp411 myRank 4 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label19
						cmp_eq ::temp414 myRank 15 
						cast ::temp411 ::temp414 
					_label19:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label20
						cmp_eq ::temp414 myRank 26 
						cast ::temp411 ::temp414 
					_label20:
						jmpf ::temp411 _label21
						; line 1950
						assign ::temp413 "$FF_LootingOn4" 
						array_setelement UIChoices 6 ::temp413 
						jmp _label22
						; line 1952
					_label21:
						assign ::temp413 "$FF_Looting4" 
						array_setelement UIChoices 6 ::temp413 
						; line 1954
					_label22:
						cmp_eq ::temp414 myRank 5 
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label23
						cmp_eq ::temp411 myRank 16 
						cast ::temp414 ::temp411 
					_label23:
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label24
						cmp_eq ::temp411 myRank 27 
						cast ::temp414 ::temp411 
					_label24:
						jmpf ::temp414 _label25
						; line 1955
						assign ::temp413 "$FF_LootingOn5" 
						array_setelement UIChoices 7 ::temp413 
						jmp _label26
						; line 1957
					_label25:
						assign ::temp413 "$FF_Looting5" 
						array_setelement UIChoices 7 ::temp413 
						; line 1959
					_label26:
						cmp_eq ::temp411 myRank 6 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label27
						cmp_eq ::temp414 myRank 17 
						cast ::temp411 ::temp414 
					_label27:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label28
						cmp_eq ::temp414 myRank 28 
						cast ::temp411 ::temp414 
					_label28:
						jmpf ::temp411 _label29
						; line 1960
						assign ::temp413 "$FF_LootingOn6" 
						array_setelement UIChoices 8 ::temp413 
						jmp _label30
						; line 1962
					_label29:
						assign ::temp413 "$FF_Looting6" 
						array_setelement UIChoices 8 ::temp413 
						; line 1964
					_label30:
						cmp_eq ::temp414 myRank 7 
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label31
						cmp_eq ::temp411 myRank 18 
						cast ::temp414 ::temp411 
					_label31:
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label32
						cmp_eq ::temp411 myRank 29 
						cast ::temp414 ::temp411 
					_label32:
						jmpf ::temp414 _label33
						; line 1965
						assign ::temp413 "$FF_LootingOn7" 
						array_setelement UIChoices 9 ::temp413 
						jmp _label34
						; line 1967
					_label33:
						assign ::temp413 "$FF_Looting7" 
						array_setelement UIChoices 9 ::temp413 
						; line 1969
					_label34:
						cmp_eq ::temp411 myRank 8 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label35
						cmp_eq ::temp414 myRank 19 
						cast ::temp411 ::temp414 
					_label35:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label36
						cmp_eq ::temp414 myRank 30 
						cast ::temp411 ::temp414 
					_label36:
						jmpf ::temp411 _label37
						; line 1970
						assign ::temp413 "$FF_LootingOn8" 
						array_setelement UIChoices 10 ::temp413 
						jmp _label38
						; line 1972
					_label37:
						assign ::temp413 "$FF_Looting8" 
						array_setelement UIChoices 10 ::temp413 
						; line 1974
					_label38:
						cmp_eq ::temp414 myRank 9 
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label39
						cmp_eq ::temp411 myRank 20 
						cast ::temp414 ::temp411 
					_label39:
						cast ::temp414 ::temp414 
						jmpt ::temp414 _label40
						cmp_eq ::temp411 myRank 31 
						cast ::temp414 ::temp411 
					_label40:
						jmpf ::temp414 _label41
						; line 1975
						assign ::temp413 "$FF_LootingOn9" 
						array_setelement UIChoices 11 ::temp413 
						jmp _label42
						; line 1977
					_label41:
						assign ::temp413 "$FF_Looting9" 
						array_setelement UIChoices 11 ::temp413 
						; line 1979
					_label42:
						cmp_eq ::temp411 myRank 10 
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label43
						cmp_eq ::temp414 myRank 21 
						cast ::temp411 ::temp414 
					_label43:
						cast ::temp411 ::temp411 
						jmpt ::temp411 _label44
						cmp_eq ::temp414 myRank 32 
						cast ::temp411 ::temp414 
					_label44:
						jmpf ::temp411 _label45
						; line 1980
						assign ::temp413 "$FF_LootingOn10" 
						array_setelement UIChoices 12 ::temp413 
						jmp _label46
						; line 1982
					_label45:
						assign ::temp413 "$FF_Looting10" 
						array_setelement UIChoices 12 ::temp413 
						; line 1984
					_label46:
						assign ::temp413 "$FF_Back" 
						array_setelement UIChoices 13 ::temp413 
						; line 1985
						cast ::temp415 self 
						cast ::temp416 ::temp415 
						callmethod ShowList ::temp416 ::temp412 "$FF_LootingTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp412 
						; line 1987
						cmp_gt ::temp414 UIPick 0 
						jmpf ::temp414 _label47
						; line 1988
						cmp_eq ::temp411 UIPick 1 
						jmpf ::temp411 _label48
						; line 1989
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp410 ;1 variable args
						jmp _label49
						; line 1990
					_label48:
						cmp_gt ::temp417 UIPick 1 
						cast ::temp417 ::temp417 
						jmpf ::temp417 _label50
						cmp_lt ::temp418 UIPick 13 
						cast ::temp417 ::temp418 
					_label50:
						jmpf ::temp417 _label49
						; line 1991
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod IsInFaction ::UIActor_var ::temp418 ::temp410 ;1 variable args
						not ::temp418 ::temp418 
						jmpf ::temp418 _label51
						; line 1992
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp410 ;1 variable args
						jmp _label51
						; line 1994
					_label51:
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod GetFactionRank ::UIActor_var ::temp412 ::temp410 ;1 variable args
						cast ::temp412 ::temp412 
						assign myRank ::temp412 
						; line 1995
						isub ::temp412 UIPick 2 
						assign rankMod ::temp412 
						; line 1996
						cmp_gt ::temp418 myRank 21 
						jmpf ::temp418 _label52
						; line 1997
						iadd ::temp412 rankMod 22 
						assign myRank ::temp412 
						jmp _label53
						; line 1998
					_label52:
						cmp_gt ::temp419 myRank 10 
						jmpf ::temp419 _label54
						; line 1999
						iadd ::temp412 rankMod 11 
						assign myRank ::temp412 
						jmp _label53
						; line 2001
					_label54:
						assign myRank rankMod 
						; line 2003
					_label53:
						propget nwsFF_GatherFac ::varScript_var ::temp410 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp410 myRank ;2 variable args
						jmp _label49
						; line 2005
					_label49:
						callmethod UIInventory self ::NoneVar ;0 variable args
						jmp _label47
					_label47
					.endCode
				.endFunction ;UILootSub
				.function UISendLootSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp420 String[]
						.local ::temp421 faction
						.local ::temp422 Bool
						.local ::temp424 String
						.local ::temp425 Bool
						.local ::temp426 form
						.local ::temp427 uilib_1
						.local myRank Int
						.local ::temp423 Int
						.local ::temp428 Bool
						.local ::NoneVar None
						.local ::temp429 Bool
						.local ::temp430 Bool
						.local ::temp431 Bool
					.endLocalTable
					.code
						; line 2010
						callstatic utility CreateStringArray ::temp420 5 "" ;2 variable args
						assign UIChoices ::temp420 
						; line 2012
						assign myRank -1 
						; line 2013
						propget nwsFF_GatherFac ::varScript_var ::temp421 
						callmethod IsInFaction ::UIActor_var ::temp422 ::temp421 ;1 variable args
						jmpf ::temp422 _label0
						; line 2014
						propget nwsFF_GatherFac ::varScript_var ::temp421 
						callmethod GetFactionRank ::UIActor_var ::temp423 ::temp421 ;1 variable args
						cast ::temp423 ::temp423 
						assign myRank ::temp423 
						jmp _label0
						; line 2016
					_label0:
						assign ::temp424 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp424 
						; line 2017
						assign ::temp424 "$FF_SendLoot_0" 
						array_setelement UIChoices 1 ::temp424 
						; line 2018
						propget nwsFF_storedFac ::setsScript_var ::temp421 
						callmethod IsInFaction ::UIActor_var ::temp422 ::temp421 ;1 variable args
						jmpf ::temp422 _label1
						; line 2019
						assign ::temp424 "$FF_SendLoot_1alt" 
						array_setelement UIChoices 2 ::temp424 
						jmp _label2
						; line 2021
					_label1:
						assign ::temp424 "$FF_SendLoot_1" 
						array_setelement UIChoices 2 ::temp424 
						; line 2023
					_label2:
						assign ::temp424 "$FF_SendLoot_2" 
						array_setelement UIChoices 3 ::temp424 
						; line 2025
						comp_gte ::temp422 myRank 22 
						jmpf ::temp422 _label3
						; line 2026
						assign ::temp424 "$FF_SendLootOn_2" 
						array_setelement UIChoices 3 ::temp424 
						jmp _label4
						; line 2027
					_label3:
						comp_gte ::temp425 myRank 11 
						jmpf ::temp425 _label5
						; line 2028
						assign ::temp424 "$FF_SendLootOn_1" 
						array_setelement UIChoices 2 ::temp424 
						jmp _label4
						; line 2030
					_label5:
						assign ::temp424 "$FF_SendLootOn_0" 
						array_setelement UIChoices 1 ::temp424 
						; line 2032
					_label4:
						assign ::temp424 "$FF_Back" 
						array_setelement UIChoices 4 ::temp424 
						; line 2033
						cast ::temp426 self 
						cast ::temp427 ::temp426 
						callmethod ShowList ::temp427 ::temp423 "$FF_LootingTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp423 
						; line 2035
						cmp_gt ::temp425 UIPick 0 
						jmpf ::temp425 _label6
						; line 2036
						cmp_gt ::temp422 UIPick 1 
						cast ::temp422 ::temp422 
						jmpf ::temp422 _label7
						cmp_lt ::temp428 UIPick 4 
						cast ::temp422 ::temp428 
					_label7:
						cast ::temp422 ::temp422 
						jmpf ::temp422 _label8
						cmp_eq ::temp428 myRank -1 
						not ::temp428 ::temp428 
						cast ::temp422 ::temp428 
					_label8:
						jmpf ::temp422 _label9
						; line 2037
						cmp_eq ::temp428 UIPick 1 
						jmpf ::temp428 _label10
						; line 2038
						cmp_gt ::temp429 myRank 21 
						jmpf ::temp429 _label11
						; line 2039
						isub ::temp423 myRank 22 
						assign myRank ::temp423 
						jmp _label12
						; line 2040
					_label11:
						cmp_gt ::temp430 myRank 10 
						jmpf ::temp430 _label12
						; line 2041
						isub ::temp423 myRank 11 
						assign myRank ::temp423 
						jmp _label12
					_label12:
						jmp _label13
						; line 2043
					_label10:
						cmp_eq ::temp430 UIPick 2 
						jmpf ::temp430 _label14
						; line 2044
						cmp_gt ::temp429 myRank 21 
						jmpf ::temp429 _label15
						; line 2045
						isub ::temp423 myRank 11 
						assign myRank ::temp423 
						jmp _label16
						; line 2046
					_label15:
						cmp_lt ::temp431 myRank 11 
						jmpf ::temp431 _label16
						; line 2047
						iadd ::temp423 myRank 11 
						assign myRank ::temp423 
						jmp _label16
					_label16:
						jmp _label13
						; line 2050
					_label14:
						cmp_lt ::temp431 myRank 11 
						jmpf ::temp431 _label17
						; line 2051
						iadd ::temp423 myRank 22 
						assign myRank ::temp423 
						jmp _label13
						; line 2052
					_label17:
						cmp_lt ::temp429 myRank 22 
						jmpf ::temp429 _label13
						; line 2053
						iadd ::temp423 myRank 11 
						assign myRank ::temp423 
						jmp _label13
						; line 2056
					_label13:
						propget nwsFF_GatherFac ::varScript_var ::temp421 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp421 myRank ;2 variable args
						jmp _label9
						; line 2058
					_label9:
						callmethod UIInventory self ::NoneVar ;0 variable args
						jmp _label6
					_label6
					.endCode
				.endFunction ;UISendLootSub
				.function UITraitAllSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp249 String[]
						.local ::temp250 String
						.local ::temp251 form
						.local ::temp252 uilib_1
						.local ::temp253 Int
						.local ::temp254 Bool
						.local ::temp255 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 1133
						callstatic utility CreateStringArray ::temp249 6 "" ;2 variable args
						assign UIChoices ::temp249 
						; line 1134
						assign ::temp250 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp250 
						; line 1135
						assign ::temp250 "$FF_AggressionAll" 
						array_setelement UIChoices 1 ::temp250 
						; line 1136
						assign ::temp250 "$FF_AssistAll" 
						array_setelement UIChoices 2 ::temp250 
						; line 1137
						assign ::temp250 "$FF_ConAll" 
						array_setelement UIChoices 3 ::temp250 
						; line 1138
						assign ::temp250 "$FF_MoralityAll" 
						array_setelement UIChoices 4 ::temp250 
						; line 1139
						assign ::temp250 "$FF_Back" 
						array_setelement UIChoices 5 ::temp250 
						; line 1140
						cast ::temp251 self 
						cast ::temp252 ::temp251 
						callmethod ShowList ::temp252 ::temp253 "$FF_TraitsTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp253 
						; line 1142
						jmpf UIPick _label0
						; line 1143
						cmp_eq ::temp254 UIPick 1 
						jmpf ::temp254 _label1
						; line 1144
						assign ::UIAll_var true 
						; line 1145
						callmethod UIAggressionSub self ::NoneVar ;0 variable args
						jmp _label2
						; line 1146
					_label1:
						cmp_eq ::temp255 UIPick 2 
						jmpf ::temp255 _label3
						; line 1147
						assign ::UIAll_var true 
						; line 1148
						callmethod UIAssistanceSub self ::NoneVar ;0 variable args
						jmp _label2
						; line 1149
					_label3:
						cmp_eq ::temp255 UIPick 3 
						jmpf ::temp255 _label4
						; line 1150
						assign ::UIAll_var true 
						; line 1151
						callmethod UIConfidenceSub self ::NoneVar ;0 variable args
						jmp _label2
						; line 1152
					_label4:
						cmp_eq ::temp255 UIPick 4 
						jmpf ::temp255 _label5
						; line 1153
						assign ::UIAll_var true 
						; line 1154
						callmethod UIMoralitySub self ::NoneVar ;0 variable args
						jmp _label2
						; line 1155
					_label5:
						cmp_eq ::temp255 UIPick 5 
						jmpf ::temp255 _label2
						; line 1156
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UITraitAllSub
				.function UIAggressionSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp201 String[]
						.local ::temp202 String
						.local ::temp203 form
						.local ::temp204 uilib_1
						.local ::temp205 Int
						.local ::temp206 Bool
						.local ::temp207 Bool
						.local ::NoneVar None
						.local ::temp208 faction
						.local ::temp209 Float
					.endLocalTable
					.code
						; line 997
						callstatic utility CreateStringArray ::temp201 4 "" ;2 variable args
						assign UIChoices ::temp201 
						; line 998
						assign ::temp202 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp202 
						; line 999
						assign ::temp202 "$FF_Aggression1" 
						array_setelement UIChoices 1 ::temp202 
						; line 1000
						assign ::temp202 "$FF_Aggression2" 
						array_setelement UIChoices 2 ::temp202 
						; line 1001
						assign ::temp202 "$FF_Back" 
						array_setelement UIChoices 3 ::temp202 
						; line 1002
						cast ::temp203 self 
						cast ::temp204 ::temp203 
						callmethod ShowList ::temp204 ::temp205 "$FF_SetAggression" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp205 
						; line 1004
						jmpf UIPick _label0
						; line 1005
						cmp_eq ::temp206 UIPick 1 
						cast ::temp206 ::temp206 
						jmpt ::temp206 _label1
						cmp_eq ::temp207 UIPick 2 
						cast ::temp206 ::temp207 
					_label1:
						jmpf ::temp206 _label2
						; line 1006
						jmpf ::UIAll_var _label3
						; line 1007
						isub ::temp205 UIPick 1 
						callmethod DoTaskAll ::controlScript_var ::NoneVar 28 ::temp205 ;2 variable args
						; line 1008
						callmethod UINotifyPlayer self ::NoneVar "$FF_AggressionSetAll" 2 ;2 variable args
						; line 1009
						callmethod UITraitAllSub self ::NoneVar ;0 variable args
						jmp _label4
						; line 1011
					_label3:
						propget nwsFF_AggrFac ::varScript_var ::temp208 
						callmethod IsInFaction ::UIActor_var ::temp207 ::temp208 ;1 variable args
						not ::temp207 ::temp207 
						jmpf ::temp207 _label5
						; line 1012
						propget nwsFF_AggrFac ::varScript_var ::temp208 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp208 ;1 variable args
						jmp _label5
						; line 1014
					_label5:
						propget nwsFF_AggrFac ::varScript_var ::temp208 
						isub ::temp205 UIPick 1 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp208 ::temp205 ;2 variable args
						; line 1015
						isub ::temp205 UIPick 1 
						cast ::temp209 ::temp205 
						callmethod SetActorValue ::UIActor_var ::NoneVar "Aggression" ::temp209 ;2 variable args
						; line 1016
						callmethod UINotifyPlayer self ::NoneVar "$FF_AggressionSet" 2 ;2 variable args
						; line 1017
						callmethod UITraitSub self ::NoneVar ;0 variable args
					_label4:
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIAggressionSub
				.function UIAssistanceSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp210 String[]
						.local ::temp211 String
						.local ::temp212 form
						.local ::temp213 uilib_1
						.local ::temp214 Int
						.local ::temp215 Bool
						.local ::temp216 Bool
						.local ::temp217 Bool
						.local ::NoneVar None
						.local ::temp218 faction
						.local ::temp219 Float
					.endLocalTable
					.code
						; line 1024
						callstatic utility CreateStringArray ::temp210 5 "" ;2 variable args
						assign UIChoices ::temp210 
						; line 1025
						assign ::temp211 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp211 
						; line 1026
						assign ::temp211 "$FF_Assist1" 
						array_setelement UIChoices 1 ::temp211 
						; line 1027
						assign ::temp211 "$FF_Assist2" 
						array_setelement UIChoices 2 ::temp211 
						; line 1028
						assign ::temp211 "$FF_Assist3" 
						array_setelement UIChoices 3 ::temp211 
						; line 1029
						assign ::temp211 "$FF_Back" 
						array_setelement UIChoices 4 ::temp211 
						; line 1030
						cast ::temp212 self 
						cast ::temp213 ::temp212 
						callmethod ShowList ::temp213 ::temp214 "$FF_SetAssistance" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp214 
						; line 1032
						cmp_gt ::temp215 UIPick 0 
						jmpf ::temp215 _label0
						; line 1033
						cmp_gt ::temp216 UIPick 0 
						cast ::temp216 ::temp216 
						jmpf ::temp216 _label1
						cmp_lt ::temp217 UIPick 4 
						cast ::temp216 ::temp217 
					_label1:
						jmpf ::temp216 _label2
						; line 1034
						jmpf ::UIAll_var _label3
						; line 1035
						isub ::temp214 UIPick 1 
						callmethod DoTaskAll ::controlScript_var ::NoneVar 29 ::temp214 ;2 variable args
						; line 1036
						callmethod UINotifyPlayer self ::NoneVar "$FF_AssistSetAll" 2 ;2 variable args
						; line 1037
						callmethod UITraitAllSub self ::NoneVar ;0 variable args
						jmp _label4
						; line 1039
					_label3:
						propget nwsFF_AssistFac ::varScript_var ::temp218 
						callmethod IsInFaction ::UIActor_var ::temp217 ::temp218 ;1 variable args
						not ::temp217 ::temp217 
						jmpf ::temp217 _label5
						; line 1040
						propget nwsFF_AssistFac ::varScript_var ::temp218 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp218 ;1 variable args
						jmp _label5
						; line 1042
					_label5:
						propget nwsFF_AssistFac ::varScript_var ::temp218 
						isub ::temp214 UIPick 1 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp218 ::temp214 ;2 variable args
						; line 1043
						isub ::temp214 UIPick 1 
						cast ::temp219 ::temp214 
						callmethod SetActorValue ::UIActor_var ::NoneVar "Assistance" ::temp219 ;2 variable args
						; line 1044
						callmethod UINotifyPlayer self ::NoneVar "$FF_AssistSet" 2 ;2 variable args
						; line 1045
						callmethod UITraitSub self ::NoneVar ;0 variable args
					_label4:
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIAssistanceSub
				.function UILoot
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp397 String[]
						.local ::temp398 String
						.local ::temp399 Bool
						.local ::temp400 Int
						.local ::temp401 Float
						.local ::temp402 Float
						.local ::temp403 Bool
						.local ::temp405 form
						.local ::temp406 uilib_1
						.local ::temp404 String
						.local ::temp407 Bool
						.local ::NoneVar None
						.local ::temp408 Bool
					.endLocalTable
					.code
						; line 1858
						callstatic utility CreateStringArray ::temp397 7 "" ;2 variable args
						assign UIChoices ::temp397 
						; line 1859
						assign ::temp398 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp398 
						; line 1860
						callmethod QueryLooting ::controlScript_var ::temp399 ;0 variable args
						jmpf ::temp399 _label0
						; line 1861
						assign ::temp398 "$FF_AutoLootStop" 
						array_setelement UIChoices 1 ::temp398 
						jmp _label1
						; line 1863
					_label0:
						assign ::temp398 "$FF_AutoLootStart" 
						array_setelement UIChoices 1 ::temp398 
						; line 1866
					_label1:
						propget outfitSwitchStyle ::controlScript_var ::temp400 
						cmp_gt ::temp399 ::temp400 0 
						jmpf ::temp399 _label2
						; line 1867
						assign ::temp398 "$FF_SwitchMenu" 
						array_setelement UIChoices 2 ::temp398 
						jmp _label3
						; line 1869
					_label2:
						assign ::temp398 "$FF_SwitchMenuDis" 
						array_setelement UIChoices 2 ::temp398 
						; line 1872
					_label3:
						callmethod GetValue ::nwsChestPort_var ::temp401 ;0 variable args
						callmethod GetValue ::GameDaysPassed_var ::temp402 ;0 variable args
						cmp_lte ::temp399 ::temp401 ::temp402 
						cast ::temp399 ::temp399 
						jmpt ::temp399 _label4
						callmethod FreeChest ::storageScript_var ::temp403 ;0 variable args
						cast ::temp399 ::temp403 
					_label4:
						jmpf ::temp399 _label5
						; line 1873
						assign ::temp398 "$FF_KeyPlaceChestM" 
						array_setelement UIChoices 3 ::temp398 
						jmp _label6
						; line 1875
					_label5:
						callmethod GetValue ::nwsChestPort_var ::temp401 ;0 variable args
						callmethod GetCooldown self ::temp404 ::temp401 ;1 variable args
						strcat ::temp404 "Place Player Chest (CD: " ::temp404 
						strcat ::temp404 ::temp404 " hours)" 
						assign ::temp398 ::temp404 
						array_setelement UIChoices 3 ::temp398 
						; line 1877
					_label6:
						callmethod GetValue ::nwsChestAllowed_var ::temp402 ;0 variable args
						callmethod GetValue ::GameDaysPassed_var ::temp401 ;0 variable args
						cmp_lte ::temp403 ::temp402 ::temp401 
						cast ::temp403 ::temp403 
						jmpt ::temp403 _label7
						callmethod FreeChest ::storageScript_var ::temp399 ;0 variable args
						cast ::temp403 ::temp399 
					_label7:
						jmpf ::temp403 _label8
						; line 1878
						assign ::temp398 "$FF_KeyOpenChestM" 
						array_setelement UIChoices 4 ::temp398 
						jmp _label9
						; line 1880
					_label8:
						callmethod GetValue ::nwsChestAllowed_var ::temp402 ;0 variable args
						callmethod GetCooldown self ::temp398 ::temp402 ;1 variable args
						strcat ::temp398 "Open Player Chest (CD: " ::temp398 
						strcat ::temp398 ::temp398 " hours)" 
						assign ::temp404 ::temp398 
						array_setelement UIChoices 4 ::temp404 
						; line 1883
					_label9:
						assign ::temp404 "$FF_TakeTorches" 
						array_setelement UIChoices 5 ::temp404 
						; line 1884
						jmpf tookTorches _label10
						; line 1885
						assign ::temp398 "$FF_GiveTorches" 
						array_setelement UIChoices 5 ::temp398 
						jmp _label10
						; line 1887
					_label10:
						assign ::temp404 "$FF_Back" 
						array_setelement UIChoices 6 ::temp404 
						; line 1888
						cast ::temp405 self 
						cast ::temp406 ::temp405 
						callmethod ShowList ::temp406 ::temp400 "$FF_LootTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp400 
						; line 1890
						cmp_gt ::temp399 UIPick 0 
						jmpf ::temp399 _label11
						; line 1891
						cmp_eq ::temp403 UIPick 1 
						jmpf ::temp403 _label12
						; line 1892
						callmethod CallLooting ::controlScript_var ::NoneVar false false false ;3 variable args
						jmp _label13
						; line 1893
					_label12:
						cmp_eq ::temp407 UIPick 2 
						jmpf ::temp407 _label14
						; line 1894
						propget outfitSwitchStyle ::controlScript_var ::temp400 
						cmp_gt ::temp408 ::temp400 0 
						jmpf ::temp408 _label15
						; line 1895
						callmethod ManualSwitch ::setsScript_var ::NoneVar ;0 variable args
						jmp _label15
					_label15:
						jmp _label13
						; line 1897
					_label14:
						cmp_eq ::temp408 UIPick 3 
						jmpf ::temp408 _label16
						; line 1898
						callmethod PlaceChest ::storageScript_var ::NoneVar ;0 variable args
						jmp _label13
						; line 1899
					_label16:
						cmp_eq ::temp407 UIPick 4 
						jmpf ::temp407 _label17
						; line 1900
						callmethod RemoteOpen ::storageScript_var ::NoneVar ;0 variable args
						jmp _label13
						; line 1901
					_label17:
						cmp_eq ::temp408 UIPick 5 
						jmpf ::temp408 _label18
						; line 1902
						jmpf tookTorches _label19
						; line 1903
						callmethod GiveTorchAll ::controlScript_var ::NoneVar ;0 variable args
						; line 1904
						callmethod UINotifyPlayer self ::NoneVar "$FF_TorchesGiven" 1 ;2 variable args
						jmp _label20
						; line 1906
					_label19:
						callmethod TakeTorchAll ::controlScript_var ::NoneVar ;0 variable args
						; line 1907
						callmethod UINotifyPlayer self ::NoneVar "$FF_TorchesTaken" 0 ;2 variable args
						; line 1909
					_label20:
						not ::temp407 tookTorches 
						assign tookTorches ::temp407 
						jmp _label13
						; line 1910
					_label18:
						cmp_eq ::temp407 UIPick 6 
						jmpf ::temp407 _label13
						; line 1911
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label13
					_label13:
						jmp _label11
					_label11
					.endCode
				.endFunction ;UILoot
				.function UISelectOneMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp11 globalvariable
						.local ::temp12 Float
						.local ::temp13 Int
						.local ::temp14 String[]
						.local ::temp15 Int[]
						.local ::temp16 String
						.local ::temp17 Bool
						.local ::temp24 form
						.local ::temp25 uilib_1
						.local folCount Int
						.local index Int
						.local count Int
						.local follower actor
						.local checkAlias referencealias
						.local ::temp18 Quest
						.local ::temp19 alias
						.local ::temp20 referencealias
						.local ::temp21 objectreference
						.local ::temp22 actor
						.local ::temp23 String
						.local ::NoneVar None
						.local mySlot Int
					.endLocalTable
					.code
						; line 122
						propget nwsFollowerCount ::varScript_var ::temp11 
						callmethod GetValue ::temp11 ::temp12 ;0 variable args
						cast ::temp13 ::temp12 
						assign folCount ::temp13 
						; line 123
						iadd ::temp13 folCount 1 
						callstatic utility CreateStringArray ::temp14 ::temp13 "" ;2 variable args
						assign UIChoices ::temp14 
						; line 124
						iadd ::temp13 folCount 1 
						callstatic utility CreateIntArray ::temp15 ::temp13 0 ;2 variable args
						assign UISlots ::temp15 
						; line 125
						assign index 0 
						; line 126
						assign count 1 
						; line 129
						assign ::temp16 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp16 
						; line 130
					_label3:
						cmp_lt ::temp17 index 12 
						jmpf ::temp17 _label0
						; line 131
						propget DialogueFollower ::varScript_var ::temp18 
						callmethod GetAlias ::temp18 ::temp19 index ;1 variable args
						cast ::temp20 ::temp19 
						assign checkAlias ::temp20 
						; line 132
						jmpf checkAlias _label1
						; line 133
						callmethod GetReference checkAlias ::temp21 ;0 variable args
						cast ::temp22 ::temp21 
						assign follower ::temp22 
						; line 134
						jmpf follower _label2
						; line 135
						callmethod GetActorName self ::temp23 follower ;1 variable args
						assign ::temp16 ::temp23 
						array_setelement UIChoices count ::temp16 
						; line 136
						assign ::temp13 index 
						array_setelement UISlots count ::temp13 
						; line 137
						iadd ::temp13 count 1 
						assign count ::temp13 
						jmp _label2
					_label2:
						jmp _label1
						; line 140
					_label1:
						iadd ::temp13 index 1 
						assign index ::temp13 
						jmp _label3
						; line 142
					_label0:
						cast ::temp24 self 
						cast ::temp25 ::temp24 
						callmethod ShowList ::temp25 ::temp13 "$FF_Followers" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp13 
						; line 144
						cmp_gt ::temp17 UIPick 0 
						jmpf ::temp17 _label4
						; line 145
						array_getlement ::temp13 UISlots UIPick 
						assign mySlot ::temp13 
						; line 146
						propget DialogueFollower ::varScript_var ::temp18 
						callmethod GetAlias ::temp18 ::temp19 mySlot ;1 variable args
						cast ::temp20 ::temp19 
						callmethod GetReference ::temp20 ::temp21 ;0 variable args
						cast ::temp22 ::temp21 
						assign ::UIActor_var ::temp22 
						; line 147
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label4
					_label4
					.endCode
				.endFunction ;UISelectOneMenu
				.function GetActorName
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
						.param lookAct actor
					.endParamTable
					.localTable
						.local ::temp447 String
						.local ::temp448 Bool
						.local ::temp449 Bool
						.local myName String
						.local ::temp450 form
					.endLocalTable
					.code
						; line 2134
						callmethod GetDisplayName lookAct ::temp447 ;0 variable args
						assign myName ::temp447 
						; line 2135
						not ::temp448 myName 
						cast ::temp448 ::temp448 
						jmpt ::temp448 _label0
						cmp_eq ::temp449 myName " " 
						cast ::temp448 ::temp449 
					_label0:
						jmpf ::temp448 _label1
						; line 2136
						callmethod GetBaseObject lookAct ::temp450 ;0 variable args
						callmethod GetName ::temp450 ::temp447 ;0 variable args
						assign myName ::temp447 
						jmp _label1
						; line 2138
					_label1:
						return myName 
					.endCode
				.endFunction ;GetActorName
				.function UIOpenHistory
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp301 globalvariable
						.local ::temp302 Float
						.local ::temp303 Int
						.local ::temp304 String[]
						.local ::temp305 String
						.local ::temp306 Bool
						.local ::temp308 form
						.local ::temp309 uilib_1
						.local histCount Int
						.local index Int
						.local numVal String
						.local histActor actor
						.local ::temp307 String
						.local ::temp310 Bool
						.local ::temp311 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 1343
						propget nwsHistoryCount ::varScript_var ::temp301 
						callmethod GetValue ::temp301 ::temp302 ;0 variable args
						cast ::temp303 ::temp302 
						assign histCount ::temp303 
						; line 1344
						iadd ::temp303 histCount 3 
						callstatic utility CreateStringArray ::temp304 ::temp303 "" ;2 variable args
						assign UIChoices ::temp304 
						; line 1345
						assign ::temp305 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp305 
						; line 1346
						assign index 1 
						; line 1350
					_label1:
						iadd ::temp303 histCount 1 
						cmp_lt ::temp306 index ::temp303 
						jmpf ::temp306 _label0
						; line 1351
						propget historyDisplayMenu ::historyScript_var ::temp304 
						isub ::temp303 index 1 
						array_getlement ::temp307 ::temp304 ::temp303 
						assign ::temp305 ::temp307 
						array_setelement UIChoices index ::temp305 
						; line 1352
						iadd ::temp303 index 1 
						assign index ::temp303 
						jmp _label1
						; line 1355
					_label0:
						assign ::temp305 "$FF_Refresh" 
						iadd ::temp303 histCount 1 
						array_setelement UIChoices ::temp303 ::temp305 
						; line 1356
						assign ::temp307 "$FF_Back" 
						iadd ::temp303 histCount 2 
						array_setelement UIChoices ::temp303 ::temp307 
						; line 1358
						cast ::temp308 self 
						cast ::temp309 ::temp308 
						cast ::temp305 histCount 
						strcat ::temp307 "$FF_HistoryTitle{" ::temp305 
						strcat ::temp305 ::temp307 "}" 
						callmethod ShowList ::temp309 ::temp303 ::temp305 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp303 
						; line 1360
						cmp_gt ::temp306 UIPick 0 
						jmpf ::temp306 _label2
						; line 1361
						iadd ::temp303 histCount 2 
						cmp_eq ::temp310 UIPick ::temp303 
						jmpf ::temp310 _label3
						; line 1362
						callmethod UIHistoryFav self ::NoneVar ;0 variable args
						jmp _label4
						; line 1363
					_label3:
						iadd ::temp303 histCount 1 
						cmp_eq ::temp311 UIPick ::temp303 
						jmpf ::temp311 _label5
						; line 1364
						assign UIPick -1 
						; line 1365
						callmethod UINotifyPlayer self ::NoneVar "$FF_BuildHistory" 2 ;2 variable args
						; line 1366
						callmethod HistoryLoad ::historyScript_var ::NoneVar ;0 variable args
						; line 1367
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label4
						; line 1369
					_label5:
						isub ::temp303 UIPick 1 
						callmethod UITeleportSub self ::NoneVar ::temp303 ;1 variable args
					_label4:
						jmp _label2
					_label2
					.endCode
				.endFunction ;UIOpenHistory
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
				.function UILoadSaveTweaks
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp360 String[]
						.local ::temp361 String
						.local ::temp362 form
						.local ::temp363 uilib_1
						.local ::temp364 Int
						.local ::temp365 Bool
						.local ::temp366 Bool
						.local ::temp368 Bool
						.local ::temp367 nwsfollowersettingsscript
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 1657
						callstatic utility CreateStringArray ::temp360 4 "" ;2 variable args
						assign UIChoices ::temp360 
						; line 1658
						assign ::temp361 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp361 
						; line 1659
						assign ::temp361 "$FF_SaveFol" 
						array_setelement UIChoices 1 ::temp361 
						; line 1660
						assign ::temp361 "$FF_LoadFol" 
						array_setelement UIChoices 2 ::temp361 
						; line 1661
						assign ::temp361 "$FF_Back" 
						array_setelement UIChoices 3 ::temp361 
						; line 1662
						cast ::temp362 self 
						cast ::temp363 ::temp362 
						callmethod ShowList ::temp363 ::temp364 "$FF_LoadSaveTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp364 
						; line 1663
						cmp_gt ::temp365 UIPick 0 
						jmpf ::temp365 _label0
						; line 1664
						cmp_eq ::temp366 UIPick 1 
						jmpf ::temp366 _label1
						; line 1665
						cast ::temp367 ::nwsFollowerSettings_var 
						callmethod LoadSaveTweaks ::temp367 ::NoneVar ::UIActor_var false ;2 variable args
						; line 1666
						callmethod UINotifyPlayer self ::NoneVar "$FF_TweaksSaved" 1 ;2 variable args
						jmp _label2
						; line 1667
					_label1:
						cmp_eq ::temp368 UIPick 2 
						jmpf ::temp368 _label3
						; line 1668
						cast ::temp367 ::nwsFollowerSettings_var 
						callmethod LoadSaveTweaks ::temp367 ::NoneVar ::UIActor_var true ;2 variable args
						; line 1669
						callmethod UINotifyPlayer self ::NoneVar "$FF_TweaksLoaded" 1 ;2 variable args
						jmp _label2
						; line 1670
					_label3:
						cmp_eq ::temp368 UIPick 3 
						jmpf ::temp368 _label2
						; line 1671
						callmethod UICmdOneFollower self ::NoneVar ;0 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UILoadSaveTweaks
				.function UIInventory
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp381 String[]
						.local ::temp382 String
						.local ::temp383 faction
						.local ::temp384 Bool
						.local ::temp385 String
						.local ::temp386 Int
						.local ::temp387 String
						.local ::NoneVar None
						.local ::temp394 uilib_1
						.local choiceStr String
						.local chString String
						.local ::temp388 Bool
						.local ::temp389 followeraliasscript
						.local ::temp390 form
						.local ::temp391 form
						.local ::temp392 Bool
						.local ::temp393 Bool
						.local itemName String
						.local ::mangled_itemname_1 String
						.local ::temp395 nwsfollowerxstorescript
						.local ::temp396 objectreference
					.endLocalTable
					.code
						; line 1766
						callstatic utility CreateStringArray ::temp381 13 "" ;2 variable args
						assign UIChoices ::temp381 
						; line 1767
						assign ::UIPos0_var 0 
						; line 1768
						assign ::temp382 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp382 
						; line 1769
						assign ::temp382 "$FF_Trade" 
						array_setelement UIChoices 1 ::temp382 
						; line 1770
						assign ::temp382 "$FF_OpenStorage" 
						array_setelement UIChoices 2 ::temp382 
						; line 1772
						assign choiceStr "Set Outfit" 
						; line 1773
						propget nwsFF_storedFac ::varScript_var ::temp383 
						callmethod IsInFaction ::UIActor_var ::temp384 ::temp383 ;1 variable args
						jmpf ::temp384 _label0
						; line 1774
						assign choiceStr "Change Outfit" 
						jmp _label0
						; line 1776
					_label0:
						strcat ::temp385 choiceStr " (" 
						propget nwsFFsetsUsed ::setsScript_var ::temp386 
						cast ::temp387 ::temp386 
						strcat ::temp387 ::temp385 ::temp387 
						strcat ::temp385 ::temp387 "/" 
						propget storedMax ::setsScript_var ::temp386 
						cast ::temp387 ::temp386 
						strcat ::temp387 ::temp385 ::temp387 
						strcat ::temp385 ::temp387 ")" 
						assign ::temp382 ::temp385 
						array_setelement UIChoices 3 ::temp382 
						; line 1778
						propget nwsFF_storedFac ::varScript_var ::temp383 
						callmethod IsInFaction ::UIActor_var ::temp384 ::temp383 ;1 variable args
						jmpf ::temp384 _label1
						; line 1779
						assign ::UIPos0_var 1 
						; line 1780
						assign ::temp387 "Restore Outfit" 
						array_setelement UIChoices 4 ::temp387 
						jmp _label1
						; line 1783
					_label1:
						assign ::temp382 "$FF_SellItems" 
						iadd ::temp386 ::UIPos0_var 4 
						array_setelement UIChoices ::temp386 ::temp382 
						; line 1784
						callmethod DisplayLooting self ::NoneVar ;0 variable args
						; line 1787
						assign chString "$FF_HeadwearOff" 
						; line 1788
						propget nwsFF_HelmFac ::varScript_var ::temp383 
						callmethod IsInFaction ::UIActor_var ::temp384 ::temp383 ;1 variable args
						jmpf ::temp384 _label2
						; line 1789
						assign chString "$FF_HeadwearNone" 
						; line 1790
						propget nwsFF_HelmFac ::varScript_var ::temp383 
						callmethod GetFactionRank ::UIActor_var ::temp386 ::temp383 ;1 variable args
						cmp_eq ::temp388 ::temp386 1 
						jmpf ::temp388 _label3
						; line 1791
						assign chString "$FF_HeadwearNone" 
						jmp _label4
						; line 1792
					_label3:
						cast ::temp389 ::UIAlias_var 
						propget wornHelmet ::temp389 ::temp390 
						cast ::temp391 none 
						cmp_eq ::temp392 ::temp390 ::temp391 
						not ::temp392 ::temp392 
						jmpf ::temp392 _label4
						; line 1793
						cast ::temp389 ::UIAlias_var 
						propget wornHelmet ::temp389 ::temp391 
						callmethod GetName ::temp391 ::temp385 ;0 variable args
						assign itemName ::temp385 
						; line 1794
						callstatic stringutil GetLength ::temp386 itemName ;1 variable args
						cmp_gt ::temp393 ::temp386 25 
						jmpf ::temp393 _label5
						; line 1795
						callstatic stringutil Substring ::temp387 itemName 0 25 ;3 variable args
						strcat ::temp382 ::temp387 "..." 
						assign itemName ::temp382 
						jmp _label5
						; line 1797
					_label5:
						strcat ::temp385 "Stored Headwear: " itemName 
						strcat ::temp387 ::temp385 " >" 
						assign chString ::temp387 
						jmp _label4
					_label4:
						jmp _label2
						; line 1800
					_label2:
						assign ::temp382 chString 
						iadd ::temp386 ::UIPos0_var 7 
						array_setelement UIChoices ::temp386 ::temp382 
						; line 1802
						assign chString "$FF_ShieldOff" 
						; line 1803
						propget nwsFF_ShieldFac ::varScript_var ::temp383 
						callmethod IsInFaction ::UIActor_var ::temp393 ::temp383 ;1 variable args
						jmpf ::temp393 _label6
						; line 1804
						assign chString "$FF_ShieldNone" 
						; line 1805
						cast ::temp389 ::UIAlias_var 
						propget outfitShield ::temp389 ::temp390 
						cast ::temp391 none 
						cmp_eq ::temp392 ::temp390 ::temp391 
						not ::temp392 ::temp392 
						jmpf ::temp392 _label7
						; line 1806
						cast ::temp389 ::UIAlias_var 
						propget outfitShield ::temp389 ::temp391 
						callmethod GetName ::temp391 ::temp385 ;0 variable args
						assign ::mangled_itemname_1 ::temp385 
						; line 1807
						callstatic stringutil GetLength ::temp386 ::mangled_itemname_1 ;1 variable args
						cmp_gt ::temp388 ::temp386 25 
						jmpf ::temp388 _label8
						; line 1808
						callstatic stringutil Substring ::temp387 ::mangled_itemname_1 0 25 ;3 variable args
						strcat ::temp382 ::temp387 "..." 
						assign ::mangled_itemname_1 ::temp382 
						jmp _label8
						; line 1810
					_label8:
						strcat ::temp385 "Stored Shield: " ::mangled_itemname_1 
						strcat ::temp387 ::temp385 " >" 
						assign chString ::temp387 
						jmp _label7
					_label7:
						jmp _label6
						; line 1813
					_label6:
						assign ::temp382 chString 
						iadd ::temp386 ::UIPos0_var 8 
						array_setelement UIChoices ::temp386 ::temp382 
						; line 1815
						assign ::temp385 "$FF_Undress" 
						iadd ::temp386 ::UIPos0_var 9 
						array_setelement UIChoices ::temp386 ::temp385 
						; line 1816
						assign ::temp387 "$FF_Redress" 
						iadd ::temp386 ::UIPos0_var 10 
						array_setelement UIChoices ::temp386 ::temp387 
						; line 1817
						assign ::temp382 "$FF_Back" 
						iadd ::temp386 ::UIPos0_var 11 
						array_setelement UIChoices ::temp386 ::temp382 
						; line 1818
						cast ::temp390 self 
						cast ::temp394 ::temp390 
						callmethod ShowList ::temp394 ::temp386 "$FF_InvTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp386 
						; line 1819
						cmp_gt ::temp384 UIPick 0 
						jmpf ::temp384 _label9
						; line 1820
						cmp_eq ::temp388 UIPick 1 
						jmpf ::temp388 _label10
						; line 1821
						callmethod OpenInventory ::UIActor_var ::NoneVar false ;1 variable args
						jmp _label11
						; line 1822
					_label10:
						cmp_eq ::temp392 UIPick 2 
						jmpf ::temp392 _label12
						; line 1823
						cast ::temp395 ::nwsFollowerXStorage_var 
						callmethod OpenStorage ::temp395 ::temp396 ::UIActor_var false ;2 variable args
						jmp _label11
						; line 1824
					_label12:
						cmp_eq ::temp393 UIPick 3 
						jmpf ::temp393 _label13
						; line 1825
						callmethod CreateOutfit ::setsScript_var ::NoneVar ::UIActor_var 0 ;2 variable args
						jmp _label11
						; line 1826
					_label13:
						iadd ::temp386 ::UIPos0_var 3 
						cmp_eq ::temp392 UIPick ::temp386 
						jmpf ::temp392 _label14
						; line 1827
						callmethod RemoveOutfit ::setsScript_var ::NoneVar ::UIActor_var 0 ;2 variable args
						jmp _label11
						; line 1828
					_label14:
						iadd ::temp386 ::UIPos0_var 4 
						cmp_eq ::temp393 UIPick ::temp386 
						jmpf ::temp393 _label15
						; line 1829
						propget isSellingItems ::controlScript_var ::temp386 
						cmp_eq ::temp392 ::temp386 0 
						jmpf ::temp392 _label16
						; line 1830
						callmethod UINotifyPlayer self ::NoneVar "$FF_OpenSell" 1 ;2 variable args
						; line 1831
						callmethod CreateSale ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						jmp _label16
					_label16:
						jmp _label11
						; line 1833
					_label15:
						iadd ::temp386 ::UIPos0_var 5 
						cmp_eq ::temp392 UIPick ::temp386 
						jmpf ::temp392 _label17
						; line 1834
						callmethod UILootSub self ::NoneVar ;0 variable args
						jmp _label11
						; line 1835
					_label17:
						iadd ::temp386 ::UIPos0_var 6 
						cmp_eq ::temp393 UIPick ::temp386 
						jmpf ::temp393 _label18
						; line 1836
						callmethod UISendLootSub self ::NoneVar ;0 variable args
						jmp _label11
						; line 1837
					_label18:
						iadd ::temp386 ::UIPos0_var 7 
						cmp_eq ::temp392 UIPick ::temp386 
						jmpf ::temp392 _label19
						; line 1838
						callmethod UIHeadwearSub self ::NoneVar ;0 variable args
						jmp _label11
						; line 1839
					_label19:
						iadd ::temp386 ::UIPos0_var 8 
						cmp_eq ::temp393 UIPick ::temp386 
						jmpf ::temp393 _label20
						; line 1840
						callmethod UIShieldSub self ::NoneVar ;0 variable args
						jmp _label11
						; line 1841
					_label20:
						iadd ::temp386 ::UIPos0_var 9 
						cmp_eq ::temp392 UIPick ::temp386 
						jmpf ::temp392 _label21
						; line 1842
						callmethod UINotifyPlayer self ::NoneVar "$FF_Undressing" 1 ;2 variable args
						; line 1843
						callstatic utility Wait ::NoneVar 0.500000 ;1 variable args
						; line 1844
						callmethod UnequipAll ::UIActor_var ::NoneVar ;0 variable args
						; line 1845
						callmethod UnequipAll ::UIActor_var ::NoneVar ;0 variable args
						jmp _label11
						; line 1846
					_label21:
						iadd ::temp386 ::UIPos0_var 10 
						cmp_eq ::temp393 UIPick ::temp386 
						jmpf ::temp393 _label22
						; line 1847
						callmethod UINotifyPlayer self ::NoneVar "$FF_Redressing" 1 ;2 variable args
						; line 1848
						callmethod UnequipAll ::UIActor_var ::NoneVar ;0 variable args
						; line 1849
						callmethod UnequipAll ::UIActor_var ::NoneVar ;0 variable args
						; line 1850
						cast ::temp389 ::UIAlias_var 
						callmethod RefreshVisual ::temp389 ::NoneVar ;0 variable args
						jmp _label11
						; line 1851
					_label22:
						iadd ::temp386 ::UIPos0_var 11 
						cmp_eq ::temp392 UIPick ::temp386 
						jmpf ::temp392 _label11
						; line 1852
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label11
					_label11:
						jmp _label9
					_label9
					.endCode
				.endFunction ;UIInventory
				.function UIShieldSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp279 String[]
						.local ::temp280 String
						.local ::temp281 faction
						.local ::temp282 Bool
						.local ::temp283 form
						.local ::temp284 uilib_1
						.local ::temp285 Int
						.local ::temp286 Bool
						.local ::NoneVar None
						.local ::temp287 followeraliasscript
						.local ::temp288 form
					.endLocalTable
					.code
						; line 1265
						callstatic utility CreateStringArray ::temp279 3 "" ;2 variable args
						assign UIChoices ::temp279 
						; line 1266
						assign ::temp280 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp280 
						; line 1268
						propget nwsFF_ShieldFac ::varScript_var ::temp281 
						callmethod IsInFaction ::UIActor_var ::temp282 ::temp281 ;1 variable args
						jmpf ::temp282 _label0
						; line 1269
						assign ::temp280 "$FF_ShieldCombatOn" 
						array_setelement UIChoices 1 ::temp280 
						jmp _label1
						; line 1271
					_label0:
						assign ::temp280 "$FF_ShieldCombatOff" 
						array_setelement UIChoices 1 ::temp280 
						; line 1273
					_label1:
						assign ::temp280 "$FF_Back" 
						array_setelement UIChoices 2 ::temp280 
						; line 1274
						cast ::temp283 self 
						cast ::temp284 ::temp283 
						callmethod ShowList ::temp284 ::temp285 "$FF_ShieldTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp285 
						; line 1276
						jmpf UIPick _label2
						; line 1277
						cmp_eq ::temp282 UIPick 1 
						jmpf ::temp282 _label3
						; line 1278
						propget nwsFF_ShieldFac ::varScript_var ::temp281 
						callmethod IsInFaction ::UIActor_var ::temp286 ::temp281 ;1 variable args
						jmpf ::temp286 _label4
						; line 1279
						propget nwsFF_ShieldFac ::varScript_var ::temp281 
						callmethod RemoveFromFaction ::UIActor_var ::NoneVar ::temp281 ;1 variable args
						; line 1280
						cast ::temp288 none 
						assign ::temp283 ::temp288 
						cast ::temp287 ::UIAlias_var 
						propset outfitShield ::temp287 ::temp283 
						jmp _label5
						; line 1282
					_label4:
						propget nwsFF_ShieldFac ::varScript_var ::temp281 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp281 ;1 variable args
						; line 1284
					_label5:
						callmethod UINotifyPlayer self ::NoneVar "$FF_ShieldApplied" 0 ;2 variable args
						; line 1285
						cast ::temp287 ::UIAlias_var 
						callmethod CheckFollower ::temp287 ::NoneVar 0.500000 false false ;3 variable args
						jmp _label6
						; line 1286
					_label3:
						cmp_eq ::temp286 UIPick 2 
						jmpf ::temp286 _label6
						; line 1287
						callmethod UIInventory self ::NoneVar ;0 variable args
						jmp _label6
					_label6:
						jmp _label2
					_label2
					.endCode
				.endFunction ;UIShieldSub
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
				.function SetToRetreat
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
						; line 55
						assign ::isRetreat_var 1 
						; line 56
						cast ::temp0 45 
						callmethod RegisterForSingleUpdate self ::NoneVar ::temp0 ;1 variable args
					.endCode
				.endFunction ;SetToRetreat
				.function UIPickFavActor
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myOpt Int
						.param catName String
					.endParamTable
					.localTable
						.local ::temp335 formList
						.local ::temp336 form
						.local ::temp337 Int
						.local ::temp338 String[]
						.local ::temp339 String
						.local ::temp340 Bool
						.local ::temp344 uilib_1
						.local myList formList
						.local listLen Int
						.local index Int
						.local count Int
						.local tmpName String
						.local tmpAct actor
						.local ::temp341 Bool
						.local ::temp342 actor
						.local ::temp343 String
						.local doNotify Bool
						.local ::temp345 Bool
						.local ::temp346 Bool
						.local ::NoneVar None
						.local ::temp347 Bool
						.local ::temp348 Bool
						.local ::temp349 faction
					.endLocalTable
					.code
						; line 1501
						propget nwsFavLists ::favScript_var ::temp335 
						callmethod GetAt ::temp335 ::temp336 myOpt ;1 variable args
						cast ::temp335 ::temp336 
						assign myList ::temp335 
						; line 1502
						callmethod GetSize myList ::temp337 ;0 variable args
						assign listLen ::temp337 
						; line 1503
						assign index 0 
						; line 1504
						assign count 0 
						; line 1507
						iadd ::temp337 listLen 8 
						callstatic utility CreateStringArray ::temp338 ::temp337 "" ;2 variable args
						assign UIChoices ::temp338 
						; line 1508
						assign ::temp339 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp339 
						; line 1510
						cmp_lt ::temp340 listLen 1 
						jmpf ::temp340 _label0
						; line 1511
						assign ::temp339 "- No Favorites -" 
						array_setelement UIChoices 1 ::temp339 
						; line 1512
						iadd ::temp337 count 2 
						assign count ::temp337 
						jmp _label1
						; line 1514
					_label0:
						cmp_lt ::temp341 index listLen 
						jmpf ::temp341 _label2
						; line 1515
						callmethod GetAt myList ::temp336 index ;1 variable args
						cast ::temp342 ::temp336 
						assign tmpAct ::temp342 
						; line 1516
						iadd ::temp337 index 1 
						cast ::temp339 ::temp337 
						strcat ::temp339 ::temp339 " - " 
						callmethod GetActorName self ::temp343 tmpAct ;1 variable args
						strcat ::temp339 ::temp339 ::temp343 
						strcat ::temp343 ::temp339 "   (" 
						callmethod GetLocName self ::temp339 tmpAct ;1 variable args
						strcat ::temp343 ::temp343 ::temp339 
						strcat ::temp339 ::temp343 ")" 
						assign tmpName ::temp339 
						; line 1517
						assign ::temp343 tmpName 
						iadd ::temp337 index 1 
						array_setelement UIChoices ::temp337 ::temp343 
						; line 1518
						iadd ::temp337 index 1 
						assign index ::temp337 
						jmp _label0
						; line 1520
					_label2:
						iadd ::temp337 listLen 1 
						iadd ::temp337 count ::temp337 
						assign count ::temp337 
						; line 1523
					_label1:
						assign ::temp339 "$FF_RenCategory" 
						array_setelement UIChoices count ::temp339 
						; line 1524
						iadd ::temp337 count 1 
						assign count ::temp337 
						; line 1526
						cmp_gt ::temp341 myOpt 0 
						jmpf ::temp341 _label3
						; line 1527
						assign ::temp343 "$FF_RemCategory" 
						array_setelement UIChoices count ::temp343 
						; line 1528
						iadd ::temp337 count 1 
						assign count ::temp337 
						jmp _label3
						; line 1531
					_label3:
						cmp_gt ::temp340 listLen 0 
						jmpf ::temp340 _label4
						; line 1532
						assign ::temp339 "$FF_FavPortM" 
						array_setelement UIChoices count ::temp339 
						; line 1533
						iadd ::temp337 count 1 
						assign count ::temp337 
						jmp _label4
						; line 1535
					_label4:
						cmp_gt ::temp341 listLen 0 
						jmpf ::temp341 _label5
						; line 1536
						assign ::temp343 "$FF_FavWaitingM" 
						array_setelement UIChoices count ::temp343 
						; line 1537
						iadd ::temp337 count 1 
						assign count ::temp337 
						jmp _label5
						; line 1539
					_label5:
						cmp_gt ::temp340 listLen 0 
						jmpf ::temp340 _label6
						; line 1540
						assign ::temp339 "$FF_FavFollowM" 
						array_setelement UIChoices count ::temp339 
						; line 1541
						iadd ::temp337 count 1 
						assign count ::temp337 
						jmp _label6
						; line 1544
					_label6:
						assign ::temp343 "$FF_Back" 
						array_setelement UIChoices count ::temp343 
						; line 1546
						cast ::temp336 self 
						cast ::temp344 ::temp336 
						callmethod ShowList ::temp344 ::temp337 catName UIChoices 0 0 ;4 variable args
						assign UIPick ::temp337 
						; line 1548
						cmp_gt ::temp341 UIPick 0 
						jmpf ::temp341 _label7
						; line 1549
						assign doNotify false 
						; line 1550
						cmp_eq ::temp340 listLen 0 
						jmpf ::temp340 _label8
						; line 1551
						cmp_eq ::temp345 UIPick 2 
						jmpf ::temp345 _label9
						; line 1552
						callmethod NameList ::favScript_var ::NoneVar myOpt ;1 variable args
						; line 1553
						callmethod UIPickFavActor self ::NoneVar myOpt catName ;2 variable args
						jmp _label10
						; line 1554
					_label9:
						cmp_eq ::temp346 myOpt 0 
						not ::temp346 ::temp346 
						jmpf ::temp346 _label11
						; line 1555
						cmp_eq ::temp347 UIPick 3 
						jmpf ::temp347 _label12
						; line 1556
						callmethod RemoveList ::favScript_var ::NoneVar myOpt ;1 variable args
						; line 1557
						cast ::temp342 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp342 ;3 variable args
						jmp _label13
						; line 1559
					_label12:
						cast ::temp342 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp342 ;3 variable args
					_label13:
						jmp _label10
						; line 1562
					_label11:
						cast ::temp342 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp342 ;3 variable args
					_label10:
						jmp _label14
						; line 1565
					_label8:
						iadd ::temp337 listLen 1 
						cmp_lt ::temp347 UIPick ::temp337 
						jmpf ::temp347 _label15
						; line 1566
						isub ::temp337 UIPick 1 
						callmethod GetAt myList ::temp336 ::temp337 ;1 variable args
						cast ::temp342 ::temp336 
						assign ::UIActor_var ::temp342 
						; line 1567
						callmethod UIFavoriteAction self ::NoneVar myOpt ;1 variable args
						jmp _label14
						; line 1568
					_label15:
						iadd ::temp337 listLen 1 
						cmp_eq ::temp346 UIPick ::temp337 
						jmpf ::temp346 _label16
						; line 1569
						callmethod NameList ::favScript_var ::NoneVar myOpt ;1 variable args
						; line 1570
						callmethod UIPickFavActor self ::NoneVar myOpt catName ;2 variable args
						jmp _label14
						; line 1571
					_label16:
						iadd ::temp337 listLen 2 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp345 ::temp345 
						jmpf ::temp345 _label17
						cmp_gt ::temp346 myOpt 0 
						cast ::temp345 ::temp346 
					_label17:
						jmpf ::temp345 _label18
						; line 1572
						callmethod RemoveList ::favScript_var ::NoneVar myOpt ;1 variable args
						; line 1573
						cast ::temp342 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp342 ;3 variable args
						jmp _label14
						; line 1574
					_label18:
						iadd ::temp337 listLen 2 
						cmp_eq ::temp346 UIPick ::temp337 
						cast ::temp346 ::temp346 
						jmpf ::temp346 _label19
						cmp_eq ::temp345 myOpt 0 
						cast ::temp346 ::temp345 
					_label19:
						cast ::temp348 ::temp346 
						jmpt ::temp348 _label20
						iadd ::temp337 listLen 3 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp345 ::temp345 
						jmpf ::temp345 _label21
						cmp_gt ::temp348 myOpt 0 
						cast ::temp345 ::temp348 
					_label21:
						cast ::temp348 ::temp345 
					_label20:
						jmpf ::temp348 _label22
						; line 1576
						assign index 0 
						; line 1577
					_label25:
						cmp_lt ::temp346 index listLen 
						jmpf ::temp346 _label23
						; line 1578
						callmethod GetAt myList ::temp336 index ;1 variable args
						cast ::temp342 ::temp336 
						assign tmpAct ::temp342 
						; line 1579
						jmpf tmpAct _label24
						; line 1580
						callmethod MoveFollower ::boxScript_var ::NoneVar tmpAct 1 false 256.000 ;4 variable args
						; line 1581
						assign doNotify true 
						jmp _label24
						; line 1583
					_label24:
						iadd ::temp337 index 1 
						assign index ::temp337 
						jmp _label25
						; line 1585
					_label23:
						jmpf doNotify _label26
						; line 1586
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavPort" 0 ;2 variable args
						jmp _label26
					_label26:
						jmp _label14
						; line 1588
					_label22:
						iadd ::temp337 listLen 3 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp348 ::temp345 
						jmpf ::temp348 _label27
						cmp_eq ::temp346 myOpt 0 
						cast ::temp348 ::temp346 
					_label27:
						cast ::temp346 ::temp348 
						jmpt ::temp346 _label28
						iadd ::temp337 listLen 4 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp345 ::temp345 
						jmpf ::temp345 _label29
						cmp_gt ::temp346 myOpt 0 
						cast ::temp345 ::temp346 
					_label29:
						cast ::temp346 ::temp345 
					_label28:
						jmpf ::temp346 _label30
						; line 1589
						assign index 0 
						; line 1590
					_label34:
						cmp_lt ::temp348 index listLen 
						jmpf ::temp348 _label31
						; line 1591
						callmethod GetAt myList ::temp336 index ;1 variable args
						cast ::temp342 ::temp336 
						assign tmpAct ::temp342 
						; line 1592
						jmpf tmpAct _label32
						; line 1593
						propget nwsFF_FollowerFac ::varScript_var ::temp349 
						callmethod IsInFaction tmpAct ::temp345 ::temp349 ;1 variable args
						jmpf ::temp345 _label33
						; line 1594
						callmethod FollowerWaitAction ::controlScript_var ::NoneVar tmpAct 0 0 ;3 variable args
						; line 1595
						assign doNotify true 
						jmp _label33
					_label33:
						jmp _label32
						; line 1598
					_label32:
						iadd ::temp337 index 1 
						assign index ::temp337 
						jmp _label34
						; line 1600
					_label31:
						jmpf doNotify _label35
						; line 1601
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavWaiting" 0 ;2 variable args
						jmp _label35
					_label35:
						jmp _label14
						; line 1603
					_label30:
						iadd ::temp337 listLen 4 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp346 ::temp345 
						jmpf ::temp346 _label36
						cmp_eq ::temp348 myOpt 0 
						cast ::temp346 ::temp348 
					_label36:
						cast ::temp348 ::temp346 
						jmpt ::temp348 _label37
						iadd ::temp337 listLen 5 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp345 ::temp345 
						jmpf ::temp345 _label38
						cmp_gt ::temp348 myOpt 0 
						cast ::temp345 ::temp348 
					_label38:
						cast ::temp348 ::temp345 
					_label37:
						jmpf ::temp348 _label39
						; line 1604
						assign index 0 
						; line 1605
					_label43:
						cmp_lt ::temp346 index listLen 
						jmpf ::temp346 _label40
						; line 1606
						callmethod GetAt myList ::temp336 index ;1 variable args
						cast ::temp342 ::temp336 
						assign tmpAct ::temp342 
						; line 1607
						jmpf tmpAct _label41
						; line 1608
						propget nwsFF_FollowerFac ::varScript_var ::temp349 
						callmethod IsInFaction tmpAct ::temp345 ::temp349 ;1 variable args
						jmpf ::temp345 _label42
						; line 1609
						callmethod FollowerFollowAction ::controlScript_var ::NoneVar tmpAct 0 ;2 variable args
						; line 1610
						assign doNotify true 
						jmp _label42
					_label42:
						jmp _label41
						; line 1613
					_label41:
						iadd ::temp337 index 1 
						assign index ::temp337 
						jmp _label43
						; line 1615
					_label40:
						jmpf doNotify _label44
						; line 1616
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavFollow" 0 ;2 variable args
						jmp _label44
					_label44:
						jmp _label14
						; line 1618
					_label39:
						iadd ::temp337 listLen 5 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp348 ::temp345 
						jmpf ::temp348 _label45
						cmp_eq ::temp346 myOpt 0 
						cast ::temp348 ::temp346 
					_label45:
						cast ::temp346 ::temp348 
						jmpt ::temp346 _label46
						iadd ::temp337 listLen 6 
						cmp_eq ::temp345 UIPick ::temp337 
						cast ::temp345 ::temp345 
						jmpf ::temp345 _label47
						cmp_gt ::temp346 myOpt 0 
						cast ::temp345 ::temp346 
					_label47:
						cast ::temp346 ::temp345 
					_label46:
						jmpf ::temp346 _label14
						; line 1619
						cast ::temp342 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp342 ;3 variable args
						jmp _label14
					_label14:
						jmp _label7
					_label7
					.endCode
				.endFunction ;UIPickFavActor
				.function UIRoleSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp181 Float
						.local ::temp182 Int
						.local ::temp183 Bool
						.local ::temp184 Bool
						.local ::temp185 String[]
						.local ::temp186 String
						.local ::temp187 form
						.local ::temp188 uilib_1
						.local roleCount Int
						.local ::temp189 Bool
						.local rolePick Int
						.local mVal Int
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 916
						callmethod GetActorValue ::UIActor_var ::temp181 "Magicka" ;1 variable args
						cast ::temp182 ::temp181 
						assign UIMagicka ::temp182 
						; line 917
						callmethod GetActorValue ::UIActor_var ::temp181 "Stamina" ;1 variable args
						cast ::temp182 ::temp181 
						assign UIStamina ::temp182 
						; line 918
						assign roleCount 1 
						; line 919
						comp_gte ::temp183 UIMagicka 80 
						cast ::temp183 ::temp183 
						jmpt ::temp183 _label0
						comp_gte ::temp184 UIStamina 50 
						cast ::temp183 ::temp184 
					_label0:
						cast ::temp182 ::temp183 
						iadd ::temp182 roleCount ::temp182 
						assign roleCount ::temp182 
						; line 920
						comp_gte ::temp184 UIStamina 30 
						cast ::temp182 ::temp184 
						iadd ::temp182 roleCount ::temp182 
						assign roleCount ::temp182 
						; line 921
						iadd ::temp182 roleCount 2 
						callstatic utility CreateStringArray ::temp185 ::temp182 "" ;2 variable args
						assign UIChoices ::temp185 
						; line 922
						assign ::temp186 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp186 
						; line 923
						assign ::temp186 "$FF_Role_0" 
						array_setelement UIChoices 1 ::temp186 
						; line 924
						assign roleCount 1 
						; line 925
						comp_gte ::temp183 UIMagicka 80 
						cast ::temp183 ::temp183 
						jmpt ::temp183 _label1
						comp_gte ::temp184 UIStamina 50 
						cast ::temp183 ::temp184 
					_label1:
						jmpf ::temp183 _label2
						; line 926
						iadd ::temp182 roleCount 1 
						assign roleCount ::temp182 
						; line 927
						assign ::temp186 "$FF_Role_1" 
						array_setelement UIChoices roleCount ::temp186 
						jmp _label2
						; line 929
					_label2:
						comp_gte ::temp184 UIStamina 30 
						jmpf ::temp184 _label3
						; line 930
						iadd ::temp182 roleCount 1 
						assign roleCount ::temp182 
						; line 931
						assign ::temp186 "$FF_Role_2" 
						array_setelement UIChoices roleCount ::temp186 
						jmp _label3
						; line 933
					_label3:
						assign ::temp186 "$FF_Back" 
						array_setelement UIChoices 4 ::temp186 
						; line 934
						cast ::temp187 self 
						cast ::temp188 ::temp187 
						callmethod ShowList ::temp188 ::temp182 "$FF_SetRole" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp182 
						; line 936
						cmp_gt ::temp183 UIPick 0 
						jmpf ::temp183 _label4
						; line 937
						assign rolePick -1 
						; line 938
						assign mVal 1 
						; line 940
						cmp_eq ::temp184 UIPick 1 
						jmpf ::temp184 _label5
						; line 941
						assign rolePick 0 
						jmp _label5
						; line 943
					_label5:
						comp_gte ::temp184 UIMagicka 80 
						cast ::temp184 ::temp184 
						jmpt ::temp184 _label6
						comp_gte ::temp189 UIStamina 50 
						cast ::temp184 ::temp189 
					_label6:
						jmpf ::temp184 _label7
						; line 944
						iadd ::temp182 mVal 1 
						assign mVal ::temp182 
						; line 945
						cmp_eq ::temp189 UIPick mVal 
						jmpf ::temp189 _label8
						; line 946
						assign rolePick 1 
						jmp _label8
					_label8:
						jmp _label7
						; line 949
					_label7:
						comp_gte ::temp189 UIStamina 30 
						jmpf ::temp189 _label9
						; line 950
						iadd ::temp182 mVal 1 
						assign mVal ::temp182 
						; line 951
						cmp_eq ::temp184 UIPick mVal 
						jmpf ::temp184 _label10
						; line 952
						assign rolePick 2 
						jmp _label10
					_label10:
						jmp _label9
						; line 955
					_label9:
						cmp_gt ::temp184 rolePick -1 
						jmpf ::temp184 _label11
						; line 956
						callmethod SetFollowerRole ::controlScript_var ::NoneVar ::UIActor_var rolePick ;2 variable args
						; line 957
						callmethod UINotifyPlayer self ::NoneVar "$FF_RoleSet" 2 ;2 variable args
						jmp _label11
						; line 959
					_label11:
						callmethod UITraitSub self ::NoneVar ;0 variable args
						jmp _label4
					_label4
					.endCode
				.endFunction ;UIRoleSub
				.function UIPickFavorite
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param myOpt Int
						.param doAdd Bool
						.param sentActor actor
					.endParamTable
					.localTable
						.local ::temp324 Int
						.local ::temp325 String[]
						.local ::temp326 String
						.local ::temp327 Bool
						.local ::temp332 form
						.local ::temp333 uilib_1
						.local index Int
						.local tmpName String
						.local catName String
						.local ::temp328 Int[]
						.local ::temp329 Bool
						.local ::temp330 Bool
						.local ::temp331 Bool
						.local ::temp334 actor
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 1424
						propget maxNumLists ::favScript_var ::temp324 
						iadd ::temp324 ::temp324 2 
						callstatic utility CreateStringArray ::temp325 ::temp324 "" ;2 variable args
						assign UIChoices ::temp325 
						; line 1425
						assign ::temp326 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp326 
						; line 1426
						assign index 0 
						; line 1430
					_label6:
						propget maxNumLists ::favScript_var ::temp324 
						cmp_lt ::temp327 index ::temp324 
						jmpf ::temp327 _label0
						; line 1431
						propget favListNames ::favScript_var ::temp325 
						array_getlement ::temp326 ::temp325 index 
						assign tmpName ::temp326 
						; line 1432
						propget favListUsed ::favScript_var ::temp328 
						array_getlement ::temp324 ::temp328 index 
						cmp_gt ::temp329 ::temp324 0 
						jmpf ::temp329 _label1
						; line 1433
						cmp_eq ::temp330 index 0 
						cast ::temp330 ::temp330 
						jmpf ::temp330 _label2
						callstatic stringutil GetLength ::temp324 tmpName ;1 variable args
						cmp_lte ::temp331 ::temp324 1 
						cast ::temp330 ::temp331 
					_label2:
						jmpf ::temp330 _label3
						; line 1434
						assign tmpName " Default Favorites" 
						jmp _label4
						; line 1436
					_label3:
						strcat ::temp326 " " tmpName 
						assign tmpName ::temp326 
					_label4:
						jmp _label5
						; line 1439
					_label1:
						assign tmpName " Empty" 
						; line 1441
					_label5:
						iadd ::temp324 index 1 
						cast ::temp326 ::temp324 
						strcat ::temp326 ::temp326 " -" 
						strcat ::temp326 ::temp326 tmpName 
						assign tmpName ::temp326 
						; line 1442
						assign ::temp326 tmpName 
						iadd ::temp324 index 1 
						array_setelement UIChoices ::temp324 ::temp326 
						; line 1443
						iadd ::temp324 index 1 
						assign index ::temp324 
						jmp _label6
						; line 1445
					_label0:
						assign ::temp326 "$FF_Back" 
						iadd ::temp324 index 1 
						array_setelement UIChoices ::temp324 ::temp326 
						; line 1446
						cast ::temp332 self 
						cast ::temp333 ::temp332 
						callmethod ShowList ::temp333 ::temp324 "Favorite Categories" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp324 
						; line 1448
						cmp_gt ::temp331 UIPick 0 
						jmpf ::temp331 _label7
						; line 1449
						iadd ::temp324 index 1 
						cmp_lt ::temp330 UIPick ::temp324 
						jmpf ::temp330 _label8
						; line 1450
						isub ::temp324 UIPick 1 
						assign favPick ::temp324 
						; line 1451
						callmethod GetListName ::favScript_var ::temp326 favPick ;1 variable args
						assign catName ::temp326 
						; line 1452
						jmpf doAdd _label9
						; line 1454
						propget favListUsed ::favScript_var ::temp328 
						array_getlement ::temp324 ::temp328 favPick 
						cmp_lt ::temp329 ::temp324 1 
						jmpf ::temp329 _label10
						; line 1455
						callmethod AddNewList ::favScript_var ::NoneVar favPick ;1 variable args
						jmp _label10
						; line 1458
					_label10:
						callmethod AddNewFavorite ::favScript_var ::NoneVar favPick ::UIActor_var ;2 variable args
						; line 1459
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavoritesAdded" 1 ;2 variable args
						; line 1460
						assign ::temp334 ::UIActor_var 
						propset removeAct ::historyScript_var ::temp334 
						; line 1461
						assign ::temp324 1 
						propset actionKey ::historyScript_var ::temp324 
						; line 1462
						callmethod RegisterForSingleUpdate ::historyScript_var ::NoneVar 0.500000 ;1 variable args
						; line 1464
						cmp_eq ::temp327 myOpt 1 
						jmpf ::temp327 _label11
						; line 1465
						assign ::UIActor_var sentActor 
						; line 1466
						callmethod UICmdOnePotential self ::NoneVar ;0 variable args
						jmp _label12
						; line 1467
					_label11:
						cmp_eq ::temp329 myOpt 2 
						jmpf ::temp329 _label13
						; line 1468
						assign ::UIActor_var sentActor 
						; line 1469
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label12
						; line 1470
					_label13:
						cmp_eq ::temp329 myOpt 3 
						jmpf ::temp329 _label12
						; line 1471
						assign ::UIActor_var sentActor 
						; line 1472
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label12
					_label12:
						jmp _label14
						; line 1476
					_label9:
						propget favListUsed ::favScript_var ::temp328 
						array_getlement ::temp324 ::temp328 favPick 
						cmp_lt ::temp329 ::temp324 1 
						jmpf ::temp329 _label15
						; line 1477
						callmethod AddNewList ::favScript_var ::NoneVar favPick ;1 variable args
						jmp _label15
						; line 1480
					_label15:
						callmethod GetListName ::favScript_var ::temp326 favPick ;1 variable args
						callmethod UIPickFavActor self ::NoneVar favPick ::temp326 ;2 variable args
					_label14:
						jmp _label16
						; line 1483
					_label8:
						cmp_eq ::temp327 myOpt 0 
						jmpf ::temp327 _label17
						; line 1484
						callmethod UIHistoryFav self ::NoneVar ;0 variable args
						jmp _label16
						; line 1485
					_label17:
						cmp_eq ::temp329 myOpt 1 
						jmpf ::temp329 _label18
						; line 1486
						assign ::UIActor_var sentActor 
						; line 1487
						callmethod UICmdOnePotential self ::NoneVar ;0 variable args
						jmp _label16
						; line 1488
					_label18:
						cmp_eq ::temp329 myOpt 2 
						jmpf ::temp329 _label19
						; line 1489
						assign ::UIActor_var sentActor 
						; line 1490
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label16
						; line 1491
					_label19:
						cmp_eq ::temp329 myOpt 3 
						jmpf ::temp329 _label16
						; line 1492
						assign ::UIActor_var sentActor 
						; line 1493
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label16
					_label16:
						jmp _label7
					_label7
					.endCode
				.endFunction ;UIPickFavorite
				.function UICmdOnePotential
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp48 String[]
						.local ::temp49 String
						.local ::temp50 String
						.local ::temp51 String
						.local ::temp52 Bool
						.local ::temp53 faction
						.local ::temp54 form
						.local ::temp55 uilib_1
						.local ::temp56 Int
						.local doAdd Bool
						.local ::temp57 Bool
						.local ::temp58 Bool
						.local ::NoneVar None
						.local ::temp59 Bool
						.local ::temp60 objectreference[]
						.local ::temp61 objectreference
						.local hLoc Int
						.local hMarker objectreference
					.endLocalTable
					.code
						; line 240
						callstatic utility CreateStringArray ::temp48 11 "" ;2 variable args
						assign UIChoices ::temp48 
						; line 241
						cast ::temp50 UIHeath 
						strcat ::temp50 "Health: " ::temp50 
						strcat ::temp50 ::temp50 ", Magicka: " 
						cast ::temp51 UIMagicka 
						strcat ::temp51 ::temp50 ::temp51 
						strcat ::temp50 ::temp51 ", Stamina: " 
						cast ::temp51 UIStamina 
						strcat ::temp51 ::temp50 ::temp51 
						strcat ::temp50 ::temp51 " [x]" 
						assign ::temp49 ::temp50 
						array_setelement UIChoices 0 ::temp49 
						; line 242
						assign ::temp51 "$FF_SkillMenu" 
						array_setelement UIChoices 1 ::temp51 
						; line 243
						assign ::temp49 "$FF_SpellMenu" 
						array_setelement UIChoices 2 ::temp49 
						; line 244
						assign ::temp50 "$FF_Traits" 
						array_setelement UIChoices 3 ::temp50 
						; line 245
						assign ::temp51 "$FF_Recruit" 
						array_setelement UIChoices 4 ::temp51 
						; line 246
						assign ::temp49 "$FF_DoFavor" 
						array_setelement UIChoices 5 ::temp49 
						; line 247
						assign ::temp50 "$FF_Trade" 
						array_setelement UIChoices 6 ::temp50 
						; line 249
						assign doAdd false 
						; line 250
						callmethod FindFavorite ::favScript_var ::temp52 ::UIActor_var false ;2 variable args
						jmpf ::temp52 _label0
						; line 251
						assign ::temp51 "$FF_FavoriteRemove" 
						array_setelement UIChoices 7 ::temp51 
						jmp _label1
						; line 253
					_label0:
						assign doAdd true 
						; line 254
						assign ::temp49 "$FF_FavoriteAdd" 
						array_setelement UIChoices 7 ::temp49 
						; line 256
					_label1:
						assign ::temp50 "$FF_SetHomeBase" 
						array_setelement UIChoices 8 ::temp50 
						; line 257
						propget nwsFF_HomeFac ::varScript_var ::temp53 
						callmethod IsInFaction ::UIActor_var ::temp52 ::temp53 ;1 variable args
						jmpf ::temp52 _label2
						; line 258
						assign ::temp51 "$FF_SendHome" 
						array_setelement UIChoices 9 ::temp51 
						; line 259
						assign ::temp49 "$FF_SubAll" 
						array_setelement UIChoices 10 ::temp49 
						jmp _label3
						; line 261
					_label2:
						assign ::temp50 "$FF_SubAll" 
						array_setelement UIChoices 9 ::temp50 
						; line 264
					_label3:
						cast ::temp54 self 
						cast ::temp55 ::temp54 
						callmethod GetActorName self ::temp51 ::UIActor_var ;1 variable args
						strcat ::temp49 ::temp51 "*" 
						callmethod ShowList ::temp55 ::temp56 ::temp49 UIChoices 0 0 ;4 variable args
						assign UIPick ::temp56 
						; line 265
						cmp_gt ::temp52 UIPick 0 
						jmpf ::temp52 _label4
						; line 266
						cmp_eq ::temp57 UIPick 1 
						jmpf ::temp57 _label5
						; line 267
						callmethod UISkills self ::NoneVar ;0 variable args
						jmp _label6
						; line 268
					_label5:
						cmp_eq ::temp58 UIPick 2 
						jmpf ::temp58 _label7
						; line 269
						callmethod UISpells self ::NoneVar ;0 variable args
						jmp _label6
						; line 270
					_label7:
						cmp_eq ::temp58 UIPick 3 
						jmpf ::temp58 _label8
						; line 271
						callmethod UITraitSub self ::NoneVar ;0 variable args
						jmp _label6
						; line 272
					_label8:
						cmp_eq ::temp58 UIPick 4 
						jmpf ::temp58 _label9
						; line 273
						callmethod RecruitAction ::controlScript_var ::NoneVar ::UIActor_var 1 ;2 variable args
						jmp _label6
						; line 274
					_label9:
						cmp_eq ::temp58 UIPick 5 
						jmpf ::temp58 _label10
						; line 275
						callmethod SetDoingFavor ::UIActor_var ::NoneVar true ;1 variable args
						jmp _label6
						; line 276
					_label10:
						cmp_eq ::temp58 UIPick 6 
						jmpf ::temp58 _label11
						; line 277
						callmethod OpenInventory ::UIActor_var ::NoneVar true ;1 variable args
						jmp _label6
						; line 278
					_label11:
						cmp_eq ::temp58 UIPick 7 
						jmpf ::temp58 _label12
						; line 279
						jmpf doAdd _label13
						; line 280
						callmethod UIPickFavorite self ::NoneVar 1 true ::UIActor_var ;3 variable args
						jmp _label14
						; line 282
					_label13:
						callmethod FindFavorite ::favScript_var ::temp59 ::UIActor_var true ;2 variable args
						; line 283
						callmethod UINotifyPlayer self ::NoneVar "$FF_FavoritesRemoved" 0 ;2 variable args
						; line 284
						callmethod RecordHistory ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						; line 285
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
					_label14:
						jmp _label6
						; line 287
					_label12:
						cmp_eq ::temp59 UIPick 8 
						jmpf ::temp59 _label15
						; line 288
						callmethod UIHomeBase self ::NoneVar ;0 variable args
						jmp _label6
						; line 289
					_label15:
						cmp_eq ::temp58 UIPick 9 
						cast ::temp58 ::temp58 
						jmpf ::temp58 _label16
						propget nwsFF_HomeFac ::varScript_var ::temp53 
						callmethod IsInFaction ::UIActor_var ::temp59 ::temp53 ;1 variable args
						cast ::temp58 ::temp59 
					_label16:
						jmpf ::temp58 _label17
						; line 290
						propget nwsFF_HomeFac ::varScript_var ::temp53 
						callmethod GetFactionRank ::UIActor_var ::temp56 ::temp53 ;1 variable args
						cast ::temp56 ::temp56 
						assign hLoc ::temp56 
						; line 291
						propget nwsHomeMarkers ::homeScript_var ::temp60 
						array_getlement ::temp61 ::temp60 hLoc 
						assign hMarker ::temp61 
						; line 292
						callmethod MoveTo ::UIActor_var ::NoneVar hMarker 0.000000 0.000000 0.000000 true ;5 variable args
						; line 293
						callmethod UINotifyPlayer self ::NoneVar "Follower Sent Home" 0 ;2 variable args
						jmp _label6
						; line 294
					_label17:
						cmp_eq ::temp59 UIPick 10 
						cast ::temp59 ::temp59 
						jmpf ::temp59 _label18
						propget nwsFF_HomeFac ::varScript_var ::temp53 
						callmethod IsInFaction ::UIActor_var ::temp58 ::temp53 ;1 variable args
						cast ::temp59 ::temp58 
					_label18:
						cast ::temp59 ::temp59 
						jmpt ::temp59 _label19
						cmp_eq ::temp58 UIPick 9 
						cast ::temp59 ::temp58 
					_label19:
						jmpf ::temp59 _label6
						; line 295
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label6
					_label6:
						jmp _label4
					_label4
					.endCode
				.endFunction ;UICmdOnePotential
				.function UIConfidenceSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp220 String[]
						.local ::temp221 String
						.local ::temp222 form
						.local ::temp223 uilib_1
						.local ::temp224 Int
						.local ::temp225 Bool
						.local ::temp226 Bool
						.local ::temp227 Bool
						.local ::NoneVar None
						.local ::temp228 faction
						.local ::temp229 Float
					.endLocalTable
					.code
						; line 1052
						callstatic utility CreateStringArray ::temp220 7 "" ;2 variable args
						assign UIChoices ::temp220 
						; line 1053
						assign ::temp221 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp221 
						; line 1054
						assign ::temp221 "$FF_Confidence1" 
						array_setelement UIChoices 1 ::temp221 
						; line 1055
						assign ::temp221 "$FF_Confidence2" 
						array_setelement UIChoices 2 ::temp221 
						; line 1056
						assign ::temp221 "$FF_Confidence3" 
						array_setelement UIChoices 3 ::temp221 
						; line 1057
						assign ::temp221 "$FF_Confidence4" 
						array_setelement UIChoices 4 ::temp221 
						; line 1058
						assign ::temp221 "$FF_Confidence5" 
						array_setelement UIChoices 5 ::temp221 
						; line 1059
						assign ::temp221 "$FF_Back" 
						array_setelement UIChoices 6 ::temp221 
						; line 1060
						cast ::temp222 self 
						cast ::temp223 ::temp222 
						callmethod ShowList ::temp223 ::temp224 "$FF_SetConfidence" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp224 
						; line 1062
						cmp_gt ::temp225 UIPick 0 
						jmpf ::temp225 _label0
						; line 1063
						cmp_gt ::temp226 UIPick 0 
						cast ::temp226 ::temp226 
						jmpf ::temp226 _label1
						cmp_lt ::temp227 UIPick 6 
						cast ::temp226 ::temp227 
					_label1:
						jmpf ::temp226 _label2
						; line 1064
						jmpf ::UIAll_var _label3
						; line 1065
						isub ::temp224 UIPick 1 
						callmethod DoTaskAll ::controlScript_var ::NoneVar 30 ::temp224 ;2 variable args
						; line 1066
						callmethod UINotifyPlayer self ::NoneVar "$FF_ConSetAll" 2 ;2 variable args
						; line 1067
						callmethod UITraitAllSub self ::NoneVar ;0 variable args
						jmp _label4
						; line 1069
					_label3:
						propget nwsFF_ConfFac ::varScript_var ::temp228 
						callmethod IsInFaction ::UIActor_var ::temp227 ::temp228 ;1 variable args
						not ::temp227 ::temp227 
						jmpf ::temp227 _label5
						; line 1070
						propget nwsFF_ConfFac ::varScript_var ::temp228 
						callmethod AddToFaction ::UIActor_var ::NoneVar ::temp228 ;1 variable args
						jmp _label5
						; line 1072
					_label5:
						propget nwsFF_ConfFac ::varScript_var ::temp228 
						isub ::temp224 UIPick 1 
						callmethod SetFactionRank ::UIActor_var ::NoneVar ::temp228 ::temp224 ;2 variable args
						; line 1073
						isub ::temp224 UIPick 1 
						cast ::temp229 ::temp224 
						callmethod SetActorValue ::UIActor_var ::NoneVar "Confidence" ::temp229 ;2 variable args
						; line 1074
						callmethod UINotifyPlayer self ::NoneVar "$FF_ConSet" 2 ;2 variable args
						; line 1075
						callmethod UITraitSub self ::NoneVar ;0 variable args
					_label4:
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIConfidenceSub
				.function UICStyleSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp190 String[]
						.local ::temp191 String
						.local ::temp192 form
						.local ::temp193 uilib_1
						.local ::temp194 Int
						.local ::temp195 Bool
						.local ::temp196 actorbase
						.local ::temp197 Bool
						.local ::temp198 Bool
						.local ::temp199 Bool
						.local ::temp200 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 964
						callstatic utility CreateStringArray ::temp190 13 "" ;2 variable args
						assign UIChoices ::temp190 
						; line 965
						assign ::temp191 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp191 
						; line 966
						assign ::temp191 "$FF_UseDefault" 
						array_setelement UIChoices 1 ::temp191 
						; line 967
						assign ::temp191 "$FF_CombatStyle1" 
						array_setelement UIChoices 2 ::temp191 
						; line 968
						assign ::temp191 "$FF_CombatStyle2" 
						array_setelement UIChoices 3 ::temp191 
						; line 969
						assign ::temp191 "$FF_CombatStyle3" 
						array_setelement UIChoices 4 ::temp191 
						; line 970
						assign ::temp191 "$FF_CombatStyle4" 
						array_setelement UIChoices 5 ::temp191 
						; line 971
						assign ::temp191 "$FF_CombatStyle5" 
						array_setelement UIChoices 6 ::temp191 
						; line 972
						assign ::temp191 "$FF_CombatStyle6" 
						array_setelement UIChoices 7 ::temp191 
						; line 973
						assign ::temp191 "$FF_CombatStyle7" 
						array_setelement UIChoices 8 ::temp191 
						; line 974
						assign ::temp191 "$FF_CombatStyle8" 
						array_setelement UIChoices 9 ::temp191 
						; line 975
						assign ::temp191 "$FF_CombatStyle9" 
						array_setelement UIChoices 10 ::temp191 
						; line 976
						assign ::temp191 "$FF_CombatStyle10" 
						array_setelement UIChoices 11 ::temp191 
						; line 977
						assign ::temp191 "$FF_Back" 
						array_setelement UIChoices 12 ::temp191 
						; line 978
						cast ::temp192 self 
						cast ::temp193 ::temp192 
						callmethod ShowList ::temp193 ::temp194 "$FF_SetCStyle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp194 
						; line 980
						cmp_gt ::temp195 UIPick 0 
						jmpf ::temp195 _label0
						; line 981
						callmethod GetActorBase ::UIActor_var ::temp196 ;0 variable args
						callmethod IsUnique ::temp196 ::temp197 ;0 variable args
						jmpf ::temp197 _label1
						; line 982
						cmp_eq ::temp198 UIPick 1 
						jmpf ::temp198 _label2
						; line 983
						callmethod SetCombatST ::controlScript_var ::NoneVar ::UIAlias_var ::UIActor_var 0 -1 ;4 variable args
						; line 984
						callmethod UINotifyPlayer self ::NoneVar "$FF_CombatStyleSet" 2 ;2 variable args
						jmp _label3
						; line 985
					_label2:
						cmp_gt ::temp199 UIPick 1 
						cast ::temp199 ::temp199 
						jmpf ::temp199 _label4
						cmp_lt ::temp200 UIPick 12 
						cast ::temp199 ::temp200 
					_label4:
						jmpf ::temp199 _label3
						; line 986
						isub ::temp194 UIPick 2 
						callmethod SetCombatST ::controlScript_var ::NoneVar ::UIAlias_var ::UIActor_var 1 ::temp194 ;4 variable args
						; line 987
						callmethod UINotifyPlayer self ::NoneVar "$FF_CombatStyleSet" 2 ;2 variable args
						jmp _label3
					_label3:
						jmp _label5
						; line 990
					_label1:
						callmethod UINotifyPlayer self ::NoneVar "$FF_CombatStyleWarn" 0 ;2 variable args
						; line 992
					_label5:
						callmethod UITraitSub self ::NoneVar ;0 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;UICStyleSub
				.function UIRangeSub
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp141 String[]
						.local ::temp142 String
						.local ::temp143 faction
						.local ::temp144 Int
						.local ::temp145 Bool
						.local ::temp146 Bool
						.local ::temp147 Bool
						.local ::temp148 form
						.local ::temp149 uilib_1
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 619
						callstatic utility CreateStringArray ::temp141 5 "" ;2 variable args
						assign UIChoices ::temp141 
						; line 620
						assign ::temp142 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp142 
						; line 621
						propget nwsFF_NCRangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp145 ::temp144 1 
						jmpf ::temp145 _label0
						; line 622
						assign ::temp142 "$FF_FollowClose" 
						array_setelement UIChoices 1 ::temp142 
						jmp _label1
						; line 623
					_label0:
						propget nwsFF_NCRangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp146 ::temp144 2 
						jmpf ::temp146 _label2
						; line 624
						assign ::temp142 "$FF_FollowFar" 
						array_setelement UIChoices 1 ::temp142 
						jmp _label1
						; line 626
					_label2:
						assign ::temp142 "$FF_FollowMed" 
						array_setelement UIChoices 1 ::temp142 
						; line 628
					_label1:
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp146 ::temp144 1 
						cast ::temp146 ::temp146 
						jmpt ::temp146 _label3
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp145 ::temp144 4 
						cast ::temp146 ::temp145 
					_label3:
						jmpf ::temp146 _label4
						; line 629
						assign ::temp142 "$FF_CombatClose" 
						array_setelement UIChoices 2 ::temp142 
						jmp _label5
						; line 630
					_label4:
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp145 ::temp144 2 
						cast ::temp145 ::temp145 
						jmpt ::temp145 _label6
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						cmp_eq ::temp147 ::temp144 5 
						cast ::temp145 ::temp147 
					_label6:
						jmpf ::temp145 _label7
						; line 631
						assign ::temp142 "$FF_CombatFar" 
						array_setelement UIChoices 2 ::temp142 
						jmp _label5
						; line 633
					_label7:
						assign ::temp142 "$FF_CombatMed" 
						array_setelement UIChoices 2 ::temp142 
						; line 635
					_label5:
						assign ::temp142 "$FF_EnforceRangeOff" 
						array_setelement UIChoices 3 ::temp142 
						; line 636
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod IsInFaction ::UIActor_var ::temp147 ::temp143 ;1 variable args
						jmpf ::temp147 _label8
						; line 637
						propget nwsFF_RangeFac ::varScript_var ::temp143 
						callmethod GetFactionRank ::UIActor_var ::temp144 ::temp143 ;1 variable args
						comp_gte ::temp145 ::temp144 3 
						jmpf ::temp145 _label9
						; line 638
						assign ::temp142 "$FF_EnforceRangeOn" 
						array_setelement UIChoices 3 ::temp142 
						jmp _label9
					_label9:
						jmp _label8
						; line 641
					_label8:
						assign ::temp142 "$FF_Back" 
						array_setelement UIChoices 4 ::temp142 
						; line 642
						cast ::temp148 self 
						cast ::temp149 ::temp148 
						callmethod ShowList ::temp149 ::temp144 "$FF_RangeTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp144 
						; line 644
						jmpf UIPick _label10
						; line 645
						cmp_eq ::temp146 UIPick 1 
						jmpf ::temp146 _label11
						; line 646
						assign ::UIAll_var false 
						; line 647
						callmethod UIRangeDist self ::NoneVar 0 ;1 variable args
						jmp _label12
						; line 648
					_label11:
						cmp_eq ::temp145 UIPick 2 
						jmpf ::temp145 _label13
						; line 649
						assign ::UIAll_var false 
						; line 650
						callmethod UIRangeDist self ::NoneVar 1 ;1 variable args
						jmp _label12
						; line 651
					_label13:
						cmp_eq ::temp147 UIPick 3 
						jmpf ::temp147 _label14
						; line 652
						callmethod TogEnforceCbt ::controlScript_var ::NoneVar ::UIActor_var ;1 variable args
						; line 653
						callmethod UIRangeSub self ::NoneVar ;0 variable args
						jmp _label12
						; line 654
					_label14:
						cmp_eq ::temp145 UIPick 4 
						jmpf ::temp145 _label12
						; line 655
						callmethod UICmdOneMenu self ::NoneVar ::UIActor_var ;1 variable args
						jmp _label12
					_label12:
						jmp _label10
					_label10
					.endCode
				.endFunction ;UIRangeSub
				.function UIHistoryFav
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp240 String[]
						.local ::temp241 String
						.local ::temp242 form
						.local ::temp243 uilib_1
						.local ::temp244 Int
						.local ::temp245 Bool
						.local ::temp246 Bool
						.local ::temp247 Bool
						.local ::NoneVar None
						.local ::temp248 actor
					.endLocalTable
					.code
						; line 1111
						callstatic utility CreateStringArray ::temp240 5 "" ;2 variable args
						assign UIChoices ::temp240 
						; line 1112
						assign ::temp241 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp241 
						; line 1113
						assign ::temp241 "$FF_ShowHistory" 
						array_setelement UIChoices 1 ::temp241 
						; line 1114
						assign ::temp241 "$FF_Favorites" 
						array_setelement UIChoices 2 ::temp241 
						; line 1115
						assign ::temp241 "$FF_SortSlots" 
						array_setelement UIChoices 3 ::temp241 
						; line 1116
						assign ::temp241 "$FF_Back" 
						array_setelement UIChoices 4 ::temp241 
						; line 1117
						cast ::temp242 self 
						cast ::temp243 ::temp242 
						callmethod ShowList ::temp243 ::temp244 "$FF_HistoryFavTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp244 
						; line 1119
						cmp_gt ::temp245 UIPick 0 
						jmpf ::temp245 _label0
						; line 1120
						cmp_eq ::temp246 UIPick 1 
						jmpf ::temp246 _label1
						; line 1121
						callmethod UIOpenHistory self ::NoneVar ;0 variable args
						jmp _label2
						; line 1122
					_label1:
						cmp_eq ::temp247 UIPick 2 
						jmpf ::temp247 _label3
						; line 1123
						cast ::temp248 none 
						callmethod UIPickFavorite self ::NoneVar 0 false ::temp248 ;3 variable args
						jmp _label2
						; line 1124
					_label3:
						cmp_eq ::temp247 UIPick 3 
						jmpf ::temp247 _label4
						; line 1125
						callmethod SortSlotsAll ::controlScript_var ::NoneVar ;0 variable args
						jmp _label2
						; line 1126
					_label4:
						cmp_eq ::temp247 UIPick 4 
						jmpf ::temp247 _label2
						; line 1127
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
						jmp _label2
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;UIHistoryFav
				.function UISummon
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp115 globalvariable
						.local ::temp116 Float
						.local ::temp117 Int
						.local ::temp118 String[]
						.local ::temp119 Int[]
						.local ::temp120 String
						.local ::temp121 Bool
						.local ::temp128 form
						.local ::temp129 uilib_1
						.local index Int
						.local count Int
						.local follower actor
						.local checkAlias referencealias
						.local ::temp122 Quest
						.local ::temp123 alias
						.local ::temp124 referencealias
						.local ::temp125 objectreference
						.local ::temp126 actor
						.local ::temp127 String
						.local ::temp130 Bool
						.local ::temp131 Bool
						.local ::temp132 Bool
						.local ::NoneVar None
						.local mySlot Int
					.endLocalTable
					.code
						; line 561
						propget nwsFollowerCount ::varScript_var ::temp115 
						callmethod GetValue ::temp115 ::temp116 ;0 variable args
						cast ::temp117 ::temp116 
						assign UIFolCnt ::temp117 
						; line 562
						iadd ::temp117 UIFolCnt 3 
						callstatic utility CreateStringArray ::temp118 ::temp117 "" ;2 variable args
						assign UIChoices ::temp118 
						; line 563
						iadd ::temp117 UIFolCnt 3 
						callstatic utility CreateIntArray ::temp119 ::temp117 0 ;2 variable args
						assign UISlots ::temp119 
						; line 564
						assign index 0 
						; line 565
						assign count 2 
						; line 568
						assign ::temp120 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp120 
						; line 569
						assign ::temp120 "$FF_All" 
						array_setelement UIChoices 1 ::temp120 
						; line 570
					_label3:
						cmp_lt ::temp121 index 12 
						jmpf ::temp121 _label0
						; line 571
						propget DialogueFollower ::varScript_var ::temp122 
						callmethod GetAlias ::temp122 ::temp123 index ;1 variable args
						cast ::temp124 ::temp123 
						assign checkAlias ::temp124 
						; line 572
						jmpf checkAlias _label1
						; line 573
						callmethod GetReference checkAlias ::temp125 ;0 variable args
						cast ::temp126 ::temp125 
						assign follower ::temp126 
						; line 574
						jmpf follower _label2
						; line 575
						callmethod GetActorName self ::temp127 follower ;1 variable args
						assign ::temp120 ::temp127 
						array_setelement UIChoices count ::temp120 
						; line 576
						assign ::temp117 index 
						array_setelement UISlots count ::temp117 
						; line 577
						iadd ::temp117 count 1 
						assign count ::temp117 
						jmp _label2
					_label2:
						jmp _label1
						; line 580
					_label1:
						iadd ::temp117 index 1 
						assign index ::temp117 
						jmp _label3
						; line 582
					_label0:
						assign ::temp120 "$FF_Back" 
						array_setelement UIChoices count ::temp120 
						; line 583
						cast ::temp128 self 
						cast ::temp129 ::temp128 
						callmethod ShowList ::temp129 ::temp117 "$FF_SummonTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp117 
						; line 584
						cmp_gt ::temp121 UIPick 0 
						jmpf ::temp121 _label4
						; line 585
						cmp_eq ::temp130 UIPick 1 
						jmpf ::temp130 _label5
						; line 586
						callmethod DoTaskAll ::boxScript_var ::NoneVar 2 1 ;2 variable args
						jmp _label6
						; line 587
					_label5:
						cmp_gt ::temp131 UIPick 1 
						cast ::temp131 ::temp131 
						jmpf ::temp131 _label7
						propget nwsFollowerCount ::varScript_var ::temp115 
						callmethod GetValue ::temp115 ::temp116 ;0 variable args
						cast ::temp117 ::temp116 
						iadd ::temp117 ::temp117 2 
						cmp_lt ::temp132 UIPick ::temp117 
						cast ::temp131 ::temp132 
					_label7:
						jmpf ::temp131 _label8
						; line 588
						array_getlement ::temp117 UISlots UIPick 
						assign mySlot ::temp117 
						; line 589
						propget DialogueFollower ::varScript_var ::temp122 
						callmethod GetAlias ::temp122 ::temp123 mySlot ;1 variable args
						cast ::temp124 ::temp123 
						callmethod GetReference ::temp124 ::temp125 ;0 variable args
						cast ::temp126 ::temp125 
						assign ::UIActor_var ::temp126 
						; line 590
						callmethod MoveFollower ::boxScript_var ::NoneVar ::UIActor_var 1 false 256.000 ;4 variable args
						jmp _label6
						; line 592
					_label8:
						callmethod UICmdAllMenu self ::NoneVar ;0 variable args
					_label6:
						jmp _label4
					_label4
					.endCode
				.endFunction ;UISummon
				.function UICmdAllMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp1 String[]
						.local ::temp2 String
						.local ::temp3 form
						.local ::temp4 uilib_1
						.local ::temp5 Int
						.local ::temp6 Bool
						.local strTitle String
						.local ::temp7 Bool
						.local ::temp10 Bool
						.local ::temp8 spell
						.local ::temp9 objectreference
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 63
						callstatic utility CreateStringArray ::temp1 12 "" ;2 variable args
						assign UIChoices ::temp1 
						; line 64
						assign ::temp2 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp2 
						; line 65
						jmpf ::isRetreat_var _label0
						; line 66
						assign ::temp2 "$FF_FollowersRetreatCancel" 
						array_setelement UIChoices 1 ::temp2 
						jmp _label1
						; line 68
					_label0:
						assign ::temp2 "$FF_FollowersRetreat" 
						array_setelement UIChoices 1 ::temp2 
						; line 70
					_label1:
						assign ::temp2 "$FF_AllWaitFollow" 
						array_setelement UIChoices 2 ::temp2 
						; line 71
						assign ::temp2 "$FF_InventoryLoot" 
						array_setelement UIChoices 3 ::temp2 
						; line 72
						assign ::temp2 "$FF_SummonAll" 
						array_setelement UIChoices 4 ::temp2 
						; line 73
						assign ::temp2 "$FF_SandboxToggle" 
						array_setelement UIChoices 5 ::temp2 
						; line 74
						assign ::temp2 "$FF_HistoryFav" 
						array_setelement UIChoices 6 ::temp2 
						; line 75
						assign ::temp2 "$FF_RangeAll" 
						array_setelement UIChoices 7 ::temp2 
						; line 76
						assign ::temp2 "$FF_TraitsAll" 
						array_setelement UIChoices 8 ::temp2 
						; line 77
						assign ::temp2 "$FF_DismissAll" 
						array_setelement UIChoices 9 ::temp2 
						; line 78
						assign ::temp2 "$FF_KeyHorseM" 
						array_setelement UIChoices 10 ::temp2 
						; line 79
						assign ::temp2 "$FF_SubSingle" 
						array_setelement UIChoices 11 ::temp2 
						; line 81
						assign strTitle "$FF_CommandAll" 
						; line 82
						cast ::temp3 self 
						cast ::temp4 ::temp3 
						callmethod ShowList ::temp4 ::temp5 strTitle UIChoices 0 0 ;4 variable args
						assign UIPick ::temp5 
						; line 84
						cmp_gt ::temp6 UIPick 0 
						jmpf ::temp6 _label2
						; line 85
						cmp_eq ::temp7 UIPick 1 
						jmpf ::temp7 _label3
						; line 86
						jmpf ::isRetreat_var _label4
						; line 87
						assign ::isRetreat_var 0 
						; line 88
						propget nwsRetreatCancel ::varScript_var ::temp8 
						cast ::temp9 ::myPlayer_var 
						callmethod Cast ::temp8 ::NoneVar ::temp9 none ;2 variable args
						; line 89
						callmethod UINotifyPlayer self ::NoneVar "$FF_FollowersRetreatingCancel" 0 ;2 variable args
						jmp _label5
						; line 91
					_label4:
						callmethod UINotifyPlayer self ::NoneVar "$FF_FollowersRetreating" 0 ;2 variable args
						; line 92
						propget nwsRetreatAllies ::varScript_var ::temp8 
						cast ::temp9 ::myPlayer_var 
						callmethod Cast ::temp8 ::NoneVar ::temp9 none ;2 variable args
						; line 93
						callmethod DoTaskAll ::controlScript_var ::NoneVar 15 0 ;2 variable args
						; line 94
						callmethod SetToRetreat self ::NoneVar ;0 variable args
					_label5:
						jmp _label6
						; line 96
					_label3:
						cmp_eq ::temp10 UIPick 2 
						jmpf ::temp10 _label7
						; line 97
						callmethod UIWaitAllSub self ::NoneVar ;0 variable args
						jmp _label6
						; line 98
					_label7:
						cmp_eq ::temp10 UIPick 3 
						jmpf ::temp10 _label8
						; line 99
						callmethod UILoot self ::NoneVar ;0 variable args
						jmp _label6
						; line 100
					_label8:
						cmp_eq ::temp10 UIPick 4 
						jmpf ::temp10 _label9
						; line 101
						callmethod UISummon self ::NoneVar ;0 variable args
						jmp _label6
						; line 102
					_label9:
						cmp_eq ::temp10 UIPick 5 
						jmpf ::temp10 _label10
						; line 103
						callmethod ToggleSandbox ::controlScript_var ::NoneVar ;0 variable args
						jmp _label6
						; line 104
					_label10:
						cmp_eq ::temp10 UIPick 6 
						jmpf ::temp10 _label11
						; line 105
						callmethod UIHistoryFav self ::NoneVar ;0 variable args
						jmp _label6
						; line 106
					_label11:
						cmp_eq ::temp10 UIPick 7 
						jmpf ::temp10 _label12
						; line 107
						callmethod UIRangeSubAll self ::NoneVar ;0 variable args
						jmp _label6
						; line 108
					_label12:
						cmp_eq ::temp10 UIPick 8 
						jmpf ::temp10 _label13
						; line 109
						callmethod UITraitAllSub self ::NoneVar ;0 variable args
						jmp _label6
						; line 110
					_label13:
						cmp_eq ::temp10 UIPick 9 
						jmpf ::temp10 _label14
						; line 111
						callmethod DismissAll ::controlScript_var ::NoneVar ;0 variable args
						jmp _label6
						; line 112
					_label14:
						cmp_eq ::temp10 UIPick 10 
						jmpf ::temp10 _label15
						; line 113
						callmethod CallHorse ::mountScript_var ::NoneVar ;0 variable args
						jmp _label6
						; line 114
					_label15:
						cmp_eq ::temp10 UIPick 11 
						jmpf ::temp10 _label6
						; line 115
						callmethod UISelectOneMenu self ::NoneVar ;0 variable args
						jmp _label6
					_label6:
						jmp _label2
					_label2
					.endCode
				.endFunction ;UICmdAllMenu
				.function UISpells
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp79 actorbase
						.local ::temp80 Int
						.local ::temp81 String[]
						.local ::temp82 Bool
						.local ::temp90 faction
						.local ::temp91 form
						.local ::temp92 uilib_1
						.local actBase actorbase
						.local baseCount Int
						.local grantedCount Int
						.local namesList String[]
						.local spellName String
						.local actSpell spell
						.local fxTotal Float
						.local fxIndex Int
						.local index Int
						.local count Int
						.local ::temp83 Bool
						.local ::temp84 spell
						.local ::temp85 String
						.local ::temp86 Float
						.local ::temp87 Bool
						.local ::temp88 magiceffect
						.local ::temp89 Bool
						.local spellEffect magiceffect
						.local spellCount Int
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 377
						callmethod GetActorBase ::UIActor_var ::temp79 ;0 variable args
						assign actBase ::temp79 
						; line 378
						callmethod GetSpellCount actBase ::temp80 ;0 variable args
						assign baseCount ::temp80 
						; line 379
						callmethod GetSpellCount ::UIActor_var ::temp80 ;0 variable args
						assign grantedCount ::temp80 
						; line 380
						array_create ::temp81 100 
						assign namesList ::temp81 
						; line 386
						assign index 0 
						; line 387
						assign count 0 
						; line 391
						cmp_gt ::temp82 grantedCount 0 
						jmpf ::temp82 _label0
						; line 395
					_label7:
						cmp_lt ::temp83 index grantedCount 
						jmpf ::temp83 _label1
						; line 396
						callmethod GetNthSpell ::UIActor_var ::temp84 index ;1 variable args
						assign actSpell ::temp84 
						; line 397
						callmethod GetName actSpell ::temp85 ;0 variable args
						assign spellName ::temp85 
						; line 399
						callmethod GetCastTime actSpell ::temp86 ;0 variable args
						assign fxTotal ::temp86 
						; line 400
						assign fxIndex 0 
						; line 401
					_label4:
						callmethod GetNumEffects actSpell ::temp80 ;0 variable args
						cmp_lt ::temp87 fxIndex ::temp80 
						jmpf ::temp87 _label2
						; line 402
						callmethod GetNthEffectArea actSpell ::temp80 fxIndex ;1 variable args
						cast ::temp86 ::temp80 
						fadd ::temp86 fxTotal ::temp86 
						assign fxTotal ::temp86 
						; line 403
						callmethod GetNthEffectDuration actSpell ::temp80 fxIndex ;1 variable args
						cast ::temp86 ::temp80 
						fadd ::temp86 fxTotal ::temp86 
						assign fxTotal ::temp86 
						; line 404
						callmethod GetNthEffectMagicEffect actSpell ::temp88 fxIndex ;1 variable args
						assign spellEffect ::temp88 
						; line 405
						callmethod GetCastingType spellEffect ::temp80 ;0 variable args
						cmp_eq ::temp89 ::temp80 2 
						jmpf ::temp89 _label3
						; line 406
						cast ::temp86 1 
						fadd ::temp86 fxTotal ::temp86 
						assign fxTotal ::temp86 
						jmp _label3
						; line 408
					_label3:
						iadd ::temp80 fxIndex 1 
						assign fxIndex ::temp80 
						jmp _label4
						; line 411
					_label2:
						cmp_gt ::temp89 fxTotal 0.500000 
						cast ::temp89 ::temp89 
						jmpf ::temp89 _label5
						cmp_eq ::temp87 spellName "" 
						not ::temp87 ::temp87 
						cast ::temp89 ::temp87 
					_label5:
						jmpf ::temp89 _label6
						; line 412
						assign ::temp85 spellName 
						array_setelement namesList count ::temp85 
						; line 413
						iadd ::temp80 count 1 
						assign count ::temp80 
						jmp _label6
						; line 416
					_label6:
						iadd ::temp80 index 1 
						assign index ::temp80 
						jmp _label7
					_label1:
						jmp _label0
						; line 420
					_label0:
						propget nwsSharpenWeapons ::varScript_var ::temp88 
						callmethod HasMagicEffect ::UIActor_var ::temp87 ::temp88 ;1 variable args
						jmpf ::temp87 _label8
						; line 421
						assign ::temp85 "$FF_BuffSharpen" 
						array_setelement namesList count ::temp85 
						; line 422
						iadd ::temp80 count 1 
						assign count ::temp80 
						jmp _label8
						; line 424
					_label8:
						propget nwsFF_RegardFac ::varScript_var ::temp90 
						callmethod IsInFaction ::UIActor_var ::temp89 ::temp90 ;1 variable args
						jmpf ::temp89 _label9
						; line 425
						propget nwsFF_RegardFac ::varScript_var ::temp90 
						callmethod GetFactionRank ::UIActor_var ::temp80 ::temp90 ;1 variable args
						comp_gte ::temp83 ::temp80 6 
						jmpf ::temp83 _label10
						; line 426
						assign ::temp85 "$FF_BuffCourage" 
						array_setelement namesList count ::temp85 
						; line 427
						iadd ::temp80 count 1 
						assign count ::temp80 
						jmp _label10
					_label10:
						jmp _label9
						; line 430
					_label9:
						propget nwsFortifyHealthFX ::varScript_var ::temp88 
						callmethod HasMagicEffect ::UIActor_var ::temp82 ::temp88 ;1 variable args
						jmpf ::temp82 _label11
						; line 431
						assign ::temp85 "$FF_BuffInspired" 
						array_setelement namesList count ::temp85 
						; line 432
						iadd ::temp80 count 1 
						assign count ::temp80 
						jmp _label11
						; line 435
					_label11:
						iadd ::temp80 count baseCount 
						assign spellCount ::temp80 
						; line 437
						cmp_eq ::temp87 spellCount 0 
						jmpf ::temp87 _label12
						; line 438
						callstatic utility CreateStringArray ::temp81 3 "" ;2 variable args
						assign UIChoices ::temp81 
						; line 439
						assign ::temp85 "$FF_None" 
						array_setelement UIChoices 1 ::temp85 
						; line 440
						assign ::temp85 "$FF_Back" 
						array_setelement UIChoices 2 ::temp85 
						jmp _label13
						; line 442
					_label12:
						iadd ::temp80 spellCount 2 
						callstatic utility CreateStringArray ::temp81 ::temp80 "" ;2 variable args
						assign UIChoices ::temp81 
						; line 443
						assign ::temp85 "$FF_Back" 
						iadd ::temp80 spellCount 1 
						array_setelement UIChoices ::temp80 ::temp85 
						; line 446
					_label13:
						assign ::temp85 "$FF_Exit" 
						array_setelement UIChoices 0 ::temp85 
						; line 448
						cmp_gt ::temp83 spellCount 0 
						jmpf ::temp83 _label14
						; line 449
						assign index 0 
						; line 450
					_label18:
						cmp_lt ::temp89 index spellCount 
						jmpf ::temp89 _label15
						; line 452
						comp_gte ::temp82 index baseCount 
						jmpf ::temp82 _label16
						; line 453
						isub ::temp80 index baseCount 
						array_getlement ::temp85 namesList ::temp80 
						assign spellName ::temp85 
						jmp _label17
						; line 455
					_label16:
						callmethod GetNthSpell actBase ::temp84 index ;1 variable args
						assign actSpell ::temp84 
						; line 456
						callmethod GetName actSpell ::temp85 ;0 variable args
						strcat ::temp85 ::temp85 "*" 
						assign spellName ::temp85 
						; line 458
					_label17:
						assign ::temp85 spellName 
						iadd ::temp80 index 1 
						array_setelement UIChoices ::temp80 ::temp85 
						; line 460
						iadd ::temp80 index 1 
						assign index ::temp80 
						jmp _label18
					_label15:
						jmp _label14
						; line 464
					_label14:
						cast ::temp91 self 
						cast ::temp92 ::temp91 
						callmethod ShowList ::temp92 ::temp80 "$FF_SpellTitle" UIChoices 0 0 ;4 variable args
						assign UIPick ::temp80 
						; line 465
						cmp_gt ::temp87 UIPick 0 
						jmpf ::temp87 _label19
						; line 466
						cmp_eq ::temp82 ::UIType_var 1 
						jmpf ::temp82 _label20
						; line 467
						callmethod UICmdOnePotential self ::NoneVar ;0 variable args
						jmp _label21
						; line 468
					_label20:
						cmp_eq ::temp89 ::UIType_var 2 
						jmpf ::temp89 _label22
						; line 469
						callmethod UICmdOneNPC self ::NoneVar ;0 variable args
						jmp _label21
						; line 471
					_label22:
						callmethod UICmdOneFollower self ::NoneVar ;0 variable args
					_label21:
						jmp _label19
					_label19
					.endCode
				.endFunction ;UISpells
			.endState
		.endStateTable
	.endObject
.endObjectTable
