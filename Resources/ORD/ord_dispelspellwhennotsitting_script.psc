Scriptname ORD_DispelSpellWhenNotSitting_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Spell Property ORD_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

EndEvent

; -----

Event OnUpdate()

	Int SitState = PlayerRef.GetSitState()
	If SitState == 2 || SitState == 3
		RegisterForSingleUpdate(ORD_UpdateRate)
	Else
		PlayerRef.DispelSpell(ORD_Proc)
	EndIf

EndEvent

; -----