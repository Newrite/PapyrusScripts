Scriptname HH_Arch_Curate_Vyrthur extends ReferenceAlias

;||||||Квесты|||||||||
Quest Property HH_Virtur_quest  Auto  
Quest Property DLC1VQ07  Auto 
;||||||Виртур и игрок|||||||||
Actor Property Virtur  Auto
Actor Property PlayerRef  Auto
;||||||Идл|||||||||
Idle Property IdleVampireStandingBack Auto
Idle Property hh_flight Auto
Idle Property IdleForceDefaultState Auto
Idle Property Jump Auto
Idle Property Loose Auto
;||||||Заклинания|||||||||
SPELL Property HH_SPELL_const_Bloody_cloak  Auto ; Виртур с плащом из мышей
SPELL Property HH_SPELL_const_shiny_cloak  Auto ; Виртур светится
SPELL Property HH_spell_trigger_sunray  Auto ; Тригер солнечных лучей
SPELL Property HH_SPELL_const_Bloody_cloak_PL  Auto ; Мыши вокруг игрока
SPELL Property Mirel_RfaDK_VampireBecomeBats  Auto ; Мыши виртура
Spell Property DLC1AurielsBowEclipseSpell Auto ;"Взрыв тьмы" [SPEL:0200F82F] 
;||||||Руки виртура |||||||||
Weapon Property Mirel_RfaDK_VirturBattleAxe Auto ; 1я стадия
Weapon Property Mirel_RfaDK_VirturSwordRight Auto ; 2я 
Weapon Property Mirel_RfaDK_VirturSwordLeft Auto ; 2я
Spell Property Mirel_RfaDK_VirturSlowRedBall Auto ; left
Spell Property Mirel_RfaDK_VirturFrostSteam Auto ; right
Weapon Property Mirel_RfaDK_VirturSwordRightMag Auto ; 4я
Spell Property Mirel_RfaDK_VirturFrostWalLeftHand Auto ; 4я
;||||||Сцены|||||||||
Scene Property HH_Scene_1 Auto ; просто сцена машет руками
Scene Property HH_VIRTUR_QUEST_sceen_2 Auto ; Сосалка ХП с охуенным ренджом
;||||||Точки для тп|||||||||
ObjectReference Property Throne  Auto  
ObjectReference Property To_tp  Auto 
 
ObjectReference Property To_tp_1  Auto ; 1 вход
ObjectReference Property To_tp_2  Auto ; 1 лево
ObjectReference Property To_tp_3  Auto ; 1 право

ObjectReference Property To_tp_4  Auto ; 1 главный
ObjectReference Property To_tp_5  Auto ; 1 лево
ObjectReference Property To_tp_6  Auto ; 1 гора

ObjectReference Property To_tp_7  Auto ; центр
ObjectReference Property To_tp_8  Auto ; право
ObjectReference Property To_tp_9  Auto ; бэк
ObjectReference Property To_tp_10  Auto ; лево
ObjectReference Property To_tp_11  Auto ; балкон
ObjectReference Property To_tp_12  Auto ; пещера отметка
ObjectReference Property To_tp_13  Auto ; пещера тп виртура
;||||||Прочее|||||||||
imageSpaceModifier Property VampireTransformDecreaseISMD  Auto 
effectShader property VampireChangeFX auto
Sound  Property MagVampireTransform01  Auto

;||||||start|||||||||
Event Oninit()
	self.GotoState("PreReady")
	;Debug.MessageBox("Готов")
EndEvent

state PreReady
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		self.GotoState("First")
		;Debug.MessageBox("хит")
	EndEvent
endState

State First
	Event OnBeginState()
		RegisterForSingleUpdate(5.0)
		Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
	EndEvent
	Event OnUpdate()
		UnregisterForUpdate()
		;Debug.MessageBox("FirstUpdate")
		Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		RegisterForSingleUpdate(5.0)
		if Virtur.GetActorValuePercentage("health")<0.75
			;Debug.MessageBox("Virtur.GetActorValuePercentage<0.75")
			Virtur.RemoveItem(Mirel_RfaDK_VirturBattleAxe,Virtur.GetItemCount(Mirel_RfaDK_VirturBattleAxe),true)
			self.GotoState("beamattack")
		endIf
	EndEvent
endState

