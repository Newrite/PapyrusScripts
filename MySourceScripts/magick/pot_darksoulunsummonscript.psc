Scriptname POT_DarkSoulUnsummonScript extends Actor

EffectShader Property AtronachUnsummonDeathFXS Auto

Event onDying(actor akKiller)
                    AtronachUnsummonDeathFXS.Play(self)
                    utility.wait(2)
                    Disable()
EndEvent
