Scriptname defaultGhostScript extends Actor  

EFFECTSHADER PROPERTY pGhostFXShader AUTO
FORMLIST PROPERTY pDefaultGhostWeaponFlickerList AUTO
CONTAINER PROPERTY pDefaultGhostCorpse AUTO
EXPLOSION PROPERTY pdefaultGhostDeathExplosion AUTO
LEVELEDITEM PROPERTY pdefaultGhostLeveledList AUTO

BOOL PROPERTY bdefaultLoot=FALSE AUTO
{mark true if you want the default ghost loot and not the NPCs}

BOOL PROPERTY bflicker=FALSE AUTO
{don't use this yet}

SPELL PROPERTY pGhostAbilityNew AUTO
SPELL PROPERTY pGhostResistsAbility AUTO

; //any perks you want to add
PERK PROPERTY pGhostHalfDamagePerk AUTO

BOOL PROPERTY bFade=FALSE AUTO
{makes the ghost fade out instead of explode}

; //make sure only one flash is active
BOOL bFlash=FALSE

; //the person who caused the ghost to flash
ACTOR target

; //////////
; //LOOT PILE VARIABLES
; //////////

; //////////
; //ASH PILE VARIABLES
; //////////
float property fDelay = 0.75 auto
{time to wait before Spawning Ash Pile}
float property fDelayEnd = 1.65 auto
{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}
Activator property pDefaultAshPileGhost auto
{The object we use as a pile.}
Bool property bSetAlphaZero = True auto
{The Effect Shader we want.}
FormList Property pDisintegrationMainImmunityList auto
{If the target is in this list, they will not be disintegrated.}
EFFECTSHADER PROPERTY pGhostDeathFXShader AUTO
{the shader to play while dying}

race VictimRace
bool TargetIsImmune = True

; ///////////
; //ONLOAD
; ///////////
EVENT onLoad()

	; // add on the abilities
	SELF.addSpell(pGhostAbilityNew)
	SELF.addSpell(pGhostResistsAbility)
			
ENDEVENT

; /////////
; //ONDYING: On dying play an explosion to mask the ghost vanishing and being replaced by his corpse
; /////////
EVENT onDYING(ACTOR killer)
	
	IF(bFade)
		SELF.blockActivation(TRUE)
		disable(1)
	ELSE
		
		; //check to see if the target is in the immunity list
		IF(pDisintegrationMainImmunityList == none)
			TargetIsImmune = False
		ELSE
			ActorBase VictimBase = SELF.GetBaseObject() as ActorBase
			VictimRace = VictimBase.GetRace()
			
			IF(pDisintegrationMainImmunityList.hasform(VictimRace) || pDisintegrationMainImmunityList.hasform(VictimBase))
				TargetIsImmune = True
			ELSE
				TargetIsImmune = False
			ENDIF
		ENDIF

		; //if the target is not immune, disintegrate them
		IF(TargetIsImmune == False)
; 			debug.trace("victim just died")

			SELF.SetCriticalStage(SELF.CritStage_DisintegrateStart)

			IF(pGhostDeathFXShader != none)
				pGhostDeathFXShader.play(SELF,ShaderDuration)
			ENDIF
			
			SELF.SetAlpha (0.0,True)
			
			; //attach the ash pile
			SELF.AttachAshPile(pDefaultAshPileGhost)
			
			IF(bdefaultLoot)
				SELF.RemoveAllItems()
				SELF.addItem(pdefaultGhostLeveledList)
			ENDIF
			
				
			utility.wait(fDelayEnd)
			IF(pGhostDeathFXShader != none)
				pGhostDeathFXShader.stop(SELF)
			ENDIF
			IF(bSetAlphaZero == True)
				SELF.SetAlpha (0.0,True)
			ENDIF
			SELF.SetCriticalStage(SELF.CritStage_DisintegrateEnd)
		ENDIF
	
	ENDIF
	
ENDEVENT
