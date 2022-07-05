Scriptname MRL_DragonCounter extends ActiveMagicEffect

Spell Property DragonSpell01 Auto
Spell Property DragonSpell02 Auto

Int Property Counter01 Auto
Int Property Counter02 Auto 

float Property Divider Auto

int c01 = 0
int c02 = 0

bool register = true

actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
    
    Caster = akCaster

    if register
        RegisterForSingleUpdate(Divider)
    endif

EndEvent

Event OnUpdate()

    if Caster.IsDead()
        register = false
    endif

    if register

        if c01 >= Counter01

            DragonSpell01.Cast(Caster, Caster)

            c01 = 0
            c02 = c02 + 1

            RegisterForSingleUpdate(Divider)

            return

        endif

        if c02 >= Counter02

            DragonSpell02.Cast(Caster, Caster)

            c02 = 0
            c01 = c01 + 1

            RegisterForSingleUpdate(Divider)
            
            return

        endif

        c01 = c01 + 1
        c02 = c02 + 1
        
        RegisterForSingleUpdate(Divider)

    endif

EndEvent