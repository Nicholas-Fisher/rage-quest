public var map:Map = new Map;
public var shop:Shop = new Shop;
private var fc:Sprite;
private var nar:Narrative = new Narrative;
private var ops:Options = new Options;
private var men:MenuPage = new MenuPage;
private var equip:Equip = new Equip;
private var controls:Controls = new Controls;
private var save:Save = new Save;
private var titleScreen:TitleScreen = new TitleScreen;
private var debug:Debug = new Debug;
private var ls:LoadingScreen = new LoadingScreen;
private var notice:Notice = new Notice;
private var pressFlash:PressFlash = new PressFlash;
private var currentNarObj:Object;
private var currentConObj:Object;
private var count:int = 0;
private var mapData:Object;
private var arenaData:Object;
private var currentArenaBtn:MovieClip;
private var currentSpecialArenaName:String;
private var justHadVictory:Boolean;
private var afterBattleScreenIsShown:Boolean = false;
private var finalBitcoinReward:int;
private var finalStatPointReward:int;
private const COUNTER_TICK:int = 20;
private const TOTAL_TICK_TIME:int = 1000; // ms

public var afterBattleScreen:AfterBattleScreen = new AfterBattleScreen;
private var afterBattleScreenAlphaTween:Tween = new Tween(afterBattleScreen, "alpha", Regular.easeIn, 0, 1, 0.5, true);
public var tutorialScreen = new TutorialScreen;
private var tutAlphaTween:Tween = new Tween(tutorialScreen, "alpha", Regular.easeIn, 0, 1, 0.5, true);
public var popUpScreen:PopUpScreen = new PopUpScreen;
private var popAlphaTween:Tween = new Tween(popUpScreen, "alpha", Regular.easeIn, 0, 1, 0.5, true);
public var whiteMask:WhiteMask = new WhiteMask;
private var whiteMaskTween:Tween = new Tween(whiteMask, "alpha", Regular.easeIn, 1, 0, 0.5, true);

// Shared between shop/equip screens:
private var catType:String;
private var currentSelectionInfo:Object;
private var thingsToChooseFrom:Vector.<Object>;
private var currPage:int;

include 'Map.as';
include 'Shop.as';
include 'Equip.as';
include 'Options.as';
include 'Narrative.as';
include 'Quests.as';
include 'Utility.as';

private function initFC():void{

	initNarrative();
	initOptions();
	initShop();
	initMap();
	initEquip();
	initSave();

	men.achievementsBtn.visible = false;

	if(!GV.DESKTOP_MODE){
		men.controlsBtn.visible = false;
	}

	if(GV.playSignedIn){
		men.achievementsBtn.visible = true;
	}

	men.achievementsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){		
		GV.showAchievements();
	});	
	men.mapBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){		
		showMap();
	});
	men.shopBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShop();
	});
	men.equipBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showEquip();
	});
	men.optionsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showOptions();
	});
	men.creditsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showCreditsOnly();
	});
	men.controlsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showNew(controls);
	});
	controls.menuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showMenu();
	});
	afterBattleScreen.mapBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		battleOver();
		showMap();
	});
	afterBattleScreen.equipBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		battleOver();
		showEquip();
		showEquipUseable();
	});
	afterBattleScreen.shopBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		battleOver();
		showShop();
	});
	afterBattleScreen.contBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		battleOver();
	});

	popUpScreen.contBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		removePopUp();		
	});

	popUpScreen.option1Btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		removePopUp();
		GV.arena.func1();
	});

	popUpScreen.option2Btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		removePopUp();
		GV.arena.func2();
	});

	debug.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		fc.removeChild(debug);
	});

	debug.x = 100;
	debug.y = 100;	

	whiteMask.mouseEnabled = false;

	notice.x = 640;
	notice.y = 360;

	notice.okayBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		fc.removeChild(notice);
	});

	pressFlash.visible = false;	
	pressFlash.mouseEnabled = false;
	pressFlash.x = 640;
	pressFlash.y = 360;
	fc.addChild(pressFlash);

	fc.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){	
		if(!GV.DESKTOP_MODE && fc.contains(pressFlash)){
			fc.setChildIndex(pressFlash, fc.numChildren - 1);
			pressFlash.visible = true;
			pressFlash.x = fc.mouseX;
			pressFlash.y = fc.mouseY;
			pressFlash.gotoAndPlay(1);
		}			
	});

	GV.stage.initGameDataScreen();
}

