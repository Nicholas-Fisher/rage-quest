private var arenaList:Vector.<Object> = new Vector.<Object>;
private var worldMenu = map.worldMenu;
private var worldButtons:Vector.<MovieClip> = new <MovieClip>[worldMenu.m_0, worldMenu.m_1, worldMenu.m_2, worldMenu.m_3]
private var enemyInfoBtns:Vector.<MovieClip> = new <MovieClip>[map.enemyButtonContainer.e0infoBtn, map.enemyButtonContainer.e1infoBtn, map.enemyButtonContainer.e2infoBtn, map.enemyButtonContainer.e3infoBtn, map.enemyButtonContainer.e4infoBtn];
private var currentMap:int;
private var currSelectedWorld:int;
private var mapDescriptions:Vector.<String> = new Vector.<String>;
private var afterBattleFunc:Function;
private var currInfoClass:String;
private var currInfoLevel:int;
private var enemyAbilButtons:Vector.<MovieClip> = new <MovieClip>[map.info.blueInfo, map.info.redInfo, map.info.greenInfo];
public var avatar:Combatant
public var p:Array;
public var mapNames:Vector.<String> = new Vector.<String>;

include 'mapData/firstMapData.as';
include 'mapData/secondMapData.as';
include 'mapData/thirdMapData.as';
include 'mapData/fourthMapData.as';

private function initMap():void{

	mapDescriptions[0] = "The landing area for newcomers. The threats found here are your garden variety internet nuisances. Maybe that's why the world looks so green and leafy. \n\nNew enemies: Malware, Spam, Bloatware, Youtube Comment";
	mapDescriptions[1] = "The world that represents social media. It's a craggy and cavernous world of virality.\n\nNew Enemies: Insanity Wolf, Socially Awkward Penguin, Scumbag, Judgment.";
	mapDescriptions[2] = "The world that represents online gaming. It's a constant war zone filled with destruction and mayhem.\n\nNew Enemies: Troll, Flamer, Hacker.";
	mapDescriptions[3] = "The world that represents corporate influence. Here, the true rulers of the internet control the flow of digital information. \n\nNew Enemies: User Data, Censor, Fake News.";

	mapNames[0] = "The Surface";
	mapNames[1] = "The Hive";
	mapNames[2] = "The Pit";
	mapNames[3] = "The Bastion";	
	
	for(var i:int = 0, ilen:int = enemyInfoBtns.length; i < ilen; i++){
		enemyInfoBtns[i].addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
			if(e.target.parent.enemyNameText){			
				var a:Array = e.target.parent.enemyNameText.text.split(' ');
				currInfoClass = e.target.parent.enemyClassName;
				currInfoLevel =  e.target.parent.enemyLevel;
				showEnemyInfo();
				showMapInfo();
			}
		});
	}
	
	map.info.backBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		map.info.visible = false;
		map.mapContainer.visible = true;
		GV.sc.clearStarlingContainer();
	});

	map.menuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showMenu();
		worldMenu.visible = false; // Necessary for specific back button functionality on this screen.
		map.mapContainer.visible = true;
		GV.sc.clearStarlingContainer();
	});

	map.startBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(arenaData && !arenaData.locked || GV.TEST_MODE){
			p = arenaData.pos;
			showArena();
		}
	});

	map.legendBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		map.legend.visible = !map.legend.visible;
	});

	map.legend.closeBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		map.legend.visible = false;
	});

	map.worldBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		worldMenu.visible = true
		worldMenu.descriptionTitle.text = '';
		worldMenu.description.text = 'Select a world on the left to enable the travel button.';
		toggleBtn(worldMenu.travelBtn, false);
	});

	worldMenu.backBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		worldMenu.visible = false;
	});

	worldMenu.m_0.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){selectWorld(0);});
	worldMenu.m_1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){selectWorld(1);});
	worldMenu.m_2.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){selectWorld(2);});
	worldMenu.m_3.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){selectWorld(3);});

	worldMenu.travelBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		GVP.stats.currentMap = currSelectedWorld;
		currentMap = currSelectedWorld;
		worldMenu.visible = false;
		showMap();
		map.mapName.text = mapNames[currentMap];
		GV.stage.saveGame();
		if (!GVP.stats.hasVisitedWorld[currSelectedWorld]){		
			GVP.stats.hasVisitedWorld[currSelectedWorld] = true;
			switch(mapNames[currSelectedWorld]) {
				case "The Hive": GV.narIntroHive(); break;
				case "The Pit": GV.narIntroPit(); break;
				case "The Bastion": GV.narIntroBastion(); break;
				case "The Core": GV.narIntroCore(); break;
			}
		}
	});

	map.info.blueInfo.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		enemyAbilBtnPress(0);
	});
	map.info.redInfo.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		enemyAbilBtnPress(1);
	});
	map.info.greenInfo.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		enemyAbilBtnPress(2);
	});

	map.legend.visible = false;
}

