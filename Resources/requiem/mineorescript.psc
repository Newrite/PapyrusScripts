scriptName mineorescript extends objectReference

mineorefurniturescript property myFurniture auto hidden
{the furniture for this piece of ore, set in script}
Int property ResourceCountCurrent = -1 auto hidden
{Used to track the current remaining resources}
Int property AttackStrikesCurrent = -1 auto hidden
{Current number of attack strikes}
achievementsscript property AchievementsQuest auto
objectReference property CidhnaMinePlayerBedREF auto
quest property DialogueCidhnaMine auto
objectReference property objSelf auto hidden
{objectReference to self}
globalvariable property BB_Enabled auto
Int property ResourceCountTotal = 6 auto
{how many resources this has before it is depleted}
quest property MS02 auto
message property FailureMessage auto
{Message to say why you can't use this without RequiredWeapon}
Int property ResourceCount = 1 auto
{how many resources you get per drop}
Int property StrikesBeforeCollection = 1 auto
{how many times this is struck before giving a resource}
message property NeedPerk auto
{Says that you need perk}
sound property DrScOreOpen auto
{sound played when Ore is acquired}
location property CidhnaMineLocation auto
perk property RequiredPerk auto
{Required perk for mining}
miscobject property Ore auto
{what you get from this Ore Vein}
message property DepletedMessage auto
{Message to say that this vein is depleted}
Int property StrikesCurrent = -1 auto hidden
{Current number of strikes}
formlist property mineOreToolsList auto
{Optional: Player must have at least one item from this formlist to interact}
Int property AttackStrikesBeforeCollection = 3 auto
{how many times this is struck by attacks before giving a resource}
leveleditem property lItemGems10 auto
{Optional: Gems that may be mined along with ore}

function OnHit(objectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	if akAggressor == game.getPlayer() as objectReference
		if BB_Enabled.GetValue() as Int == 0
			self.MiningOnHit(akSource)
		elseIf game.getPlayer().HasPerk(RequiredPerk) || RequiredPerk == none
			self.MiningOnHit(akSource)
		else
			NeedPerk.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	endIf
endFunction

function MiningOnHit(Form akSource)

	if mineOreToolsList.hasForm(akSource)
		if game.getPlayer().GetCurrentLocation() == CidhnaMineLocation && MS02.ISRunning() == false
			CidhnaMinePlayerBedREF.Activate(game.getPlayer() as objectReference, false)
			DialogueCidhnaMine.SetStage(45)
			return 
		endIf
		self.proccessAttackStrikes()
	endIf
endFunction

function MiningOnActivate(objectReference akActivator)

	if game.getPlayer().IsSneaking()
		game.getPlayer().StartSneaking()
	endIf
	if ResourceCountCurrent == 0
		DepletedMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	elseIf self.playerHasTools() == false
		FailureMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	else
		if game.getPlayer().GetCurrentLocation() == CidhnaMineLocation && MS02.ISRunning() == false
			CidhnaMinePlayerBedREF.Activate(game.getPlayer() as objectReference, false)
			DialogueCidhnaMine.SetStage(45)
			return 
		endIf
		if self.getLinkedRef(none)
			myFurniture = self.getLinkedRef(none) as mineorefurniturescript
			myFurniture.lastActivateRef = objSelf
			self.getLinkedRef(none).Activate(akActivator, false)
			AchievementsQuest.incHardworker(2)
		endIf
	endIf
endFunction

function onCellAttach()

	self.blockActivation(true)
	self.SetNoFavorAllowed(true)
	objSelf = self as objectReference
	if !self.getLinkedRef(none)
		self.depleteOreDueToFailure()
	endIf
endFunction

function depleteOreDueToFailure()

	self.damageObject(50 as Float)
	self.setDestroyed(true)
	ResourceCountCurrent = 0
endFunction

function giveOre()

	if ResourceCountCurrent == -1
		ResourceCountCurrent = ResourceCountTotal
	endIf
	if ResourceCountCurrent > 0
		ResourceCountCurrent -= 1
		if ResourceCountCurrent == 0
			self.damageObject(50 as Float)
			self.getLinkedRef(none).Activate(objSelf, false)
			DrScOreOpen.play(self as objectReference)
			self.setDestroyed(true)
			if Ore
				game.getPlayer().addItem(Ore as Form, ResourceCount, false)
			endIf
			if lItemGems10
				game.getPlayer().addItem(lItemGems10 as Form, 1, false)
			endIf
			DepletedMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		else
			DrScOreOpen.play(self as objectReference)
			if Ore
				game.getPlayer().addItem(Ore as Form, ResourceCount, false)
			endIf
			if lItemGems10
				game.getPlayer().addItem(lItemGems10 as Form, 1, false)
			endIf
		endIf
	elseIf ResourceCountCurrent == 0
		self.getLinkedRef(none).Activate(objSelf, false)
		(self.getLinkedRef(none) as mineorefurniturescript).goToDepletedState()
		DepletedMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction

function onReset()

	self.Reset(none)
	self.clearDestruction()
	self.setDestroyed(false)
	ResourceCountCurrent = -1
	if self.isEnabled()
		self.disable(false)
		self.enable(false)
	endIf
endFunction

Bool function playerHasTools()

	if game.getPlayer().GetItemCount(mineOreToolsList as Form) > 0
		return true
	else
		return false
	endIf
endFunction

function proccessAttackStrikes()

	if AttackStrikesCurrent <= -1
		AttackStrikesCurrent = AttackStrikesBeforeCollection
	endIf
	AttackStrikesCurrent -= 1
	if AttackStrikesCurrent == 0
		AttackStrikesCurrent = AttackStrikesBeforeCollection
		self.giveOre()
	endIf
endFunction

function ProccessStrikes()

	if StrikesCurrent <= -1
		StrikesCurrent = StrikesBeforeCollection
	endIf
	StrikesCurrent -= 1
	if StrikesCurrent == 0
		StrikesCurrent = StrikesBeforeCollection
		self.giveOre()
	endIf
endFunction

function onActivate(objectReference akActivator)

	if akActivator as actor
		if akActivator == game.getPlayer() as objectReference
			if BB_Enabled.GetValue() as Int == 0 || game.getPlayer().HasPerk(RequiredPerk) || RequiredPerk == none || (game.getPlayer().GetCurrentLocation() == CidhnaMineLocation && MS02.ISRunning() == false)
				self.MiningOnActivate(akActivator)
			else
				NeedPerk.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			endIf
		elseIf self.getLinkedRef(none)
			self.getLinkedRef(none).Activate(akActivator, false)
		endIf
	elseIf akActivator == self.getLinkedRef(none)
		self.ProccessStrikes()
	endIf
endFunction