public function testArena():void{
	GVP.stats.currentMap = 0;
	arenaData = { 
		objectArray: [{id: 'Troll', lvl: 10, pos: [3,0]}, {id: 'InsanityWolf', lvl: 10, pos: [3,1]}, {id: 'Malware', lvl: 10, pos: [3,2]}],
		heroPos: [3,3], noTileBorders: true,
		tileMap: [/*
			'000','001','002','003','004','005'*/
			'c82','c83','c82','c97','c82','c83',//0
			'c83','c82','c83','c97','c83','c82',//1
			'c82','c83','c82','c97','c82','c83',//2
			'c83','c82','c83','c82','c83','c82',//3
			'c82','c83','c82','c83','c82','c83',//4
		]
	};
	showArena();
}

public function showTutorial():void{
	tutorialScreen.stop();
	tutorialScreen.visible = true;
	GV.arena.greyOutArena();
	GV.arena.clearToolTip();
	tutorialScreen.condensedTutorial1.visible = false;
	tutorialScreen.condensedTutorial2.visible = false;
	GV.arena.enableAllButtons();
	tutorialScreen.contBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		tutorialScreen.condensedTutorial1.visible = false;
		tutorialScreen.condensedTutorial2.visible = false;
		switch(tutorialScreen.currentFrame){
			case 2:				
				if(!GVP.options.condensedHUD){
					tutorialScreen.condensedTutorial1.visible = true;					
				}
			break;
			case 3:
				if(!GVP.options.condensedHUD && GV.DESKTOP_MODE){					
					tutorialScreen.condensedTutorial2.visible = true;
				}
				if(!GV.DESKTOP_MODE){
					tutorialScreen.nextFrame();
				}
			break;

		}
		if(tutorialScreen.currentFrame === 5){
			GV.arena.unGreyOutArena();
			GV.arena.paused = false;
			GV.arena.isTutorial = false;
			GV.arena.showTooltip('Press an action button on the right to move, attack, or block. Then, press somewhere in the highlighted area to target the action. The action will execute when the charge timer hits zero.');	
			removePopUp();
		}else{
			tutorialScreen.nextFrame();

		}
	});

	tutAlphaTween.start();  	
   	tutorialScreen.gotoAndStop(1);   	
   	showNew(tutorialScreen, true);
   	
}

public function onBackButton():void{	
	if(GV.arena && GV.arena.isActive){
		GV.arena.exitArena();
	}else if(map.worldMenu.visible){
		map.worldMenu.backBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}else{
		var screensWithBackButtons = [map, shop, ops, equip];
		for (var i:int = 0; i < screensWithBackButtons.length; i++){
			var currScreen = screensWithBackButtons[i];
			if(fc.contains(currScreen)){ // If we are currently on this screen.
				if(currScreen.backBtn && currScreen.backBtn.visible){
					currScreen.backBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
				}else if(currScreen.menuBtn && currScreen.menuBtn.visible){
					currScreen.menuBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
				}
			}
		}
	}
}

public function removePopUp():void{
	if(GV.arena){
		GV.arena.unGreyOutArena();
		if(GV.arena.wasVictorious){
			GV.arena.endBattleScreen();
		} else {
			clearFC();
		}
	}
}

public function battleOver():void{
	afterBattleScreenIsShown = false;	
	if(justHadVictory){
		removeArena(true);
	}else{
		removeArena(false);
	}
}
public function showDebug(str:String):void{	 
	if(!fc.contains(debug)){
		fc.addChild(debug);
		debug.msg.text = '';
	}else{
		fc.setChildIndex(debug, fc.numChildren - 1)
	}	
	debug.msg.appendText('\n'+str);	
}

private function clearFC():void{
	while (fc.numChildren > 0) {
	    fc.removeChildAt(0);
	}
}

private function showNew(mc:MovieClip, skipAnim:Boolean = false):void{
	clearFC();
	fc.addChild(pressFlash);
	fc.addChild(mc);
	if(!skipAnim){
		fc.addChild(whiteMask)
		whiteMaskTween.start();
	}	
}

