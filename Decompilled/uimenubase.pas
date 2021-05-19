.info
	.source "UIMenuBase.psc"
	.modifyTime 1386212348 ;2013-12-05 09:59:08
	.compileTime 1427045418 ;2015-03-23 00:30:18
	.user "Brendan"
	.computer "BRENDAN-PC"
.endInfo
.userFlagsRef
	.flag hidden 0 ;0x00000001
	.flag conditional 1 ;0x00000002
.endUserFlagsRef
.objectTable
	.object UIMenuBase Quest
		.userFlags 0 ;none
		.docString ""
		.autoState 
		.variableTable
			.variable ::isResetting_var Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
			.variable _waitLock Bool
				.userFlags 0 ;none
				.initialValue false
			.endVariable
		.endVariableTable
		.propertyTable
			.property isResetting Bool auto
				.userFlags 0 ;none
				.docString ""
				.autovar ::isResetting_var
			.endProperty
		.endPropertyTable
		.stateTable
			.state 
				.function ResetMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;ResetMenu
				.function SetPropertyAlias
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Alias
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyAlias
				.function GetPropertyBool
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Bool
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 94
						return false 
					.endCode
				.endFunction ;GetPropertyBool
				.function OpenMenu
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
						.param akForm Form
						.param akReceiver Form
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 55
						return -1 
					.endCode
				.endFunction ;OpenMenu
				.function WaitLock
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Bool
					.paramTable
					.endParamTable
					.localTable
						.local lockOut Int
						.local ::temp0 Int
						.local ::temp1 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 11
						assign lockOut 0 
						; line 12
					_label2:
						jmpf _waitLock _label0
						; line 13
						iadd ::temp0 lockOut 1 
						assign lockOut ::temp0 
						; line 14
						cmp_gt ::temp1 lockOut 50 
						jmpf ::temp1 _label1
						; line 15
						assign _waitLock false 
						; line 16
						return false 
						jmp _label1
						; line 18
					_label1:
						callstatic utility Wait ::NoneVar 0.100000 ;1 variable args
						jmp _label2
						; line 20
					_label0:
						return true 
					.endCode
				.endFunction ;WaitLock
				.function SetPropertyForm
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Form
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyForm
				.function GetResultString
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 79
						return "" 
					.endCode
				.endFunction ;GetResultString
				.function GetMenuName
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 59
						return "" 
					.endCode
				.endFunction ;GetMenuName
				.function GetResultForm
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Form
					.paramTable
					.endParamTable
					.localTable
						.local ::temp7 Form
					.endLocalTable
					.code
						; line 83
						cast ::temp7 none 
						return ::temp7 
					.endCode
				.endFunction ;GetResultForm
				.function SetPropertyIndexFloat
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value Float
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexFloat
				.function SetPropertyBool
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Bool
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyBool
				.function GetPropertyInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 90
						return 0 
					.endCode
				.endFunction ;GetPropertyInt
				.function SetPropertyIndexString
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value String
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexString
				.function SetPropertyString
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value String
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyString
				.function SetPropertyAliasA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Alias[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyAliasA
				.function SetPropertyFormA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Form[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyFormA
				.function SetPropertyFloatA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Float[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyFloatA
				.function GetPropertyAlias
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Alias
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
						.local ::temp9 Alias
					.endLocalTable
					.code
						; line 110
						cast ::temp9 none 
						return ::temp9 
					.endCode
				.endFunction ;GetPropertyAlias
				.function SetPropertyBoolA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Bool[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyBoolA
				.function Unlock
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 24
						assign _waitLock false 
					.endCode
				.endFunction ;Unlock
				.function SetPropertyIntA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Int[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIntA
				.function SetPropertyInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Int
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyInt
				.function BlockUntilClosed
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Bool
					.paramTable
					.endParamTable
					.localTable
						.local ::temp2 Bool
						.local counter Int
						.local ::temp3 Int
						.local ::temp4 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 28
						assign counter 0 
						; line 29
					_label2:
						callstatic ui IsMenuOpen ::temp2 "CustomMenu" ;1 variable args
						jmpf ::temp2 _label0
						; line 30
						iadd ::temp3 counter 1 
						assign counter ::temp3 
						; line 31
						cmp_gt ::temp4 counter 50 
						jmpf ::temp4 _label1
						; line 32
						return false 
						jmp _label1
						; line 34
					_label1:
						callstatic utility Wait ::NoneVar 0.100000 ;1 variable args
						jmp _label2
						; line 37
					_label0:
						return true 
					.endCode
				.endFunction ;BlockUntilClosed
				.function GetPropertyFloat
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 102
						return 0.000000 
					.endCode
				.endFunction ;GetPropertyFloat
				.function SetPropertyIndexAlias
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value Alias
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexAlias
				.function OnGameReload
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;OnGameReload
				.function GetPropertyString
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return String
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 98
						return "" 
					.endCode
				.endFunction ;GetPropertyString
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
				.function GetResultFloat
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Float
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 71
						return 0.000000 
					.endCode
				.endFunction ;GetResultFloat
				.function Lock
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 7
						assign _waitLock true 
					.endCode
				.endFunction ;Lock
				.function WaitForReset
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Bool
					.paramTable
					.endParamTable
					.localTable
						.local counter Int
						.local ::temp5 Int
						.local ::temp6 Bool
						.local ::NoneVar None
					.endLocalTable
					.code
						; line 41
						assign counter 0 
						; line 42
					_label2:
						jmpf ::isResetting_var _label0
						; line 43
						iadd ::temp5 counter 1 
						assign counter ::temp5 
						; line 44
						cmp_gt ::temp6 counter 50 
						jmpf ::temp6 _label1
						; line 45
						assign ::isResetting_var false 
						; line 46
						return false 
						jmp _label1
						; line 48
					_label1:
						callstatic utility Wait ::NoneVar 0.100000 ;1 variable args
						jmp _label2
						; line 51
					_label0:
						return true 
					.endCode
				.endFunction ;WaitForReset
				.function SetPropertyIndexInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value Int
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexInt
				.function GetPropertyForm
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Form
					.paramTable
						.param propertyName String
					.endParamTable
					.localTable
						.local ::temp8 Form
					.endLocalTable
					.code
						; line 106
						cast ::temp8 none 
						return ::temp8 
					.endCode
				.endFunction ;GetPropertyForm
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
				.function SetPropertyIndexBool
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value Bool
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexBool
				.function GetResultInt
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return Int
					.paramTable
					.endParamTable
					.localTable
					.endLocalTable
					.code
						; line 75
						return 0 
					.endCode
				.endFunction ;GetResultInt
				.function SetPropertyIndexForm
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param index Int
						.param value Form
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyIndexForm
				.function SetPropertyFloat
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value Float
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyFloat
				.function SetPropertyStringA
					 ; function type 0
					.userFlags 0 ;none
					.docString ""
					.return None
					.paramTable
						.param propertyName String
						.param value String[]
					.endParamTable
					.localTable
					.endLocalTable
					.code
					.endCode
				.endFunction ;SetPropertyStringA
			.endState
		.endStateTable
	.endObject
.endObjectTable
