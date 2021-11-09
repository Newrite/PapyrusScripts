Scriptname MRL_NPCBlockChange extends ActiveMagicEffect
{Скрипт деактивирует блок у нпс если они долго стоят в блоке}

Spell Property SpellBlockBashAndBlock Auto
Float Property UpdateTime Auto
Int Property MaxTimeInBlock Auto

actor Blocker

bool RegisterStage

int TimeInBlock

Event OnEffectStart(Actor akTarget, Actor akCaster)

    ;Debug.Notification("Start Effect")

    RegisterStage = true
    Blocker = akCaster
    TimeInBlock = 0


    RegisterForSingleUpdate(UpdateTime)

EndEvent

Event OnUpdate()
    
    if RegisterStage

        if TimeInBlock >= MaxTimeInBlock

            ;Debug.Notification("TimeInBlock >= MaxTimeInBlock")

            SpellBlockBashAndBlock.Cast(Blocker, Blocker)

            while Blocker.GetAnimationVariableBool("IsBlocking")
                Debug.SendAnimationEvent(Blocker, "blockStop")
            endWhile

            UnregisterForUpdate()

        else

            if Blocker.GetAnimationVariableBool("IsBlocking")

                ;Debug.Notification("TimeInBlock += 1")

                TimeInBlock += 1
                RegisterForSingleUpdate(UpdateTime)

            endif

        endif

    else

        UnregisterForUpdate()
        return

    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    RegisterStage = false
    TimeInBlock = 0

EndEvent
