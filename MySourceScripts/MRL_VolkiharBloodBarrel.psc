ScriptName MRL_VolkiharBloodBarrel extends objectReference
{Скрипт для бочек с кровью, удаляет у игрока все пустные флаконы с кровью и добавляет заполненные}

Potion Property FillBloodPotion Auto
MiscObject Property EmptyBloodPotion Auto

Event OnActivate(ObjectReference ActivateRef)
	int EmptyPotionCount = Game.GetPlayer().GetItemCount(EmptyBloodPotion as Form)
	If EmptyPotionCount >= 1
		Game.GetPlayer().RemoveItem(EmptyBloodPotion as Form, EmptyPotionCount, false)
		Game.GetPlayer().AddItem(FillBloodPotion as Form, EmptyPotionCount, false)
	Else
		Debug.Notification("У меня нет с собой пустых флаконов для крови.")
	Endif
endEvent