private function bossInfoString(boss){
	return "\n\nBlue Ability: " + EnemyAbils[boss + '1'].description + "\n\nRed Ability: " + EnemyAbils[boss + '2'].description + "\n\nGreen Ability: " + EnemyAbils[boss + '3'].description;
}

private function enemyAbilBtnPress(b:int):void{
	for(var i:int = 0; i < enemyAbilButtons.length; i++){
		enemyAbilButtons[i].gotoAndStop(1);
	}
	enemyAbilButtons[b].gotoAndStop(2);
	stringifyCombatantAbility(b);
}

private function selectWorld(w:int):void{
	currSelectedWorld = w;
	toggleBtn(worldMenu.travelBtn, true);
	worldMenu.description.text = mapDescriptions[w];
	worldMenu.descriptionTitle.text = mapNames[w];
}

private function showMapInfo():void{
	map.info.visible = true;
	map.info.blueInfo.visible = true;
	map.info.redInfo.visible = true;
	map.info.greenInfo.visible = true;
}

private function showStarlingAvatar(className:String):void{
	map.mapContainer.visible = false;
	GV.sc.clearStarlingContainer();
	var MyClass:Class = getDefinitionByName('classes::' + className) as Class;	
	trace('className', className);
	if(className === 'GenericTarget') return;
	avatar = new MyClass();
	avatar.x = 99;
	avatar.y = 162;
	avatar.init(1);
}