state beamattack
	Event OnBeginState()
		;Debug.MessageBox("beamattack")
		Virtur.MoveTo(To_tp_11)
		Virtur.addSpell(HH_SPELL_const_shiny_cloak)
		HH_spell_trigger_sunray.cast(Virtur, PlayerRef)
		utility.Wait(0.5)
		HH_Scene_1.Start()
		Virtur.SetGhost(true)
		RegisterForSingleUpdate(7.0)
	EndEvent
	Event OnUpdate()
		Virtur.SetGhost(false)
		Utility.WaitMenuMode(0.25)
		UnregisterForUpdate()
		;Debug.MessageBox("BeamattackUpdate")
		HH_spell_trigger_sunray.cast(Virtur, PlayerRef)
		Virtur.QueueNiNodeUpdate()
		Virtur.AddItem(Mirel_RfaDK_VirturSwordRight,1,true)
		Utility.WaitMenuMode(0.1)
		Virtur.EquipItem(Mirel_RfaDK_VirturSwordRight, true, true)
		Virtur.QueueNiNodeUpdate()
		Virtur.AddItem(Mirel_RfaDK_VirturSwordLeft,1,true)
		Utility.WaitMenuMode(0.1)
		Virtur.EquipItem(Mirel_RfaDK_VirturSwordLeft, true, true)
		Virtur.QueueNiNodeUpdate()
		Virtur.MoveTo(PlayerRef)
		self.GotoState("Second")
	EndEvent
endState

state Second
	Event OnBeginState()
		;Debug.MessageBox("Second")
		RegisterForSingleUpdate(5.0)
	EndEvent
	Event OnUpdate()
		;Debug.MessageBox("OnUpdateSecond")
		UnregisterForUpdate()
		Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		RegisterForSingleUpdate(5.0)
		if Virtur.GetActorValuePercentage("health")<0.5
			;Debug.MessageBox("Virtur.GetActorValuePercentage<0.5")
			Virtur.RemoveItem(Mirel_RfaDK_VirturSwordRight,Virtur.GetItemCount(Mirel_RfaDK_VirturSwordRight),true)
			Virtur.RemoveItem(Mirel_RfaDK_VirturSwordLeft,Virtur.GetItemCount(Mirel_RfaDK_VirturSwordLeft),true)
			self.GotoState("Kys")
		endIf
	EndEvent
endState

state Kys
	Event OnBeginState()
		;Debug.MessageBox("Kys")
		Virtur.MoveTo(To_tp_11)
		HH_Scene_1.Start()
		Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		RegisterForSingleUpdate(7.0)
	EndEvent
	Event OnUpdate()
		;Debug.MessageBox("KysOnUpdate")
		PlayerRef.addSpell(HH_SPELL_const_Bloody_cloak_PL, false)
		PlayerRef.addSpell(HH_SPELL_const_Bloody_cloak_PL, false)
		UnregisterForUpdate()
		Game.ForceThirdPerson()
		Game.DisablePlayerControls()
		utility.Wait(0.5)
		PlayerRef.PlayIdle(hh_flight)
		Virtur.PlayIdle(hh_flight)
		utility.Wait(3.0)
		PlayerRef.MoveTo(To_tp_7)
		PlayerRef.PlayIdle(IdleForceDefaultState)
		PlayerRef.PlayIdle(Loose)
		PlayerRef.SetAngle(0.0, 0.0, 0.0)
		utility.Wait(2.5)
		Virtur.MoveTo(PlayerRef)
		VampireTransformDecreaseISMD.applyCrossFade(2.0)
		MAGVampireTransform01.Play(Virtur)
		Virtur.SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), PlayerRef.GetAngleZ())
		Virtur.PlayIdleWithTarget(IdleVampireStandingBack, PlayerRef)
		utility.Wait(1.5)
		PlayerRef.PlayIdle(IdleForceDefaultState)
		Virtur.MoveTo(To_tp_11)
		Game.EnablePlayerControls()
		PlayerRef.PlayIdle(Loose)
		Virtur.PlayIdle(Loose)
		float damagehealth = PlayerRef.GetActorValue("Health")/2.0
		Virtur.RestoreActorValue("health", 9000.0)
		PlayerRef.DamageActorValue("Health", damagehealth)
		Virtur.PushActorAway(PlayerRef, 5)
		PlayerRef.PushActorAway(Virtur, 5)
		imageSpaceModifier.removeCrossFade()
		Virtur.RemoveSpell(HH_SPELL_const_Bloody_cloak_PL)
		PlayerRef.RemoveSpell(HH_SPELL_const_Bloody_cloak_PL)
		Game.EnablePlayerControls()
		self.GotoState("Third")
	EndEvent
endState

