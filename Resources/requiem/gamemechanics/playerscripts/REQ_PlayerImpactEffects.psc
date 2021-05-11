Scriptname REQ_PlayerImpactEffects extends REQ_PlayerAlias
{apply various effects to the player on hit, if the conditions are met, spellarrays = [1H normal, 2H normal, 1H power, 2H power, ranged, spell, concentration spell]}

Spell[] Property MagickaDamage Auto
{magicka damage with check for Focused Mind perk}
Spell[] Property StaminaDamage Auto
{stamina damage if attack was not blocked}
Spell[] Property StaminaGain Auto
{stamina gain if attack is blocked with appropriate perk}
Spell[] Property Stagger Auto
{stagger spell, applied randomly depending on various things}
Spell[] Property Disarm Auto
{disarm effect, applied randomly, if player is out of stamina}
Keyword[] Property Twohanded Auto
{keywords for weapons to be considered as 2H weapons}
Keyword[] Property RangedWeapons Auto
{weapon types which are considered ranged weapons}
Keyword Property BreakableBow Auto
{bows with this keyword break on hit}
Keyword Property Concentration Auto
{keyword for spell with concentration effects}
Keyword Property IgnoredAttack Auto
{if the attacks "source" (weapon, spell etc) has this keyword, it will not trigger any impact effects}
Float[] Property ArmorTresholds Auto
{thresholds for stagger change, scales with Threshold^2/AC^2}
Message[] Property DestroyedMessage Auto
{0 will be displayed for broken bows, 1 for crossbows}

Spell Property DummyEffect Auto
{dummy spell, which blocks multiple OnHits from a single spell}
MagicEffect Property Blocker Auto
{dummy effect, which blocks multiple OnHits from a single spell}

GlobalVariable Property OnHitDebug Auto
{debug variable to find evil OnHit generators}

Weapon Property Unarmed Auto
{The unarmed weapon, to prevent processing of invalied brawl attacks, caused e.g. by Nature of the Beast}

Spell absorbed

; Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	; Unarmed = Game.GetFormFromFile(0x000001F4, "Skyrim.esm") As Weapon
	; REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	; Int index = UpdateControl.Scripts.find(self)
	; UpdateControl.ShutdownReady[index] = False
; EndEvent

Event OnWardHit(ObjectReference akCaster, Spell akSpell, Int aiStatus)
	If aiStatus == 1
		absorbed = akSpell
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
	If (akSource == None || (akSource == Unarmed && akAggressor == None))
		; If (OnHitDebug.GetValue() == 1)
			; Debug.MessageBox("Ignored Hit Event\nHit Event type: "+spelltype+" ("+aksource+")\nSource-Ench: "+(akSource as Enchantment) +"\nSourceweapon: "+(akSource as Weapon)+"\npower: "+abPowerAttack +"\nblock: " + abhitblocked+ "\nstagger: "+random+"/"+chance+"\nbash: "+abBashAttack+"\nProjectile: "+akProjectile+"\nBad Guy: " + akAggressor)
		; EndIf
		return
	EndIf
	GotoState("working")
	Int spelltype = 0
	Int count = 0
	Weapon equipped = Player.GetEquippedWeapon()
	If (akSource.HasKeyword(IgnoredAttack))
		GotoState("")
		Return
	ElseIf (akSource as Weapon)
		While (count < RangedWeapons.Length && spelltype == 0)
			spelltype = 4 * aksource.HasKeyword(RangedWeapons[count]) as Int
			count += 1
		EndWhile
		count = 0
		If (akProjectile == None && spelltype == 0)
			While (count < Twohanded.Length && spelltype == 0)
				spelltype = aksource.HasKeyword(Twohanded[count]) as Int
				count += 1
			EndWhile
			spelltype += 2 * ((abPowerAttack && !abBashAttack) as Int)
		Else
			GotoState("")
			return
		EndIf
	ElseIf (akSource as Spell && !absorbed)
		If ( akSource.HasKeyword(Concentration) )
			spelltype = 6
		Else
			spelltype = 5
			If ( !(akSource as Spell).IsHostile() || Player.HasMagicEffect(blocker))
				GotoState("")
				return
			Else
				DummyEffect.cast(Player,Player)
			EndIf
		EndIf
	Else
		absorbed = None
		GotoState("")
		return
	EndIf
	Float chance = Staggerchance(spelltype, abPowerAttack, abBashAttack, abHitBlocked)
	float random = Utility.RandomFloat()
	If (OnHitDebug.GetValue() == 1)
		Debug.MessageBox("Hit Event type: "+spelltype+" ("+aksource+")\nSource-Ench: "+(akSource as Enchantment) +"\nSourceweapon: "+(akSource as Weapon)+"\npower: "+abPowerAttack +"\nblock: " + abhitblocked+ "\nstagger: "+random+"/"+chance+"\nbash: "+abBashAttack+"\nProjectile: "+akProjectile+"\nBad Guy: " + akAggressor)
	EndIf
	MagickaDamage[spelltype].cast(Player, Player)
	If (random < chance )
		Stagger[spelltype].cast(Player, Player)
	EndIf
	If (Player.GetActorValue("Stamina") < 3)
		Disarm[spelltype].cast(Player, Player)
	EndIf
	If ( abHitBlocked )
		StaminaGain[spelltype].cast(Player, Player)
	Else
		StaminaDamage[spelltype].cast(Player, Player)
	EndIf
	
	If ( spelltype >= 4 || abBashAttack)
		GotoState("")
		return
	ElseIf ( equipped != None && akAggressor != None )
		If ( Player.GetEquippedItemType(1) == 7 && equipped.HasKeyword(BreakableBow))
			Player.UnequipItem(equipped, False, True)
			Player.RemoveItem(equipped, 1, True)
			DestroyedMessage[0].Show()
		ElseIf ( Player.GetEquippedItemType(1) == 12 && equipped.HasKeyword(BreakableBow))
			Player.UnequipItem(equipped, False, True)
			Player.RemoveItem(equipped, 1, True)
			DestroyedMessage[1].Show()
		EndIf
	EndIf
	GotoState("")
EndEvent

State working

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
	EndEvent

EndState

Float Function StaggerChance(int spelltype, bool power, bool bash, bool block)
	If spelltype >= 5
		return 0
	ElseIf (spelltype < 2 && power)
		spelltype += 2
	EndIf
	Float Chance = 0
	Float armorrating = Player.GetAV("DamageResist")+100
	Float threshold = ArmorTresholds[spelltype] * ( 1.0 + 0.5* bash as Float)
	Float skill = (Player.GetAV("Block")+50) * ( 1.0 + (Player.GetEquippedItemType(0) == 10) as Float)
	Chance = (threshold*threshold)/(armorrating*armorrating)
	If (block)
		chance *= 50.0/skill
	EndIf
	return chance
EndFunction