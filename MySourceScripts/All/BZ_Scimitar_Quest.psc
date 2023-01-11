scriptName BZ_Scimitar_Quest extends ReferenceAlias
GlobalVariable Property  BZ_Container AUTO
GlobalVariable Property  BZ_Found_Gold AUTO

Event OnInit()
    RegisterForMenu("InventoryMenu")
EndEvent
 
Event OnMenuOpen(String MenuName)
    BZ_Container.SetValue(Game.QueryStat("Chests Looted"))
    BZ_Found_Gold.SetValue(Game.QueryStat("Gold Found"))

EndEvent