package classes {

	import classes.FFParticleSystem.FFParticleSystem;
	import starling.events.Event;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.utils.HAlign;
    import starling.animation.Tween;
    import starling.animation.Transitions;
    import flash.utils.*;
	
	public class Combatant extends Sprite {

		include 'nonClasses/Movement.as';
		include 'nonClasses/AI.as';
		include 'nonClasses/Utility.as';
		include 'nonClasses/Pathfinding.as';
		include 'nonClasses/AbilityMethods.as';
		include 'nonClasses/FXAssigner.as'

		public var reasonsToBlock:int = 0;
		public var movementAnimation:Function;
		public var idleAnimation:Function;
		public var hitAnimation:Function;
		public var deathAnimation:Function;
		public var runAfterInit:Function;
		public var moveSoundStop:Function;
		public var moveSoundPlay:Function;
		public var decNullItAll:Function;
		public var conversationAvatar:Combatant;
		public var ai:Function;
		public var heuristicFunc:Function = customHeuristic;
		public var conversation:String;
		public var id:int;
		public var lvl:int = 1;
		public var maxHp:int;
		public var maxAp:int;
		public var hp:int;
		public var ap:int;
		public var pow:int;
		public var def:int;
		public var dot:int = 0;
		public var damageReturn:Number = 0;
		public var statUnit:StatUnit;
		public var xd:int;
		public var yd:int;		
		public var initialSkewY:Number;
		public var angle:Number;
		public var distance:Number;
		public var targHpChange:int;
		public var targDefChange:int;
		public var targpowChange:int;
		public var rewardPoints:int;
		public var canBeTalkedTo:Boolean = true;
		public var pos:Array = new Array(2);
		public var slots:Vector.<Slot> = new Vector.<Slot>(3);
		public var statusMessages:Vector.<SuperText> = new Vector.<SuperText>();
		public var tempAbilTimers:Vector.<TempAbilTimer> = new Vector.<TempAbilTimer>();
		public var fadeStatusMessageFuncs:Vector.<Function> = new Vector.<Function>();
		public var allAbilities:Array  = new Array();
		public var isProtectee:Boolean = false;
		public var isSummon:Boolean = false;
		public var isSimple:Boolean = false;
		public var isEnemy:Boolean = false;
		public var isSpawn:Boolean = false;
		public var isDead:Boolean = false;
		public var isHero:Boolean = false;
		public var isFlat:Boolean = false;
		public var alreadyPreDisposed:Boolean = false;
		public var startedCurrAction:Boolean = false;
		public var doNotActivateMovementAugs:Boolean = false;		
		public var isNotTurner:Boolean = false;
		public var tilePositionOffset:int;
		public var targetPixelX:int; // pixel location of destination
		public var targetPixelY:int;
		public var ourTile:Tile;
		public var speechBubble:SpeechBubble = new SpeechBubble(Combatant(this));
		public var missed:Boolean = true;
		public var unitType:String;
		public var slotForCurrentAction:Slot;
		public var myParticleEffect:FFParticleSystem;
		public var noEndActionDelay:Boolean = false;

		private var currStatusIndex:int = 0;
		private var fadeRate:Number;
		private var baseX:int;
		private var baseY:int;
		private var usingMelee:Boolean = false;
		private var indicatorTween:Tween;

		protected var particleEffect:FFParticleSystem;
		protected var colorIndicatorContainer:Sprite;
		protected var sContainer:Sprite = new Sprite;
		protected var blocking:Boolean = false;
		protected var shadowHeight:Number;
		protected var indicatorHeight:Number;
		protected var currTarg:Array;
		protected var shadow:SuperImage = new SuperImage('shadowWithBlur0000', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		protected var colorIndicator:SuperImage;
		protected var facing:int = 1; // Pos for left, neg for right.
		protected var isArmature:Boolean = false;
		protected var faceOppositeDirectionAfterMoving:Boolean = false;
		protected var introMessage:String;
		protected var currentState:SuperMovieClip; // Used by combatants with only one moving part.
		protected var floats:Boolean = false;
		protected var grows:Boolean = false;
		protected var hitPool:SpritePool;
		protected var hitEffectTime:Number;
		protected var trailP:FFParticleSystem;
		protected var movementTrailPool:SpritePool;
		protected var projectileTrailPool:SpritePool;
		protected var trailInterval:Number;
		protected var removeTrailTimeout:Number;
		protected var isCurrTrailConstant:Boolean = false;
		protected var trailSpacing:int;

		protected static const MAX_TRAIL_LENGTH:int = 10;
		protected static const TRAIL_FADE_TIME:int = 2000;
		protected static const BLUE:int = 0;
		protected static const RED:int = 1;
		protected static const GREEN:int = 2;
		protected static const STATUS_MSG_WIDTH = 300;
		protected static const STATUS_MSG_HEIGHT = 25;
		protected static const STATUS_MSG_NUM = 3;
		protected static const MOVEMENT_SPEED:int = 5;

		private  const SUMMON_STAT_UNIT_ID = 5;

		public function Combatant(){

			unitType = getQualifiedClassName(this).substring(9);
			
			if(!GV.arena || !GV.arena.isActive) return;

			speechBubble.touchable = false;

			isHero = (unitType == 'Hero');			
			isSimple = (unitType == 'TimeBomb' || unitType == 'Wall' || unitType == 'Trap');
			isSummon = (unitType == 'CourageWolf' || unitType == 'AdBlock' || unitType == 'ClickBait' || unitType == 'TwitchChat');
			isFlat = (unitType == 'AdBlockEnemy' || unitType == 'AdBlock' || unitType == 'Spambot' || unitType == 'YoutubeComment' || unitType == 'FakeNews' || unitType == 'UserData' || unitType == 'Censor' || unitType == 'Mobling' || unitType == 'TwitchChat' || unitType == 'TwitchChatEnemy');
			isNotTurner = (unitType == 'Judgment' || unitType == 'Gamergate' || unitType == 'HiveMind' || unitType == 'ClickBait');
			isEnemy = (!isHero && !isSummon && !isSimple);
			if(isEnemy) GV.arena.currEnemyNum++;			

			id = GV.arena.objectCount++;
			if(isSummon) GV.arena.summon = this;

			for (var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){
				slots[i] = new Slot(i, Combatant(this));
			}

			for(var j:int = 0; j < STATUS_MSG_NUM; j++){
				statusMessages[j] = new SuperText(STATUS_MSG_WIDTH, STATUS_MSG_HEIGHT, '', GV.FONT_1, GV.HUD_FONT_SIZE, GV.STS_RED, 'center', 'speech_bubble');
				statusMessages[j].addBackground();
				statusMessages[j].pivotX = 150;
				statusMessages[j].pivotY = 50;
				statusMessages[j].alpha = 0;
				statusMessages[j].hAlign = starling.utils.HAlign.CENTER;
			}

			fadeStatusMessageFuncs[0] = function():void{fadeStatusMessage(0);}
			fadeStatusMessageFuncs[1] = function():void{fadeStatusMessage(1);}
			fadeStatusMessageFuncs[2] = function():void{fadeStatusMessage(2);}
		}

		public function init(type:int = 0):void{

			var showCombatStuff:Boolean =  true;
			var moveToPosition:Boolean = true;

			addChild(sContainer);

			switch(type){
				case 1:
					showCombatStuff = false;
					moveToPosition = false;

				break;
				case 2:
					showCombatStuff = false;
					moveToPosition = true;
				break;
			}

			if(showCombatStuff){			
				if (!GV.arena.isSafe){
					if(!isHero){
						statsAssigner();
						abilityAssigner();
					}
				}
				if(!isSimple){
					if(isHero){
						statUnit = new StatUnit(-1, true);
					}else{
						if(isSummon){
							statUnit = new StatUnit(SUMMON_STAT_UNIT_ID);
						}else{
							statUnit = GV.arena.getAvailableStatUnit();
						}
					}
					if(!GV.arena.isSafe || isHero) statUnit.setup(this);
				}
			}

			fxAssigner();
			runAfterInit = (hasOwnProperty('uniqueRunAfterInit')) ? this['uniqueRunAfterInit'] : function():void{}
			movementAnimation = (hasOwnProperty('uniqueMovementAnimation')) ? this['uniqueMovementAnimation'] : function():void{};
			idleAnimation = (hasOwnProperty('uniqueIdleAnimation')) ? this['uniqueIdleAnimation'] : function():void{};
			hitAnimation = (hasOwnProperty('uniqueHitAnimation')) ? this['uniqueHitAnimation'] : defaultHitAnimation;
			deathAnimation = (hasOwnProperty('uniqueDeathAnimation')) ? this['uniqueDeathAnimation'] : defaultdeathAnimation;
			moveSoundPlay = (hasOwnProperty('uniqueMoveSoundPlay')) ? this['uniqueMoveSoundPlay'] : defaultMoveSoundPlay;
			moveSoundStop = (hasOwnProperty('uniqueMoveSoundStop')) ? this['uniqueMoveSoundStop'] : defaultMoveSoundStop;
			decNullItAll =  (hasOwnProperty('uniqueNullItAll')) ? this['uniqueNullItAll'] : function():void{};
			if(!isHero) ai = (hasOwnProperty('uniqueAi')) ? this['uniqueAi'] : function():void{};

			if(moveToPosition) moveToPos(pos, true);

			if (!isArmature){
				idleAnimation();
				pivotX = width >> 1;
				pivotY = height >> 1;
				if(GV.arena && GV.arena.isActive) {
					addToStage();
				}else{					
					GV.sc.addChild(this);							
				}
			}
				
			if(floats) initFloatTween();
			if(grows) initSizeTween();	

			if(GV.arena && GV.arena.isActive && !GVP.options.condensedHUD){
				GV.arena.onToggleClick(false);
			}	
		}

		public function addToStage():void{
			
			indicatorHeight = height/1.8 + 40;
			if(unitType === 'Gamergate'){
				indicatorHeight = 90;
			}
			tilePositionOffset = height/2.25;
			shadowHeight = height/2.3;
			shadow.width = width*1.35;
			centerThis();

			if (introMessage && pos[1] > 0) speechBubble.showSpeech(introMessage);
			if (unitType != 'Bloatware') faceHero(); // I forgot why I did this, something to do with xScale.
			
			if(!GV.arena.isSafe && statUnit){
				if(statUnit.id != -1){
					colorIndicatorContainer = new Sprite();
					colorIndicatorContainer.x = x;
					colorIndicatorContainer.y = y - indicatorHeight;
					colorIndicator = new SuperImage('colorIndicator000' + (statUnit.id), GV.COMBATANT_SPRITESHEET, 0, 0, true);
					colorIndicatorContainer.addChild(colorIndicator);

					if(!floats){

						indicatorTween = new Tween(colorIndicator, 0.85, "SINE");

						indicatorTween.repeatCount = 0;
						indicatorTween.reverse = true;
						indicatorTween.animate('y', colorIndicator.y - 6);

						GV.s.juggler.add(indicatorTween);
					}
					GV.arena.aboveCombatantContainer.addChild(colorIndicatorContainer);
				}
			}

			GV.arena.combatantContainer.addChild(this);
			GV.arena.belowCombatantContainer.addChild(shadow);
			runAfterInit();
			if(!isSimple) FX.showParticleEffect(FX.poofPool, x, y, 0.1);
		}

		public function defaultMoveSoundPlay():void{
			if(floats){
				FX.playHoverMove();
			}else{
				FX.runSound1Play();
			}
		}
		public function defaultMoveSoundStop():void{
			if(floats){
				FX.stopHoverMove();
			}else{
				FX.runSound1Stop();
			}
		}

		protected function centerShadow():void{	
			shadow.x = x;
			shadow.y = y + shadowHeight;
			if(floats) shadow.y += 15;
		}

		protected function centerIndicator():void{	
			if(colorIndicatorContainer){	
				colorIndicatorContainer.x = x;
				colorIndicatorContainer.y = y - indicatorHeight;
			}
		}

		public function faceHero():void{
			if(!GV.arena || !GV.arena.isActive) return;
			if(GV.arena.hero.pos[0] == pos[0]){
				if(GV.arena.hero.pos[1] < pos[1]){
					faceRight();	
				}else{
					faceLeft();
				}
			}else if(GV.arena.hero.pos[0] < pos[0]){
				faceLeft();
			}else{
				faceRight();
			}			
		}

		public function startAbility(slot:Slot, t:Array = null):void{
			if(slot.startable && (isHero || !slot.isCharging)){		
				if(isHero){
					if(!canUseAbility(slot)) return;
					FX.abilityTargetedSound.play(GV.AUDIO_START_TIME, 0, GV.sfx);
					if(slot.selfTargeting){
						GV.arena.getTile(pos).setTargetedAbilityPicture(slot.id);
					}else{
						GV.arena.getTile(t).setTargetedAbilityPicture(slot.id);
					} 
				}	
				if (GV.ONE_SHOT_ABILS) {
					if (isHero) GV.arena.getActionButton(slot.id).showLock();
					slot.startable = false;
					slot.isCharging = true;
				}
				slot.charge = slot.chargeTime;
				slot.cooldown = slot.cooldownTime;				
				if(!slot.selfTargeting && t){
					slot.targ = t;
				}else{
					slot.targ = null;
				}				
				if(slot.abilityTimer) slot.abilityTimer.charge();
				pointToLocation(slot, t); 
				addEventListener(starling.events.Event.ENTER_FRAME, slot.chargeAbilityFunc);
			}
		}

		private function pointToLocation(slot:Slot, t:Array):void{
			if(!GV.arena || !GV.arena.isActive) return;			
			if(slot.charge > 0){	
				if (!slot.targ || areEqual(slot.targ, pos) || !GVP.options.showPointers){
					slot.barContainer.visible = true;
					slot.pointer.visible = false;
					positionBars();
				}else{
					slot.barContainer.visible = false;
					slot.pointer.visible = true;
					var xd:int = GV.arena.tileX(pos) - GV.arena.tileX(t);
					var yd:int = GV.arena.tileY(pos) - GV.arena.tileY(t);
					var angle:Number = Math.atan2(yd, xd);
					var distance:Number = Math.round(Math.sqrt(Math.pow(xd,2) + Math.pow(yd,2)));
					var degrees:Number = angle;
					slot.pointer.rotation = degrees;
					slot.pointer.x = GV.arena.tileX(pos);
					slot.pointer.y = GV.arena.tileY(pos);
					slot.pointer.scaleX = (0.01 * (distance));
				}
			}
		}
		

		private function positionBars():void{

			var actives:Array = new Array;
			var i:int;
			for (i = GV.SLOT_NUM -1; i >= 0; i--){
				if(slots[i].barContainer.visible == true){
					actives.push(i);
				}
			}
			for (i = 0; i < actives.length; i++){
				switch(i){
					case 0:
						slots[actives[i]].barContainer.x = ourTile.x + 11.25;
						slots[actives[i]].barContainer.y = ourTile.y + 103;	
					break;								
					case 1:
						slots[actives[i]].barContainer.x = ourTile.x + 16.85;
						slots[actives[i]].barContainer.y = ourTile.y + 94.4;	
					break;
					case 2:
						slots[actives[i]].barContainer.x = ourTile.x + 22.7;
						slots[actives[i]].barContainer.y = ourTile.y + 85.65;
					break;
				}
			}
		}

		private function chargeAbility(slot:Slot):void{
			if(!GV.arena || !GV.arena.isActive) return;
			if(!GV.arena.inAction && !GV.arena.paused){
				if(slot.markedForCooldown){
					endAbilityChargePhase(slot);
					if(slot.cooldownTime > 0){
						if(slot.abilityTimer) slot.abilityTimer.cooldown();	
						slot.barContainer.visible = true;
						positionBars();
					}
					addEventListener(starling.events.Event.ENTER_FRAME, slot.cooldownAbilityFunc);
					slot.markedForCooldown = false;
					return;
				}			
				if (slot.charge > 0){
					if(GV.arena.isTutorial) {
						if(isHero) {																					
							if (slot.id === 2 && Math.floor(slot.charge) === 2 && (GV.arena.currTutorialPhase === 6 || GV.arena.currTutorialPhase === 8)){
								GV.arena.tutorialPhase();
							}
							if (slot.id === 1 && Math.floor(slot.charge) === 1 && GV.arena.currTutorialPhase === 9){
								GV.arena.tutorialPhase();
							}								
						} else if (unitType === "YoutubeComment"){							
							if(slot.id === 0 && Math.floor(slot.charge) === 3 && GV.arena.currTutorialPhase === 2){
								GV.arena.tutorialPhase();
							}
							if(slot.id === 1){
								if (Math.floor(slot.charge) === 3 && GV.arena.currTutorialPhase === 4){
									GV.arena.tutorialPhase();
								}
							}
							if(slot.id === 2){
								if (Math.floor(slot.charge) === 9 && GV.arena.currTutorialPhase === 11){
									GV.arena.tutorialPhase();
								}
							}							
						}
					}				
					slot.timerTick();
				} else { // Start an ability for real, inAction check to prevent issues with 0 charge abilities.
					endAbilityChargePhase(slot)
					slotForCurrentAction = slot;
					if (cannotTargetLocation() || hp <= 0){ // Out of bounds.
						endAbility(false);
						GV.arena.aboveCombatantContainer.removeChild(GV.arena.heroAbilTargetPics[slotForCurrentAction.id]);
					} else {
						if(slot.speech) speechBubble.showSpeech(slot.speech);
						onAbilityCharge();
					}					
					GV.arena.alwaysFlatTextContainer.flatten();
					GV.arena.alwaysFlattenedContainer.flatten();
				}
			}
		}

		public function endAbilityChargePhase(slot:Slot):void{
			if(slot.isCharging){			
				removeEventListener(starling.events.Event.ENTER_FRAME, slot.chargeAbilityFunc);
				slot.charge = 0;
				slot.isCharging = false;
				slot.pointer.visible = false;
				slot.barContainer.visible = false;
			}
		}

		private function freeAbil():void{
			if (GV.ONE_SHOT_ABILS) {
				slotForCurrentAction.startable = true;
				slotForCurrentAction.isCharging = false;				
				GV.arena.getActionButton(slotForCurrentAction.id).hideLock();
			}
		}
		
		private function onAbilityCharge():void{
			if(!GV.arena || !GV.arena.isActive) return;

			var actionCanBeDone:Boolean = true;			
			var c:uint;
			
			switch(slotForCurrentAction.id){
				case 0: c = 0x00CCCC; break;
				case 1: c = 0xCC0000; break;
				case 2: c = 0x00CC00; break; 
			}
			
			if(slotForCurrentAction.gameName) statusMsg(slotForCurrentAction.gameName, c);

			if(isHero){						
				var obj:Object = slotForCurrentAction.o;
				GV.arena.aboveCombatantContainer.removeChild(GV.arena.heroAbilTargetPics[slotForCurrentAction.id]);
				if(!GV.arena.isTrainingArea){	
					if(obj.hasOwnProperty("stock")){					
						if(obj.stock > 0){
							obj.stock--;
							// If the ability to be set is the same as the ability which is already set for this slot or if there is no ability to be set for this slot
							if(!GV.arena.toBeSetAbilites[slotForCurrentAction.id] || GV.arena.toBeSetAbilites[slotForCurrentAction.id].objectName === obj.objectName){
								GV.arena.getActionButton(slotForCurrentAction.id).showStock(obj.stock);								
							}
							statusMsg('-1 stock', GV.STS_RED);
							if(obj.stock == 0){
								obj.objectStatus = null;
							}
							if(GV.arena.selectedSlot.id === slotForCurrentAction.id){
								GV.arena.refreshAbilBtns(slotForCurrentAction.id);
							}												
						}else{
							freeAbil();
							statusMsg('OUT OF STOCK', GV.STS_RED);
							FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
							actionCanBeDone = false;
							if(isHero){						
								GV.arena.setWaitingAbility(slotForCurrentAction.id);
								executeQueuedAction(slotForCurrentAction);
							}
						}
					}
					if(obj.hasOwnProperty("ap")){					
						if(ap >= slotForCurrentAction.ap){
							changeAp(-1 * slotForCurrentAction.ap)
						} else {
							freeAbil();
							statusMsg('NOT ENOUGH AP', GV.STS_RED);
							FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
							actionCanBeDone = false;
							if(isHero){						
								GV.arena.setWaitingAbility(slotForCurrentAction.id);
								executeQueuedAction(slotForCurrentAction);
							}
						}
					}
				}
			}
			if(actionCanBeDone){
				if(slotForCurrentAction.targ){
					currTarg = slotForCurrentAction.targ;
				}else{
					currTarg = pos;
				}
				slotForCurrentAction.startable = false;
				GV.arena.beginAction(this);
			}else{
				endAbility(false);
			}
		}

		public function afterBuffer():void{
			if(!GV.arena || !GV.arena.isActive) return;
			targetPixelX = GV.arena.tileX(currTarg);
			targetPixelY = GV.arena.tileY(currTarg,  tilePositionOffset);
			if(GV.arena.combatantContainer.contains(this) && unitType != 'Gamergate') GV.arena.combatantContainer.setChildIndex(this, GV.arena.combatantContainer.numChildren - 1); // Make this top most Combatant. 
			if(GV.arena.topBoy && GV.arena.combatantContainer.contains(GV.arena.topBoy)) GV.arena.combatantContainer.setChildIndex(GV.arena.topBoy, GV.arena.combatantContainer.numChildren - 1);
			if(slotForCurrentAction) slotForCurrentAction.ability();
		}

		protected function cooldownAbility(slot:Slot):void{
			if(!GV.arena || !GV.arena.isActive) return;
			if(!GV.arena.inAction && !GV.arena.paused){					
				if (slot.cooldown > 0){ 
					slot.timerTick();
				}else{ // Cooldown finished
					removeEventListener(starling.events.Event.ENTER_FRAME, slot.cooldownAbilityFunc);
					slot.cooldown = 0;
					if(slot.abilityTimer) slot.abilityTimer.neutral();
					if(slot.id === 2 && unitType === "FakeNews"){
						GV.arena.alwaysFlattenedContainer.visible = true;
						GV.arena.alwaysFlatTextContainer.visible = true;
					}
					if(slot.id === 2 && unitType === "Censor"){
						GV.arena.hideCensor();
					}
					slot.startable = true;
					slot.barContainer.visible = false;
					positionBars();
					if(isHero){
						GV.arena.getActionButton(slot.id).hideLock();
						GV.arena.setWaitingAbility(slot.id);
						executeQueuedAction(slot);						
					}
					if(isSimple){
						startAbility(slot); // All simple combatants just loop their abilities endlessly.
					}else{
						GV.arena.runAI();
					}
				}
			}
		}

		private function executeQueuedAction(slot:Slot): void {
			if (!GV.arena.isSafe) {
				if (slot.hasAbilityQueued) {
					startAbility(slot, slot.queuedAbilTarg);
					GV.arena.getTile(slot.queuedAbilTarg).clearQueueMarker(slot.id);
					slot.hasAbilityQueued = false;
					slot.queuedAbilTarg = null;
				} else {
					FX.slotReadySound.play(GV.AUDIO_START_TIME, 0, GV.sfx);
					var btn:ActionButton = GV.arena.slotBtns[slot.id];
					GV.s.juggler.tween(btn.btn, 0.25, {
						transition: Transitions.EASE_OUT,
						reverse: true,
						repeatCount: 2,
						scaleX: 1.25,
						scaleY: 1.25,
						onComplete: function(): void { btn.btn.scaleX = btn.btn.scaleY = 1; }
					});
				}
			}
		}

		private function canUseAbility(s:Slot):Boolean{

			var canUse:Boolean = true;
			var obj:Object = s.o;

			if(obj.hasOwnProperty("stock") && obj.stock == 0){
				statusMsg('OUT OF STOCK', GV.STS_RED);
				FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				canUse = false;
			}
			return canUse;
		}

		public function cannotTargetLocation():Boolean{

			var ret:Boolean = false;
			if(GV.arena && !slotForCurrentAction.selfTargeting){
				GV.arena.selectTiles('targetCheck', pos, slotForCurrentAction);
				if(!GV.arena.getTile(slotForCurrentAction.targ).isSelected){ // Target is not currently within abilities selectable scope.					
					if(slotForCurrentAction.abilityRange && slotForCurrentAction.abilityRange < distanceBetween(pos, slotForCurrentAction.targ)){
						statusMsg('OUT OF RANGE', GV.STS_RED);
					} else {
						statusMsg('CANNOT TARGET THERE', GV.STS_RED);
					}				
					FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
					freeAbil();
					if(isHero){						
						GV.arena.setWaitingAbility(slotForCurrentAction.id);
						executeQueuedAction(slotForCurrentAction);
					}
					ret = true;
				}
			}
			return ret;
		}

		public function statusMsg(msg:String, color:uint, big:Boolean = false){

			if(msg != '' && !isSimple){
				var lowestAlphaIndex:int = statusCycle();
				var msgY:int = y - height/2;
				if(unitType === 'Gamergate'){
					msgY = y - 80;
				}
				var lastMsg = lowestAlphaIndex - 1 == -1 ? 2 : lowestAlphaIndex - 1;
				var yDif:int;
				yDif = statusMessages[lastMsg].alpha > 0 ? msgY - statusMessages[lastMsg].y : STATUS_MSG_HEIGHT;
				yDif = (yDif < STATUS_MSG_HEIGHT) ? STATUS_MSG_HEIGHT - yDif : 0;
				for(var i:int = 0; i < statusMessages.length; i++){
					if(i != lowestAlphaIndex) statusMessages[i].y -= yDif;
				}
				var s:SuperText = statusMessages[lowestAlphaIndex];
				s.color = color;
				s.text = msg;
				s.alpha = 1;
				s.x = x;
				s.y = msgY;
				s.visible = true;
				var balloonSize = big ? 2 : 1.5;
				s.scaleX = s.scaleY = 1;
				GV.s.juggler.tween(s, 0.25, {
				   	transition: Transitions.EASE_OUT,
				   	reverse: true,
				   	repeatCount: 2,
				   	scaleX: balloonSize,
				   	scaleY: balloonSize,
				   	onComplete: function():void{s.scaleX = s.scaleY = 1;}
				});

				addEventListener(starling.events.Event.ENTER_FRAME, fadeStatusMessageFuncs[lowestAlphaIndex]);
			}
		}

		private function statusCycle():int{
			currStatusIndex++;
			if(currStatusIndex == STATUS_MSG_NUM) currStatusIndex = 0;
			return currStatusIndex;
		}

		private function fadeStatusMessage(i:int):void{
			var s = statusMessages[i];
			if(s.alpha > 0){
				s.alpha -= 0.01 * GV.speedFactor;
				s.y -= 0.5 * GV.speedFactor;
			}else{
				s.alpha = 0;
				s.visible = false;
				removeEventListener(Event.ENTER_FRAME, fadeStatusMessageFuncs[i]);
			}
		}

		public function effect(e:String){
			if(!GV.arena || !GV.arena.isActive) return;			
			switch(e){
				case 'hpDown':
					if(!GV.arena.isSafe){
						FX.showParticleEffect(hitPool, x, y, hitEffectTime);
					}
				break;
				case 'hpUp':
					FX.showParticleEffect(FX.healPool, x, y, 0.5);
				break;
				case 'apUp':
					FX.showParticleEffect(FX.apUpPool, x, y, 0.1);
				break;
				case 'apDown':
					FX.showParticleEffect(FX.apDownPool, x, y, 0.1);
				break;
				case 'powUp':
					FX.showParticleEffect(FX.powUpPool, x, y, 0.5);
				break;
				case 'powDown':
					FX.showParticleEffect(FX.powDownPool, x, y, 0.5);
				break;
				case 'defUp':
					FX.showParticleEffect(FX.defUpPool, x, y, 0.5);
				break;
				case 'defDown':
					FX.showParticleEffect(FX.defDownPool, x, y, 0.5);
				break;
				case 'timeUp':
					FX.showParticleEffect(FX.stunPool, x, y - height/2 + 5, 0.25);
				break;
				case 'timeDown':
					FX.showParticleEffect(FX.stunPool, x, y, 0.25);
				break;
			}
		}

		public function faceLeft():void{
			if(isNotTurner) return;
			if(isFlat){			
				facing = 1;
				skewY = 0.5;
				shadow.skewY = skewY;
			}else{
				facing = 1; scaleX = Math.abs(scaleX);
			}
		}
		public function faceRight():void{
			if(isNotTurner) return;
			if(isFlat){			
				facing = -1;
				skewY = -0.5;
				shadow.skewY = skewY;
			}else{
				facing = -1; scaleX = Math.abs(scaleX)*-1;
			}
		}
		public function faceOppositeDirection():void{
			if(isNotTurner) return;
			if(isFlat){	
				if(facing > 0){
					facing = -1;
					skewY = -0.5;
				}else{
					facing = 1;
					skewY = 0.5;
				}
				skewX = 0.5*facing*-1;
				shadow.skewY = skewY;
				shadow.skewX = skewX;
			}else{
				scaleX *=-1;
			}
		}

		public function currentDirection():int{return scaleX/Math.abs(scaleX);}
		
        public function preDispose(){
        	if(!alreadyPreDisposed){    		
	        	alreadyPreDisposed = true;
	        	var i:int;
	        	endTrailEffect();
	        	removeStatusMsgs();
	        	GV.s.juggler.removeTweens(this);
				for(i = 0; i < GV.SLOT_NUM; i++){
					if(slots[i]){
						GV.arena.aboveCombatantContainer.removeChild(slots[i].pointer);	
						GV.arena.belowCombatantContainer.removeChild(slots[i].barContainer);
					}		        				
	        	}
				removeEventListeners(Event.COMPLETE);
	      		removeEventListeners(Event.ENTER_FRAME);
	      		removeEventListeners(Event.ADDED_TO_STAGE);
	        	for (i = 0; i < numChildren; i++) {
	        		var curr:DisplayObject = getChildAt(i);
	      			curr.removeEventListeners(Event.COMPLETE);
	      			curr.removeEventListeners(Event.ENTER_FRAME);
	      			curr.removeEventListeners(Event.ADDED_TO_STAGE);
				}
	        	removeEventListeners(Event.ENTER_FRAME);
	        	if(GV.arena){
	        		GV.arena.aboveCombatantContainer.removeChild(speechBubble);
	        		GV.arena.aboveCombatantContainer.removeChild(colorIndicatorContainer);
	        		GV.arena.belowCombatantContainer.removeChild(shadow);
	        	}
	        	for(i = 0; i < tempAbilTimers.length; i++){
					if(tempAbilTimers[i]){				
						tempAbilTimers[i] = null;
					}
				}

				if (hasOwnProperty("armatureNullItAll")) this['armatureNullItAll']();
				clearInterval(trailInterval);
				setTimeout(nullItAll, 20);
        	}
        }

        public function nullItAll():void{
        	
			if(statUnit) statUnit.nullItAll();
			setTimeout(function():void{statUnit = null;}, 20);

			var i:int;
			for(i = 0; i < GV.SLOT_NUM; i++){
				if(slots[i]){
					slots[i].nullItAll();
				}	        	
        	}

        	setTimeout(function():void{
        		for(i = 0; i < GV.SLOT_NUM; i++){
        			if(slots[i]){
	        			slots[i] = null;
	        		}
        		}
        		setTimeout(function():void{slots = null;}, 20);
    		}, 20);

			superNull(movementAnimation); movementAnimation = null;
			superNull(idleAnimation); idleAnimation = null;
			superNull(hitAnimation); hitAnimation = null;
			superNull(deathAnimation); deathAnimation = null;
			superNull(runAfterInit); runAfterInit = null;
			superNull(moveSoundStop); moveSoundStop = null;
			superNull(moveSoundPlay); moveSoundPlay = null;
			superNull(ai); ai = null;
			superNull(heuristicFunc); heuristicFunc = null;
			superNull(shadow); shadow = null;
			superNull(speechBubble); speechBubble = null;
			superNull(colorIndicatorContainer); colorIndicatorContainer = null;
			superNull(pos); pos = null;
			superNull(statusMessages); statusMessages = null;
			superNull(fadeStatusMessageFuncs); fadeStatusMessageFuncs = null;
			superNull(tempAbilTimers); tempAbilTimers = null;
			superNull(allAbilities); allAbilities = null;
			superNull(ourTile); ourTile = null;
			superNull(speechBubble); speechBubble = null;
			superNull(indicatorTween); indicatorTween = null;
			superNull(colorIndicatorContainer); colorIndicatorContainer = null;
			superNull(sContainer); sContainer = null;
			superNull(shadow); shadow = null;
			superNull(colorIndicator); colorIndicator = null;
			superNull(slotForCurrentAction); slotForCurrentAction = null;
			superNull(currentState); currentState = null;
			superNull(hitPool); hitPool = null;
			superNull(trailP); trailP = null;
			superNull(movementTrailPool); movementTrailPool = null;
			superNull(projectileTrailPool); projectileTrailPool = null;			
			decNullItAll();
        }

        public function removeStatusMsgs():void{
        	if(!GV.arena || !GV.arena.isActive) return;
        	var i:int;
			for(i = 0; i < statusMessages.length; i++){
        		GV.arena.speechBubbleContainer.removeChild(statusMessages[i]);
				removeEventListener(Event.ENTER_FRAME, fadeStatusMessageFuncs[i]);
        	}
        }

		public function defaultdeathAnimation():void{
			genericFade();
		}

		public function defaultHitAnimation():void{
			if(blocking){
				FX.shield.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			}else{
				shakeAnimation(200, false);
			}
		}

		public function genericFade(_fadeRate:Number = 0.025):void{
			fadeRate = _fadeRate;
			addEventListener(starling.events.Event.ENTER_FRAME, genericFaderOnFrame);
		}

		public function genericFaderOnFrame():void{
			if(alpha > 0){
				alpha -= fadeRate * GV.speedFactor;
			}else{
				alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFaderOnFrame);
				GV.arena.combatantDispose(this);
			}
		}

		protected function introMessageRandomizer(strArray:Vector.<String>):String{
			if(!GV.arena || !GV.arena.isActive) return null;
			var rand:int = Math.ceil(Math.random()*strArray.length) - 1;
			setTimeout(function(){
				if(GV.arena && GV.arena.isActive && Math.random() < 0.5 && !GV.arena.isSafe && !GV.arena.conversationStarter) return strArray[rand];
			}, 100);
			return null;
		}

		public function initFloatTween(){
			
			var t:Sprite = sContainer;
			var rand:String = id%2 == 0 ? '' : 'NEG';
			var floatTween:Tween = new Tween(t, 0.85, "SINE" + rand);
			var shadowTween:Tween = new Tween(shadow, 0.85, "SINE" + rand);

			floatTween.repeatCount = 0;
			floatTween.reverse = true;
			floatTween.animate('y', t.y - 6);

			centerShadow();
			shadowTween.repeatCount = 0;
			shadowTween.reverse = true;
			shadowTween.animate('scaleX', shadow.scaleX - (Math.abs(scaleX)/scaleX)*0.15);
			shadowTween.animate('scaleY', shadow.scaleY - 0.15);

			if(colorIndicator){
				var indicatorTween:Tween = new Tween(colorIndicator, 0.85, "SINE" + rand);
				indicatorTween.repeatCount = 0;
				indicatorTween.reverse = true;
				indicatorTween.animate('y', colorIndicator.y - 6);
				GV.s.juggler.add(indicatorTween);
			}
			
			GV.s.juggler.add(floatTween);
			GV.s.juggler.add(shadowTween);
		}

		public function initSizeTween():void{

			var t:Sprite = sContainer;
			var sizeTween:Tween = new Tween(t, 0.85, "SINE");
			var shadowTween:Tween = new Tween(shadow, 0.85, "SINE");
			const SCALE:Number = 0.3;

			sizeTween.repeatCount = 0;
			sizeTween.reverse = true;
			sizeTween.animate('scaleX', t.scaleX + SCALE);
			sizeTween.animate('scaleY', t.scaleY + SCALE);

			centerShadow();
			shadowTween.repeatCount = 0;
			shadowTween.reverse = true;
			shadowTween.animate('scaleX', shadow.scaleX + 2*SCALE);
			shadowTween.animate('scaleY', shadow.scaleY + 2*SCALE);

			GV.s.juggler.add(sizeTween);
			GV.s.juggler.add(shadowTween);
		}

		protected function displayAnimation(animation:SuperMovieClip, designation:SuperMovieClip = null):void{
			GV.s.juggler.remove(designation);
			sContainer.removeChild(designation);
			GV.s.juggler.add(animation);
			sContainer.addChild(animation);
			animation.stop();
			animation.play();
			if (currentState) currentState = animation;
		}

		protected function changeAnimation(newAnimation:SuperMovieClip):void{
			displayAnimation(newAnimation, currentState);
			currentState = newAnimation;
		}

		public function shakeAnimation(ms:int = 1000, executeEffectsAfter:Boolean = true):void{
			addEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
			baseX = x;
			baseY = y;
			if(executeEffectsAfter && !GV.arena.isSafe){
				setTimeout(onshakeFinishWithEffects, ms);
			}else{
				setTimeout(onshakeFinish, ms);
			}
		}

		private function shakeOnFrame():void{
			x = baseX + (Math.random()*10 - 5);
			y = baseY + (Math.random()*10 - 5);
		}

		private function onshakeFinish():void{
			x = baseX;
			y = baseY;
			removeEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
		}

		private function onshakeFinishWithEffects():void{
			x = baseX;
			y = baseY;
			removeEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
			executeEffects();
		}

		public function perTurn():void{
			if(dot) changeHp(dot);
		}

		public function cleanTimerArray(){
			var i:int = 0;
			while(i < tempAbilTimers.length){
				if(tempAbilTimers[i] && tempAbilTimers[i].destroyFlag){
					tempAbilTimers[i] = null;
					tempAbilTimers.splice(i, 1);
				}else{
					i++;
				}
			}
		}
		public function removeSelfIfDead():void{
			if(isDead){		
				if(isSummon){
				 	GV.arena.summon = null;
				}
				releaseTile();
				if(statUnit && !GV.arena.isSafe) statUnit.makeFree();
				statUnit = null;
				if(!GV.arena.preDisposeStarted){				
					FX.death.play(GV.AUDIO_START_TIME, 0, GV.sfx);
					deathAnimation();
				}else{
					GV.arena.combatantDispose(this);
				}
			}
		}

		public function showRandomMsg(msgArray:Array):void{
			var i:int = Math.floor(Math.random()*msgArray.length);
			if(i == msgArray.length) i--;
			speechBubble.showSpeech(msgArray[i]);
		}

		public function statsAssigner():void{
		    var ob:Object = GV.statsAssigner(unitType, lvl);
			maxHp = hp = ob.hp;
			pow = ob.pow;
			def = ob.def;
			rewardPoints = ob.rewardPoints;
		}


		public function vanish(_fadeRate:Number = 0.025):void{
			FX.showParticleEffect(FX.poofPool, x, y, 0.1);
			fadeRate = _fadeRate;
			addEventListener(starling.events.Event.ENTER_FRAME, vanishOnFrame);
		}

		public function vanishOnFrame():void{
			if(alpha > 0){				
				alpha -= fadeRate * GV.speedFactor;
			}else{
				alpha = 1;		
				removeEventListener(Event.ENTER_FRAME, vanishOnFrame);
				visible = false;			
				shadow.visible = false;
				canBeTalkedTo = false;
				if(myParticleEffect) myParticleEffect.stop();
				releaseTile();			
			}
		}

		public function randomTeleportAbility():void{	
			if(!GV.arena || !GV.arena.isActive) return;				
			spinAnimationInert();
			executeEffects();
			FX.kaboom.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			FX.showParticleEffect(FX.poofPool, x, y, 0.1);
			FX.showParticleEffect(FX.shoopExplosionPool, x, y, 0.1);
			moveToPos(GV.arena.getRandomFreePos(), true);
			FX.showParticleEffect(FX.poofPool, x, y, 0.1);
			FX.showParticleEffect(FX.shoopExplosionPool, x, y, 0.1);
		}

		public function spinAnimationInert(){
			spinAnimation();
		}

		public function spinAnimationAndExecuteEffects(){
			spinAnimation('executeEffects');	
		}

		public function spinAnimationAndMoveBackToTile(){
			spinAnimation('moveBackToTile');	
		}

		public function spinAnimation(type:String = null):void{		
			switch(type){
				case 'executeEffects': addEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndExecuteEffects); break;
				case 'moveBackToTile': addEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndMoveBackToTile); break;
				default: addEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameInert); break;
			}	
			initialSkewY = skewY;
			skewY = facing*0.5;
			skewX = 0;
		}

		public function spinOnFrameAndExecuteEffects(e:starling.events.Event):void{		
			spinOnFrame('executeEffects');
		}
		public function spinOnFrameAndMoveBackToTile(e:starling.events.Event):void{			
			spinOnFrame('moveBackToTile');
		}
		public function spinOnFrameInert(e:starling.events.Event):void{		
			spinOnFrame();
		}

		private function spinOnFrame(type:String = null):void{
			if(!GV.arena){
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndExecuteEffects);
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndMoveBackToTile);
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameInert);
				return;
			}
			if(skewY <= facing*0.5 || skewY > (facing*0.5 + 0.5)){
				skewY -= 0.5;
				shadow.skewY = skewY;
			}else{
				skewY = initialSkewY;
				shadow.skewY = skewY;				
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndExecuteEffects);
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameAndMoveBackToTile);
				removeEventListener(starling.events.Event.ENTER_FRAME, spinOnFrameInert);
				switch(type){
					case 'executeEffects': executeEffects(); break;
					case 'moveBackToTile': moveBackToOurTile(); break;
					default:
						idleAnimation();
						if(slotForCurrentAction.ability !== projectileAbility){
							endAbility();	
						}						
					break;
				}
			}
		}

		public function chargeAbility1(e:starling.events.Event):void{chargeAbility(slots[0]);}
		public function chargeAbility2(e:starling.events.Event):void{chargeAbility(slots[1]);}
		public function chargeAbility3(e:starling.events.Event):void{chargeAbility(slots[2]);}
		public function cooldownAbility1(e:starling.events.Event):void{cooldownAbility(slots[0]);}
		public function cooldownAbility2(e:starling.events.Event):void{cooldownAbility(slots[1]);}
		public function cooldownAbility3(e:starling.events.Event):void{cooldownAbility(slots[2]);}
	}
}