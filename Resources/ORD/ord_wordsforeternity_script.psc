Scriptname ORD_WordsForEternity_Script extends activemagiceffect  

; -----

Float Property ORD_Chance Auto
Actor Property PlayerRef Auto
Int Property ORD_Amount Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Scroll) && Utility.RandomFloat(0.0,1.0) < ORD_Chance
		PlayerRef.AddItem(akSpell, ORD_Amount)
	EndIf

EndEvent

; -----