private function showMenu():void{
	showNew(men);
	var stats:Object = GVP.stats;
	men.infoText.text = "HP: " + stats.hp
	+ "\nAP: " + stats.ap
	+ "\nPOW: " + stats.pow
	+ "\nDEF: " + stats.def
	+ "\n\nBitcoins: " + stats.bitcoins
	+ "\nStat Points: " + stats.statPoints
	+ "\nTotal Bitcoins Earned: " + stats.totalBitcoinsEarned
	+ "\nTotal Stat Points Earned: " + stats.totalStatPointsEarned
	+ "\n\nCurrent Main Quest: " + getActiveMainQuest().name
	+ "\nTime Played: " + msToHours(stats.totalPlayTime);	
}

public function sortThings():void{
	var temp:Vector.<Object> = new Vector.<Object>(45); //31
	for(var i:int = 0, ilen:int = thingsToChooseFrom.length; i < ilen; i++){
		var thing:Object = thingsToChooseFrom[i];
		if(thing.storeOrder != undefined){ // && thing.cost){		
			temp[thing.storeOrder] = thing;
		}
	}
	i = 0;
	while(i < temp.length){
		if(temp[i] == null){
			temp.splice(i, 1);
		}else{
			i++;
		}
	}
	thingsToChooseFrom = temp;
}

public function showNotice(str){	
	notice.noticeText.text = str;
	fc.addChild(notice);
}

public function endBattle():void{

	var COUNTER:Boolean = false;
	var overwriteHint:Boolean = true;

	showNew(afterBattleScreen, true);
	afterBattleScreenIsShown = true;
	afterBattleScreenAlphaTween.start();

	if(!GV.arena || !GV.arena.isActive) return;

	var rewardLine:String = '';
	var rp:int = GV.arena.rewardPoints;
	if (GV.arena.wasDefeatedBefore) rp = Math.round(GV.arena.rewardPoints/2);
	finalBitcoinReward = rp;
	finalStatPointReward = Math.round(rp/2);

	GVP.stats.bitcoins += finalBitcoinReward;
	GVP.stats.statPoints += finalStatPointReward;
	GVP.stats.totalBitcoinsEarned += finalBitcoinReward;
	GVP.stats.totalStatPointsEarned += finalStatPointReward;

	//Ideas for bonuses: No damage, under 3 minutes, half damage in one turn
	afterBattleScreen.bitcoinText.text = '';
	afterBattleScreen.spText.text = '';

	afterBattleScreen.shopBtn.visible = false;
	afterBattleScreen.mapBtn.visible = false;
	afterBattleScreen.equipBtn.visible = false;
	afterBattleScreen.contBtn.visible = false;

	if(GV.arena.narrativeBattle){
		afterBattleScreen.contBtn.visible = true;
	}else{
		afterBattleScreen.shopBtn.visible = true;
		afterBattleScreen.mapBtn.visible = true;
		afterBattleScreen.equipBtn.visible = true;
		if(GVP.notices.firstEndOfBattle){
			afterBattleScreen.hintText.text = "The map button will return you to the screen where you can select the next sector. The shop button will take you to the screen where you can buy things. The equip button will take you to the screen where you can equip items and abilities."
			GVP.notices.firstEndOfBattle = false;
			overwriteHint = false;
		}
	}
	
	afterBattleScreen.timeElapsedText.text = msToHours((getTimer() - GV.arena.startTime));
	afterBattleScreen.lootLabelText.text = '';
	afterBattleScreen.lootText.text = '';
	afterBattleScreen.bitcoinLabelText.text = 'Bitcoin earned: ';
	afterBattleScreen.spLabelText.text = 'SP earned: ';
	afterBattleScreen.lootIcon.visible = false;

	if(GV.arena.wasVictorious){
		justHadVictory = true;
		afterBattleScreen.titleText.text = 'Victory!';		

		afterBattleScreen.bitcoinText.text = finalBitcoinReward.toString();
		afterBattleScreen.spText.text = finalStatPointReward.toString();

		if(!GV.arena.wasDefeatedBefore){
			thingsToChooseFrom = Assignables.buyable('items');
			var rand:int = Math.round(Math.random()*(thingsToChooseFrom.length - 1));
			var loot:Object = thingsToChooseFrom[rand];			
			afterBattleScreen.lootLabelText.text = 'Loot: ';
			afterBattleScreen.lootText.text = loot.gameName;
			afterBattleScreen.lootIcon.gotoAndStop(loot.pic);
			afterBattleScreen.lootIcon.visible = true;
			Assignables.changeStock(loot, 1)
		}else{		
			afterBattleScreen.disclosureText.text = 'Since you completed this sector before you will receive half rewards and no loot :[';
		}
	}else{
		justHadVictory = false;
		afterBattleScreen.titleText.text = 'Defeat.';		
		afterBattleScreen.spText.text = '0';
		afterBattleScreen.bitcoinText.text = '0';
	}

	afterBattleScreen.spTotalText.text = GVP.stats.statPoints;
	afterBattleScreen.bitcoinTotalText.text = GVP.stats.bitcoins;

	if(overwriteHint){
		afterBattleScreen.hintText.text = hintGenerator();	
	}

	if (GVP.stats.bitcoins > 500 && GVP.stats.currentMap === 0 && !GVP.notices.spendBitcoin) {
		GVP.notices.spendBitcoin = true;
		showNotice("You've acquired a substantial amount of bitcoin. You can select \"Shop\" to spend it. The shop can also be accessed from the main menu.")
	}	
}

