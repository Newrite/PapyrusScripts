Scriptname ORD_Grindhouse_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Two_Grindhouse_Spell_Proc Auto
Float Property ORD_GrindhouseChance Auto
Keyword Property MagicShout Auto

; warcry
Perk Property ORD_Two90_Warcry_Perk_90 Auto
Float Property ORD_WarcryChance Auto

; enter the arena
MagicEffect Property ORD_Two_Massacre_Effect_EnterTheArenaCooldown Auto
Perk Property ORD_Two90_EnterTheArena_Perk_90_OrdASISExclude Auto

; -----

Bool AlreadySwung = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")
	; HitFrame

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == PlayerRef

		; grindhouse
		If Utility.RandomFloat(0.0,1.0) < ORD_GrindhouseChance || (AlreadySwung == false && PlayerRef.HasPerk(ORD_Two90_EnterTheArena_Perk_90_OrdASISExclude) && !PlayerRef.HasMagicEffect(ORD_Two_Massacre_Effect_EnterTheArenaCooldown))
			ORD_Two_Grindhouse_Spell_Proc.Cast(PlayerRef)
		EndIf

		AlreadySwung = true

		; warcry
		If PlayerRef.HasPerk(ORD_Two90_Warcry_Perk_90) && Utility.RandomFloat(0.0,1.0) < ORD_WarcryChance
			Spell WarcryShout = PlayerRef.GetEquippedSpell(2) as Spell
			If WarcryShout != NONE
				WarcryShout.Cast(PlayerRef)
			EndIf
		EndIf

	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Two_Grindhouse_Spell_Proc)

EndEvent

; -----