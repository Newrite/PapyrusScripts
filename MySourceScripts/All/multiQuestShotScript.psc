Scriptname multiQuestShotScript extends Quest

import Math
import Utility

int Num

; initial position vector
float Property xPos  Auto
float Property yPos Auto
float Property zPos Auto

; fly vector
float dx
float dy
float dz

; private
float ang
float Property xang  Auto
float Property yang  Auto
float Property zang  Auto
float x
float x2
float sin
float cos

int Property multiShotTrigger  Auto

Int index

Sound Property multiFXMultiShot01  Auto
Sound Property multiFXMultiShot02  Auto
Sound Property multiFXMultiShot03  Auto
Sound Property multiSoundCore  Auto
bool SoundCore

Activator Property multiActivatorShooter  Auto
ObjectReference Shooter

Activator Property multiActivatorCore  Auto
ObjectReference Core

GlobalVariable Property MultiSet  Auto

Event onInit()                       ; This event will run once, when the script is initialized

	Num = 0
	multiShotTrigger = 0

	RegisterForSingleUpdate(0.01)

endEvent

Event OnUpdate()

	Actor PlayerActor =  Game.GetPlayer()

if MultiSet.getValue() != 0
	RegisterForAnimationEvent(PlayerActor, "BowDrawn")
	RegisterForAnimationEvent(PlayerActor, "BowRelease")
	RegisterForAnimationEvent(PlayerActor, "AttackStop")

	if multiShotTrigger == 1

			ang = PlayerActor.GetAngleZ()

			zang = ang

			if ang > 180
				ang = ang - 360
			endif

			x = ang*0.0174532925
			x2 = x*x
			sin = x*(1-(x2/6)*(1-(x2/20)*(1-(x2/42)*(1-(x2/72)*(1-x2/110)))))
			cos = 1-(0.5)*x2*(1-(x2/12)*(1-(x2/30)*(1-(x2/56)*(1-x2/90))))
			dx = 10*sin
			dy = 10*cos

			; vertical fly vector
			ang = PlayerActor.GetAngleX()
			xang = ang*cos ; uses settings from Horizontal Vector
			yang = -ang*sin

			x = -ang*0.0174532925
			x2 = x*x
			sin = x*(1-(x2/6)*(1-(x2/20)*(1-(x2/42)*(1-(x2/72)*(1-x2/110)))))
			cos = 1-(0.5)*x2*(1-(x2/12)*(1-(x2/30)*(1-(x2/56)*(1-x2/90))))
			dz = 10*sin
	
			; initial position vector (to add to player coords)
			xPos = 12*dx*cos
			yPos = 12*dy*cos
			zPos = 118+12*dz ;-(25.0*(PlayerActor.IsSneaking()))

			xAng = PlayerActor.GetAngleX()
			yAng = PlayerActor.GetAngleY()
			zAng = PlayerActor.GetAngleZ()

			Core = PlayerActor.PlaceAtMe(multiActivatorCore)
			Core.moveTo(PlayerActor, xPos , yPos , zPos , true)

			Core.Activate(PlayerActor)
			SoundCore = multiSoundCore.Play(PlayerActor)

			multiShotTrigger = 2

	endif

	if multiShotTrigger == 2 &&  Num <= 12

		Shooter = PlayerActor.PlaceAtMe(multiActivatorShooter)

		Shooter.moveTo(Core, 0 , 0 , 0 , true)
		if MultiSet.getValue() == 1
			Shooter.setAngle(xAng,yAng,zAng+RandomFloat(-30,30))
		elseif MultiSet.getValue() == 2
			Shooter.setAngle(xAng+RandomFloat(-30,30),yAng+RandomFloat(-30,30),zAng+RandomFloat(-30,30))
		elseif MultiSet.getValue() == 3
			Shooter.setAngle(xAng+RandomFloat(-3,3),yAng+RandomFloat(-3,3),zAng+RandomFloat(-3,3))
		endif

		Shooter.Activate(PlayerActor)

		Num += 1

		if SoundCore == 1
			SoundCore = multiSoundCore.Play(PlayerActor)
		endif

	endif

endif

	RegisterForSingleUpdate(0.01)

endEvent


Event OnAnimationEvent(ObjectReference akSource, String asEventName)

	if MultiSet.getValue() != 0

		if asEventName == "BowDrawn"
			multiShotTrigger = 1
			Num = 0
		endif

		if asEventName == "BowRelease" || asEventName == "AttackStop" && multiShotTrigger == 2

			multiShotTrigger = 3

			Actor PlayerActor =  Game.GetPlayer()

			index += 1
			index = index % 3

			if index == 1
				multiFXMultiShot01.play(PlayerActor)
			elseif index == 2
				multiFXMultiShot02.play(PlayerActor)
			else
				multiFXMultiShot03.play(PlayerActor)
			endif

		endif

	endif

endEvent