public function hintGenerator():String{	
	const HINT_NUM:int = GV.DESKTOP_MODE ? 10 : 9;
	var rand:int = Math.floor(Math.random()*HINT_NUM);
	var hint:String = "";
	switch(rand){
		case 0: hint = "Don't forget to upgrade your stats and buy items, equipment. and abilities at the shop!"; break;
		case 1: hint = "All damaging abilities are guaranteed to do at least 1 damage to effected targets, even if the targets DEF surpasses the damage amount."; break;
		case 2: hint = "You don't have to complete every battle to progress. You can choose alternate routes and ignore some fights completely."; break;
		case 3: hint = "Pause often! It's your chance to strategize. You can even make moves while paused!"; break;
		case 4: hint = "Never trust a Nigerian Prince that you haven't met in person."; break;
		case 5: hint = "You can reassign an action to any slot under any color (blue, red, or green)."; break;
		case 6: hint = "If a slot is on cooldown, you can still queue an action equipped to that slot by selecting the action and targeting it. A marker will appear to indicate where the action will be executed once the cooldown phase is over."; break;
		case 7: hint = "You can queue abilities by targeting a slot that is currently on cooldown."; break;
		case 8: hint = "There is a " + GV.CRITICAL_DAMAGE_CHANCE*10 + "% chance that any damaging attack will land as a critical attack and do 150% damage."
		case 9: hint = 'Keyboard shortcuts: "1" for your blue action, "2" for your red action, "3" for your green action, spacebar to pause, "S" to toggle speed, and "Q, W, E, or R" to pick a reserve action.'; break;
		default: hint = ":D"
	}
	return hint;
}