state Third
	Event OnBeginState()
		RegisterForSingleUpdate(11.0)
		Virtur.AddSpell(Mirel_RfaDK_VirturSlowRedBall, false)
		Virtur.AddSpell(Mirel_RfaDK_VirturFrostSteam, false)
		Virtur.EquipSpell(Mirel_RfaDK_VirturSlowRedBall, 0) ; left
		Virtur.EquipSpell(Mirel_RfaDK_VirturFrostSteam, 1) ; right
	EndEvent
	Event OnUpdate()
		if Virtur.GetActorValuePercentage("health")<0.5
			UnregisterForUpdate()
			self.GotoState("Fourth")
		endIf 
		if PlayerRef.GetDistance(To_tp_1) < PlayerRef.GetDistance(To_tp_4) && PlayerRef.GetDistance(To_tp_1) < PlayerRef.GetDistance(To_tp_7) && PlayerRef.GetDistance(To_tp_1) < PlayerRef.GetDistance(To_tp_12)
			Virtur.EquipSpell(Mirel_RfaDK_VirturSlowRedBall, 0) ; left
			Virtur.EquipSpell(Mirel_RfaDK_VirturFrostSteam, 1) ; right
			Begin()
			RegisterForSingleUpdate(11.0)
			Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		elseIf PlayerRef.GetDistance(To_tp_4) < PlayerRef.GetDistance(To_tp_1) && PlayerRef.GetDistance(To_tp_4) < PlayerRef.GetDistance(To_tp_7) && PlayerRef.GetDistance(To_tp_4) < PlayerRef.GetDistance(To_tp_12)
			Virtur.EquipSpell(Mirel_RfaDK_VirturSlowRedBall, 0) ; left
			Virtur.EquipSpell(Mirel_RfaDK_VirturFrostSteam, 1) ; right
			Midle()
			RegisterForSingleUpdate(11.0)
			Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		elseIf PlayerRef.GetDistance(To_tp_7) < PlayerRef.GetDistance(To_tp_4) && PlayerRef.GetDistance(To_tp_7) < PlayerRef.GetDistance(To_tp_1) && PlayerRef.GetDistance(To_tp_7) < PlayerRef.GetDistance(To_tp_12)
			Virtur.EquipSpell(Mirel_RfaDK_VirturSlowRedBall, 0) ; left
			Virtur.EquipSpell(Mirel_RfaDK_VirturFrostSteam, 1) ; right
			Balcon()
			RegisterForSingleUpdate(11.0)
			Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		elseIf PlayerRef.GetDistance(To_tp_12) < PlayerRef.GetDistance(To_tp_4) && PlayerRef.GetDistance(To_tp_12) < PlayerRef.GetDistance(To_tp_1) && PlayerRef.GetDistance(To_tp_12) < PlayerRef.GetDistance(To_tp_7)
			Virtur.EquipSpell(Mirel_RfaDK_VirturSlowRedBall, 0) ; left
			Virtur.EquipSpell(Mirel_RfaDK_VirturFrostSteam, 1) ; right
			Virtur.MoveTo(To_tp_13)
			RegisterForSingleUpdate(11.0)
			Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
		endIf
	EndEvent
endState

Function Begin()
	int random1 = Utility.RandomInt(0, 2)
	if random1==0
		Virtur.MoveTo(To_tp_1)
	elseIf random1==1
		Virtur.MoveTo(To_tp_2)
	elseIf random1==2
		Virtur.MoveTo(To_tp_3)
	endIf
EndFunction

Function Midle()
	int random2 = Utility.RandomInt(0, 2)
	if random2==0
		Virtur.MoveTo(To_tp_4)
	elseIf random2==1
		Virtur.MoveTo(To_tp_5)
	elseIf random2==2
		Virtur.MoveTo(To_tp_6)
	endIf
EndFunction

Function Balcon()
	int random3 = Utility.RandomInt(0, 3)
	if random3==0
		Virtur.MoveTo(To_tp_7)
	elseIf random3==1
		Virtur.MoveTo(To_tp_8)
	elseIf random3==2
		Virtur.MoveTo(To_tp_10)
	elseIf random3==3
		Virtur.MoveTo(To_tp_11)
	endIf
EndFunction

state Fourth
	Event OnBeginState()
		RegisterForSingleUpdate(16.0)
		Virtur.RemoveSpell(Mirel_RfaDK_VirturSlowRedBall)
		Virtur.RemoveSpell(Mirel_RfaDK_VirturFrostSteam)
		Virtur.QueueNiNodeUpdate()
		Virtur.AddSpell(Mirel_RfaDK_VirturFrostWalLeftHand, false)
		Utility.WaitMenuMode(0.1)
		Virtur.EquipSpell(Mirel_RfaDK_VirturFrostWalLeftHand, 0) ; left
		Virtur.QueueNiNodeUpdate()
		Virtur.AddItem(Mirel_RfaDK_VirturSwordRightMag,1,true)
		Utility.WaitMenuMode(0.1)
		Virtur.EquipItem(Mirel_RfaDK_VirturSwordRightMag, true, true)
		Virtur.QueueNiNodeUpdate() 
		DLC1AurielsBowEclipseSpell.cast(Virtur, Virtur)
		;Virtur.QueueNiNodeUpdate()
	EndEvent
	Event OnUpdate()
	Mirel_RfaDK_VampireBecomeBats.cast(Virtur, Virtur)
	Virtur.EquipSpell(Mirel_RfaDK_VirturFrostWalLeftHand, 0)
	Virtur.MoveTo(PlayerRef)
	HH_VIRTUR_QUEST_sceen_2.Start()
	RegisterForSingleUpdate(16.0)
	EndEvent
endState

Event OnDying(Actor akKiller)
UnregisterForUpdate()
;Debug.MessageBox("умер")
HH_Virtur_quest.SetStage(50)
self.GoToState("DoNothingState")
EndEvent

State DoNothingState
EndState