private function showEnemyInfo():void{
	showStarlingAvatar(currInfoClass);
	map.info.nameText.text = fixName(currInfoClass);
	map.info.statsText.text = stringifyCombatant(currInfoClass);
	enemyAbilBtnPress(0);
	var infoStr:String = "???";
	switch (currInfoClass){
		case 'Malware':
			infoStr = "Malware stands for \"malicious software\". These guys are essentially the foot soldiers of internet nuisances. They're everywhere and always manage to keep up with the times. In combat, they're fairly predictable melee attackers. Just be careful about letting them cover to much of the map with viruses, or you'll find your safe movement options limited.";
		break;
		case 'Spambot':
			infoStr = "Spambots are the close kin of malware. A spambot is a script written to barrage internet users with spam for someone's monetary gain in the form of ad impressions. In combat, these are ranged attackers that will routinely pepper the screens with popups that obscure vision. Fortunately, the popups can be closed by pressing the little X's.";
		break;
		case 'Bloatware':
			infoStr = "Bloatware is the software on your devices that you didn't ask for, and didn't need. It too is a staple of the internet because a very large quantity of software downloads on the internet comes packaged with some kind of bloatware unless you're vigilant enough to uncheck the right boxes during the installation. In combat, bloatware will use it's massive size to roll over enemies while moving across the map. From time to time, it will increase it's mass by downloading additional software, and in turn, this gives it greater crushing power.";
		break;
		case 'YoutubeComment':
			infoStr = "YouTube comments are the go to example of vitriol and toxicity on the internet. It's not because of anything to do with the YouTube service itself, but this tends to be the result of any massively popular mainstream site maintaining a commenting system. In combat, they are aggressive melee warriors that periodically say such stupid things that they'll lower the DEF of both friend and foe close to them.";
		break;
		case 'Penguin':
			infoStr = "The socially awkward penguin is an advice-animals class meme that's emblematic of socially awkward people/situations. In combat, the socially awkward penguin will get timid for a POW increase and actively move away from Zye whenever he approaches into melee range. Its awkward glare will lower the offensive capability of its target.";
		break;
		case 'InsanityWolf':
			infoStr = "The insanity wolf is an advice-animals class meme that's emblematic of insane people. In combat, the insanity wolf strikes fair into the hearts of his enemies on approach for a DEF drop, powers up nearby allies with a invigorating roar for a POW increase, and delivers a strong melee attack.";
		break;
		case 'Scumbag':
			infoStr = "The scumbag is an advice-animals class meme that's emblematic of people that do really scummy things. Though, eventually it kind of devolved into just being a hat that you put on things you don't like much. In combat, the scumbag will fight dirty by flicking dirt at its target from a distance to do both damage and lower their DEF. It's also capable of shoving Zye back if he gets to close.";
		break;
		case 'Troll':
			infoStr = 'The attention seekers of the internet. Almost all teenagers and some adults go through a period where they equate self worth with attention received, be it positive or negative. Hence, this enemy type will try to draw your abilities toward with its agro ability, and once it has your attention, it can then work its dark magic. Avoid targeting this enemy type early in a fight or it will power up all of its allies. Perhaps instead, use a summon to fight it, or use abilities with an area of effect so you can indirectly attack it.';
		break;
		case 'Flamer':
			infoStr = "In internet lingo, the term 'flamer' is essentially a synonym for hater. Flamers are the folks who spew unproductive criticism whenever they get the chance, usually in an attention-grabbing and uncouth manner. In combat, the flamer launches explosive ranged attacks that damage friend or foe. If they're about to perish, the flamer will attempt to \"rage quit\" and blow up nearby combatants. Flamers also make any tile they move onto volatile.";
		break;
		case 'Hacker':
			infoStr = "An especially annoying enemy type to fight. The hacker uses external software or hardware to bend the rules of the game. In the case of this game, they periodically teleport anywhere on the map through the use of their lag switch, they have an attack with infinite range due to the use of their aim bot, and they regenerate health regularly through general hacker nonsense. No one really knows why hackers care so much about illegitimately increasing their ranks on leaderboards in video games that people play for fun. But in the words of one hacker: \"Seeing my numbers go up just gives me that sweet sweet hit of dopamine. What can I say, man?\"";
		break;
		case 'TrainingDummy':
			infoStr = "The training dummy is a staple of video game tutorials everywhere. Much like the cyborg ninja, It loves pain.";
		break;

		case 'FakeNews':
			infoStr = "Fake news is fiction created and presented to appear as fact. The internet, and more specifically, social media has lead to the creation of mostly impenetrable media echo chambers where people opt to read news they like, rather than news that's... well... news. In combat, fake news employs the power of obfuscation to hide the HUD for 10 seconds at a time, and the power of distortion to heavily damage and stun their target at a great range.";
		break;
		case 'UserData':		
			infoStr = "Keeping track of user data has proven to be a very lucrative business for internet companies. With enough data on a particular user, you begin to know them on a very personal level and advertise to them hyper effectively. Usually, when a service on the internet is offered for free and it's not obvious how that service makes money, the revenue comes from the collection and dissemination of user data. The user data enemy type is able to increase its POW by analyzing its target In combat. It can also data scrape its target to siphon HP and revitalize itself. A ranged attacker.";
		break;
		case 'Censor':
			infoStr = "The censor is the specter of darkness on the internet. It comes in many forms: government firewalls, region locking, and sometimes even gold old fashioned intimidation. In combat, the censor will periodically block the entire view of the battlefield for a short interval of time. It attacks by suffocating nearby foes in a blinding mist.";
		break;
		case 'Judgment':
			infoStr = "Figuring out a demographics likes and dislikes is a big part of capturing actionable data for advertisers. Thus, almost every mainstream media consumption site has some kind of easy thumbs-up/thumbs-down feedback system for users. In combat, judgment is a ranged healer and attacker. Its upvote heals a single ally, and its downvote damages a single enemy. In battle, it's usually prudent to defeat judgments first."
		break;
		case 'Malphaware':
			infoStr = "When the vault was filled to capacity, this anti-virus software began to assimilate malware instead of quarantining it. The result was this monstrosity.";
		break;
		case 'OmegaPenguin':
			infoStr = "The Omega Penguin was so socially awkward that he was shunned by all of the other penguins."
		break;
		case 'AlphaWolf':
			infoStr = "The Alpha Wolf was insane and dominant enough to become the pack leader of all the insanity wolves."
		break;
		case 'HiveMind':
			infoStr = "Does social media give us all a voice, or does it just make us all say the same thing? Probably a little of both."
		break;
		case 'Gamergate':
			infoStr = "The Gamergate is a fickle creature with an easily bruised ego, if you attack while it's charging its blue action, that action will immediately be pushed into its cooldown phase."
		break;
		case 'PRISM':
			infoStr = "PRISM has incredible battle prowess due to the acquisition and analysis of thousands of petabytes of user data. She is currently the second most powerful entity in this world."
		break;
		case 'HateVirus':
			infoStr = "All of the energy you collected had been used by PRISM to create this monstrosity. The only entity in the internet that can wreak havoc in the real world.";
		break;
		case 'TwitchChatEnemy':
			infoStr = "The Twitch Chat ravenous beast that's always hungry for a good show. On the most popular Twitch channels, the chat scrolls so quickly that chat users will be lucky if the 10 seconds they put into writing a message results in even 0.1 seconds of acknowledgment from a single user across the world. That said, even if individual messages get lost in the noise, the overall ethos of the chat somehow manages to coalesce and project itself strongly... for better or worse.";
		break;	
		case 'AdBlockEnemy':
			infoStr = "Ad blockers are the trusty web extensions that block ads on the internet. Because so many internet ads contain malware, many feel their usage is essential. As such, ad blockers are the sworn enemies of spambots the world over.";
		break;
		case 'TimeBomb':
			// Nada,
		break;
		case 'Wall':
			// Nada,
		break;
		case 'Trap':
			// Nada,
		break;
		case 'Hate':
			// Nada,
		break;
		case 'CourageWolf':
			// Nada,
		break;
		case 'CorruptedMalware':
			// Nada,
		break;
		case 'Mobling':
			// Nada,
		break;
		case 'AdBlock':
			// Nada,
		break;
		case 'ClickBait':
			// Nada,
		break;
	}

	map.info.descriptionText.text = infoStr;	
}