public function infoText(o:Object):String{
	var info:String = '';

	if(o.classification){ //then this is equipment
		info += 'POW: ' + o.powChange; 
		info += '\n\nDEF: ' + o.defChange;
	}else{
		if(o.deselectCombatants) info += 'This action cannot target tiles with combatants on them.\n\n'; 

		if(o.effectType == 'augment'){
			info += 'Trap: '
			info += 'This action places a trap on the targeted tile, which can be triggered by ';
			switch(o.augmentTrigger){
				case 'damage': info += 'a damaging action.'; break;
				case 'proximity': 
					if(o.effectTargetType == 'good-guys') info += 'Zye or an allied summon moving onto the tile.'; 
					else if(o.effectTargetType == 'enemies') info += 'an enemy of Zye moving onto the tile.'; 
					else if(!o.effectTargetType) info += 'a combatant moving onto the tile.'; 
				break;
			}
			info += ' Once triggered, this actions\'s effects will execute.\n\n';
		}

		if(o.effects){
			info += 'Effects:'
			if(o.effectType == 'temporary') info += ' temporarily...'
			//info += ':'
			if(o.effects.hpChange){
				if(o.effects.hpChange < 0) info += '\n- Damages effected combatants for ' + powNum(o.effects.hpChange);
				if(o.effects.hpChange > 0) info += '\n- Heals effected combatants for ' + powNum(o.effects.hpChange);
				if(Math.abs(o.effects.hpChange) < GV.EFFECTTHRESHOLD)  info += ' x POW';
			} 
			if(o.effects.apChange){
				if(o.effects.apChange < 0) info += '\n- Lowers effected combatants AP by ' + powNum(o.effects.apChange);
				if(o.effects.apChange > 0) info += '\n- Raises effected combatants AP by ' + powNum(o.effects.apChange);
				if(Math.abs(o.effects.apChange) < GV.EFFECTTHRESHOLD)  info += ' x POW';
			} 
			if(o.effects.defChange){
				if(o.effects.defChange < 0) info += '\n- Lowers effected combatants DEF by ' + powNum(o.effects.defChange);
				if(o.effects.defChange > 0) info += '\n- Raises effected combatants DEF by ' + powNum(o.effects.defChange);
				if(Math.abs(o.effects.defChange) < GV.EFFECTTHRESHOLD)  info += ' x POW';
			} 
			if(o.effects.powChange){
				if(o.effects.powChange < 0) info += '\n- Lowers effected combatants POW by ' + powNum(o.effects.powChange);
				if(o.effects.powChange > 0) info += '\n- Raises effected combatants POW by ' + powNum(o.effects.powChange);
				if(Math.abs(o.effects.powChange) < GV.EFFECTTHRESHOLD)  info += ' x POW';
			} 
			if(o.effects.timeChange){
				if(o.effects.timeChange < 0) info += '\n- Slows down effected combatants actions for ' + powNum(o.effects.timeChange) + 's';
				if(o.effects.timeChange > 0) info += '\n- Speeds up effected combatants actions for ' + powNum(o.effects.timeChange) + 's';
			} 
			if(o.effects.damageReturnChange){
				if(o.effects.damageReturnChange > 0) info += '\n- Causes effected combatants to reflect ' + powNum(o.effects.damageReturnChange*100) + '% of incoming damage (before DEF reduction)';
				if(o.effects.damageReturnChange < 0) info += '\n- Causes effected combatants to heal their attacker for ' + powNum(o.effects.damageReturnChange*100) + '% of incoming damage (before DEF reduction)';
			} 
			if(o.effects.dotChange){
				if(o.effects.dotChange < 0) info += '\n- Causes effected combatants to take ' + Math.round(Math.abs(o.effects.dotChange)*100) + '% damage periodically';
				if(o.effects.dotChange > 0) info += '\n- Causes effected combatants to heal for ' + Math.round(Math.abs(o.effects.dotChange)*100) + '% periodically';
			} 
			if(o.effectType == 'temporary') info += '\n\nfor ' + o.tempAbilSeconds + 's, after which the effects will revert';

			if(o.effectType == 'leech') info += '\n\nand applies the inverse of the aforementioned effects to the user';
			info += '.\n\n'
		}

		if(o.effectSelectType && (o.effectSelectType === 'direction' || o.effectSelectType === 'vector')){			
			info += 'Area of Effect: All tiles in a straight line from the user to (and including) the target tile.\n\n'
		}

		if(o.effectTargetType){
			info += 'This action only effects ';
			switch(o.effectTargetType){
				case 'good-guys': info += 'Zye and his summons'; break;
				case 'enemies': info += 'enemy units (not Zye or his summons)'; break;
			}
			info += '.\n\n'
		}

		info += 'Charge Time: ' + o.charge + 's'; 
		info += '\nCooldown Time: ' + o.cooldown + 's';
		if(o.ap) info += '\nAP cost: ' + o.ap;
	}
	return info;
}

private function toggleBtn(btn:MovieClip, _enabled:Boolean):void{
	if(_enabled){
		btn.alpha = 1;
		btn.mouseEnabled = true;
		btn.mouseChildren = true;
	}else{
		btn.alpha = 0.3;
		btn.mouseEnabled = false;
		btn.mouseChildren = false;
	}
}

private function powNum(i:Number):String{
	return Math.abs(i).toString();
}

public function showPopUp(title:String, subtitle:String, msg:String, hasOption:Boolean = false, option1:String = '', option2:String = ''):void{
	
	if(!GV.arena || !GV.arena.isActive) return;

   	if(hasOption){
   		popUpScreen.contBtn.visible = false;
   		popUpScreen.option1Btn.visible = true;
		popUpScreen.option2Btn.visible = true;
   		popUpScreen.option1Text.text = option1;
		popUpScreen.option2Text.text = option2;
   	}else{
   		popUpScreen.contBtn.visible = true;
   		popUpScreen.option1Btn.visible = false;
   		popUpScreen.option2Btn.visible = false;
   		popUpScreen.option1Text.text = '';
		popUpScreen.option2Text.text = '';
   	}

   	popUpScreen.titleText.text = title;
   	popUpScreen.subtitleText.text = subtitle;
   	popUpScreen.infoText.text = msg

   	showNew(popUpScreen, true);
   	popAlphaTween.start();

	GV.arena.greyOutArena();	
}
