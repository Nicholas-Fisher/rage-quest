private const MAIN_QUEST:int = 0;
private const SIDE_QUEST:int = 1;
private const START:int = 0;
private const MIDDLE:int = 1;
private const END:int = 2;

public var questData:Object = {

	// MAIN QUEST
	reachTheOracle: {
		name:'Talk to the Oracle',
		type:MAIN_QUEST,
		tail:null,
		isActive: GV.TEST_MODE,
		wasStarted: GV.TEST_MODE,
		isFinished:false,
		world: 0,
		loc: [9,3],
		description: "This peculiar creature tells you that you'll need to talk to \"the Oracle\" if you want to find a way out of the Internet. What other options do you have?\n\nTo enter the world map, press the exit button on the left. The Oracle's location will be marked by a flag on the map."
	},

	searchForHateInHive: {
		name:'Search the Hive for a source of hate',
		type:MAIN_QUEST,
		tail:'reachTheOracle',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 1,
		loc: [2,3],
		description: "The Oracle has informed you that you need to harness the power of hate to escape the Internet. Your first stop is going to be the Hive.\n\nTo enter this world, press the \"world\" button on the map screen, and then select the Hive."
	},

	reachTheAccessPoint: {
		name:'Reach the access point',
		type:MAIN_QUEST,
		tail:'searchForHateInHive',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 1,
		loc: [9,3],
		description: "According to Jay, the best way to harness hate within this area is to broadcast an incendiary tweet. This can only be done on a large enough scale by reaching a special access point."
	},

	talkWithTheOracleAboutPit: {
		name:'Consult with the Oracle',
		type:MAIN_QUEST,
		tail:'reachTheAccessPoint',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 0,
		loc: [9,3],
		description: "Now that you've harnessed the hate local to the Hive, it's time to meet with the oracle again."
	},

	searchForHateInPit: {
		name:'Search the Pit for a source of hate',
		type:MAIN_QUEST,
		tail:'talkWithTheOracleAboutPit',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 2,
		loc: [2,2],
		description: "According to the Oracle. We should have enough hate to escape the Internet if we can find an ample source in the Pit. Time to quest through another world."
	},

	destroyTheGamerGate: {
		name:'Collect the hate behind the Gamergate',
		type:MAIN_QUEST,
		tail:'searchForHateInPit',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'unlock32in2',
		world: 2,
		loc: [4,0],
		description: "A great swell of hateful energy is said to exist behind something called the 'Gamergate'. Find and open it."
	},

	returnTheEnergyToTheOracle: {
		name:'Return to the Oracle',
		type:MAIN_QUEST,
		tail:'destroyTheGamerGate',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 0,
		loc: [9,3],
		description: "You now have enough energy to create the portal and return home. Return to the Oracle."
	},

	findTheOracle: {
		name:'Find the Oracle',
		type:MAIN_QUEST,
		tail:'returnTheEnergyToTheOracle',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 3,
		loc: [5,1],
		description: "Something is amiss. The Oracle siphoned the energy you collected and vanished, but Bit seems to have a fix on her location. She is somewhere within the Bastion."
	},

	defeatPRISM: {
		name:'Defeat PRISM',
		type:MAIN_QUEST,
		tail:'findTheOracle',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 3,
		phaseFunc: 'unlock61in3',
		loc: [6,1],
		description: "The Oracle has revealed herself to be PRISM, and her plan for your escape was a ruse. Instead, she has used the energy you collected for nefarious purposes. Defeat her!"
	},

	defeatedPRISM: {
		name:'Talk to Bit',
		type:MAIN_QUEST,
		tail:'defeatPRISM',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 3,
		loc: [7,1],
		description: "You had to kill PRISM. She was formally a friend to Bit under the guise of the Oracle. For that reason, you should talk to bit next."
	},

	confrontTheHateVirus: {
		name:'Confront the Hate Virus',
		type:MAIN_QUEST,
		tail:'defeatedPRISM',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'unlock81in3',
		world: 3,
		loc: [8,1],
		description: "PRISM had used the hate energy to create a weapon known as the Hate Virus. It has the power to wreak havoc in the real word, unless it can be stopped."
	},

	killTheHateVirus: {
		name:'Kill the Hate Virus',
		type:MAIN_QUEST,
		tail:'confrontTheHateVirus',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 3,
		phaseFunc: 'unlock91in3',
		loc: [9,1],
		description: "The only way to stop the Hate Virus is to kill it. So kill it."
	},

	// SIDE QUEST 1
	talkedToSpamBot1: {
		name:'Q1 - Take care of AdBlock',
		type:SIDE_QUEST,
		phase:START,
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 0,
		loc: [6,1],
		phaseFunc: 'unlock62in0',
		icon: 'Q1',
		description: "If you want the spambot's money you'll have to defeat AdBlock... but it might be in your interest to help AdBlock out instead. His location is marked on your map as \"Q1\"."
	},

	protectedAdBlock: {
		name:'You protected AdBlock',
		type:SIDE_QUEST,
		phase:END,
		tail:'talkedToSpamBot1',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'addAdBlockSummon',
		description: "AdBlock thanks you for saving him and offers you a new shield. Additionally, you can now summon him into battle! To summon an ally into battle you must equip the desired summon ability in Equip > Items/Abilities. To equip your new shield, go to Equip > Weapon/Shield."
	},

	defeatedAdBlock: {
		name:'AdBlock defeated',
		type:SIDE_QUEST,
		phase:MIDDLE,
		tail:'talkedToSpamBot1',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		loc: [6,3],
		phaseFunc: 'addAdBlockShield',
		description: "With AdBlock defeated, you can now collect your bounty from the spambot that hired you. AdBlock's corpse also makes for a find shield, which you add to your inventory (To equip: Menu > Equip > Weapon/Shield)."
	},

	talkedToSpamBot2: {
		name:'Bounty collected',
		type:SIDE_QUEST,
		phase:END,
		tail:'defeatedAdBlock',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'add300BitCoin',
		description: "The spambot is pleased with your work and hands you 300 bitcoin as a reward."
	},

	// SIDE QUEST 2
	theGauntlet: {
		name:'Q2 - Conquer the Gauntlet of Courage',
		type:SIDE_QUEST,
		phase:START,
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 1,
		loc: [11,0],
		icon: 'Q2',
		description: "Courage wolf will join you as a summon if you past his test. Reach the location marked \"Q2\" on your map to prove your worth."
	},

	completedTheGauntlet: {
		name:'You completed the Gauntlet of Courage',
		type:SIDE_QUEST,
		phase:END,
		tail:'theGauntlet',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'addCourageSummon',
		description: "Now that you've proven your worth, Courage Wolf has joined your forces as a new summon. To summon an ally into battle you must equip the desired summon ability in Equip > Items/Abilities."
	},

	// SIDE QUEST 3
	hackTheHackers1: {
		name:'Q3 - Hack the hackers',
		type:SIDE_QUEST,
		phase:START,
		isActive:false,
		wasStarted:false,
		isFinished:false,
		world: 2,
		loc: [9,3],
		phaseFunc: 'unlock83in2',
		icon: 'Q3',
		description: "A disgruntled flamer is willing to pay you handsomely for fulfilling his vengeance. Find and defeat the hackers for your reward."
	},

	hackTheHackers2: {
		name:'You defeated the hackers',
		type:SIDE_QUEST,
		phase:MIDDLE,
		tail:'hackTheHackers1',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		description: "The hackers have been defeated. You can now collect your reward from the flamer."
	},

	hackTheHackers3: {
		name:'Bounty collected',
		type:SIDE_QUEST,
		phase:END,
		tail:'hackTheHackers2',
		isActive:false,
		wasStarted:false,
		isFinished:false,
		phaseFunc: 'add750BitCoin',
		description: "The flamer is pleased with your work and hands you 750 bitcoin as a reward."
	}

}