private function stringifyCombatant(className:String):String{
	var c:Object = GV.statsAssigner(className, currInfoLevel)
	return "LVL: " + currInfoLevel +
	"\nHP: " + c.hp +
	"\nPOW: " + c.pow +
	" DEF: " + c.def +
	"\nReward: " + c.rewardPoints;
}

public function fixName(oldStr:String):String{
	switch(oldStr){
		case 'HateVirus': return 'Hate Virus'; break;
		case 'HiveMind': return 'Hive Mind'; break;
		case 'UserData': return 'User Data'; break;
		case 'FakeNews': return 'Fake News'; break;
		case 'YoutubeComment': return 'Youtube Comment'; break;
		case 'TrainingDummy': return 'Training Dummy'; break;
		case 'InsanityWolf': return 'Insanity Wolf'; break;
		case 'OmegaPenguin': return 'Omega Penguin'; break;
		case 'AlphaWolf': return 'Alpha Wolf'; break;
		case 'AdBlockEnemy': return 'AdBlock'; break;
		case 'TwitchChatEnemy': return 'Twitch Chat'; break;
		case 'TwitchChat': return 'Twitch Chat'; break;
		case 'CourageWolf': return 'Courage Wolf'; break;
		case 'ClickBait': return 'Click Bait'; break;
		case 'GenericTarget': return '???'; break;
		default: return oldStr; break;
	}
	return null;
}

private function stringifyCombatantAbility(i:int):void{
	var a:Object = EnemyAbils[currInfoClass+(i+1)];
	if(a){	
		var str:String = '';
		switch(i){
			case 0: map.info.abilityName.textColor = 0x00AAAA; str = a.gameName; break;
			case 1: map.info.abilityName.textColor = 0xAA0000; str = a.gameName; break;
			case 2: map.info.abilityName.textColor = 0x00AA00; str = a.gameName; break;
		}
		map.info.abilityName.text = str;
		map.info.abilityDescription.text = a.description;
		map.info.abilityInfo.text = infoText(a);
		map.info.infoGfx.rangeGfx.showRange(true, a.effects, a.abilitySelectType, a.abilityRange, a.selfTargeting);
   		map.info.infoGfx.aoeGfx.showRange(false, a.effects, a.effectSelectType, a.effectRange, a.selfTargeting);
	}else{
		map.info.abilityName.textColor = 0xAAAAAA;
		map.info.abilityName.text = '???';
		map.info.abilityInfo.text = '';
		map.info.visible = false;
		map.info.redInfo.visible = false;
		map.info.greenInfo.visible = false;
	}
}

