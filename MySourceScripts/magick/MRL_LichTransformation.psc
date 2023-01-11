Scriptname MRL_LichTransformation extends ActiveMagicEffect

GlobalVariable Property pDLC1VQ04SafeToEnter Auto

FormList Property BaseRace Auto
FormList Property LichRace Auto
FormList Property SpellsAndPerks Auto

Spell Property POT_LichCureDisease Auto
Spell Property POT_LichTransformationFX Auto
Spell Property POT_LichPhylacteryAbility Auto

Actor Property PlayerRef Auto

Idle Property BleedOutStart Auto
Idle Property BleedOutStop Auto

ImageSpaceModifier Property VampireTransformDecreaseISMD  Auto

EffectShader Property VampireChangeFX auto

Sound Property MagVampireTransform01 Auto

Function AddLichAbilitys()

        int size = SpellsAndPerks.GetSize()
        int index = 0

        while index < size

                Spell sp = SpellsAndPerks.GetAt(index) as Spell

                if sp
                        PlayerRef.AddSpell(sp, false)
                else
                        Perk p = SpellsAndPerks.GetAt(index) as Perk
                        if p
                                PlayerRef.AddPerk(p)
                        endif
                endif

                index = index + 1

        endWhile

EndFunction

bool Function ChangeRace(Race PlayerRace)

        int size = BaseRace.GetSize()
        int index = 0

        while index < size

                Race bRace = BaseRace.GetAt(index) as Race

                if bRace && bRace == PlayerRace
                        Race lRace = LichRace.GetAt(index) as Race
                        if lRace
                                PlayerRef.SetRace(lRace)
                                return true
                        endif
                endif

                index = index + 1

        endWhile

        return false

EndFunction


Function TransformationVisuals()
	Game.ForceThirdPerson()
	Game.ShakeCamera(afStrength = 0.75, afDuration = 7)
	Game.DisablePlayerControls()
	PlayerRef.PlayIdle(BleedOutStart)
	Utility.WaitMenuMode(2.0)
	VampireChangeFX.play(PlayerRef)
	VampireTransformDecreaseISMD.applyCrossFade(2.0)
	MAGVampireTransform01.Play(PlayerRef)
	utility.WaitMenuMode(2.0)
	imageSpaceModifier.RemoveCrossFade()
	Utility.WaitMenuMode(1.0)
	PlayerRef.PlayIdle(BleedOutStop)
	Utility.WaitMenuMode(1.0)
	VampireChangeFX.stop(PlayerRef)
	Utility.WaitMenuMode(1.5)
	Utility.WaitMenuMode(1.0)
        pDLC1VQ04SafeToEnter.SetValue(1)
        POT_LichTransformationFX.Cast(PlayerRef)
        PlayerRef.RemoveSpell(POT_LichPhylacteryAbility)
        Debug.Notification("Мощь вырывается из вас во время трансформации...")
	Game.EnablePlayerControls()
EndFunction


Event OnEffectStart(Actor akTarget, Actor akCaster)
	POT_LichCureDisease.Cast(PlayerRef)
        if ChangeRace(PlayerRef.GetRace())
                AddLichAbilitys()
                TransformationVisuals()
        else
                Debug.Notification("Что-то пошло не так во время трансформации... вероятнее всего не найдено сопавстовление для расы лича.")
        endif
EndEvent