package classes {

	import starling.display.Sprite;
	import starling.events.Event;
    import starling.animation.Tween;
    import starling.animation.Transitions;
    import starling.filters.BlurFilter;
    import starling.core.Starling;
    import starling.display.DisplayObject;
    import starling.filters.ColorMatrixFilter;

    import flash.concurrent.Mutex;
	import flash.utils.*;
    import flash.utils.Timer;
	import classes.FFParticleSystem.FFParticleSystem;
	import dragonBones.animation.IAnimatable;
	
	public class Arena extends Sprite {

		include 'nonClasses/Utility.as';
		include 'nonClasses/conversationData/conversationData.as';

		public var backgroundContainer:Sprite = new Sprite;
		public var borderContainer:Sprite = new Sprite;
		public var alwaysFlattenedContainer:Sprite = new Sprite;
		public var alwaysFlatTextContainer:Sprite = new Sprite;
		public var belowCombatantContainer:Sprite = new Sprite;
		public var higherDoodadContainer:Sprite = new Sprite;
		public var buttonContainer:Sprite = new Sprite;
		public var touchTileContainer:Sprite = new Sprite;
		public var combatantContainer:Sprite = new Sprite;
		public var aboveCombatantContainer:Sprite = new Sprite;
		public var windowContainer:Sprite = new Sprite;
		public var neverFlatTextContainer:Sprite = new Sprite;
		public var speechBubbleContainer:Sprite = new Sprite;
		public var buttonContainer2:Sprite = new Sprite;
		public var spamContainer:Sprite = new Sprite;
		public var possibleComments:Vector.<int> = new Vector.<int>();
		public var bg:Vector.<Combatant> = new Vector.<Combatant>();
		public var specialsVector:Vector.<int> = new Vector.<int>();
		public var statUnits:Vector.<StatUnit> = new Vector.<StatUnit>();
		public var blueBtn:ActionButton = new ActionButton(onBlueClick, 'notActiveIcon');
		public var redBtn:ActionButton = new ActionButton(onRedClick, 'notActiveIcon');
		public var greenBtn:ActionButton = new ActionButton(onGreenClick, 'notActiveIcon');
		public var speedBtn:ActionButton = new ActionButton(onSpeedClick, 'ff2Icon');
		public var pauseBtn:ActionButton = new ActionButton(onPauseClick, 'pauseIcon');
		public var exitBtn:ActionButton = new ActionButton(exitArena, 'exitIcon');
		public var toggleBtn:ActionButton = new ActionButton(onToggleClick, 'toggleIcon', true);
		public var convoNextBtn:ActionButton = new ActionButton(onConvoNextClick, 'nextIcon', true);
		public var convoSkipBtn:ActionButton = new ActionButton(onConvoSkipClick, 'skipIcon', true);
		public var slotBtns:Vector.<ActionButton> = new Vector.<ActionButton>();
		public var abilBtns:Vector.<ActionButton> = new Vector.<ActionButton>();
		public var toBeSetAbilites:Vector.<Object> = new Vector.<Object>(GV.SLOT_NUM);
		public var tiles:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>();
		public var combatTilePositions:Vector.<Array> = new Vector.<Array>();
		public var damageTrigTiles:Array = new Array();
		public var selectedSlot:Slot;
		public var summon:Combatant;
		public var summonIsDecoy:Boolean;
		public var hero:Hero;
		public var narrativeBattle:Boolean;
		public var inConversation:Boolean;
		public var spamCount:int;
		public var isSafe:Boolean;
		public var topBoy:Combatant;
		public var tileMap:Array;
		public var arenaName:String;
		public var func1:Function;
		public var func2:Function;
		public var startTime:int;
		public var arenaData:Object;
		public var startingObjectsArray:Array;
		public var pauseTimer:AbilityTimer;
		public var currAbilUser:Combatant;
		public var protectee:Combatant;
		public var currSelectionType:String;
		public var inAction:Boolean = false;
		public var wasVictorious:Boolean = false;
		public var bossFight:Boolean = false;
		public var isTutorial:Boolean = false;
		public var isTimeTrail:Boolean = false;
		public var noSummons:Boolean = false;
		public var wasDefeatedBefore:Boolean = false;
		public var makingSelection:Boolean = true;
		public var isTrainingArea:Boolean = false;
		public var isObstacleCourse:Boolean = false;
		public var domainOfHate:Boolean = false;		
		public var paused:Boolean = false;
		public var criticalIsHappening:Boolean = false;
		public var leavingAllowed:Boolean = false;
		public var unpauseOnNextClick:Boolean = false;
		public var isActive:Boolean = false;
		public var commentIndex:int = 0;
		public var currEnemyNum:int = 0;
		public var objectCount:int = 0;
		public var rewardPoints:int = 0;
		public var pauseNum:int = 0;
		public var defeatMessage:String = '';
		public var leftMostArenaX:Number = 1280;
		public var rightMostArenaX:Number = 0;
		public var topMostArenaY:Number = 720;
		public var bottomMostArenaY:Number = 0;		
		public var remainingActions:int = -1;
		public var preDisposeStarted:Boolean = false;
		public var currTutorialPhase:int = 0;
		public var toggleInt:int = 1;
		public var heroAbilTargetPics:Vector.<SuperImage> = new Vector.<SuperImage>(GV.SLOT_NUM);
		public var bQueueMarker:SuperMovieClip = new SuperMovieClip('blueQueueMarker', GV.HUD_SPRITESHEET, 0, 0, true);
		public var rQueueMarker:SuperMovieClip = new SuperMovieClip('redQueueMarker', GV.HUD_SPRITESHEET, 0, 0, true);
		public var gQueueMarker:SuperMovieClip = new SuperMovieClip('greenQueueMarker', GV.HUD_SPRITESHEET, 0, 0, true);
		public var actionButtonHighlight:SuperImage = new SuperImage('actionButtonHighlight0000', GV.HUD_SPRITESHEET, 0, 0, true);
		public var conversationStarter:Combatant;
		private var censored:SuperImage = new SuperImage('censorBlock0000', GV.ABOVE_ALL_SPRITESHEET, 0, 0, true);
		private var currentActionCombatant:Combatant;		
		private var battleOver:Boolean = false;
		private var gridInitCompleted:Boolean = false;		
		private var speechMovingStuff:Boolean = false;		
		private var lastSelectedSlotId:int = -1;
		private var pauseStock:int;
		private var enemyDeaths:int = 0;
		private var initialInit:Boolean = true;
		private var lossCondition:int;
		private var currEffectInfo:Object;
		private var currSelectionAnim:String;
		private var enemyDeathTarget:int;
		private var xAdjustGrid:Number;
		private var yAdjustGrid:Number;
		private var currText:String;
		private var currentNarObj:Object;
		private var currentConObj:Object;
		private var convoCount:int;
		private var lastSpeaker:Combatant;
		private var whoHeroIsTalkingTo:Combatant;
		private var fadeRate: Number;
		private var baseX:int;
		private var baseY:int;
		private var currBattleTheme:int;
		private var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter();		
		private var speechMoveContainers:Vector.<Sprite> = new Vector.<Sprite>();
		private var spamArray:Vector.<SpamAd> = new Vector.<SpamAd>();
		private var mutex:Mutex = new Mutex();
		private var bigSpeechBubble:SuperMovieClip = new SuperMovieClip('bigSpeechBubble', GV.ABOVE_ALL_SPRITESHEET);
		private var bubbleText:SuperText = new SuperText(805, 255, '', GV.FONT_2, 24, 0xffffff, 'left');
		private var tooltipText:SuperText = new SuperText(605, 151, '', GV.FONT_2, 24, 0xffffff, 'left'); // Former width: 616.

		private static const HUD_Y_ADJUST_R:int = -7;
		private static const HUD_Y_ADJUST_L:int = 7;
		private static const CONVO_TRANSITION_TIME:Number = 0.35;
		private static const numOfPossibleComments:int = 8;
		private static const BATTLE_THEME_NUM:int = 6;


		public function Arena(){
			abilBtns[0] = new ActionButton(onReserveAbil1Click, 'notActiveIcon');
			abilBtns[1] = new ActionButton(onReserveAbil2Click, 'notActiveIcon');
			abilBtns[2] = new ActionButton(onReserveAbil3Click, 'notActiveIcon');
			abilBtns[3] = new ActionButton(onReserveAbil4Click, 'notActiveIcon');
		}

		public function initialInitOnly(): void {

			initialInit = false;
			
			// Just getting class definitions
			Conversationalist;
			ZipChest; 
			Bloatware;
			Malware;
			YoutubeComment;
			Spambot;
			Penguin;
			InsanityWolf;
			Scumbag;
			Troll;
			Flamer;
			Hacker; 
			TrainingDummy;
			CourageWolf;
			CorruptedMalware;
			Mobling;
			AdBlock;
			AdBlockEnemy;
			TwitchChat;
			TwitchChatEnemy;			
			ClickBait;
			FakeNews;
			UserData;
			Censor;
			Judgment;
			Malphaware;	 
			OmegaPenguin;
			AlphaWolf;
			HiveMind
			GenericTarget;
			TimeBomb;
			Wall;
			Trap;
			Gamergate;
			PRISM;
			HateVirus;
			Hate;

			currBattleTheme =  Math.floor(Math.random()*BATTLE_THEME_NUM);

			for(var h = 0; h < numOfPossibleComments; h++){
				possibleComments[h] = h;
			}

			colorMatrixFilter.tint(0xFFFFFF, 0.65);

			slotBtns[0] = blueBtn;
			slotBtns[1] = redBtn;
			slotBtns[2] = greenBtn;

			GV.gameSpeedMultiplier = 1;
			FFParticleSystem.init(1024, false, 512, 4);	

			addChild(backgroundContainer);
			addChild(borderContainer);		
			addChild(higherDoodadContainer);
			addChild(belowCombatantContainer);
			addChild(alwaysFlattenedContainer);
			addChild(buttonContainer);
			addChild(alwaysFlatTextContainer);
			addChild(combatantContainer);
			addChild(aboveCombatantContainer);
			addChild(windowContainer);
			addChild(neverFlatTextContainer);
			addChild(speechBubbleContainer);
			addChild(buttonContainer2);
			addChild(touchTileContainer);
			addChild(spamContainer);

			blueBtn.y = 325 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			pauseBtn.y = redBtn.y = 460 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			speedBtn.y = greenBtn.y = 595 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			redBtn.x = greenBtn.x = blueBtn.x = 1170 + GV.BTN_RADIUS;
			pauseBtn.x = speedBtn.x = 1055 + GV.BTN_RADIUS;

			toggleBtn.x = 945 + GV.BTN_RADIUS;
			toggleBtn.y = 607 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;

			exitBtn.y = 390 + HUD_Y_ADJUST_L + GV.BTN_RADIUS;
			exitBtn.x = 10 + GV.BTN_RADIUS;
			abilBtns[0].x = abilBtns[2].x = 10 + GV.BTN_RADIUS;
			abilBtns[1].x = abilBtns[3].x = 125 + GV.BTN_RADIUS; //125
			abilBtns[0].y = abilBtns[1].y = 120 + HUD_Y_ADJUST_L + GV.BTN_RADIUS;
			abilBtns[2].y = abilBtns[3].y = 255 + HUD_Y_ADJUST_L + GV.BTN_RADIUS;

			buttonContainer.addChild(exitBtn);
			buttonContainer.addChild(blueBtn);
			buttonContainer.addChild(redBtn);
			buttonContainer.addChild(greenBtn);
			buttonContainer.addChild(speedBtn);
			buttonContainer.addChild(pauseBtn);	
			buttonContainer.addChild(abilBtns[0]);
			buttonContainer.addChild(abilBtns[1]);
			buttonContainer.addChild(abilBtns[2]);
			buttonContainer.addChild(abilBtns[3]);

			pauseTimer = new AbilityTimer('grey');
			pauseTimer.y = pauseBtn.y + 97 - GV.BTN_RADIUS; 
			pauseTimer.x = pauseBtn.x + 50 - GV.BTN_RADIUS; 
			pauseTimer.abilityTimerText.text = 'OK';
			pauseTimer.backColor.currentFrame = 1;

			backgroundContainer.touchable = false;
			borderContainer.touchable = false;
			belowCombatantContainer.touchable = false;
			higherDoodadContainer.touchable = false;
			alwaysFlattenedContainer.touchable = false;
			alwaysFlatTextContainer.touchable = false;
			combatantContainer.touchable = false;
			aboveCombatantContainer.touchable = false;
			neverFlatTextContainer.touchable = false;
			windowContainer.touchable = false;

			bigSpeechBubble.alpha = 0.85;
			bigSpeechBubble.pivotX = bigSpeechBubble.width/2;
			bigSpeechBubble.pivotY = 0;

			speechMoveContainers[0] = backgroundContainer;
			speechMoveContainers[1] = borderContainer;
			speechMoveContainers[2] = belowCombatantContainer;
			speechMoveContainers[3] = aboveCombatantContainer;
			speechMoveContainers[4] = higherDoodadContainer;
			speechMoveContainers[5] = combatantContainer;
			speechMoveContainers[6] = touchTileContainer

			bigSpeechBubble.x = 640;
			bigSpeechBubble.y = 360;

			bubbleText.x = 238;
			bubbleText.y = 435;

			tooltipText.x = 338;
			tooltipText.y = 539;

			convoNextBtn.x = 1073;
			convoNextBtn.y = 680;

			convoSkipBtn.x = 973;
			convoSkipBtn.y = 680;

			bQueueMarker.pivotY = bQueueMarker.height; 
			rQueueMarker.pivotY = rQueueMarker.height; 
			gQueueMarker.pivotY = gQueueMarker.height; 

			bQueueMarker.alpha = rQueueMarker.alpha = gQueueMarker.alpha = GV.MARKER_ALPHA;
		}

		public function init(_arenaData:Object):void {

			isActive = true
			touchable = false; // Set to true on animation finish.
			inAction = false;
			wasVictorious = false;
			conversationStarter = null;
			bossFight = false;
			isTutorial = false;
			isTimeTrail = false;
			noSummons = false;
			wasDefeatedBefore = false;
			makingSelection = true;
			isTrainingArea = false;
			isObstacleCourse = false;
			paused = false;
			commentIndex = 0;
			currEnemyNum = 0;
			objectCount = 0;
			rewardPoints = 0;
			pauseNum = 0;
			defeatMessage = '';
			leftMostArenaX = 1280;
			rightMostArenaX = 0;
			topMostArenaY = 720;
			bottomMostArenaY = 0;
			remainingActions = -1;
			preDisposeStarted = false;
			toggleInt = 1;
			battleOver = false;
			lastSelectedSlotId = -1;
			enemyDeaths = 0;
			startTime = 0;
			currTutorialPhase = 0;
			combatTilePositions = new Vector.<Array>();
			damageTrigTiles.length = 0;
			inConversation = false;

			alwaysFlattenedContainer.visible = true;
			alwaysFlatTextContainer.visible = true;

			scrubContainer(backgroundContainer);
			scrubContainer(borderContainer);
			scrubContainer(alwaysFlattenedContainer);
			scrubContainer(alwaysFlatTextContainer);
			scrubContainer(belowCombatantContainer);
			scrubContainer(higherDoodadContainer);
			scrubContainer(combatantContainer);
			scrubContainer(aboveCombatantContainer);
			scrubContainer(windowContainer);
			scrubContainer(neverFlatTextContainer);
			scrubContainer(speechBubbleContainer);
			scrubContainer(spamContainer);
			if(contains(actionButtonHighlight))	removeChild(actionButtonHighlight);

			if(initialInit) initialInitOnly();

			aboveCombatantContainer.addChild(bQueueMarker);
			aboveCombatantContainer.addChild(rQueueMarker);
			aboveCombatantContainer.addChild(gQueueMarker);

			commentIndex = Math.round(Math.random()*7);

			paused = false;
			startTime = getTimer();

			if(GV.stage.p) arenaName = GV.stage.p.join('_');
			arenaData = _arenaData;
			tileMap = arenaData.tileMap ? arenaData.tileMap.concat() : []; // Shallow copy
			narrativeBattle = arenaData.narrativeBattle;
			leavingAllowed = arenaData.leavingAllowed;
			isSafe = arenaData.isSafe;
			isTrainingArea = arenaData.trainingArea;
			bossFight = arenaData.bossFight;
			lossCondition = arenaData.lossCondition;
			startingObjectsArray = arenaData.objectArray;
			isTutorial = arenaData.isTutorial;
			noSummons = arenaData.noSummons;
			wasDefeatedBefore = arenaData.defeated;
			isObstacleCourse = arenaData.isObstacleCourse;
			isTimeTrail = arenaData.isTimeTrail;
			domainOfHate = arenaData.domainOfHate;

			var z:int;

			for (z = 0; z < abilBtns.length; z++) {
				abilBtns[z].reset();
			}
			
			blueBtn.reset();
			redBtn.reset();
			greenBtn.reset();
			speedBtn.show();
			pauseBtn.show();
			toggleBtn.show();

			func1 = GV[arenaData.func1];
			func2 = GV[arenaData.func2];

			if(!isSafe) enemyDeathTarget = startingObjectsArray.length;
			if(narrativeBattle && !leavingAllowed) exitBtn.showLock();

			setUpTiles();

			// Has to be after setup tiles because tiles are flattened on the background.
			backgroundContainer.flatten();			
			higherDoodadContainer.flatten();
			alwaysFlattenedContainer.flatten();
			alwaysFlatTextContainer.flatten();
			touchTileContainer.flatten();
			
			unflattenAllButParticles(false);

			var descale:Number = 1;

			if(GVP.options.condensedHUD && !isSafe){
				descale = 0.9
				toggleBtn.visible = false;
			}

			speechBubbleContainer.scaleX = descale; speechBubbleContainer.scaleY = descale;
			touchTileContainer.scaleX = descale; touchTileContainer.scaleY = descale;
			backgroundContainer.scaleX = descale; backgroundContainer.scaleY = descale;
			borderContainer.scaleX = descale; borderContainer.scaleY = descale;
			belowCombatantContainer.scaleX = descale; belowCombatantContainer.scaleY = descale;
			higherDoodadContainer.scaleX = descale; higherDoodadContainer.scaleY = descale;
			combatantContainer.scaleX = descale; combatantContainer.scaleY = descale;
			aboveCombatantContainer.scaleX = descale; aboveCombatantContainer.scaleY = descale;
			spamContainer.scaleX = descale; spamContainer.scaleY = descale;

			var horizontalWhiteSpace:Number = (1280 - (rightMostArenaX - leftMostArenaX))/2;
			xAdjustGrid = -1*(leftMostArenaX - horizontalWhiteSpace);

			var hudSpace:int = (GVP.options.condensedHUD && !isSafe) ? 225 : 107;			

			var verticalWhiteSpace:Number = (720 + hudSpace - (bottomMostArenaY - topMostArenaY))/2;
			yAdjustGrid = -1*(topMostArenaY - verticalWhiteSpace);			

			speechBubbleContainer.x = xAdjustGrid;
			touchTileContainer.x = xAdjustGrid;
			backgroundContainer.x = xAdjustGrid;
			borderContainer.x = xAdjustGrid;
			belowCombatantContainer.x = xAdjustGrid;
			higherDoodadContainer.x = xAdjustGrid;
			combatantContainer.x = xAdjustGrid;
			aboveCombatantContainer.x = xAdjustGrid;
			spamContainer.x = xAdjustGrid;

			speechBubbleContainer.y = yAdjustGrid;
			touchTileContainer.y = yAdjustGrid;
			backgroundContainer.y = yAdjustGrid;
			borderContainer.y = yAdjustGrid;
			belowCombatantContainer.y = yAdjustGrid;
			higherDoodadContainer.y = yAdjustGrid;
			combatantContainer.y = yAdjustGrid;
			aboveCombatantContainer.y = yAdjustGrid;
			spamContainer.y = yAdjustGrid;

			if(!arenaData.isTheSandBox || 1) buttonContainer.addChild(toggleBtn);
			buttonContainer.setChildIndex(pauseTimer, belowCombatantContainer.numChildren - 1);	// find out why I have to do this

			bQueueMarker.visible = false;
			rQueueMarker.visible = false;
			gQueueMarker.visible = false;

			for(var s:int = 0; s < GV.MAX_ENEMY_NUM; s++){
				statUnits[s] = new StatUnit(s);
			}

			hero = new Hero;
			GV.hero = hero;
			hero.pos = arenaData.heroPos;
			hero.init();

			// Set up opponents
			var chestCount:int = 0;

			var i:int;
			var j:int;
			var ilen:int;

			bg.length = startingObjectsArray.length;

			for(i = 0, ilen = startingObjectsArray.length; i < ilen; i++){

				var bgX:int = 1120 - i*170;

				var currObj:Object = startingObjectsArray[i];

				switch(currObj.id){
	
					case 'ZipChest':
					 	var pattern:RegExp = /_/;  
						var chestName:String = GV.stage.mapNames[GVP.stats.currentMap].replace(pattern, "_") + '_' + arenaName + '_' + chestCount;
						chestCount++;
						if(!GVP.chestList.firstMap[chestName]){ // If chest was never opened
							var c: ZipChest = new ZipChest;
							c.chestName = chestName
							c.stock =  currObj.stock || 1;
							if(currObj.item == 'bitcoins'){
								c.bitcoins = true;
							}else{
								c.itemObj = Assignables.itemData[currObj.item];
							}
							bg[i] = c;
						}
					break;
					case 'Conversationalist':
						if(currObj.removeCondition && GV.stage.questData[currObj.removeCondition].isFinished){
							bg[i] = null;	
						} else {
							bg[i] = new Conversationalist(currObj.avatar, currObj.conversation, currObj.introMessage);	
						}
					break;
					case 'GenericTarget':
						bg[i] = new GenericTarget(currObj.avatar, currObj.introMessage);
						if(currObj.conversation && !arenaData.alreadyHadConversation){
							arenaData.alreadyHadConversation = true;
							bg[i].conversation = currObj.conversation;
							conversationStarter = bg[i];		
						}
					break;
					default:
						var MyClass:Class = getDefinitionByName('classes::' + currObj.id) as Class;
						bg[i] = new MyClass();
						bg[i].lvl = currObj.lvl || 1;
						if(currObj.conversation && !arenaData.alreadyHadConversation){
							arenaData.alreadyHadConversation = true;
							bg[i].conversation = currObj.conversation;
							conversationStarter = bg[i];		
						}
					break;
				}

				if(i < bg.length && bg[i]){
					bg[i].pos = currObj.pos;
					bg[i].init();
					if(currObj.isProtectee){ 
						protectee = bg[i]; 
						bg[i].isProtectee = true;
					}
					if(bg[i].isSummon || bg[i].isProtectee) enemyDeathTarget--;
				}
			}

			//Add traps
			for (j = 0; j<GV.TILE_Y; j++){
				for (i = 0; i<GV.TILE_X; i++){
					getTile([i, j]).trapify();
				}
			}

			if(isObstacleCourse){
				runAI();
				hero.obstacleAbilities();
			}
			
			y = -720;		
			buttonContainer.touchable = false;	
			touchTileContainer.touchable = false;

			FX.woosh.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			GV.s.juggler.tween(this, 0.75, {
			   	transition: Transitions.EASE_OUT,
			   	repeatCount: 1,
			   	y: 0,
			   	onComplete: function():void{
			   		touchable = true;
			   		if(isTutorial){ 
						paused = true;
						tutorialPhase();						
						actionButtonHighlight.touchable = false;
						addChild(actionButtonHighlight);
						clearToolTip();
					}

					var p:Object = arenaData.popUp;
			   		if(p) GV.stage.showPopUp(p.title, p.subtitle, p.description, p.hasOption, p.option1, p.option2);

					if (lossCondition == GV.TIME_OUT) {
						GV.stage.showPopUp('Special Battle', 'Defeat your enemies in under 15 actions.', 'To be victorious, you have to defeat your enemies by or on your 15th action. It\'s all about offense over defense, so go hot and heavy.');
						remainingActions = 15;
					}

					if(conversationStarter && !p){ // If popup dont do start conversation right away.
						setTimeout(function(){							
							startConversation(conversationStarter);
							conversationStarter = null;					
						}, 100);				
					}else{
						touchTileContainer.touchable = true;
						buttonContainer.touchable = true;
					}	

					var music:String = arenaData.music;

					if(music){				
						if(music != 'silence'){					
							FX.playMusic(FX[music]);
						}else{
							FX.stopMusic();
						}			
					}else{				
						if(isSafe){
							FX.stopMusic();
						}else if(isObstacleCourse){
							FX.playMusic(FX.minigame);
						}else if(isTutorial){							
							FX.playMusic(FX.battle4);
						}else if(isTrainingArea){
							FX.playMusic(FX.training);
						}else{												
							var themeNum:int = currBattleTheme++;
							if(currBattleTheme >= BATTLE_THEME_NUM){
								currBattleTheme = 0;
							}							
							FX.playMusic(FX['battle' + themeNum]);								
						}
					}	
			   	}
			});		

			GV.stage.afterBattleScreen.disclosureText.text = '';

			clearSelection();

			pauseBtn.hideStock();
			pauseBtn.hideAp();
			pauseTimer.stateChangeAnimation.visible = false;

			pauseTimer.neutral()
			pauseTimer.abilityTimerText.text = 'OK';
			pauseTimer.backColor.y = 2;
			pauseTimer.backColor.currentFrame = 1;
			pauseBtn.setPicture('pauseIcon');
			pauseBtn.hideLock();

			speedBtn.hideStock();
			speedBtn.hideAp();

			redBtn.btn.scaleX = 1;
			redBtn.btn.scaleY = 1;
			blueBtn.btn.scaleX = 1;
			blueBtn.btn.scaleY = 1;
			greenBtn.btn.scaleX = 1;
			greenBtn.btn.scaleY = 1;
			pauseBtn.btn.scaleX = 1;
			pauseBtn.btn.scaleY = 1;
			blueBtn.y = 325 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			pauseBtn.y = redBtn.y = 460 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			speedBtn.y = greenBtn.y = 595 + HUD_Y_ADJUST_R + GV.BTN_RADIUS;
			redBtn.x = greenBtn.x = blueBtn.x = 1170 + GV.BTN_RADIUS;
			pauseBtn.x = speedBtn.x = 1055 + GV.BTN_RADIUS;

			pauseTimer.visible = false;
			pauseStock = GVP.stats.pauseStock;
			pauseBtn.showStock(pauseStock);
        		
			if (isSafe) safeMode();

			censored.x = 1280/2 - spamContainer.x;
			censored.y = 720/2 - spamContainer.y; 

			unGreyOutArena(true);		
		}

		public function disableAllButtons():void {
			blueBtn.disable();
			redBtn.disable();
			greenBtn.disable();
			pauseBtn.disable();			
			for (var j:int = 0, jlen:int = 4; j < jlen; j++){
				abilBtns[j].disable();
			}
		}

		public function enableAllButtons():void {
			blueBtn.enable();
			redBtn.enable();
			greenBtn.enable();
			pauseBtn.enable();			
			for (var j:int = 0, jlen:int = 4; j < jlen; j++){
				abilBtns[j].enable();
			}
		}

		public function disableAllTiles():void {
			for (var j = 0; j<GV.TILE_Y; j++){
				for (var i = 0; i<GV.TILE_X; i++){
					getTile([i, j]).isForTutorial = false;
					getTile([i, j]).baseTile.filter = null;
				}
			}
			backgroundContainer.flatten();
		}

		public function enableAllTiles():void {
			for (var j = 0; j<GV.TILE_Y; j++){
				for (var i = 0; i<GV.TILE_X; i++){
					getTile([i, j]).isForTutorial = true;
				}
			}
		}		

		public function tutorialPhase():void {		

			paused = false;
			disableAllButtons();
			disableAllTiles();
			backgroundContainer.flatten();
			unpauseOnNextClick = true;
			paused = true;
			actionButtonHighlight.visible = false;

			switch(currTutorialPhase){
				case 0: 									
					paused = true;					
					showTooltip("Time for a super short tutorial. Press on the indicated button that has the arrow pointing to it to begin using the current blue action: Move.");				
					blueBtn.highlightBtn();	
					unpauseOnNextClick = true;					
					break;
				case 1:					
					showTooltip("The highlighted area is where Zye can target this ability based on his current position. Press the tile just in front of Zye to move him toward the YouTube comment.");					
					getTile([2,2]).highlightTile();
					break;		
				case 2:		
					showTooltip("The blue line emanating from the Youtube comment shows that it is going to move toward you. Select the indicated button to begin using the current red action: Slash.");	
					redBtn.highlightBtn();					
					break;
				case 3:					
					showTooltip("The highlighted area is where Zye can target this ability based on his current position. Press the tile just in front of him to attack the spot where the YouTube comment is moving to.");
					getTile([3,2]).highlightTile();					
					break;
				case 4:	
					showTooltip("The YouTube comment is about to retaliate by attacking you. Press the indicated button to begin using the green action: Block.");
					greenBtn.highlightBtn();							
					break;
				case 5:
					enableAllTiles();
					showTooltip("Because this ability is self-targeting, the whole field is highlighted. You can press any tile to begin using the action.");															
					break;
				case 6:
					showTooltip("While we wait to block, let's prepare our next attack. The red action is on cooldown, and thus cannot be targeted immediately, but we can queue up our next action with it. Press the red action button to begin.");
					redBtn.highlightBtn();												
					break;
				case 7:
					showTooltip("Also, let's use a more powerful attack. Every action slot (blue, red, and green) can have four things assigned to it. Red has the Slash and Lag Spike abilities assigned to it. Swap in the Lag Spike ability by pressing the indicated button.");
					abilBtns[1].highlightBtn();											
					break;
				case 8:
					showTooltip("This ability will do more damage and stun the YouTube comment. Target the YouTube comment to queue the ability. A red cone will appear once you've done so to indicate that the red action is queued.");
					getTile([3,2]).highlightTile();												
					break;
				case 9:									
					showTooltip("The Block ability reduced the damage you took. Now let's try one more thing: select the move ability.");
					blueBtn.highlightBtn();								
					break;
				case 10:					
					showTooltip("Instead of blocking its next attack, lets evade it all together. Move to the specified tile so that the YouTube comment wastes its next attack by hitting nothing.");
					getTile([3,1]).highlightTile();										
					break;
				case 11:
					paused = true;					
					setTimeout(function(){						
						GV.stage.showTutorial();							
					}, 1000)									
					break;
			}
			currTutorialPhase++;
		}

		private function objectiveFailed():Boolean{
			var failed:Boolean = false
			if(lossCondition){			
				switch(lossCondition){
					case GV.PROTECTION:
						if(!protectee || protectee.isDead){
							failed = true
							defeatMessage = "Your ally must survive the battle.";
						}
					break;
					case GV.TIME_OUT:
						if(remainingActions == 0){
							failed = true
							defeatMessage = "You ran out of actions.";
						}
					break;
				}
				GV.stage.afterBattleScreen.disclosureText.text = defeatMessage;
			}
			return failed;
		}

		public function preDisposeArena():void{
			preDisposeStarted = true;
			hideCensor();
			killSummon();
			killEnemies();
			kill(hero);
			removeDeadUnits();			
		}

		public function scrubContainer(c:Sprite):void {
			while (c.numChildren > 0) {
			    c.removeChildAt(0);
			}	
		}

		public function nullItAll():void{			
			var i:int;
			for(i = 0; i < bg.length; i++){				
				superNull(bg[i]); bg[i] = null;
			}
			superNull(hero); hero = null;						
			superNull(summon); summon = null;
			superNull(topBoy); topBoy = null;
			superNull(currAbilUser); currAbilUser = null;
			superNull(protectee); protectee = null;
			superNull(currentActionCombatant); currentActionCombatant = null;
			superNull(lastSpeaker); lastSpeaker = null;
			superNull(combatTilePositions); combatTilePositions = null;
			superNull(conversationStarter); conversationStarter = null;
			isSafe = false;
			isActive = false;
			for (i = 0; i < GV.SLOT_NUM; i++) {
				superNull(toBeSetAbilites[i]); toBeSetAbilites[i] = null;
			}
		}

		public function kill(c:Combatant):void{
			if(c && !c.isDead){			
				c.isDead = true;
				if (c.unitType === 'Wall'){
					c.ourTile.canBeSelected = true
				}
				if(c.isEnemy && !c.isSpawn){
					rewardPoints += c.rewardPoints;
					currEnemyNum--;
					enemyDeaths++;
				}
				if(c.isSpawn) currEnemyNum--;
			}
		}

		public function killSummon(){
			summonIsDecoy = false;
			if(summon){
				kill(summon);
			}
		}

		public function killEnemies(){
			for(var i:int; i < bg.length; i++){
				if(bg[i]) kill(bg[i]); // Zip chests can mess this up without checking for nulls.
			}
		}
		
		public function removeDeadUnits(){
			var i:int = 0;
			while(i < bg.length){
				if(bg[i] && bg[i].isDead){
					bg[i].removeSelfIfDead();
					bg[i] = null;
					bg.splice(i, 1);
				}else{
					i++;
				}
			}
			hero.removeSelfIfDead();
			if(summon) summon.removeSelfIfDead();
		}

		public function combatantDispose(c:Combatant):void{	
			combatantContainer.removeChild(c);
			c.preDispose();
			c.dispose();
			c = null;
		}

		public function checkIfBattleOver():void{
			var won:Boolean = (enemyDeaths == enemyDeathTarget && !isTrainingArea && !isObstacleCourse);
			var lost:Boolean = (hero.isDead || objectiveFailed());
			if(lost) lose();
			else if(won) win();
		}

		public function cheat():void{
			for(var i:int; i < bg.length; i++){
				kill(bg[i]); // To get the rewards
			}
			win();
		}

		public function win():void{
			wasVictorious = true;
			battleOver = true;
			touchable = false;
			hero.victoryAnimation();
			if(arenaData.newQuestPhaseOncomplete){
				setTimeout(function():void{
					GV.stage.newQuestPhase(arenaData.newQuestPhaseOncomplete);
				}, 500);
			}else if(arenaData.afterWinPopUp){
				var p:Object = arenaData.afterWinPopUp;
			   	if(p) GV.stage.showPopUp(p.title, p.subtitle, p.description, p.hasOption, p.option1, p.option2);
			}else{
				endBattleScreenAfterDelay();
			}
		}

		public function lose():void{
			wasVictorious = false;
			battleOver = true;
			touchable = false;
			rewardPoints = 0;
			endBattleScreenAfterDelay();
		}

		public function endBattleScreenAfterDelay():void{
			paused = true;
			setTimeout(endBattleScreen, 1500);
		}

		public function endBattleScreen():void{
			paused = true;
			logPlayTime();
			greyOutArena();
			preDisposeArena();
			GV.stage.endBattle();
		}

		public function placeChest(itemName:String, pos:Array, stock:int = 1):void{		
			var c: ZipChest = new ZipChest;
			c.stock =  stock;
			if(itemName == 'bitcoins'){
				c.bitcoins = true;
			}else{
				c.itemObj = Assignables.itemData[itemName];
			}
			c.pos =  pos;
			c.init();
		}

		public function makeLeavingAllowed():void{
			narrativeBattle = false;
			exitBtn.hideLock();
		}

		public function runAI():void{
			for (var i:int = 0; i < bg.length; i++){
				if(bg[i]) bg[i].ai();
			}
			if(summon)summon.ai();
		}

		public function runPerTurnStuff():void{
			for (var i:int = 0, ilen:int = bg.length; i < ilen; i++){
				if(bg[i]) bg[i].perTurn();
			}
			if(summon) summon.perTurn();
			if(hero) hero.perTurn();
		}

		public function beginAction(c:Combatant = null):void{
			mutex.lock();
			if(inAction) return;
			inAction = true;
			c.startedCurrAction = true;
			currentActionCombatant = c;
			var i:int
			for (i = 0; i < GV.SLOT_NUM; i++){
				hero.slots[i].pointer.alpha = 0.25;
				hero.statUnit.abilityTimers[i].stopAnimating();
				if(summon){
					summon.slots[i].pointer.alpha = 0.25;
					summon.statUnit.abilityTimers[i].stopAnimating();
				}
			}
			for (i = 0; i < bg.length; i++){
				if(bg[i]){
					var j:int
					for (j = 0; j < GV.SLOT_NUM; j++){
						bg[i].slots[j].pointer.alpha = 0.25;								
						if(bg[i].statUnit) bg[i].statUnit.abilityTimers[j].stopAnimating();
					}
				}
			}
			if(isSafe || c.isSimple || c.noEndActionDelay){
				setTimeout(c.afterBuffer, 0);					
			}else{
				setTimeout(c.afterBuffer, GV.ABIL_BUFFER);
			}
			mutex.unlock();
		}

		public function endAction(c:Combatant = null):void{
			mutex.lock();
			if(!c || !inAction || !c.startedCurrAction) return;
			currentActionCombatant = null;
			c.startedCurrAction = false	
			var i:int
			for (i = 0; i < GV.SLOT_NUM; i++){
				hero.slots[i].pointer.alpha = 1;
				hero.statUnit.abilityTimers[i].refreshChargeTime();
				hero.statUnit.abilityTimers[i].animate();
				if(summon){
					summon.slots[i].pointer.alpha = 1;
					summon.statUnit.abilityTimers[i].refreshChargeTime();
					summon.statUnit.abilityTimers[i].animate();
				}
			}
			for (i = 0; i < bg.length; i++){
				if(bg[i]){
					for (var j:int = 0, jlen:int = GV.SLOT_NUM; j < jlen; j++){
						bg[i].slots[j].pointer.alpha = 1;
						if (bg[i].statUnit && bg[i].statUnit.abilityTimers){
							bg[i].statUnit.abilityTimers[j].refreshChargeTime();
							bg[i].statUnit.abilityTimers[j].animate();
						}
					}
				}
			}
			runPerTurnStuff();
			objectiveFailed();
			if(c.isHero && remainingActions > 0){
				remainingActions--;
				hero.statusMsg(remainingActions + ' actions left', GV.STS_RED);
			}
			if(!isSafe) checkIfBattleOver(); // has to be before remove dead units to remove enemy spawned units.
			removeDeadUnits(); // This is used in safe arenas as well.
			if(!isSafe){			
				hudUpdate();
				if(!c.isSimple){
					runAI();
				}
			}
			if(isSafe || c.isSimple || c.noEndActionDelay){
				endActionHelper();					
			}else{
				setTimeout(endActionHelper, 500);
			}
			unmarkTiles();
			mutex.unlock();
		}

		private function endActionHelper():void{
			inAction = false;
		}

		public function hudUpdate():void{
			alwaysFlattenedContainer.flatten();
			alwaysFlatTextContainer.flatten();
		}

		public function greyOutArena(){			
			// filter = colorMatrixFilter;				
			flattenAllButParticles();
			paused = true;			
			touchable = false;
		}

		public function unGreyOutArena(forInit:Boolean = false){
			// filter = null;	
			unflattenAllButParticles();		
			paused = false;
			touchable = true;
			if(conversationStarter && !forInit){				
				setTimeout(function(){
					startConversation(conversationStarter);							
					conversationStarter = null;
				}, 100);				
			}
		}

		public function flattenAllButParticles(doJugglerStuff:Boolean = true):void{
			if(doJugglerStuff) GV.s.stop();
			buttonContainer.flatten();
			combatantContainer.flatten();
			windowContainer.flatten();			
			neverFlatTextContainer.flatten();
			spamContainer.flatten();
			buttonContainer2.flatten();
			speechBubbleContainer.flatten();
			borderContainer.flatten();					
		}

		public function unflattenAllButParticles(doJugglerStuff:Boolean = true):void{
			if(doJugglerStuff) GV.s.start();
			buttonContainer.unflatten();
			combatantContainer.unflatten();
			windowContainer.unflatten();			
			neverFlatTextContainer.unflatten();
			spamContainer.unflatten();
			buttonContainer2.unflatten();
			speechBubbleContainer.unflatten();
			borderContainer.unflatten();
		}

		public function onBlueClick(): void { 
			if(isTutorial && !blueBtn.isForTutorial) return;
			onTutBtnClick(blueBtn);
			actionButtonClick(0); 
		}

		public function onRedClick():void{ 
			if(isTutorial && !redBtn.isForTutorial) return;
			onTutBtnClick(redBtn);
			actionButtonClick(1); 
		}

		public function onGreenClick():void{			
			if(!isSafe){
				if( isTutorial && !greenBtn.isForTutorial) return;
				onTutBtnClick(greenBtn);	
				 actionButtonClick(2);
			}			
		}

		public function actionButtonClick(i:int):void {
			
			selectedSlot = hero.slots[i];	
			if(selectedSlot.assigned){
				blueBtn.hideGlow();
				redBtn.hideGlow();
				greenBtn.hideGlow();
				switch(i){
					case 0: blueBtn.glow(i); break;
					case 1: redBtn.glow(i); break;
					case 2: greenBtn.glow(i); break;
				}
				if(!isSafe && !isObstacleCourse) refreshAbilBtns(i);
				selectTilesForSelection();
			}
		}

		private function onTutBtnClick(btn:ActionButton):void {
			if(GV.arena.isTutorial && btn.isForTutorial){
				GV.s.juggler.removeTweens(btn);
				scaleX = 1;
				scaleY = 1;
				btn.isForTutorial = false;				
				tutorialPhase();												
			}
		}

		public function selectTilesForSelection(forceFancy:Boolean = false):void{
			if(selectedSlot){
				var fancy:Boolean = true;
				if(selectedSlot.id == lastSelectedSlotId && !forceFancy){
					fancy = false; // don't animate if same color as last selection
				}else{
					lastSelectedSlotId = selectedSlot.id
				}
				makingSelection = true;				
				deanimateTiles();
				var slotColor:String
				switch(selectedSlot.id){
					case 0: slotColor = 'blueTile'; break;
					case 1: slotColor = 'redTile'; break;
					case 2: slotColor = 'greenTile'; break;
				}				
				if(hero){				
					if(toBeSetAbilites[selectedSlot.id]){
						selectTiles('ability', hero.pos, toBeSetAbilites[selectedSlot.id], slotColor, fancy);
					}else{
						selectTiles('ability', hero.pos, selectedSlot, slotColor, fancy);
					}
				}
			}
		}

		public function onReserveAbil1Click():void{reserveAbilClick(0);}
		public function onReserveAbil2Click():void{reserveAbilClick(1);}
		public function onReserveAbil3Click():void{reserveAbilClick(2);}
		public function onReserveAbil4Click():void{reserveAbilClick(3);}

		private function reserveAbilClick(i:int):void{
			if(isTutorial && !abilBtns[i].isForTutorial) return;
			onTutBtnClick(abilBtns[i]);			
			if(selectedSlot && hero.abils[selectedSlot.id] && hero.abils[selectedSlot.id][i]){
				var colorBtn:ActionButton = getActionButton();										
				var newAbil:Object = hero.abils[selectedSlot.id][i];
				if (newAbil.hasOwnProperty("stock")){
					if(!newAbil.stock){  
						return; 
					}else{
						colorBtn.showStock(newAbil.stock);  
					}
				}else{
					colorBtn.hideStock();	
				}
				if (newAbil.hasOwnProperty("ap")){
					colorBtn.showAp(newAbil.ap); 
				}else{
					colorBtn.hideAp();
				}
				colorBtn.setPicture(newAbil.pic);
				if(!selectedSlot.startable || selectedSlot.isCharging){ // New ability stats aren't loaded yet if old ability is charging or cooling down or in action.
					toBeSetAbilites[selectedSlot.id] = newAbil;
				}else{		
					toBeSetAbilites[selectedSlot.id] = null;	
					selectedSlot.setAbility(newAbil);
				}
				actionButtonClick(selectedSlot.id);
			}
		}

		public function setWaitingAbility(i:int):void{
			if(toBeSetAbilites[i]) hero.slots[i].setAbility(toBeSetAbilites[i]);
		}

		public function getActionButton(i:int = -1):ActionButton{
			var n:int = i == -1 ? selectedSlot.id : i; 
			switch(n){
				case 0: return blueBtn; break;
				case 1: return redBtn; break;
				case 2: return greenBtn; break;
			}
			return null;
		}

		public function refreshAbilBtns(i:int):void{ // Goes through all ability buttons and fixes things about them.
			for (var j:int = 0, jlen:int = 4; j < jlen; j++){
				var currentBtn:ActionButton = abilBtns[j];
				currentBtn.reset(); // Reset to get rid of stock and ap indicators.
				if(j < hero.abils[i].length && hero.abils[i][j]){
					var abilityObject:Object = hero.abils[i][j];
					currentBtn.setPicture(abilityObject.pic);
					if(abilityObject.ap) currentBtn.showAp(abilityObject.ap);					
					if(abilityObject.hasOwnProperty("stock")){
						if(abilityObject.stock){
							currentBtn.showStock(abilityObject.stock);							
						}else{
							// Reset again to get rid of the picture. Show nothing for out of stock items.
							currentBtn.reset();
						}						
					}					
				}
			}
		}

		public function onPauseClick():void{

			if(isSafe) return;
			if(isTutorial && !pauseBtn.isForTutorial) return;
			onTutBtnClick(pauseBtn);

			var k:int;
			var i:int;
			if(paused){
				paused = false;
				hero.statusMsg("GAME UNPAUSED", GV.STS_NEUTRAL);
				pauseBtn.setPicture('pauseIcon');
        		
				for(k = 0; k < GV.SLOT_NUM; k++){
        			hero.slots[k].abilityTimer.onUnPause();
        		}
        		if(summon){        			
					for(k = 0; k < GV.SLOT_NUM; k++){
						if(summon.slots[k] && summon.slots[k].abilityTimer){
	        				summon.slots[k].abilityTimer.onUnPause();
	        			}
	        		}
        		}
        		
        		for(i = 0; i < bg.length; i++){
					for(k = 0; k < GV.SLOT_NUM; k++){
						if(bg[i].slots[k].abilityTimer) bg[i].slots[k].abilityTimer.onUnPause();
        			}
        		}
			} else {
				if(pauseStock > 0){
					paused = true;
					pauseStock--;
					pauseBtn.showStock(pauseStock);
					hero.statusMsg("GAME PAUSED", GV.STS_NEUTRAL);
					pauseBtn.setPicture('playIcon');

					for(k = 0; k < GV.SLOT_NUM; k++){
	        			hero.slots[k].abilityTimer.onPause();
	        		}
	        		if(summon){        			
						for(k = 0; k < GV.SLOT_NUM; k++){
							if(summon.slots[k] && summon.slots[k].abilityTimer){
								summon.slots[k].abilityTimer.onPause();
							}		        			
		        		}
	        		}
	        		for(i = 0; i < bg.length; i++){
						for(k = 0; k < GV.SLOT_NUM; k++){
							if(bg[i].slots[k].abilityTimer) bg[i].slots[k].abilityTimer.onPause();
	        			}
	        		}
				}else{
					hero.statusMsg("OUT OF PAUSES.", GV.STS_NEUTRAL);
					FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				}
			}
		}

		public function showCensor():void{
			spamContainer.addChild(censored);
		}


		public function hideCensor():void{
			if(spamContainer.contains(censored)){
				spamContainer.removeChild(censored);
			}
		}

		public function exitArena():void{
			if(!narrativeBattle || leavingAllowed) { // if leaving allowed.								
				redBtn.btn.scaleX = 1;
				redBtn.btn.scaleY = 1;
				blueBtn.btn.scaleX = 1;
				blueBtn.btn.scaleY = 1;
				greenBtn.btn.scaleX = 1;
				greenBtn.btn.scaleY = 1;
				pauseBtn.btn.scaleX = 1;
				pauseBtn.btn.scaleY = 1;
				logPlayTime();		
				if(currentActionCombatant) endAction(currentActionCombatant);
				GV.stage.removeArena(wasVictorious);
			}
		}

		public function logPlayTime():void{
			GVP.stats.totalPlayTime += getTimer() - startTime;
		}

		public function onSpeedClick():void{
			var i:int;
			var ilen:int;
			if(GV.gameSpeedMultiplier == 1){
				GV.gameSpeedMultiplier = 2;
				hero.statusMsg("GAME SPEED UP", GV.STS_NEUTRAL);
				speedBtn.setPicture('ff1Icon');
			}else{
				GV.gameSpeedMultiplier = 1;
				hero.statusMsg("GAME SPEED DOWN", GV.STS_NEUTRAL);
				speedBtn.setPicture('ff2Icon');
			}
		}

		public function onToggleClick(increment:Boolean = true):void{
			if (isSafe) return;
			if (increment) {
				toggleInt++;
			}			
			var i:int
			switch(toggleInt){
				case 1:
					if(summon && summon.statUnit) summon.statUnit.showAbilTimers(summon);
					for(i = 0; i < bg.length; i++){
						if(bg[i] && bg[i].statUnit) bg[i].statUnit.showAbilTimers(bg[i]);
					}
				break;
				case 2:
					if(summon && summon.statUnit) summon.statUnit.showAbilNames(summon);
					for(i = 0; i < bg.length; i++){
						if(bg[i] && bg[i].statUnit) bg[i].statUnit.showAbilNames(bg[i]);
					}
				break;
				case 3:
					if(summon && summon.statUnit) summon.statUnit.showStats(summon);
					for(i = 0; i < bg.length; i++){
						if(bg[i] && bg[i].statUnit) bg[i].statUnit.showStats(bg[i]);
					}
					toggleInt = 0;
				break;
			}
			hudUpdate();
		}
		
		public function clearSelection():void{
			makingSelection = false;
			deanimateTiles();
		}

		private function safeMode():void{
			isSafe = true;
			clearAllTileAugments();
			hero.statUnit.makeInvisible();
			for(var s:int = 0; i < GV.MAX_ENEMY_NUM; i++){
				statUnits[i].makeInvisible();
			}

			pauseTimer.visible = false;

			for(var i:int = 0, ilen:int = 4; i < ilen; i++){
				abilBtns[i].hide();
			}

			clearSelection();
			hero.passiveAbilities();
			hudUpdate();

			speedBtn.hide();
			pauseBtn.hide();
			toggleBtn.hide();
			greenBtn.hide();
		}

		public function tileX(_pos:Array):int{
			var tile = getTile(_pos);
			return tile.centerX;
		}
		
		public function tileY(_pos:Array, offset:int = 0):int{
			var tile = getTile(_pos);
			return tile.centerY - offset;
		}

		public function getTile(_pos:Array):Tile{
			var xP:int = _pos[0];
			var yP:int = _pos[1];
			if(between(0, yP, tiles.length - 1) && between(0, xP, tiles[yP].length - 1)){
			 	return tiles[yP][xP];
			}else{
				return null
			}
		}


		public function getClosestEnemyTileTo(pos:Array):Tile{
			var shortestDistance:int = 10;
			var bgid:int = 0;
			for(var i:int = 0, ilen:int = bg.length; i < ilen; i++){
				if(bg[i] && !bg[i].isSimple){
					var db:int = distanceBetween(bg[i].pos, pos);
					if(db < shortestDistance) {
						shortestDistance = db;
						bgid = i;
					}
				}
			}
			if(bg.length > 0 && bg[bgid]) return bg[bgid].ourTile;
			return null;
		}

		public function selectTile(_pos:Array):void{
			var tile:Tile = getTile(_pos);
			if(tile && tile.canBeSelected){
			    tile.select(currSelectionAnim);
			}
		}

		public function selectTiles(_type:String, _pos:Array, _currEffectInfo:Object = null, _currSelectionAnim:String = null, fancy:Boolean = false):void{
			
			var runEffectBorderAfter:Boolean = false;
			currEffectInfo = _currEffectInfo;
			currSelectionAnim = _currSelectionAnim;
			currSelectionType = _type;

			if(currSelectionAnim == 'targetTile'){
				currSelectionAnim = null;
				runEffectBorderAfter = true;
			}

			deselectTiles();
			
			var range:int;
			var selectType:String;
			var deselectCombatants:Boolean;

			switch (_type){
				case 'ability':
					range = currEffectInfo.abilityRange;
					selectType = currEffectInfo.abilitySelectType || 'all';
					deselectCombatants = currEffectInfo.deselectCombatants;
				break;
				case 'targetCheck':
					range = currEffectInfo.abilityRange;
					selectType = currEffectInfo.abilitySelectType || 'all';
					if(selectType == 'eight-way_endpoints') selectType = 'eight-way';
					deselectCombatants = currEffectInfo.deselectCombatants;
				break;
				case 'effect':
					selectType = currEffectInfo.effectSelectType || 'box';
					if(selectType == 'direction'){
						range = distanceBetween(_pos, GV.hero.pos);
					}else{
						range = currEffectInfo.effectRange;		
					}
					deselectCombatants = false;
				break;
				case 'tile':
					var tile:Tile = getTile(_pos);
					range = tile.effectRange;
					selectType = tile.effectSelectType || 'box';
					deselectCombatants = false;
				break;
			}

			var topLeftX:int = Math.max(_pos[0] - range, 0);
			var topLeftY:int = Math.max(_pos[1] - range, 0);
			var bottomRightX:int = Math.min(_pos[0] + range, GV.TILE_X);
			var bottomRightY:int = Math.min(_pos[1] + range, GV.TILE_Y);
			var i:int;
			var j:int;
			var aDir:Object = {n: true, ne: true, e: true, se: true, s: true, sw: true, w: true, nw: true};

			switch (selectType){
				case 'all':
					for (i = 0; i < GV.TILE_Y; i++){
						for (j = 0; j < GV.TILE_X; j++){
							selectTile([j, i]);
						}
					}
				break;
				case 'box':
					for (i = topLeftX; i < bottomRightX + 1; i++){
						for (j = topLeftY; j < bottomRightY + 1; j++){
							selectTile([i, j]);
						}
					}
				break;
				case 'radial':
					for (i = topLeftX; i < bottomRightX + 1; i++){
						for (j = topLeftY; j < bottomRightY + 1; j++){
							if(i  != _pos[0] || j  != _pos[1]){
								selectTile([i, j]);
							}
						}
					}
					deselectTile(_pos);
				break;
				case 'cross':
					selectDirection(currEffectInfo, 'n', range, _pos);
					selectDirection(currEffectInfo, 's', range, _pos);
					selectDirection(currEffectInfo, 'e', range, _pos);
					selectDirection(currEffectInfo, 'w', range, _pos);
					selectTile(_pos); // Mid selected
				break;
				case 'eight-way':
					selectDirection(currEffectInfo, 'n', range, _pos);
					selectDirection(currEffectInfo, 'w', range, _pos);
					selectDirection(currEffectInfo, 's', range, _pos);
					selectDirection(currEffectInfo, 'e', range, _pos);
					selectDirection(currEffectInfo, 'nw', range, _pos);
					selectDirection(currEffectInfo, 'ne', range, _pos);
					selectDirection(currEffectInfo, 'sw', range, _pos);
					selectDirection(currEffectInfo, 'se', range, _pos);
				break;
				case 'vector':
					var vector:Vector.<Array> = currEffectInfo.posVector;
					if(vector){					
						for (i = 0; i < vector.length; i++){
							selectTile(vector[i]);
						}
					}
				break;
				case 'direction':			
						if(_pos[0] < currEffectInfo.c.pos[0]){
							currEffectInfo.c.faceLeft();
							if(_pos[1] == currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'w', range, currEffectInfo.c.pos);
							if(_pos[1] < currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'nw', range, currEffectInfo.c.pos);
							if(_pos[1] > currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'sw', range, currEffectInfo.c.pos);
						}
						else if (_pos[0] == currEffectInfo.c.pos[0]){
							if(_pos[1] < currEffectInfo.c.pos[1]) {selectDirection(currEffectInfo, 'n', range, currEffectInfo.c.pos); currEffectInfo.c.faceRight();}
							if(_pos[1] > currEffectInfo.c.pos[1]) {selectDirection(currEffectInfo, 's', range, currEffectInfo.c.pos); currEffectInfo.c.faceLeft();}
						}
						else if (_pos[0] > currEffectInfo.c.pos[0]){
							currEffectInfo.c.faceRight();
							if(_pos[1] == currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'e', range, currEffectInfo.c.pos);
							if(_pos[1] < currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'ne', range, currEffectInfo.c.pos);
							if(_pos[1] > currEffectInfo.c.pos[1]) selectDirection(currEffectInfo, 'se', range, currEffectInfo.c.pos);
						}
				break;
			}
			if(deselectCombatants){
				deselectCombatantsFunc(_type != 'targetCheck');
			}
			if(runEffectBorderAfter){
				for (i = 0; i < GV.TILE_Y; i++){
					for (j = 0; j < GV.TILE_X; j++){
						getTile([j, i]).effectBorder();
					}
				}
			}
			if(_type == 'ability'){
				for (i = 0; i < GV.TILE_Y; i++){
					for (j = 0; j < GV.TILE_X; j++){
						var t:Tile = getTile([j, i]);
						t.colorBorder(fancy);
					}
				}
			}
		}

		public function selectDirection(currEffectInfo:Object, dir:String, range:int, _pos:Array, endpointsOnly:Boolean = false):void{
			var lastLookedAtTile:Tile;
			for (var i:int = 1; i < range + 1; i++){
				var cPos:Array;
				switch(dir){
					case 'n': cPos = [_pos[0], _pos[1] - i]; break;
					case 's': cPos = [_pos[0], _pos[1] + i]; break;
					case 'e': cPos = [_pos[0] + i, _pos[1]]; break;
					case 'w': cPos = [_pos[0] - i, _pos[1]]; break;
					case 'ne': cPos = [_pos[0] + i, _pos[1] - i]; break;
					case 'nw': cPos = [_pos[0] - i, _pos[1] - i]; break;
					case 'sw': cPos = [_pos[0] - i, _pos[1] + i]; break;
					case 'se': cPos = [_pos[0] + i, _pos[1] + i]; break;
				}
				
				var tile:Tile = getTile(cPos);

				if(tile){
					if(endpointsOnly){
						if(tile.canBeSelected){
							if(tile.occupied && !currEffectInfo.goesThroughThings){ // If occupied and we cannot go through it.
								selectTile(cPos);
								break;
							}else{
								if(i == range){
									selectTile(cPos);
								}else{
									lastLookedAtTile = tile;
								}
							}
						}else{
							if(lastLookedAtTile) selectTile(lastLookedAtTile.pos);
							break;
						}
					}else{
						if(tile.canBeSelected){
							if(tile.occupied && !currEffectInfo.goesThroughThings){
								selectTile(cPos);
								break;
							}else{
								selectTile(cPos);
							}
						}else{
							break;
						}
					}
				}else{
					if(lastLookedAtTile) selectTile(lastLookedAtTile.pos);
					break;
				}
			}
		}

		public function deselectTile(_pos:Array):void{
			getTile(_pos).deselect();
		}

		public function deselectTiles():void{
			for (var j:int = 0; j<GV.TILE_Y; j++){
				for (var i:int = 0; i<GV.TILE_X; i++){
					getTile([i, j]).deselect();
				}
			}
		}

		public function unmarkTiles():void{
			for (var j:int = 0; j<GV.TILE_Y; j++){
				for (var i:int = 0; i<GV.TILE_X; i++){
					getTile([i, j]).unmark();
				}
			}
		}	

		public function deanimateTiles():void{
			for (var j:int = 0; j<GV.TILE_Y; j++){
				for (var i:int = 0; i<GV.TILE_X; i++){
					getTile([i, j]).removeAnimation();
				}
			}
		}

		private function deselectCombatantsFunc(removeAnimation:Boolean){

			for (var i:int = 0, ilen:int = bg.length; i < ilen; i++){
				if(bg[i] && bg[i].canBeTalkedTo === true){
					getTile(bg[i].pos).deselect();
					if(removeAnimation) getTile(bg[i].pos).removeAnimation();
				}
			}

			getTile(hero.pos).deselect();
			if(removeAnimation) getTile(hero.pos).removeAnimation();
			if(summon){			
				getTile(summon.pos).deselect();
				if(removeAnimation) getTile(summon.pos).removeAnimation();
			}
			
		}

		public function getRandomFreePos():Array{
			var taken:Vector.<Array> = new Vector.<Array>();
			for (var i:int = 0, ilen:int = bg.length; i < ilen; i++){
				taken.push(bg[i].pos);
			}
			taken.push(hero.pos);
			if(summon) taken.push(summon.pos);

			var notTaken:Vector.<Array> = combatTilePositions.concat(); // Making a copy.

			for(var j:int = 0; j < taken.length; j++){
				var k:int = 0
				while(k < notTaken.length){
			        if(areEqual(notTaken[k], taken[j])){
			            notTaken.splice(k, 1);
			        }else{
			            k++;
			        }
				}
			}

			//0.99 to ensure never out of bounds
			var randomIndex:int = Math.floor(0.99*Math.random()*notTaken.length);
			return notTaken[randomIndex];
		}

		public function clearAllTileAugments():void{
			for (var j:int = 0; j<GV.TILE_Y; j++){
				for (var i:int = 0; i<GV.TILE_X; i++){
					getTile([i, j]).clearAugment();
				}
			}
		}

		public function lowestHpEnemy():Combatant{
			var lowestHpPercent:Number = 1;
			var lowestEnemy:Combatant;
			for (var i:int = 0, ilen:int = bg.length; i < ilen; i++){			
				var p:Number = bg[i].hp/bg[i].maxHp
				if(p < lowestHpPercent){
					lowestHpPercent = p;
					lowestEnemy = bg[i]; 
				}
			}
			return lowestEnemy;
		}

		public function onTileClick(pos:Array):void{

			if(makingSelection && selectedSlot){
				if(selectedSlot.startable){	
					toBeSetAbilites[selectedSlot.id] == null
					if(selectedSlot.isCharging && (!selectedSlot.targ || (selectedSlot.targ && areEqual(selectedSlot.targ, pos)))){
						hero.endAbilityChargePhase(selectedSlot);
						selectedSlot.abilityTimer.neutral();
						aboveCombatantContainer.removeChild(heroAbilTargetPics[selectedSlot.id]);
					}else{
						setWaitingAbility(selectedSlot.id);
						hero.startAbility(selectedSlot, pos);
					}
				}else{
					if(selectedSlot.queuedAbilTarg && areEqual(selectedSlot.queuedAbilTarg, pos)){
						selectedSlot.queuedAbilTarg = null;
						selectedSlot.hasAbilityQueued = false;
						getTile(pos).clearQueueMarker(selectedSlot.id);
					}else if(!isSafe){
						selectedSlot.queuedAbilTarg = pos;
						selectedSlot.hasAbilityQueued = true;
						var currMarker:SuperMovieClip = getTile(pos).showQueueMarker(selectedSlot.id);
						FX.abilityQueuedSound.play(GV.AUDIO_START_TIME, 0, GV.sfx);

						currMarker.scaleX = currMarker.scaleY = 1;
						GV.s.juggler.tween(currMarker, 0.25, {
						   	transition: Transitions.EASE_OUT,
						   	reverse: true,
						   	repeatCount: 2,
						   	scaleX: 1.5,
						   	scaleY: 1.5,
						   	onComplete: function():void{currMarker.scaleX = currMarker.scaleY = 1;}
						});
					}else{
						hero.statusMsg('ACTION NOT FINISHED', returnColor(selectedSlot.id));
					}
				}
			}
		}

		private function setUpTiles():void{
			var j:int;
			var i:int;
			if(gridInitCompleted){	
				for (j = 0; j<GV.TILE_Y; j++){
					for (i = 0; i<GV.TILE_X; i++){
						getTile([i, j]).resetTile();
					}
				}
			}else{			
				for (j = 0; j<GV.TILE_Y; j++){
					var row:Vector.<Tile> = new Vector.<Tile>();
					for (i = 0; i<GV.TILE_X; i++){
						var tile:Tile = new Tile(i, j);
						row[i] = tile;
						buttonContainer.addChild(tile);
					}
					tiles[j] = row;
				}
				gridInitCompleted = true;
			}

			// Adding borders.
			for (j = 0; j<GV.TILE_Y; j++){
				for (i = 0; i<GV.TILE_X; i++){
					var currTile:Tile = getTile([i, j]);

					if(arenaData.link && areEqual([i, j], arenaData.link.loc)) currTile.createLink(arenaData.link.arena);
					if(GVP.stats.currentMap != 2){					
						var t:Tile;
						t = getTile([i, j-1]);
						if(t && t.canBeBordered && !t.canBeSelected){ currTile.dottedBorderContainer.addChild(currTile.tbrd); }
						t = getTile([i+1, j]);
						if(t && t.canBeBordered){ currTile.dottedBorderContainer.addChild(currTile.rbrd); }
						t = getTile([i, j+1]);
						if(t && t.canBeBordered){ currTile.dottedBorderContainer.addChild(currTile.bbrd); }
						t = getTile([i-1, j]);
						if(t && t.canBeBordered && !t.canBeSelected){ currTile.dottedBorderContainer.addChild(currTile.lbrd); }
					}
				}
			}
		}

		public function specialCheck(s:int):Boolean{
			for(var i:int = 0; i < specialsVector.length; i++){
				if(specialsVector[i] == s) return true;
			}
			return false;
		}

		public function showSpam():void{
			var adBlockExists:Boolean = (summon && (summon.unitType == 'AdBlock') && !isSafe);
			if(adBlockExists){
				var thought:int = Math.ceil(Math.random()*3)
				switch(thought){
					case 1: summon.speechBubble.showSpeech("Oh no, you don't."); break;
					case 2: summon.speechBubble.showSpeech("Nope."); break;
					case 3: summon.speechBubble.showSpeech("No one wants to see your junk."); break;
				}
				summon.speechBubble.showSpeech("Oh no, you don't.");
				summon.statusMsg('ADS BLOCKED', GV.STS_GREEN);
			}else if (specialCheck(GV.ADBLOCK)){
				hero.statusMsg('ADS BLOCKED', GV.STS_GREEN);
			}else{
				// 3 is the max spam count per volley, and 9 is the max spam count in total.
				for(var j:int = 0, jlen:int = 3; j < jlen; j++){
					if(spamCount < 9){			
						spamArray[j] = new SpamAd();						
						spamCount++;
					}
				}
			}
		}

		public function getAvailableStatUnit():StatUnit{
			var i:int = 0;
			while(i < statUnits.length){
				if(statUnits[i].isFree){
					return statUnits[i];
				}else{
					i++;
				}
			}
			return null;
		}

		public function doEffectsOnEnemies(effects:Object, ignoreDamageReturn:Boolean = false):Boolean{
			var missed:Boolean = true;
			for (var i:int = 0, ilen:int = bg.length; i < ilen; i++){
				var c:Combatant = bg[i];
				if(c.isEnemy && c.ourTile.isSelected){	
					missed = doEffectsOnTarget(effects, c.pos, ignoreDamageReturn);
				}
			}
			return missed;
		}

		public function doEffectsOnGoodGuys(effects:Object, ignoreDamageReturn:Boolean = false):Boolean{
			var missed:Boolean = true;
			if(hero.ourTile.isSelected){
				missed = doEffectsOnTarget(effects, hero.pos, ignoreDamageReturn);
			}
			if(summon && summon.ourTile.isSelected){
				missed = doEffectsOnTarget(effects, summon.pos, ignoreDamageReturn);
			}
			return missed;
		}

		public function triggerDamageAugs(effects:Object):Boolean{
			var missed:Boolean = true;
			if(!effects) return missed;
			if(effects.hpChange < 0){			
				var i:int = 0;
				while(i < damageTrigTiles.length){
					var t:Tile = damageTrigTiles[i];
					if(t.wasSelectedThisTurn){	
						t.wasSelectedThisTurn = false;
						damageTrigTiles.splice(i, 1); // Remove this from the array.
						t.triggerAugment(); // This does a select on each explosion which also deselects everything.
						missed = false;
					}else{
						i++;
					}
				}
			}
			return missed;
		}

		public function doEffectsOnAll(effects:Object, ignoreDamageReturn:Boolean = false):Boolean{
			var b1:Boolean = doEffectsOnEnemies(effects, ignoreDamageReturn);
			var b2:Boolean = doEffectsOnGoodGuys(effects, ignoreDamageReturn);
			var b3:Boolean = triggerDamageAugs(effects);
			return b1 && b2 && b3; // You have to whiff all to miss.
		}

		public function doEffectsOnTarget(effects:Object, _pos:Array, ignoreDamageReturn:Boolean = false):Boolean{
			var targ:Combatant = getTile(_pos).occupant;
			var color:uint;
			if(targ && targ.statUnit && effects){	
							
				if(effects.hpChange >= 0 && effects.defChange >= 0 && effects.powChange >= 0 && effects.timeChange >=0){
					color = GV.STS_GREEN;
				}else if(effects.hpChange <= 0 && effects.defChange <= 0 && effects.powChange <=0 && effects.timeChange <=0){
					color = GV.STS_RED;
				}else{
					color = GV.STS_NEUTRAL;
				}

				targ.statusMsg('', color);
				targ.changeHp(effects.hpChange, ignoreDamageReturn, criticalIsHappening);
				targ.changeAp(effects.apChange);
				targ.changeDef(effects.defChange);
				targ.changePow(effects.powChange);
				targ.changeTime(effects.timeChange);
				targ.changeDamageReturn(effects.damageReturnChange);
				targ.changeDot(effects.dotChange);

				return false;
			}
			return true;
		}

		public function startConversation(c:Combatant):void{			
			if (!c.canBeTalkedTo) return;
			paused = true;
			inConversation = true;
			touchTileContainer.touchable = false;
			clearToolTip();
			windowContainer.addChild(bigSpeechBubble);
			neverFlatTextContainer.addChild(bubbleText)
			buttonContainer2.addChild(convoSkipBtn);
			buttonContainer2.addChild(convoNextBtn);
			buttonContainer.touchable = false;
			buttonContainer.visible = false;
			alwaysFlatTextContainer.visible = false;
			alwaysFlattenedContainer.visible = false;		

			// Reset vars.
			currText = ''
			currentNarObj = null;
			currentConObj = null;
			convoCount = -1; // First run increments this at the start.
			lastSpeaker = null;
			whoHeroIsTalkingTo = c;
			var currCon = c.hasOwnProperty('conversationFinder') ? c['conversationFinder']() : c.conversation;
			currentConObj = conObjList[currCon];
			if(!currentConObj){
				currentConObj = conObjList2[currCon];
			}		
			showNextConvoObj();
		}

		public function positionConvoStuff(loc:String):void{

			var currSpeaker:Combatant;

			switch(loc){
				case 'hero': 
					currSpeaker = hero;
				break;
				case 'other': 
					currSpeaker = whoHeroIsTalkingTo;
				break;
				case 'nar':	
					currSpeaker = null;
					bigSpeechBubble.currentFrame = 2;
				break;
			}
			if(currSpeaker != lastSpeaker && currSpeaker != null){

				bigSpeechBubble.currentFrame = 1;
				speechMovingStuff = true;

				const condensedHUDAdjustment:Number = GVP.options.condensedHUD && !isSafe ? 0.9 : 1;

				for(var i:int = 0; i < speechMoveContainers.length; i++){
					GV.s.juggler.tween(speechMoveContainers[i], CONVO_TRANSITION_TIME, {
		               transition: Transitions.EASE_IN,
		               repeatCount: 1,
		               onComplete: showBubble,
		               x: -1*(currSpeaker.x*condensedHUDAdjustment - 640),
		               y: -1*((currSpeaker.y*condensedHUDAdjustment + currSpeaker.height/2 + 10) - 360) 
		            });	
				}

			}else{
				showTextHelper();
			}
			lastSpeaker = currSpeaker;
		}

		private function showBubble():void{
			if(speechMovingStuff){
				speechMovingStuff = false;
				bigSpeechBubble.currentFrame = 0;
				showTextHelper();
			}
		}

		private function showNextConvoObj():void{
			bubbleText.text = '';
			convoCount++;
			if(convoCount == currentConObj.textArray.length){
				endConversation();
			}else{
				var o:Object = currentConObj.textArray[convoCount];
				if(o.func){
					o.func();
				}else{	
					if(o.anim){
						if(o.anim == 'vanish'){
							if(o.location == 'hero'){
								hero.vanish();
							}else {
								whoHeroIsTalkingTo.vanish();
							}
						}else {
							if(o.location == 'hero'){
								hero[o.anim]();
							}else{
								if(whoHeroIsTalkingTo.conversationAvatar){
									whoHeroIsTalkingTo.conversationAvatar[o.anim]();
								}else{
									if(o.anim === "hateAbsorbAnimation" || o.anim === "joyAbsorbAnimation" || o.anim === "betrayal"){
										whoHeroIsTalkingTo[o.anim]();
									} else {
										if(whoHeroIsTalkingTo.hasOwnProperty('changeLook') && whoHeroIsTalkingTo['changeLook']){
											whoHeroIsTalkingTo['changeLook'](o.anim);											
										} else {
											whoHeroIsTalkingTo[o.anim]();
										}
									}								
								}
							}								
						}
					}else{
						if(o.location === 'hero'){
							hero.talkingAnimation();
						}
					}
					showText(o.text);
				}
			}	
		}

		private function onConvoNextClick():void{showNextConvoObj();	}
		private function onConvoSkipClick():void{endConversation();}

		private function showText(str:String):void{ 
			currText = str;
			positionConvoStuff(currentConObj.textArray[convoCount].location);
		}

		private function showTextHelper():void{
			if(buttonContainer.touchable) return; // To prevent code happening after tween.
			var isForNar:Boolean = currentConObj.textArray[convoCount].location != 'nar';
			if(isForNar){
				bubbleText.color = 0xFFFFFF;
			}else{
				bubbleText.color = 0x333333;	
			}
			bubbleText.text = currText;
		}
	
		private function endConversation():void{
			buttonContainer.visible = true;
			alwaysFlatTextContainer.visible = true;
			alwaysFlattenedContainer.visible = true;
			paused = false;
			inConversation = false;

			hero.idleAnimation();
			if(whoHeroIsTalkingTo.conversationAvatar) whoHeroIsTalkingTo.conversationAvatar.idleAnimation();

			windowContainer.removeChild(bigSpeechBubble);
			neverFlatTextContainer.removeChild(bubbleText)
			buttonContainer2.removeChild(convoSkipBtn);
			buttonContainer2.removeChild(convoNextBtn);
			
			buttonContainer.touchable = true;

			if(currentConObj.func) currentConObj.func();

			for(var i:int = 0; i < speechMoveContainers.length; i++){
				GV.s.juggler.tween(speechMoveContainers[i], CONVO_TRANSITION_TIME, {
	               transition: Transitions.EASE_OUT,
	               repeatCount: 1,
	               delay: 0.25,
	               x: xAdjustGrid,
	               y: yAdjustGrid
	            });	
			}
			touchTileContainer.touchable = true;
		}

		public function showTooltip(str:String):void{

			setTimeout(function():void{
				bigSpeechBubbleAlphaAnimation();
				windowContainer.addChild(bigSpeechBubble);
				neverFlatTextContainer.addChild(tooltipText)
				bigSpeechBubble.currentFrame = 3;
				tooltipText.text = str; 
			}, 100);
		}
		
		public function bigSpeechBubbleAlphaAnimation():void{
			addEventListener(starling.events.Event.ENTER_FRAME, bigSpeechBubbleAlphaOnFrame);
			bigSpeechBubble.alpha = 0;					
		}

		private function bigSpeechBubbleAlphaOnFrame():void{
			if(bigSpeechBubble.alpha < 1 ){
				bigSpeechBubble.alpha += 0.02 * GV.speedFactor;
			}else{
				bigSpeechBubble.alpha = 1;
				removeEventListener(starling.events.Event.ENTER_FRAME, bigSpeechBubbleAlphaOnFrame);
			}		
		}

		public function clearToolTip():void{
			windowContainer.removeChild(bigSpeechBubble);
			neverFlatTextContainer.removeChild(tooltipText);
		}

		public function getFreeComment():int{
			commentIndex++;
			if(commentIndex >= (numOfPossibleComments - 1)) commentIndex = 0;
			return possibleComments[commentIndex];
		}

		public function shakeAnimation(ms:int = 1000):void{
			addEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
			baseX = x;
			baseY = y;
			setTimeout(onshakeFinish, ms);
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
	}
}