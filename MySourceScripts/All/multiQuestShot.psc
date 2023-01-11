Scriptname multiQuestShot extends Quest  

import Math
import Utility

int multiShotTrigger

float xMove
float yMove
float rXMove
float rYMove

float xPos
float yPos
float zPos

; private
float xAng
float yAng
float zAng

Activator Property multiActivatorShooter  Auto
ObjectReference Shooter

Event onInit()                       ; This event will run once, when the script is initialized

	multiShotTrigger = 0

	RegisterForSingleUpdate(0.01)

endEvent

Event OnUpdate()

	Actor PlayerActor =  Game.GetPlayer()

	if PlayerActor.IsSneaking() && multiShotTrigger <= 1

		multiShotTrigger = 1

		XMove = 120
		YMove = 0
		zPos = 78

		zAng = PlayerActor.getAngleZ()

		rXMove = (math.Sin(zAng) * yMove)+(math.Cos(zAng) * xMove)
		rYMove = (math.Cos(zAng) * yMove)-(math.Sin(zAng) * xMove)

		xPos = rXMove
		yPos = rYMove

		Shooter = PlayerActor.PlaceAtMe(multiActivatorShooter)
		Shooter.MoveTo(PlayerActor, xPos , yPos , zPos ,True)

		Shooter.setAngle(RandomFloat(-180.180),RandomFloat(-180.180),RandomFloat(-180.180))

		Shooter.Activate(PlayerActor)

	endif

	if !PlayerActor.IsSneaking() && multiShotTrigger == 1
		multiShotTrigger = 2
	endif

	RegisterForSingleUpdate(0.01)

endEvent