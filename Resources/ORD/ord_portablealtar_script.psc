Scriptname ORD_PortableAltar_Script extends activemagiceffect  

; -----

Furniture Property ORD_Con_BoneCollector_Furniture Auto
Float Property ORD_TimeoutLoopRate Auto
EffectShader Property ORD_Con_BoneCollector_FXS_PortableAltar Auto
Sound Property ORD_Con_BoneCollector_Marker_PortableAltar_Cast Auto

; -----

ObjectReference TheFurniture

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheFurniture = akTarget.PlaceAtMe(ORD_Con_BoneCollector_Furniture)
	TheFurniture.SetAngle(0,0,akTarget.GetAngleZ())
	ORD_Con_BoneCollector_Marker_PortableAltar_Cast.Play(akCaster)
;	ORD_Con_BoneCollector_FXS_PortableAltar.Play(TheFurniture)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	While TheFurniture.IsFurnitureInUse()
		Utility.Wait(ORD_TimeoutLoopRate)
	EndWhile
;	ORD_Con_BoneCollector_FXS_PortableAltar.Stop(TheFurniture)
	TheFurniture.BlockActivation()
	TheFurniture.Disable(true)
	TheFurniture.DeleteWhenAble()

EndEvent

; -----