public function addField(f:String, o:String):String{ 
	if (o) return '\n' + f + o;
	return ''
}

public function showMap():void{

	map.legend.visible = false;
	currentMap = GVP.stats.currentMap;
	map.mapName.text = mapNames[currentMap];
	
	toggleBtn(worldButtons[0], true); // This button is always available unless you're already in the Surface.
	if(!questData.searchForHateInHive.wasStarted && !GV.TEST_MODE){ toggleBtn(worldButtons[1], false) }else{ toggleBtn(worldButtons[1], true) }
	if(!questData.searchForHateInPit.wasStarted && !GV.TEST_MODE){ toggleBtn(worldButtons[2], false) }else{ toggleBtn(worldButtons[2], true) }
	if(!questData.findTheOracle.wasStarted && !GV.TEST_MODE){ toggleBtn(worldButtons[3], false) }else{ toggleBtn(worldButtons[3], true) }

	var currWorldButton:MovieClip = worldButtons[currentMap];
	worldMenu.youAreHereMc.y = currWorldButton.y;
	toggleBtn(currWorldButton, false);

	while (map.mapContainer.numChildren > 0) {
	    map.mapContainer.removeChildAt(0);
	}

	for(var i:int = 0, ilen:int = enemyInfoBtns.length; i < ilen; i++){
		enemyInfoBtns[i].enemyNameText.text = ''
	}

	map.enemyButtonContainer.visible = false;
	map.info.visible = false;
	map.mapContainer.visible = true;
	worldMenu.visible = false;
	map.titleText.text = "";
	map.descriptionText.text = "Press sector tile to select it. Once selected, you can enter a sector by pressing start. The gray tiles are locked, but you can unlock them by completing an adjacent battle. Press the \"Toggle Legend\" button to see what each of the tile symbols mean.";

	var currQuest:Object = getActiveMainQuest();
	if(currQuest && currQuest.world != currentMap){
		map.descriptionText.text = "To " + currQuest.name.toLowerCase() + ", you must go to the "+ mapNames[currQuest.world] +". You can travel to this world by pressing the WORLD button on the top of the screen.";
	}

	toggleBtn(map.startBtn, false);		

	if (currentArenaBtn) currentArenaBtn.glow.visible = false;

	arenaList[0] = firstMapData;
	arenaList[1] = secondMapData;
	arenaList[2] = thirdMapData;
	arenaList[3] = fourthMapData;

	mapData = arenaList[currentMap];

	var highestX:int = 0;

	for(var arenaName:String in mapData) {
				
		var arenaProperties:Object = mapData[arenaName];
		arenaProperties.name = arenaName;
		arenaProperties.pos = nameToPos(arenaName);

		if(arenaName.substring(0,1) != 's'){
			var a:MovieClip = new ArenaButton;
			a.name = arenaName;
			highestX = Math.max(highestX, arenaProperties.pos[0]);
			a.x = arenaProperties.pos[0]*100;
			a.y = 300 - arenaProperties.pos[1]*100;
			map.mapContainer.addChild(a);

			if (arenaProperties.locked){
				a.back.gotoAndStop('locked');
			}else{
				a.back.gotoAndStop('unlocked');
			}

			if(arenaProperties.sideQuestGoal){
				a.gotoAndStop('q' + arenaProperties.sideQuestNum);
			}else if (arenaProperties.trainingArea){
				a.gotoAndStop('training');
			}else if (arenaProperties.goal){
				a.gotoAndStop('goal');
			}else if (arenaProperties.isTutorial){
				a.gotoAndStop('tutorial');
			}else if (arenaProperties.specialUnlockCondition && arenaProperties.locked){
				a.gotoAndStop('specialLock');
			}else if (arenaProperties.boss){
				if(arenaProperties.defeated){
					a.gotoAndStop('bossDefeated');
					a.back.gotoAndStop('defeated');
				}else{
					a.gotoAndStop('boss');
				}
			}else if (arenaProperties.defeated){
				a.gotoAndStop('defeated');
				a.back.gotoAndStop('defeated');
			}else if (arenaProperties.isSafe){
				a.gotoAndStop('safe');
			}else{
				a.gotoAndStop('dangerous');			
			}
			
			a.mouseChildren = false;
			a.glow.visible = false;
			a.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
				FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				if (currentArenaBtn) currentArenaBtn.glow.visible = false;
				currentArenaBtn = e.target as MovieClip;
				arenaData = mapData[e.target.name];
				if (arenaData.locked && !GV.TEST_MODE){
					toggleBtn(map.startBtn, false);		
				}else{
					
					if(map.startBtn.mouseEnabled === false){
						map.startBtn.gotoAndPlay(1);
					}

					toggleBtn(map.startBtn, true);	

					map.titleText.text = 'Sector (' + arenaData.pos + ')';
					var objectArray:Array = arenaData.objectArray;

					if(arenaData.description){
						map.enemyButtonContainer.visible = false
						map.descriptionText.text = arenaData.description;
					}else if (arenaData.isSafe){
						map.enemyButtonContainer.visible = false;
						map.descriptionText.text = "?";
					}else{
						map.descriptionText.text = "";
						map.enemyButtonContainer.visible = true;
						var i:int;
						var ilen:int;
						for(i = 0, ilen = GV.MAX_ENEMY_NUM; i < ilen; i++){
							enemyInfoBtns[i].visible = false;
						}
						for(i = 0, ilen = objectArray.length; i < ilen; i++){
							enemyInfoBtns[i].visible = true;
							enemyInfoBtns[i].enemyClassName = objectArray[i].id;
							enemyInfoBtns[i].enemyLevel = objectArray[i].lvl;
							var enemyName:String = fixName(objectArray[i].id);
							enemyInfoBtns[i].enemyNameText.text = 'Lvl ' + objectArray[i].lvl + ' ' + enemyName
						}
					}
				}
				e.target.glow.visible = true;
			});
			map.mapContainer.x = 640 - ((highestX*100) + 75)/2; // Center the map.
		}
	}

	var aq:Vector.<Object> = getActiveQuests();
	for(var j:int; j < aq.length; j++){
		var q:Object = aq[j];
		if(q.world == currentMap){
			var n:String = 'a' + q.loc[0] + '_' + q.loc[1]; 
			var btn:MovieClip = map.mapContainer.getChildByName(n) as MovieClip;
			if(q.type == MAIN_QUEST){
				btn.gotoAndStop('goal');
			}else{
				btn.gotoAndStop(q.icon);
			}
		}
	}


	showNew(map);
}

