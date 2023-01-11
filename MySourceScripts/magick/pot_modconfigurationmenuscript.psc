Scriptname POT_ModConfigurationMenuScript extends Ski_ConfigBase

GlobalVariable Property ToggleA Auto
GlobalVariable Property ToggleB Auto
GlobalVariable Property ToggleC Auto
GlobalVariable Property ToggleD Auto
GlobalVariable Property ToggleE Auto
GlobalVariable Property ToggleF Auto
GlobalVariable Property ToggleG Auto
GlobalVariable Property ToggleH Auto

Int OID_ToggleA
Int OID_ToggleB
Int OID_ToggleC
Int OID_ToggleD
Int OID_ToggleE
Int OID_ToggleF
Int OID_ToggleG
Int OID_ToggleH

;=============================================

Event OnConfigInit()
            Pages = New String[1]
            Pages[0] = "Настройки"
EndEvent

;=============================================

Event OnPageReset(string page)

    If (Page == "Настройки")
    SetCursorFillMode(TOP_TO_BOTTOM)
    SetCursorPosition(0)
    AddHeaderOption("Настройки Личдома")
    AddEmptyOption()

    OID_ToggleA = AddToggleOption("Переключение визуала ледяной ауры", ToggleA.GetValueInt())
    OID_ToggleB = AddToggleOption("Переключение визуала инеевой кожи", ToggleB.GetValueInt())
    OID_ToggleC = AddToggleOption("Переключение визуала нечестивого неистовства" , ToggleC.GetValueInt())
    OID_ToggleD = AddToggleOption("Переключение визуала багровой ярости", ToggleD.GetValueInt())
    OID_ToggleE = AddToggleOption("Не используется", ToggleE.GetValueInt())
    OID_ToggleF = AddToggleOption("Переключение взгляда нежити", ToggleF.GetValueInt())
    OID_ToggleG = AddToggleOption("Переключение визуального эффекта глаз", ToggleG.GetValueInt())
    OID_ToggleH = AddToggleOption("Переключение эффекта тумана Лича", ToggleH.GetValueInt())

Endif
EndEvent

;=============================================

Event OnOptionHighlight(Int Option)
    If (Option == OID_ToggleA)
                SetInfoText("Включает/отключает визуальные эффекты ледяной ауры вокруг игрока")
    ElseIf (Option == OID_ToggleB)
                SetInfoText("Включает/отключает визуальные эффекты инеевой кожи вокруг игрока")
    ElseIf (Option == OID_ToggleC)
                SetInfoText("Включает/отключает визуальные эффекты нечестивого неистовства вокруг игрока")
    ElseIf (Option == OID_ToggleD)
                SetInfoText("Включает/отключает визуальные эффекты багровой ярости вокруг игрока")
    ElseIf (Option == OID_ToggleE)
                SetInfoText("Не используется")
    ElseIf (Option == OID_ToggleF)
                SetInfoText("Включает/отключает взгляд нежити (возможность видеть НПС сквозь стены и тд)")
    ElseIf (Option == OID_ToggleG)
                SetInfoText("Включает/отключает визуальный эффект у глаз")
    ElseIf (Option == OID_ToggleH)
                SetInfoText("Включает/отключает визуальный эффект тумана вокруг игрока")
    Endif
EndEvent

;=============================================

Event OnOptionSelect(int option)

If (option == OID_ToggleA)
    If ToggleA.GetValue() == 1
                ToggleA.SetValue(0)
                SetToggleOptionValue(OID_ToggleA, 0)
    ElseIf ToggleA.GetValue() == 0
                ToggleA.SetValue(1)
                SetToggleOptionValue(OID_ToggleA, 1)

EndIf

ElseIf (option == OID_ToggleB)
    If ToggleB.GetValue() == 1
                ToggleB.SetValue(0)
                SetToggleOptionValue(OID_ToggleB, 0)
    ElseIf ToggleB.GetValue() == 0
                ToggleB.SetValue(1)
                SetToggleOptionValue(OID_ToggleB, 1)

EndIf

ElseIf (option == OID_ToggleC)
    If ToggleC.GetValue() == 1
                ToggleC.SetValue(0)
                SetToggleOptionValue(OID_ToggleC, 0)
    ElseIf ToggleC.GetValue() == 0
                ToggleC.SetValue(1)
                SetToggleOptionValue(OID_ToggleC, 1)

EndIf

ElseIf (option == OID_ToggleD)
    If ToggleD.GetValue() == 1
                ToggleD.SetValue(0)
                SetToggleOptionValue(OID_ToggleD, 0)
    ElseIf ToggleD.GetValue() == 0
                ToggleD.SetValue(1)
                SetToggleOptionValue(OID_ToggleD, 1)

    EndIf

ElseIf (option == OID_ToggleE)
    If ToggleE.GetValue() == 1
                ToggleE.SetValue(0)
                SetToggleOptionValue(OID_ToggleE, 0)
    ElseIf ToggleE.GetValue() == 0
                ToggleE.SetValue(1)
                SetToggleOptionValue(OID_ToggleE, 1)

EndIf

ElseIf (option == OID_ToggleF)
    If ToggleF.GetValue() == 1
                ToggleF.SetValue(0)
                SetToggleOptionValue(OID_ToggleF, 0)
    ElseIf ToggleF.GetValue() == 0
                ToggleF.SetValue(1)
                SetToggleOptionValue(OID_ToggleF, 1)

    EndIf

ElseIf (option == OID_ToggleG)
    If ToggleG.GetValue() == 1
                ToggleG.SetValue(0)
                SetToggleOptionValue(OID_ToggleG, 0)
    ElseIf ToggleG.GetValue() == 0
                ToggleG.SetValue(1)
                SetToggleOptionValue(OID_ToggleG, 1)

EndIf

ElseIf (option == OID_ToggleH)
    If ToggleH.GetValue() == 1
                ToggleH.SetValue(0)
                SetToggleOptionValue(OID_ToggleH, 0)
    ElseIf ToggleH.GetValue() == 0
                ToggleH.SetValue(1)
                SetToggleOptionValue(OID_ToggleH, 1)

    EndIf
  EndIf
EndEvent