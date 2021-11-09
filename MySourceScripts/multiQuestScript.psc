Scriptname multiQuestScript extends Quest  

Spell Property multiSpellMultiShot  Auto

Event onInit()                       ; This event will run once, when the script is initialized

	Actor PlayerActor = Game.GetPlayer()

	PlayerActor.AddSpell(multiSpellMultiShot)

endEvent