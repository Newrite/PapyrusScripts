function handleLevelPoints(basePointsPerLevel, boostWarriorPoints, boostMagePoints, boostThiefPoints, level, raceTypeBoost, raceBoostValue)
    bluePerLevel = basePointsPerLevel + boostMagePoints
    redPerLevel = basePointsPerLevel + boostWarriorPoints
    greenPerLevel = basePointsPerLevel + boostThiefPoints
    if raceTypeBoost == "red"
        redPerLevel += raceBoostValue
    elseif raceTypeBoost == "blue"
        bluePerLevel += raceBoostValue
    else raceTypeBoost == "green"
        greenPerLevel += raceBoostValue
    end
    println("With start skill 5-10-15-20-25 :\v $(calcSkill(5))-$(calcSkill(10))-$(calcSkill(15))-$(calcSkill(20))-$(calcSkill(25))")
    redFromBooks = 30
    blueFromBooks = 30
    greenFromBooks = 30
    println("All points: red = $(redPerLevel*level) blue = $(bluePerLevel*level) green = $(greenPerLevel*level)")
    println("All points with books: red = $(redPerLevel*level+redFromBooks) blue = $(bluePerLevel*level+blueFromBooks) green = $(greenPerLevel*level+greenFromBooks)\n")
    println("All points convert to blue $(bluePerLevel*level+convertPoints(redPerLevel*level)+convertPoints(greenPerLevel*level)) ")
    println("All points convert to red $(redPerLevel*level+convertPoints(bluePerLevel*level)+convertPoints(greenPerLevel*level)) ")
    println("All points convert to green $(greenPerLevel*level+convertPoints(redPerLevel*level)+convertPoints(bluePerLevel*level))\nConvert with Books\n")
    println("All points convert to blue with Books $(bluePerLevel*level+convertPoints(redPerLevel*level+redFromBooks)+convertPoints(greenPerLevel*level+greenFromBooks)) ")
    println("All points convert to red with Books $(redPerLevel*level+convertPoints(bluePerLevel*level+blueFromBooks)+convertPoints(greenPerLevel*level+greenFromBooks)) ")
    println("All points convert to green with Books $(greenPerLevel*level+convertPoints(redPerLevel*level+redFromBooks)+convertPoints(bluePerLevel*level+blueFromBooks))")
    println("\nDebug: Parameters \n\tbasePointsPerLevel = $basePointsPerLevel \n\tboostMagePoints = $boostMagePoints \n\tboostThiefPoints = $boostThiefPoints \n\tboostWarriorPoints = $boostWarriorPoints \n\tlevel = $level \n\traceTypeBoost = $raceTypeBoost \n\traceBoostValue = $raceBoostValue")
end

function convertPoints(points)
    points % 2 == 0 ? points / 2 : (points -1) / 2
end

function calcSkill(skillValue)
    pointCounter = 0
    while skillValue < 100
        if skillValue < 90
            pointCounter += 1
        else 
            pointCounter += 2
        end
        skillValue += 1
    end
    pointCounter
end