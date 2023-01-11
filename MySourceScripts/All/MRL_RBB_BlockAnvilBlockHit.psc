Scriptname MRL_RBB_BlockAnvilBlockHit extends ActiveMagicEffect  

GlobalVariable Property Counter Auto
Int Property ValueToActivate Auto
Spell Property AnvilSpell Auto

int keycod = 18
actor Player

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Player = akTarget
    RegisterForKey(keycod)
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
    int value = Counter.GetValueInt()
	if abHitBlocked && (value < ValueToActivate)
        int newValue = value + 1
        if newValue >= ValueToActivate
            Debug.Notification("Наковальня Стуна готова к использованию.")
        endif
		Counter.SetValue(newValue)
	endif

EndEvent

Event OnKeyUp(int keyCode, float holdTime)
    AnvilSpell.Cast(Player, Player)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForKey(keycod)
EndEvent