public function permaLock(world:int, arenaName:String):void{
	var d:Object = arenaList[world];
	d[arenaName].permalocked = true;
	d[arenaName].locked = true;
	d[arenaName].defeated = true;
	d[arenaName].sideQuestGoal = null
}

public function quickOpenArena(world:int, arenaName:String):void{
	var d:Object = arenaList[world];
	GV.arena.exitArena();
	arenaData = d[arenaName];
	if(!arenaData) throw new Error('This arena does not exist for the given map: ' + arenaName);
	showArena();
}

public function nameToPos(name:String){
	var pos:Array = name.substring(1).split('_');
	pos[0] = int(pos[0]);
	pos[1] = int(pos[1]);
	return pos
}

public function specialArena(instance:String):void{
	switch(instance){
		case 'firstBattle':
			currentSpecialArenaName = instance;
			arenaData = { 
				objectArray: [{id: 'YoutubeComment', lvl: 2, pos: [4,2]}],
				narrativeBattle: true, heroPos: [1,2], isTutorial: true,
				afterBattleFunc: 'narIntroPart2',
				tileMap: [/*
					'000','001','002','003','004','005'*/
					'n00','n00','n00','n00','n00','n00',//0
					'h04','h05','c23','c19','c25','c19',//1
					'c24','c19','c02','c25','c02','c20',//2
					'c22','c14','c11','l15','l16','m18',//3
					'n00','m12','m13','m12','m03','m18',//0
				]
			};
		break;
		case 'meetBit':
			arenaData = { 
				objectArray: [{id: 'Conversationalist', avatar: 'heroCompanion', introMessage: 'Please approach me, I intend no harm.', conversation: 'where_am_i', pos: [4,2]}], 
				narrativeBattle: true, heroPos: [1,2], isSafe: true,
				afterBattleFunc: 'showMap', music: 'silence',
				tileMap: [/*
					'000','001','002','003','004','005'*/
					'n00','n00','n00','n00','n00','n00',//0
					'h04','h05','c23','c19','c25','c19',//1
					'c24','c19','c02','c25','c02','c20',//2
					'c22','c14','c11','l15','l16','m18',//3
					'n00','m12','m13','m12','m03','m18',//0
				]
			};
		break;
		case 'endingArena':
			arenaData = { 
				objectArray: [{id: 'Conversationalist', avatar: 'heroCompanion', introMessage: 'You did it, Zye.', conversation: 'final_conversation', pos: [3,2]}], 
				narrativeBattle: true, heroPos: [2,2], isSafe: true, noTileBorders: true,
				afterBattleFunc: 'showMap', music: 'silence',
				tileMap: [/*
					'000','001','002','003','004','005'*/
					'c84','n00','c72','c85','n00','c71',//0
					'c00','c00','n00','n00','c70','c00',//1
					'c71','n00','c73','c00','n00','c72',//2
					'c00','c00','n00','n00','c71','c00',//3
					'c70','n00','c86','c72','n00','c73',//4
				]
			};
		break;
	}
	showArena();
}

