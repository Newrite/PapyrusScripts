Scriptname multiActivatorShooterScript extends ObjectReference  

import Math
import Utility

; initial position vector
float xPos
float yPos
float zPos

; private
float xAng  
float yAng  
float zAng  

multiQuestShotScript Property multi Auto

WEAPON Property multShotBow  Auto
Ammo Property multShotAmmo  Auto  

GlobalVariable Property MultiSet  Auto

EVENT onActivate(objectReference akActivator)

	Actor PlayerActor =  Game.GetPlayer()

	while 1

		if multi.multiShotTrigger == 3 || MultiSet.getValue() == 0

;			moveTo(PlayerActor,  multi.xPos ,  multi.yPos ,  multi.zPos , true)
;			if MultiSet.getValue() == 1
;				setAngle( multi.xAng, multi.yAng, multi.zAng+RandomFloat(-30,30))
;			elseif MultiSet.getValue() == 2
;				setAngle( multi.xAng+RandomFloat(-30,30), multi.yAng+RandomFloat(-30,30), multi.zAng+RandomFloat(-30,30))
;			elseif MultiSet.getValue() == 3
;				setAngle( multi.xAng+RandomFloat(-3,3), multi.yAng+RandomFloat(-3,3), multi.zAng+RandomFloat(-3,3))
;			endif

			multShotBow.fire(self, multShotAmmo)
	
			delete()
			return
		endif

	endWhile

;	RegisterForSingleUpdate(0.01)

endEvent

;Event OnUpdate()

;	RegisterForSingleUpdate(0.01)

;endEvent