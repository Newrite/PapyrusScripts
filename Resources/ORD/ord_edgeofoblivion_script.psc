Scriptname ORD_EdgeOfOblivion_Script extends activemagiceffect  


; -----

Actor Property PlayerRef Auto
Message Property ORD_Con_EdgeOfOblivion_Message_Aflame Auto
Sound Property ORD_Con_EdgeOfOblivion_Marker_Aflame Auto
ImagespaceModifier Property ORD_Con_EdgeOfOblivion_Imod_Aflame Auto
Float Property ORD_Delay Auto
Spell Property ORD_Con_EdgeOfOblivion_Spell_Ab_Aflame Auto
Message Property ORD_Con_EdgeOfOblivion_Message_Help Auto
Spell Property ORD_Con_EdgeOfOblivion_Spell_Proc_Aflame Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Con_EdgeOfOblivion_Message_Help.ShowAsHelpMessage("ApproachingTheEdge", 6, 99, 1)
	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	ORD_Con_EdgeOfOblivion_Marker_Aflame.Play(PlayerRef)
	PlayerRef.RampRumble(0.5, 4, 2500)
	ORD_Con_EdgeOfOblivion_Imod_Aflame.Apply()
	ORD_Con_EdgeOfOblivion_Spell_Proc_Aflame.Cast(PlayerRef)
	PlayerRef.AddSpell(ORD_Con_EdgeOfOblivion_Spell_Ab_Aflame, false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.RemoveSpell(ORD_Con_EdgeOfOblivion_Spell_Ab_Aflame)

EndEvent

; -----