Scriptname MRL_TEST_LIST_UI extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)

    string[] sOptions = new string[10]

    sOptions[0] = "Урон огнем"
    sOptions[1] = "Урон холодом"
    sOptions[2] = "Урон электричеством"
    sOptions[3] = "Периодический урон магией"
    sOptions[4] = "Разрушение брони"
    sOptions[5] = "Урон по нежити"
    sOptions[6] = "Урон по даедра"
    sOptions[7] = "Замедление"
    sOptions[8] = "Урон Чем-тоТАм"
    sOptions[9] = "Урон ЯДоВмиТОм"

    int isInput = ((self.GetBaseObject() as Form) as UILIB_1).ShowList("Выберите зачарование для оружие", sOptions, 0, 0)

    Debug.Notification("Choose is " + sOptions[isInput] + " input number: " + isInput)

endEvent