public function showArena():void{       
	pressFlash.visible = false;	
	//ls.hintText.text = hintGenerator();	
	setTimeout(function(){
		showNew(ls, true);	
		setTimeout(showArenaHelper, 100);
	}, 200);   
}

public function showArenaHelper():void{
    if(!GV.arena) GV.arena = new Arena();
    GV.sc.clearStarlingContainer();
    GV.sc.addChild(GV.arena);
    GV.arena.init(arenaData);
    clearFC();
}

public function removeArena(_arenaCompleted:Boolean):void{
	FX.stopAllSound(); // This is mostly just to kill the ticker noise if anything
	FX.playMusic(FX.topMusic);
    if(_arenaCompleted){ // Battle won.
 		arenaCompleted();
	    if(arenaData.afterBattleFunc){
	        GV[arenaData.afterBattleFunc]();
	    }else{
	 		showMap();
	    }
	    currentSpecialArenaName = null;
    }else{ // Battle lost.
    	if(currentSpecialArenaName){ // If special battle, just repeat it.
    		specialArena(currentSpecialArenaName);
    	}else{
       		showMap(); // If not then go to the map.
    	}
    }
	GV.stage.saveGame();
    GV.arena.preDisposeArena();
    GV.arena.nullItAll();
    GV.sc.clearStarlingContainer();
}

public function unlockArena(world:int, arenaName:String):void{
	var d:Object = arenaList[world];
	var a:Object = d[arenaName]
	var btn:MovieClip = map.mapContainer.getChildByName(arenaName) as MovieClip;
	btn.gotoAndStop(a.isSafe ? 'safe' : 'dangerous')
	a.locked = false;
}

public function arenaCompleted():void{

	if(p){
		var _sc:String = 'a' + p[0] + '_' + p[1];
		var _sn:String = 'a' + p[0] + '_' + (p[1] + 1);
		var _se:String = 'a' + (p[0] + 1) + '_' + p[1];
		var _ss:String = 'a' + p[0] + '_' + (p[1] - 1);
		var _sw:String = 'a' + (p[0] - 1) + '_' + p[1];

		var _oc:Object = mapData[_sc];
		var _on:Object = mapData[_sn];
		var _oe:Object = mapData[_se];
		var _os:Object = mapData[_ss];
		var _ow:Object = mapData[_sw];

		if (!_oc.isSafe){ 			
			if(_oc.oneTimeFight){
				_oc.permalocked = true;
				_oc.locked = true;
			}
			_oc.defeated = true;
		}
		
		if (_on){ if (_on.locked && !_on.permalocked && !_on.specialUnlockCondition){ unlockArena(currentMap, _on.name);}};
		if (_oe){ if (_oe.locked && !_oe.permalocked && !_oe.specialUnlockCondition){ unlockArena(currentMap, _oe.name);}};
		if (_os){ if (_os.locked && !_os.permalocked && !_os.specialUnlockCondition){ unlockArena(currentMap, _os.name);}};
		if (_ow){ if (_ow.locked && !_ow.permalocked && !_ow.specialUnlockCondition){ unlockArena(currentMap, _ow.name);}};
	}
}
