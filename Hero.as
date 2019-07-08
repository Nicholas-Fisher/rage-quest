package classes {

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import flash.utils.*;

	import dragonBones.Armature;
	import dragonBones.Bone;
	import dragonBones.events.AnimationEvent;
	import dragonBones.factories.StarlingFactory;
	

	public class Hero extends ArmatureCombatant {

		[Embed(source = "../hero.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;

		public var abils:Vector.<Vector.<Object>>;
		public var blueAbils:Vector.<Object>;
		public var redAbils:Vector.<Object>;
		public var greenAbils:Vector.<Object>;
		public var invisMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		public var bombMc:SuperMovieClip = new SuperMovieClip('bombMissle', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		public var bottleMc:SuperMovieClip = new SuperMovieClip('sodaMissle', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		public var packetMc:SuperMovieClip = new SuperMovieClip('packetMissle', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		private var handSwordTextures:Vector.<String> = new <String>["parts/handSword1", "parts/handSword2", "parts/handSword3", "parts/handSword4", "parts/handSword5", "parts/handSword6"];
		private var swordTextures:Vector.<String> = new <String>["parts/sword1", "parts/sword2", "parts/sword3", "parts/sword4", "parts/sword5", "parts/sword6"];
		private var shieldTextures:Vector.<String> = new <String>["parts/shield1", "parts/shield2", "parts/shield3", "parts/shield4", "parts/shield5", "parts/shield6"];

		public function Hero(){
			armatureName = "hero";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;			

			if(GV.arena.isSafe){
				passiveAbilities();
			}

			if(GV.arena.isTutorial){
				tutorialAbilities();
			}else{
				blueAbils = Assignables.assignedList('blue');
				redAbils = Assignables.assignedList('red');
				greenAbils = Assignables.assignedList('green');
				if(blueAbils.length > 0) slots[0].setAbility(firstAvailableAbil(blueAbils));
				if(redAbils.length > 0) slots[1].setAbility(firstAvailableAbil(redAbils));
				if(greenAbils.length > 0) slots[2].setAbility(firstAvailableAbil(greenAbils));	
				abils = new <Vector.<Object>>[blueAbils, redAbils, greenAbils];
			}

			//Assigning stats
			if(GV.arena.isTrainingArea){
				maxHp = hp = 1000;
				def = 1000;
			}else{
				maxHp = hp = GVP.stats.hp;
				def = GVP.stats.def;
			}

			if(GV.arena.isTutorial){
				pow = 20;
			}else{
				pow = GVP.stats.pow;
			}

			maxAp = ap = GVP.stats.ap;		
		}

		public function uniqueNullItAll():void{
			superNull(abils); abils = null;
			superNull(blueAbils); blueAbils = null;
			superNull(redAbils); redAbils = null;
			superNull(greenAbils); greenAbils = null;
			superNull(invisMc); invisMc = null;
			superNull(bombMc); bombMc = null;
			superNull(bottleMc); bottleMc = null;
			superNull(packetMc); packetMc = null;
			superNull(handSwordTextures); handSwordTextures = null;			
			superNull(swordTextures); swordTextures = null;
			superNull(shieldTextures); shieldTextures = null;
		}

		private function firstAvailableAbil(array:Vector.<Object>):Object{
			for(var i = 0; i < array.length; i++){
				if(array[i] != null){
					return array[i];
				}
			}
			return null;
		}
		
		public function changeSword(index:int):void {
		    changeBoneHelper("handSword", handSwordTextures[index]);
		    changeBoneHelper("sword", swordTextures[index]);
		}

		public function changeShield(index:int):void {		    
		    changeBoneHelper("shield", shieldTextures[index]);
		}

		private function uniqueArmatureComplete(e:AnimationEvent):void{
			switch(afterAnim){
				default:
					idleAnimation();
				break;
				case 'effects':					
					executeEffects();
				break;
				case 'rage':
					FX.showExplosion(x, y, 0.1);
					executeEffects();
				break;
				case 'moveBack':
					moveBackToOurTile(); 
					moveBack = false;
				break;
				case 'passiveIdle':
					armature.animation.gotoAndPlay("idle");
				break;
				case 'endAbility':
					endAbility();
				break;
			}
			afterAnim = null;
		}

		public function uniqueMovementAnimation():void{
			armature.animation.gotoAndPlay("run");
		}

		public function uniqueIdleAnimation():void{		
		if(reasonsToBlock){
				armature.animation.gotoAndPlay("blockIdle");					
			}else{
				armature.animation.gotoAndPlay("idle");					
			}				
		}

		public function uniqueHitAnimation():void{
			if(reasonsToBlock){
				FX.shield.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			}else{
				armature.animation.gotoAndPlay("hit");
			}
		}

		public function teleportAbility():void{
			armature.animation.gotoAndPlay("upwardPoint");
			afterAnim = null;
			setTimeout(function(){
				if(!GV.arena || !GV.arena.isActive) return;				
				FX.kaboom.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				FX.showParticleEffect(FX.poofPool, x, y, 0.1);
				FX.showParticleEffect(FX.shoopExplosionPool, x, y, 0.1);
				moveToPos(currTarg, true);
				FX.showParticleEffect(FX.poofPool, x, y, 0.1);
				FX.showParticleEffect(FX.shoopExplosionPool, x, y, 0.1);					
				armature.animation.gotoAndPlay("hit");
				afterAnim = null;				
			}, 800);		
		}

		public function castingAnimation():void{armature.animation.gotoAndPlay("upwardPoint");  FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx); afterAnim = 'effects';}
		public function victoryAnimation():void{armature.animation.gotoAndPlay("upwardPoint"); FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx); afterAnim = 'passiveIdle';}
		public function talkingAnimation():void{armature.animation.gotoAndPlay("talking"); afterAnim = 'passiveIdle';}
		public function projectileAnimation():void{armature.animation.gotoAndPlay("thrusting"); FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx);}
		public function shoopAnimation():void{
			speechBubble.showSpeech('SHOOP DA WHOOP');
			armature.animation.gotoAndPlay("thrusting"); 
			afterAnim = 'projectile';
		}
		public function blockingAnimation():void{armature.animation.gotoAndPlay("block"); afterAnim = 'effects';}
		public function attackAnimation():void{armature.animation.gotoAndPlay("attack"); afterAnim = 'moveBack'; FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx);}
		public function attackAnimationForConvo():void{armature.animation.gotoAndPlay("attack"); afterAnim = 'passiveIdle'; FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx);}
		public function thrustAnimation():void{armature.animation.gotoAndPlay("thrusting"); afterAnim = 'moveBack'; FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx);}
		public function actionAnimation():void{armature.animation.gotoAndPlay("sheathing"); afterAnim = 'effects';}
		public function leroyAnimation():void{
			speechBubble.showSpeech('LEEERROOOOY~ JEEEENKINS!');
			setTimeout(executeEffects, 1000);
		}

		public function rageAnimation():void{
			armature.animation.gotoAndPlay("upwardPoint"); afterAnim = 'rage';
		}

		public function hateAbsorbAnimation():void{			
			hitAnimation();
			FX.showParticleEffect(FX.hateSwirlPool, x, y, 2.0);
		}

		public function passiveAbilities():void {
			
			idleAnimation = uniqueIdleAnimation;

			GV.arena.redBtn.hideAp();
			GV.arena.blueBtn.hideAp();
			GV.arena.greenBtn.hideAp();
			GV.arena.redBtn.hideStock();
			GV.arena.blueBtn.hideStock();
			GV.arena.greenBtn.hideStock();

			slots[0].setAbility({

				gameName: 'Move',
				pic: 'runIcon',

				abilityRange: 5,
				abilitySelectType: 'eight-way',
				deselectCombatants: true,
				charge: 0,
				cooldown: 0,
				ability: 'movementAbility',
				abilityAnimation: 'movementAnimation'
			});

			slots[1].setAbility({

				gameName: 'Action',
				pic: 'actionIcon',

				abilityRange: 1,
				abilitySelectType: 'eight-way',
				effectType: 'action',
				effectRange: 0,
				charge: 0,
				cooldown: 0,
				ability: 'instantAbility',
				abilityAnimation: 'actionAnimation'
			});

			slots[2].setAbility(null);

			resetAll();
		}

		public function tutorialAbilities():void {
			blueAbils = new <Object>[Assignables.abilityData.runAbil, Assignables.abilityData.sprintAbil];
			redAbils = new <Object>[Assignables.abilityData.attackAbil, Assignables.abilityData.lagSpikeAbil];
			greenAbils = new <Object>[Assignables.abilityData.blockAbil, Assignables.abilityData.parryAbil];
			if(blueAbils.length > 0) slots[0].setAbility(firstAvailableAbil(blueAbils));
			if(redAbils.length > 0) slots[1].setAbility(firstAvailableAbil(redAbils));
			if(greenAbils.length > 0) slots[2].setAbility(firstAvailableAbil(greenAbils));	
			abils = new <Vector.<Object>>[blueAbils, redAbils, greenAbils];			
		}

		public function obstacleAbilities():void {

			idleAnimation = uniqueIdleAnimation;

			GV.arena.redBtn.hideAp();
			GV.arena.blueBtn.hideAp();
			GV.arena.greenBtn.hideAp();
			GV.arena.redBtn.hideStock();
			GV.arena.blueBtn.hideStock();
			GV.arena.greenBtn.hideStock();

			slots[0].setAbility({

				gameName: 'Move',
				pic: 'runIcon',

				// Selection
				abilityRange: 2,
				goesThroughThings: true,
				abilitySelectType: 'eight-way',
				deselectCombatants: true,

				// Universal
				charge: 3,
				cooldown: 0,
				ability: 'movementAbility',
				abilityAnimation: 'movementAnimation'
			});

			slots[1].setAbility({

				gameName: 'Move',
				pic: 'runIcon',

				// Selection
				abilityRange: 2,
				goesThroughThings: true,
				abilitySelectType: 'eight-way',
				deselectCombatants: true,

				// Universal
				charge: 5,
				cooldown: 0,
				ability: 'movementAbility',
				abilityAnimation: 'movementAnimation'
			});

			slots[2].setAbility({

				gameName: 'Move',
				pic: 'runIcon',

				// Selection
				abilityRange: 2,
				goesThroughThings: true,
				abilitySelectType: 'eight-way',
				deselectCombatants: true,

				// Universal
				charge: 7,
				cooldown: 0,
				ability: 'movementAbility',
				abilityAnimation: 'movementAnimation'
			});
		}

		private function resetAll():void{
			for(var k:int = 0; k < GV.SLOT_NUM; k++){
	        	if(slots[k].pointer) slots[k].pointer.visible = false;	        	
	        	if(slots[k].abilityTimer) slots[k].abilityTimer.visible = false;
				if(slots[k].barContainer) slots[k].barContainer.visible = false;
				slots[k].cooldown = 0;
				slots[k].charge = 0;
				GV.arena.getActionButton(k).hideLock();
        		removeEventListener(starling.events.Event.ENTER_FRAME, slots[k].cooldownAbilityFunc);
        		removeEventListener(starling.events.Event.ENTER_FRAME, slots[k].chargeAbilityFunc);
        	}
		}

		public function uniqueRunAfterInit():void{
			var weaponObj:Object = Assignables.returnObjectInSlot('equipped:weapon');
			if(weaponObj){
				changeSword(weaponObj.dragonBonesPosition);
				pow += weaponObj.powChange;
				statUnit.powText.text = pow.toString();
			}

			var shieldObj:Object = Assignables.returnObjectInSlot('equipped:shield');
			if(shieldObj){
				changeShield(shieldObj.dragonBonesPosition);
				def += shieldObj.defChange;
				statUnit.defText.text = def.toString();
			}
			GV.arena.specialsVector.length = 0;
			GV.arena.specialsVector.push(weaponObj.special);
			GV.arena.specialsVector.push(shieldObj.special);
			GV.arena.alwaysFlatTextContainer.flatten();

			if(pos[0] > GV.TILE_X/2){
				faceLeft();
			}else {
				faceRight()
			}
			shadowHeight = 55;			
			shadow.width = width;
			centerShadow();

			if(GV.arena.specialCheck(GV.HACK_AP_REDUCTION)){
				Assignables.abilityData.lowerDefenseAbil.ap = 0;
			}else{
				Assignables.abilityData.lowerDefenseAbil.ap = 2;
			}
		}

		override protected function centerShadow():void{	
			if(facing == 1){
				shadow.x = x + 8;
			}else{
				shadow.x = x - 5;			
			}
			shadow.y = y + shadowHeight;
		}
	}
}