public var quests:Vector.<Object> = objectToArray(questData);

public function reloadQuestDataAfterLoad():void{
	quests =  objectToArray(questData);
}

public static function objectToArray(dataObject:Object):Vector.<Object>{		
	var a:Vector.<Object> = new Vector.<Object>;
	for(var propertyName:String in dataObject) {
		var e:Object = dataObject[propertyName];
		a.push(e)
	}
	return a;
}

public function getActiveQuests():Vector.<Object>{
	var ret:Vector.<Object> = new Vector.<Object>;
	for(var i:int = 0, ilen:int = quests.length; i < ilen; i++){
		if(quests[i].isActive) ret.push(quests[i]);
	}
	return ret;
}

public function newQuestPhase(phase:String):void{	

	var o:Object = questData[phase];
	var t:String ;
	var st:String = o.name;
	var m:String = o.description;
	if(!o.wasStarted){
		o.wasStarted = true;
		if(o.phaseFunc){
			GV[o.phaseFunc]();
		}
		if(o.phase != END){
		 	o.isActive = true;
		}else{
			o.isFinished = true;
		}
		if(o.tail){ 
			questData[o.tail].isActive = false;
			questData[o.tail].isFinished = true;
		}
		if(o.type == MAIN_QUEST){
			GVP.stats.currentMainQuest = o.name;
			t = "Main Quest Update";
		}else{
			switch(o.phase){
				case START: t = "New Side Quest"; break;
				case MIDDLE: t = "Side Quest Update"; break;
				case END: t = "Side Quest Completed"; break;
			}
		}
		setTimeout(function(){
			GV.stage.showPopUp(t, st, m);
		}, 800);
		
		GV.stage.saveGame();
	}
}


public function getActiveMainQuest():Object {
	var aq:Vector.<Object> = getActiveQuests();
	for(var j:int; j < aq.length; j++){
		var q:Object = aq[j];
		if(q.type == MAIN_QUEST){
			return q;
		}
	}	
	return {};
}