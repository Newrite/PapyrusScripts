.info
	.source "Clonejuration.psc"
	.modifyTime 1486230894 ;2017-02-05 00:54:54
	.compileTime 1486230909 ;2017-02-05 00:55:09
	.user "Utopium"
	.computer "DESKTOP-J4FLIQR"
.endInfo
.userFlagsRef
	.flag conditional 1 ;0x00000002
	.flag hidden 0 ;0x00000001
.endUserFlagsRef
.objectTable
	.object Clonejuration SKI_ConfigBase
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable sCloneCounts String[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::oCloneMarker_var objectreference
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable sNpcOptions String[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iCloneCountOID Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iSearchOID Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iClonedFormsOIDs Int[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iCloneLevel Int
				.userFlags 0 ;none
				.initialValue 4
			.endVariable
			.variable fClonedForms Form[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iCloneCount Int
				.userFlags 0 ;none
				.initialValue 0
			.endVariable
			.variable iCloneLevelOID Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iCloneOID Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable aCurrentNPC ActorBase
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iCloneCounts Int[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable iClearAllOID Int
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable sCloneLevels String[]
				.userFlags 0 ;none
				.initialValue none
			.endVariable
		.endVariableTable
		.propertyTable
			.property oCloneMarker objectreference auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::oCloneMarker_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
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
				.function OnOptionInputAccept
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param option Int
						.param value String
					.endParamTable
					.localTable
						.local ::temp52 Bool
						.local ::temp53 Int
						.local ::temp54 Bool
						.local formID Int
						.local ::temp55 String
						.local ::NoneVar None
						.local ::temp56 form
						.local ::temp57 ActorBase
						.local npc ActorBase
					.endLocalTable
					.code
						; line 293
						cmp_eq ::temp52 option iSearchOID 
						jmpf ::temp52 _label0
						; line 294
						callmethod HexStringToInt self ::temp53 value ;1 variable args
						assign formID ::temp53 
						; line 295
						cmp_eq ::temp54 formID -1 
						jmpf ::temp54 _label1
						; line 296
						strcat ::temp55 value " is not a valid form ID." 
						callstatic debug MessageBox ::NoneVar ::temp55 ;1 variable args
						jmp _label2
						; line 298
					_label1:
						callstatic game GetForm ::temp56 formID ;1 variable args
						cast ::temp57 ::temp56 
						assign npc ::temp57 
						; line 299
						jmpf npc _label3
						; line 300
						callmethod AddNPC self ::NoneVar npc ;1 variable args
						; line 301
						callmethod ForcePageReset self ::NoneVar ;0 variable args
						jmp _label2
						; line 303
					_label3:
						strcat ::temp55 value " was not found." 
						callstatic debug MessageBox ::NoneVar ::temp55 ;1 variable args
					_label2:
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnOptionInputAccept
				.function AddNPC
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param ref ActorBase
					.endParamTable
					.localTable
						.local ::temp7 Int
						.local ::temp8 Bool
						.local ::NoneVar None
						.local ::temp9 Form[]
						.local ::temp10 form
						.local ::temp11 form
						.local newFormList Form[]
						.local index Int
					.endLocalTable
					.code
						; line 77
						array_length ::temp7 fClonedForms 
						comp_gte ::temp8 ::temp7 100 
						jmpf ::temp8 _label0
						; line 78
						return none 
						jmp _label0
						; line 81
					_label0:
						callmethod RemoveNPC self ::NoneVar ref ;1 variable args
						; line 83
						array_length ::temp7 fClonedForms 
						iadd ::temp7 ::temp7 1 
						callstatic utility CreateFormArray ::temp9 ::temp7 none ;2 variable args
						assign newFormList ::temp9 
						; line 84
						array_length ::temp7 fClonedForms 
						assign index ::temp7 
						; line 85
						cast ::temp11 ref 
						assign ::temp10 ::temp11 
						array_setelement newFormList index ::temp10 
						; line 86
					_label2:
						jmpf index _label1
						; line 87
						isub ::temp7 index 1 
						assign index ::temp7 
						; line 88
						array_getlement ::temp10 fClonedForms index 
						assign ::temp11 ::temp10 
						array_setelement newFormList index ::temp11 
						jmp _label2
						; line 91
					_label1:
						assign fClonedForms newFormList 
					.endCode
				.endFunction ;AddNPC
				.function OnCrosshairRefChange
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param ref objectreference
					.endParamTable
					.localTable
						.local ::temp5 actor
						.local currentActor actor
						.local ::temp6 ActorBase
					.endLocalTable
					.code
						; line 68
						cast ::temp5 ref 
						assign currentActor ::temp5 
						; line 69
						jmpf currentActor _label0
						; line 70
						callmethod GetActorBase currentActor ::temp6 ;0 variable args
						assign aCurrentNPC ::temp6 
						jmp _label1
						; line 72
					_label0:
						cast ::temp6 none 
						assign aCurrentNPC ::temp6 
					_label1
					.endCode
				.endFunction ;OnCrosshairRefChange
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
				.function HexCharToInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
						.param chr String
					.endParamTable
					.localTable
						.local ::temp12 Bool
						.local ::temp13 Bool
						.local ::temp14 Bool
					.endLocalTable
					.code
						; line 95
						cmp_eq ::temp12 chr "0" 
						jmpf ::temp12 _label0
						; line 96
						return 0 
						jmp _label1
						; line 97
					_label0:
						cmp_eq ::temp13 chr "1" 
						jmpf ::temp13 _label2
						; line 98
						return 1 
						jmp _label1
						; line 99
					_label2:
						cmp_eq ::temp13 chr "2" 
						jmpf ::temp13 _label3
						; line 100
						return 2 
						jmp _label1
						; line 101
					_label3:
						cmp_eq ::temp13 chr "3" 
						jmpf ::temp13 _label4
						; line 102
						return 3 
						jmp _label1
						; line 103
					_label4:
						cmp_eq ::temp13 chr "4" 
						jmpf ::temp13 _label5
						; line 104
						return 4 
						jmp _label1
						; line 105
					_label5:
						cmp_eq ::temp13 chr "5" 
						jmpf ::temp13 _label6
						; line 106
						return 5 
						jmp _label1
						; line 107
					_label6:
						cmp_eq ::temp13 chr "6" 
						jmpf ::temp13 _label7
						; line 108
						return 6 
						jmp _label1
						; line 109
					_label7:
						cmp_eq ::temp13 chr "7" 
						jmpf ::temp13 _label8
						; line 110
						return 7 
						jmp _label1
						; line 111
					_label8:
						cmp_eq ::temp13 chr "8" 
						jmpf ::temp13 _label9
						; line 112
						return 8 
						jmp _label1
						; line 113
					_label9:
						cmp_eq ::temp13 chr "9" 
						jmpf ::temp13 _label10
						; line 114
						return 9 
						jmp _label1
						; line 115
					_label10:
						cmp_eq ::temp13 chr "a" 
						cast ::temp13 ::temp13 
						jmpt ::temp13 _label11
						cmp_eq ::temp14 chr "a" 
						cast ::temp13 ::temp14 
					_label11:
						jmpf ::temp13 _label12
						; line 116
						return 10 
						jmp _label1
						; line 117
					_label12:
						cmp_eq ::temp14 chr "b" 
						cast ::temp14 ::temp14 
						jmpt ::temp14 _label13
						cmp_eq ::temp13 chr "b" 
						cast ::temp14 ::temp13 
					_label13:
						jmpf ::temp14 _label14
						; line 118
						return 11 
						jmp _label1
						; line 119
					_label14:
						cmp_eq ::temp13 chr "c" 
						cast ::temp13 ::temp13 
						jmpt ::temp13 _label15
						cmp_eq ::temp14 chr "c" 
						cast ::temp13 ::temp14 
					_label15:
						jmpf ::temp13 _label16
						; line 120
						return 12 
						jmp _label1
						; line 121
					_label16:
						cmp_eq ::temp14 chr "d" 
						cast ::temp14 ::temp14 
						jmpt ::temp14 _label17
						cmp_eq ::temp13 chr "d" 
						cast ::temp14 ::temp13 
					_label17:
						jmpf ::temp14 _label18
						; line 122
						return 13 
						jmp _label1
						; line 123
					_label18:
						cmp_eq ::temp13 chr "e" 
						cast ::temp13 ::temp13 
						jmpt ::temp13 _label19
						cmp_eq ::temp14 chr "e" 
						cast ::temp13 ::temp14 
					_label19:
						jmpf ::temp13 _label20
						; line 124
						return 14 
						jmp _label1
						; line 125
					_label20:
						cmp_eq ::temp14 chr "f" 
						cast ::temp14 ::temp14 
						jmpt ::temp14 _label21
						cmp_eq ::temp13 chr "f" 
						cast ::temp14 ::temp13 
					_label21:
						jmpf ::temp14 _label22
						; line 126
						return 15 
						jmp _label1
						; line 128
					_label22:
						return -1 
					_label1
					.endCode
				.endFunction ;HexCharToInt
				.function OnVersionUpdate
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param version Int
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;OnVersionUpdate
				.function Clone
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param npc ActorBase
					.endParamTable
					.localTable
						.local ::temp24 Int
						.local ::temp29 String
						.local ::temp30 String
						.local index Int
						.local ::temp25 Float
						.local ::temp26 Bool
						.local ::temp27 actor
						.local ::temp28 objectreference
						.local ::NoneVar None
						.local range Float
						.local x Float
						.local y Float
					.endLocalTable
					.code
						; line 187
						array_getlement ::temp24 iCloneCounts iCloneCount 
						assign index ::temp24 
						; line 188
					_label3:
						jmpf index _label0
						; line 189
						isub ::temp24 index 1 
						assign index ::temp24 
						; line 191
						cast ::temp25 300 
						assign range ::temp25 
						; line 192
						cast ::temp25 2 
						fdiv ::temp25 range ::temp25 
						callstatic utility RandomFloat ::temp25 ::temp25 range ;2 variable args
						assign x ::temp25 
						; line 193
						cast ::temp25 2 
						fdiv ::temp25 range ::temp25 
						callstatic utility RandomFloat ::temp25 ::temp25 range ;2 variable args
						assign y ::temp25 
						; line 194
						callstatic utility RandomInt ::temp24 0 1 ;2 variable args
						cmp_eq ::temp26 ::temp24 1 
						jmpf ::temp26 _label1
						; line 195
						fmul ::temp25 x -1.00000 
						assign x ::temp25 
						jmp _label1
						; line 197
					_label1:
						callstatic utility RandomInt ::temp24 0 1 ;2 variable args
						cmp_eq ::temp26 ::temp24 1 
						jmpf ::temp26 _label2
						; line 198
						fmul ::temp25 y -1.00000 
						assign y ::temp25 
						jmp _label2
						; line 200
					_label2:
						callstatic game GetPlayer ::temp27 ;0 variable args
						cast ::temp28 ::temp27 
						callmethod MoveTo ::oCloneMarker_var ::NoneVar ::temp28 x y 0.000000 true ;5 variable args
						; line 201
						callmethod PlaceActorAtMe ::oCloneMarker_var ::temp27 npc iCloneLevel none ;3 variable args
						jmp _label3
						; line 204
					_label0:
						array_getlement ::temp24 iCloneCounts iCloneCount 
						cast ::temp29 ::temp24 
						strcat ::temp29 ::temp29 " clones of " 
						callmethod GetName npc ::temp30 ;0 variable args
						strcat ::temp29 ::temp29 ::temp30 
						strcat ::temp30 ::temp29 " have been conjured." 
						callstatic debug MessageBox ::NoneVar ::temp30 ;1 variable args
					.endCode
				.endFunction ;Clone
				.function OnOptionMenuAccept
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param option Int
						.param index Int
					.endParamTable
					.localTable
						.local ::temp43 Bool
						.local ::temp45 Bool
						.local ::temp44 String
						.local ::NoneVar None
						.local ::temp46 Int
						.local n Int
						.local ::temp47 form
						.local ::temp48 ActorBase
						.local ::temp49 Bool
						.local ::temp50 Bool
						.local npc ActorBase
					.endLocalTable
					.code
						; line 263
						cmp_eq ::temp43 option iCloneLevelOID 
						jmpf ::temp43 _label0
						; line 264
						assign iCloneLevel index 
						; line 265
						array_getlement ::temp44 sCloneLevels iCloneLevel 
						callmethod SetMenuOptionValue self ::NoneVar option ::temp44 false ;3 variable args
						jmp _label1
						; line 266
					_label0:
						cmp_eq ::temp45 option iCloneCountOID 
						jmpf ::temp45 _label2
						; line 267
						assign iCloneCount index 
						; line 268
						array_getlement ::temp44 sCloneCounts iCloneCount 
						callmethod SetMenuOptionValue self ::NoneVar option ::temp44 false ;3 variable args
						jmp _label1
						; line 270
					_label2:
						array_length ::temp46 fClonedForms 
						assign n ::temp46 
						; line 271
					_label6:
						jmpf n _label1
						; line 272
						isub ::temp46 n 1 
						assign n ::temp46 
						; line 273
						array_getlement ::temp46 iClonedFormsOIDs n 
						cmp_eq ::temp45 ::temp46 option 
						jmpf ::temp45 _label3
						; line 274
						array_getlement ::temp47 fClonedForms n 
						cast ::temp48 ::temp47 
						assign npc ::temp48 
						; line 275
						cmp_eq ::temp49 index 0 
						jmpf ::temp49 _label4
						; line 276
						callmethod Clone self ::NoneVar npc ;1 variable args
						jmp _label5
						; line 277
					_label4:
						cmp_eq ::temp50 index 1 
						jmpf ::temp50 _label5
						; line 278
						callmethod RemoveNPC self ::NoneVar npc ;1 variable args
						; line 279
						callmethod ForcePageReset self ::NoneVar ;0 variable args
						jmp _label5
					_label5:
						jmp _label3
					_label3:
						jmp _label6
					_label1
					.endCode
				.endFunction ;OnOptionMenuAccept
				.function OnOptionMenuOpen
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param option Int
					.endParamTable
					.localTable
						.local ::temp41 Bool
						.local ::temp42 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 247
						cmp_eq ::temp41 option iCloneLevelOID 
						jmpf ::temp41 _label0
						; line 248
						callmethod SetMenuDialogOptions self ::NoneVar sCloneLevels ;1 variable args
						; line 249
						callmethod SetMenuDialogStartIndex self ::NoneVar iCloneLevel ;1 variable args
						; line 250
						callmethod SetMenuDialogDefaultIndex self ::NoneVar 4 ;1 variable args
						jmp _label1
						; line 251
					_label0:
						cmp_eq ::temp42 option iCloneCountOID 
						jmpf ::temp42 _label2
						; line 252
						callmethod SetMenuDialogOptions self ::NoneVar sCloneCounts ;1 variable args
						; line 253
						callmethod SetMenuDialogStartIndex self ::NoneVar iCloneCount ;1 variable args
						; line 254
						callmethod SetMenuDialogDefaultIndex self ::NoneVar 0 ;1 variable args
						jmp _label1
						; line 256
					_label2:
						callmethod SetMenuDialogOptions self ::NoneVar sNpcOptions ;1 variable args
						; line 257
						callmethod SetMenuDialogStartIndex self ::NoneVar 2 ;1 variable args
						; line 258
						callmethod SetMenuDialogDefaultIndex self ::NoneVar 2 ;1 variable args
					_label1
					.endCode
				.endFunction ;OnOptionMenuOpen
				.function HexStringToInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
						.param str String
					.endParamTable
					.localTable
						.local ::temp15 Int
						.local ::temp16 Bool
						.local ::temp17 Bool
						.local strLength Int
						.local result Int
						.local index Int
						.local ::temp18 String
						.local nibble Int
					.endLocalTable
					.code
						; line 133
						callstatic stringutil GetLength ::temp15 str ;1 variable args
						assign strLength ::temp15 
						; line 134
						cmp_gt ::temp16 strLength 8 
						cast ::temp16 ::temp16 
						jmpt ::temp16 _label0
						cmp_eq ::temp17 strLength 0 
						cast ::temp16 ::temp17 
					_label0:
						jmpf ::temp16 _label1
						; line 135
						return -1 
						jmp _label1
						; line 138
					_label1:
						assign result 0 
						; line 140
						assign index 0 
						; line 141
					_label4:
						cmp_lt ::temp17 index strLength 
						jmpf ::temp17 _label2
						; line 142
						callstatic math LeftShift ::temp15 result 4 ;2 variable args
						assign result ::temp15 
						; line 143
						callstatic stringutil GetNthChar ::temp18 str index ;2 variable args
						callmethod HexCharToInt self ::temp15 ::temp18 ;1 variable args
						assign nibble ::temp15 
						; line 144
						cmp_eq ::temp16 nibble -1 
						jmpf ::temp16 _label3
						; line 145
						return -1 
						jmp _label3
						; line 147
					_label3:
						iadd ::temp15 result nibble 
						assign result ::temp15 
						; line 148
						iadd ::temp15 index 1 
						assign index ::temp15 
						jmp _label4
						; line 151
					_label2:
						return result 
					.endCode
				.endFunction ;HexStringToInt
				.function OnPageReset
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param page String
					.endParamTable
					.localTable
						.local ::temp31 Bool
						.local ::temp34 Int[]
						.local ::temp32 String
						.local ::temp33 Int
						.local index Int
						.local ::temp35 form
						.local ::temp36 Int
					.endLocalTable
					.code
						; line 208
						cmp_eq ::temp31 page "" 
						jmpf ::temp31 _label0
						; line 209
						jmpf aCurrentNPC _label1
						; line 210
						callmethod GetName aCurrentNPC ::temp32 ;0 variable args
						strcat ::temp32 "Add " ::temp32 
						callmethod AddTextOption self ::temp33 ::temp32 "ADD" 0 ;3 variable args
						assign iCloneOID ::temp33 
						jmp _label2
						; line 212
					_label1:
						callmethod AddTextOption self ::temp33 "No NPC in crosshairs" "" 0 ;3 variable args
						assign iCloneOID ::temp33 
						; line 214
					_label2:
						array_getlement ::temp32 sCloneLevels iCloneLevel 
						callmethod AddMenuOption self ::temp33 "Clone Level" ::temp32 0 ;3 variable args
						assign iCloneLevelOID ::temp33 
						; line 215
						callmethod AddInputOption self ::temp33 "Search By Form ID" "" 0 ;3 variable args
						assign iSearchOID ::temp33 
						; line 216
						array_getlement ::temp32 sCloneCounts iCloneCount 
						callmethod AddMenuOption self ::temp33 "Number Of Clones To Conjure" ::temp32 0 ;3 variable args
						assign iCloneCountOID ::temp33 
						; line 217
						callmethod AddTextOption self ::temp33 "Clear All" "CLEAR" 0 ;3 variable args
						assign iClearAllOID ::temp33 
						; line 219
						callmethod AddEmptyOption self ::temp33 ;0 variable args
						; line 220
						callmethod AddEmptyOption self ::temp33 ;0 variable args
						; line 221
						callmethod AddEmptyOption self ::temp33 ;0 variable args
						; line 223
						array_length ::temp33 fClonedForms 
						callstatic utility CreateIntArray ::temp34 ::temp33 0 ;2 variable args
						assign iClonedFormsOIDs ::temp34 
						; line 225
						array_length ::temp33 fClonedForms 
						assign index ::temp33 
						; line 226
					_label4:
						jmpf index _label3
						; line 227
						isub ::temp33 index 1 
						assign index ::temp33 
						; line 228
						array_getlement ::temp35 fClonedForms index 
						callmethod GetName ::temp35 ::temp32 ;0 variable args
						callmethod AddMenuOption self ::temp36 ::temp32 "" 0 ;3 variable args
						assign ::temp33 ::temp36 
						array_setelement iClonedFormsOIDs index ::temp33 
						jmp _label4
					_label3:
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnPageReset
				.function RemoveNPC
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param ref ActorBase
					.endParamTable
					.localTable
						.local ::temp19 Int
						.local ::temp23 Form[]
						.local found Bool
						.local index Int
						.local ::temp20 form
						.local ::temp21 form
						.local ::temp22 Bool
						.local newFormList Form[]
					.endLocalTable
					.code
						; line 155
						assign found false 
						; line 156
						array_length ::temp19 fClonedForms 
						assign index ::temp19 
						; line 157
					_label2:
						jmpf index _label0
						; line 158
						isub ::temp19 index 1 
						assign index ::temp19 
						; line 159
						array_getlement ::temp20 fClonedForms index 
						cast ::temp21 ref 
						cmp_eq ::temp22 ::temp20 ::temp21 
						jmpf ::temp22 _label1
						; line 160
						assign found true 
						jmp _label1
					_label1:
						jmp _label2
						; line 164
					_label0:
						not ::temp22 found 
						jmpf ::temp22 _label3
						; line 165
						return none 
						jmp _label3
						; line 168
					_label3:
						array_length ::temp19 fClonedForms 
						isub ::temp19 ::temp19 1 
						callstatic utility CreateFormArray ::temp23 ::temp19 none ;2 variable args
						assign newFormList ::temp23 
						; line 170
						assign found false 
						; line 171
						array_length ::temp19 fClonedForms 
						assign index ::temp19 
						; line 172
					_label8:
						jmpf index _label4
						; line 173
						isub ::temp19 index 1 
						assign index ::temp19 
						; line 174
						array_getlement ::temp21 fClonedForms index 
						cast ::temp20 ref 
						cmp_eq ::temp22 ::temp21 ::temp20 
						jmpf ::temp22 _label5
						; line 175
						assign found true 
						jmp _label6
						; line 176
					_label5:
						jmpf found _label7
						; line 177
						array_getlement ::temp21 fClonedForms index 
						assign ::temp20 ::temp21 
						array_setelement newFormList index ::temp20 
						jmp _label6
						; line 179
					_label7:
						array_getlement ::temp21 fClonedForms index 
						assign ::temp20 ::temp21 
						isub ::temp19 index 1 
						array_setelement newFormList ::temp19 ::temp20 
					_label6:
						jmp _label8
						; line 183
					_label4:
						assign fClonedForms newFormList 
					.endCode
				.endFunction ;RemoveNPC
				.function GetVersion
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 24
						return 10 
					.endCode
				.endFunction ;GetVersion
				.function OnConfigInit
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::NoneVar None
						.local ::temp0 String[]
						.local ::temp1 String
						.local ::temp2 Int[]
						.local ::temp3 Int
						.local index Int
						.local ::temp4 String
					.endLocalTable
					.code
						; line 31
						callstatic debug Notification ::NoneVar "Clonejuration installing, please wait a moment for the MCM menu to register." ;1 variable args
						; line 32
						callmethod RegisterForCrosshairRef self ::NoneVar ;0 variable args
						; line 34
						array_create ::temp0 3 
						assign sNpcOptions ::temp0 
						; line 35
						assign ::temp1 "Conjure" 
						array_setelement sNpcOptions 0 ::temp1 
						; line 36
						assign ::temp1 "Remove" 
						array_setelement sNpcOptions 1 ::temp1 
						; line 37
						assign ::temp1 "Cancel" 
						array_setelement sNpcOptions 2 ::temp1 
						; line 39
						array_create ::temp0 5 
						assign sCloneLevels ::temp0 
						; line 40
						assign ::temp1 "Easy" 
						array_setelement sCloneLevels 0 ::temp1 
						; line 41
						assign ::temp1 "Medium" 
						array_setelement sCloneLevels 1 ::temp1 
						; line 42
						assign ::temp1 "Hard" 
						array_setelement sCloneLevels 2 ::temp1 
						; line 43
						assign ::temp1 "Boss" 
						array_setelement sCloneLevels 3 ::temp1 
						; line 44
						assign ::temp1 "Default" 
						array_setelement sCloneLevels 4 ::temp1 
						; line 46
						array_create ::temp0 11 
						assign sCloneCounts ::temp0 
						; line 47
						array_create ::temp2 11 
						assign iCloneCounts ::temp2 
						; line 48
						assign ::temp3 1 
						array_setelement iCloneCounts 0 ::temp3 
						; line 49
						assign ::temp3 2 
						array_setelement iCloneCounts 1 ::temp3 
						; line 50
						assign ::temp3 3 
						array_setelement iCloneCounts 2 ::temp3 
						; line 51
						assign ::temp3 4 
						array_setelement iCloneCounts 3 ::temp3 
						; line 52
						assign ::temp3 5 
						array_setelement iCloneCounts 4 ::temp3 
						; line 53
						assign ::temp3 10 
						array_setelement iCloneCounts 5 ::temp3 
						; line 54
						assign ::temp3 20 
						array_setelement iCloneCounts 6 ::temp3 
						; line 55
						assign ::temp3 50 
						array_setelement iCloneCounts 7 ::temp3 
						; line 56
						assign ::temp3 100 
						array_setelement iCloneCounts 8 ::temp3 
						; line 57
						assign ::temp3 200 
						array_setelement iCloneCounts 9 ::temp3 
						; line 58
						assign ::temp3 500 
						array_setelement iCloneCounts 10 ::temp3 
						; line 60
						array_length ::temp3 iCloneCounts 
						assign index ::temp3 
						; line 61
					_label1:
						jmpf index _label0
						; line 62
						isub ::temp3 index 1 
						assign index ::temp3 
						; line 63
						array_getlement ::temp3 iCloneCounts index 
						cast ::temp4 ::temp3 
						assign ::temp1 ::temp4 
						array_setelement sCloneCounts index ::temp1 
						jmp _label1
					_label0
					.endCode
				.endFunction ;OnConfigInit
				.function OnOptionInputOpen
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param option Int
					.endParamTable
					.localTable
						.local ::temp51 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 287
						cmp_eq ::temp51 option iSearchOID 
						jmpf ::temp51 _label0
						; line 288
						callmethod SetInputDialogStartText self ::NoneVar "" ;1 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;OnOptionInputOpen
				.function OnOptionSelect
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param option Int
					.endParamTable
					.localTable
						.local ::temp37 Bool
						.local ::temp38 Bool
						.local ::NoneVar None
						.local ::temp39 Bool
						.local continue Bool
						.local ::temp40 Form[]
					.endLocalTable
					.code
						; line 234
						cmp_eq ::temp37 option iCloneOID 
						cast ::temp37 ::temp37 
						jmpf ::temp37 _label0
						cast ::temp37 aCurrentNPC 
					_label0:
						jmpf ::temp37 _label1
						; line 235
						callmethod AddNPC self ::NoneVar aCurrentNPC ;1 variable args
						; line 236
						callmethod ForcePageReset self ::NoneVar ;0 variable args
						jmp _label2
						; line 237
					_label1:
						cmp_eq ::temp38 option iClearAllOID 
						jmpf ::temp38 _label2
						; line 238
						callmethod ShowMessage self ::temp39 "Are you sure you want to clear everything?" true "$Yes" "$No" ;4 variable args
						assign continue ::temp39 
						; line 239
						jmpf continue _label3
						; line 240
						cast ::temp40 none 
						assign fClonedForms ::temp40 
						; line 241
						callmethod ForcePageReset self ::NoneVar ;0 variable args
						jmp _label3
					_label3:
						jmp _label2
					_label2
					.endCode
				.endFunction ;OnOptionSelect
			.endState
		.endStateTable
	.endObject
.endObjectTable
