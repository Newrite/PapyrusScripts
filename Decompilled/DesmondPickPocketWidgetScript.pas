.info
	.source "DesmondPickpocketWidgetScript.psc"
	.modifyTime 1639314721 ;2021-12-12 20:12:01
	.compileTime 1639314772 ;2021-12-12 20:12:52
	.user "nirn2"
	.computer "WORKSTATION"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object DesmondPickpocketWidgetScript SKI_WidgetBase
		.userFlags 0 ;none
		.docString "This script adds functionality to the Attribute Icon Widget"
		.autoState 
		.variableTable
			.variable ::EffectEnchantFrost_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable itemCounter Int
				.userFlags 0 ;none
				.initialValue 0
			.endVariable
			.variable frostBottleIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable enchantCounterVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable ::EffectEnchantLightning_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable defualtPosY Float
				.userFlags 0 ;none
				.initialValue 575.000
			.endVariable
			.variable ::EnchaterCounterPoison_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable defualtScale Float
				.userFlags 0 ;none
				.initialValue 100.000
			.endVariable
			.variable daggerIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable ::PowderFire_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable poisonVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable itemCounterVisible Bool
				.userFlags 0 ;none
				.initialValue true
			.endVariable
			.variable ::PlayerRef_var objectreference
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable smokeBombIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable ::EnchaterCounterFrost_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable scale Float
				.userFlags 0 ;none
				.initialValue 100.000
			.endVariable
			.variable ::EnchaterCounterShock_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::EnchaterCounterFire_var globalvariable
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::EffectEnchantPoison_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable poisonCounter Int
				.userFlags 0 ;none
				.initialValue 0
			.endVariable
			.variable ::PowderLightning_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable enchantCounter Int
				.userFlags 0 ;none
				.initialValue 0
			.endVariable
			.variable visible Bool
				.userFlags 0 ;none
				.initialValue true
			.endVariable
			.variable ::PowderFrost_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable PosY Float
				.userFlags 0 ;none
				.initialValue 575.000
			.endVariable
			.variable lightningIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable ::SmokeBomb_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable PosX Float
				.userFlags 0 ;none
				.initialValue 110.000
			.endVariable
			.variable fireBottleIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable fireIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable defualtPosX Float
				.userFlags 0 ;none
				.initialValue 110.000
			.endVariable
			.variable render Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable formForCount form
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::BottleFrost_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::BottleFire_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable ::EffectEnchantFire_var keyword
				.userFlags 0 ;none
				.initialValue none
			.endVariable
			.variable frostIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable pawIconVisible Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
		.endVariableTable
		.propertyTable
			.property BottleFire keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::BottleFire_var
			.endProperty
			.property BottleFrost keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::BottleFrost_var
			.endProperty
			.property EnchaterCounterPoison globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EnchaterCounterPoison_var
			.endProperty
			.property EffectEnchantFire keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EffectEnchantFire_var
			.endProperty
			.property EnchaterCounterShock globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EnchaterCounterShock_var
			.endProperty
			.property EnchaterCounterFrost globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EnchaterCounterFrost_var
			.endProperty
			.property EnchaterCounterFire globalvariable auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EnchaterCounterFire_var
			.endProperty
			.property SmokeBomb keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::SmokeBomb_var
			.endProperty
			.property EffectEnchantPoison keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EffectEnchantPoison_var
			.endProperty
			.property PowderFire keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PowderFire_var
			.endProperty
			.property EffectEnchantFrost keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EffectEnchantFrost_var
			.endProperty
			.property EffectEnchantLightning keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::EffectEnchantLightning_var
			.endProperty
			.property PlayerRef objectreference auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PlayerRef_var
			.endProperty
			.property PowderLightning keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PowderLightning_var
			.endProperty
			.property PowderFrost keyword auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::PowderFrost_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function updateStatus
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp5 Bool
						.local ::temp6 Bool
						.local ::temp7 Bool
						.local ::temp10 actor
						.local ::temp11 Int
						.local ::temp8 String
						.local ::temp9 String
						.local ::NoneVar None
						.local Player actor
					.endLocalTable
					.code
						; line 202
						propget Ready self ::temp5 
						jmpf ::temp5 _label0
						; line 204
						not ::temp6 render 
						cast ::temp6 ::temp6 
						jmpt ::temp6 _label1
						not ::temp7 visible 
						cast ::temp6 ::temp7 
					_label1:
						jmpf ::temp6 _label2
						; line 205
						propget HUD_MENU self ::temp8 
						propget WidgetRoot self ::temp9 
						strcat ::temp9 ::temp9 "._visible" 
						callstatic ui SetBool ::NoneVar ::temp8 ::temp9 false ;3 variable args
						; line 206
						return none 
						jmp _label2
						; line 209
					_label2:
						callstatic game GetPlayer ::temp10 ;0 variable args
						assign Player ::temp10 
						; line 210
						callmethod HandleEffectIcon self ::NoneVar Player ;1 variable args
						; line 211
						callmethod GetItemCount Player ::temp11 formForCount ;1 variable args
						assign itemCounter ::temp11 
						; line 212
						callmethod render self ::NoneVar ;0 variable args
						jmp _label0
					_label0
					.endCode
				.endFunction ;updateStatus
				.function GetDefaultScale
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 85
						return defualtScale 
					.endCode
				.endFunction ;GetDefaultScale
				.function SetDefaultScale
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 81
						assign scale defualtScale 
					.endCode
				.endFunction ;SetDefaultScale
				.function SetDefaultPositionY
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 69
						assign PosY defualtPosY 
					.endCode
				.endFunction ;SetDefaultPositionY
				.function GetWidgetSource
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 282
						return "skyui/despickpocket.swf" 
					.endCode
				.endFunction ;GetWidgetSource
				.function HandleEffectIcon
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param Player actor
					.endParamTable
					.localTable
						.local ::temp0 Bool
						.local ::temp1 Float
						.local ::temp2 Int
					.endLocalTable
					.code
						; line 90
						jmpf daggerIconVisible _label0
						; line 92
						callmethod HasEffectKeyword Player ::temp0 ::EffectEnchantPoison_var ;1 variable args
						jmpf ::temp0 _label1
						; line 93
						assign poisonVisible true 
						; line 94
						callmethod GetValue ::EnchaterCounterPoison_var ::temp1 ;0 variable args
						cast ::temp2 ::temp1 
						assign poisonCounter ::temp2 
						jmp _label2
						; line 96
					_label1:
						assign poisonVisible false 
						; line 99
					_label2:
						callmethod HasEffectKeyword Player ::temp0 ::EffectEnchantFire_var ;1 variable args
						jmpf ::temp0 _label3
						; line 100
						assign fireIconVisible true 
						; line 101
						assign frostIconVisible false 
						; line 102
						assign lightningIconVisible false 
						; line 103
						assign enchantCounterVisible true 
						; line 104
						callmethod GetValue ::EnchaterCounterFire_var ::temp1 ;0 variable args
						cast ::temp2 ::temp1 
						assign enchantCounter ::temp2 
						; line 105
						return none 
						jmp _label3
						; line 108
					_label3:
						callmethod HasEffectKeyword Player ::temp0 ::EffectEnchantFrost_var ;1 variable args
						jmpf ::temp0 _label4
						; line 109
						assign fireIconVisible false 
						; line 110
						assign frostIconVisible true 
						; line 111
						assign lightningIconVisible false 
						; line 112
						assign enchantCounterVisible true 
						; line 113
						callmethod GetValue ::EnchaterCounterFrost_var ::temp1 ;0 variable args
						cast ::temp2 ::temp1 
						assign enchantCounter ::temp2 
						; line 114
						return none 
						jmp _label4
						; line 117
					_label4:
						callmethod HasEffectKeyword Player ::temp0 ::EffectEnchantLightning_var ;1 variable args
						jmpf ::temp0 _label5
						; line 118
						assign fireIconVisible false 
						; line 119
						assign frostIconVisible false 
						; line 120
						assign lightningIconVisible true 
						; line 121
						assign enchantCounterVisible true 
						; line 122
						callmethod GetValue ::EnchaterCounterShock_var ::temp1 ;0 variable args
						cast ::temp2 ::temp1 
						assign enchantCounter ::temp2 
						; line 123
						return none 
						jmp _label5
						; line 126
					_label5:
						assign fireIconVisible false 
						; line 127
						assign frostIconVisible false 
						; line 128
						assign lightningIconVisible false 
						; line 129
						assign enchantCounterVisible false 
						; line 130
						return none 
						jmp _label0
						; line 134
					_label0:
						jmpf pawIconVisible _label6
						; line 136
						callmethod WornHasKeyword Player ::temp0 ::PowderFire_var ;1 variable args
						jmpf ::temp0 _label7
						; line 137
						assign fireIconVisible true 
						; line 138
						assign frostIconVisible false 
						; line 139
						assign lightningIconVisible false 
						; line 140
						assign poisonVisible false 
						; line 141
						return none 
						jmp _label7
						; line 144
					_label7:
						callmethod WornHasKeyword Player ::temp0 ::PowderFrost_var ;1 variable args
						jmpf ::temp0 _label8
						; line 145
						assign fireIconVisible false 
						; line 146
						assign frostIconVisible true 
						; line 147
						assign lightningIconVisible false 
						; line 148
						assign poisonVisible false 
						; line 149
						return none 
						jmp _label8
						; line 152
					_label8:
						callmethod WornHasKeyword Player ::temp0 ::PowderLightning_var ;1 variable args
						jmpf ::temp0 _label9
						; line 153
						assign fireIconVisible false 
						; line 154
						assign frostIconVisible false 
						; line 155
						assign lightningIconVisible true 
						; line 156
						assign poisonVisible false 
						; line 157
						return none 
						jmp _label9
					_label9:
						jmp _label6
						; line 162
					_label6:
						assign fireIconVisible false 
						; line 163
						assign frostIconVisible false 
						; line 164
						assign lightningIconVisible false 
						; line 165
						assign enchantCounterVisible false 
						; line 166
						assign poisonVisible false 
					.endCode
				.endFunction ;HandleEffectIcon
				.function GetWidgetType
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 286
						return "DesmondPickpocketWidgetScript" 
					.endCode
				.endFunction ;GetWidgetType
				.function GetPositionX
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 230
						return PosX 
					.endCode
				.endFunction ;GetPositionX
				.function SetDefaultPositionX
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 65
						assign PosX defualtPosX 
					.endCode
				.endFunction ;SetDefaultPositionX
				.function SetPowders
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 273
						assign fireBottleIconVisible false 
						; line 274
						assign frostBottleIconVisible false 
						; line 275
						assign smokeBombIconVisible false 
						; line 276
						assign daggerIconVisible false 
						; line 277
						assign pawIconVisible true 
						; line 278
						assign enchantCounterVisible false 
					.endCode
				.endFunction ;SetPowders
				.function SetDaggers
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 265
						assign fireBottleIconVisible false 
						; line 266
						assign frostBottleIconVisible false 
						; line 267
						assign smokeBombIconVisible false 
						; line 268
						assign daggerIconVisible true 
						; line 269
						assign pawIconVisible false 
					.endCode
				.endFunction ;SetDaggers
				.function SetBottles
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp13 actor
						.local ::temp14 Bool
						.local Player actor
					.endLocalTable
					.code
						; line 255
						callstatic game GetPlayer ::temp13 ;0 variable args
						assign Player ::temp13 
						; line 257
						callmethod WornHasKeyword Player ::temp14 ::BottleFire_var ;1 variable args
						assign fireBottleIconVisible ::temp14 
						; line 258
						callmethod WornHasKeyword Player ::temp14 ::BottleFrost_var ;1 variable args
						assign frostBottleIconVisible ::temp14 
						; line 259
						callmethod WornHasKeyword Player ::temp14 ::SmokeBomb_var ;1 variable args
						assign smokeBombIconVisible ::temp14 
						; line 260
						assign daggerIconVisible false 
						; line 261
						assign pawIconVisible false 
					.endCode
				.endFunction ;SetBottles
				.function ChangeVisible
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp12 Bool
					.endLocalTable
					.code
						; line 250
						not ::temp12 visible 
						assign visible ::temp12 
					.endCode
				.endFunction ;ChangeVisible
				.function SetPositionX
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param newXPos Float
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 218
						assign PosX newXPos 
					.endCode
				.endFunction ;SetPositionX
				.function SetFormCount
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param newForm form
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 246
						assign formForCount newForm 
					.endCode
				.endFunction ;SetFormCount
				.function SetUIState
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param newState Bool
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 242
						assign render newState 
					.endCode
				.endFunction ;SetUIState
				.function GetDefaultPositionY
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 77
						return defualtPosY 
					.endCode
				.endFunction ;GetDefaultPositionY
				.function SetPositionY
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param newYPos Float
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 222
						assign PosY newYPos 
					.endCode
				.endFunction ;SetPositionY
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
				.function GetScale
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 238
						return scale 
					.endCode
				.endFunction ;GetScale
				.function GetPositionY
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 234
						return PosY 
					.endCode
				.endFunction ;GetPositionY
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
				.function SetScale
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param newScale Float
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 226
						assign scale newScale 
					.endCode
				.endFunction ;SetScale
				.function GetDefaultPositionX
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 73
						return defualtPosX 
					.endCode
				.endFunction ;GetDefaultPositionX
				.function render
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
						.local ::temp3 String
						.local ::temp4 String
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 172
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 "._visible" 
						callstatic ui SetBool ::NoneVar ::temp3 ::temp4 visible ;3 variable args
						; line 173
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 "._x" 
						callstatic ui SetFloat ::NoneVar ::temp3 ::temp4 PosX ;3 variable args
						; line 174
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 "._y" 
						callstatic ui SetFloat ::NoneVar ::temp3 ::temp4 PosY ;3 variable args
						; line 175
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 "._xscale" 
						callstatic ui SetFloat ::NoneVar ::temp3 ::temp4 scale ;3 variable args
						; line 176
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 "._yscale" 
						callstatic ui SetFloat ::NoneVar ::temp3 ::temp4 scale ;3 variable args
						; line 178
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setFireIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 fireIconVisible ;3 variable args
						; line 179
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setFrostIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 frostIconVisible ;3 variable args
						; line 180
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setLightningIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 lightningIconVisible ;3 variable args
						; line 181
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setPoisonIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 poisonVisible ;3 variable args
						; line 183
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setFireBottleIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 fireBottleIconVisible ;3 variable args
						; line 184
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setFrostBottleIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 frostBottleIconVisible ;3 variable args
						; line 185
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setSmokeBombIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 smokeBombIconVisible ;3 variable args
						; line 187
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setItemCounterVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 itemCounterVisible ;3 variable args
						; line 188
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setEnchantCounterVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 enchantCounterVisible ;3 variable args
						; line 189
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setPoisonCounterVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 poisonVisible ;3 variable args
						; line 191
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setDaggerIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 daggerIconVisible ;3 variable args
						; line 192
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setPowderIconVisible" 
						callstatic ui InvokeBool ::NoneVar ::temp3 ::temp4 pawIconVisible ;3 variable args
						; line 194
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setItemCounterText" 
						callstatic ui InvokeInt ::NoneVar ::temp3 ::temp4 itemCounter ;3 variable args
						; line 195
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setEnchantCounterText" 
						callstatic ui InvokeInt ::NoneVar ::temp3 ::temp4 enchantCounter ;3 variable args
						; line 196
						propget HUD_MENU self ::temp3 
						propget WidgetRoot self ::temp4 
						strcat ::temp4 ::temp4 ".setPoisonCounterText" 
						callstatic ui InvokeInt ::NoneVar ::temp3 ::temp4 poisonCounter ;3 variable args
					.endCode
				.endFunction ;render
			.endState
		.endStateTable
	.endObject
.endObjectTable
