private var creditsXTween:Tween = new Tween(nar.credits, "x", Regular.easeOut, 0, 50, 0.75, true);
private var creditsAlphaTween:Tween = new Tween(nar.credits, "alpha", Regular.easeIn, 0, 1, 0.75, true);
private var centerXTween:Tween = new Tween(nar.center, "x", Regular.easeOut, 0, 50, 0.75, true);
private var centerAlphaTween:Tween = new Tween(nar.center, "alpha", Regular.easeIn, 0, 1, 0.75, true);
private var subcenterXTween:Tween = new Tween(nar.subcenter, "x", Regular.easeOut, 0, 50, 1.25, true);
private var subcenterAlphaTween:Tween = new Tween(nar.subcenter, "alpha", Regular.easeIn, 0, 1, 1.25, true);
private var mainXTween:Tween = new Tween(nar.main, "x", Regular.easeOut, 0, 50, 0.75, true);
private var mainAlphaTween:Tween = new Tween(nar.main, "alpha", Regular.easeIn, 0, 1, 0.75, true);
private var subXTween:Tween = new Tween(nar.sub, "x", Regular.easeOut, 0, 50, 1.25, true);
private var subAlphaTween:Tween = new Tween(nar.sub, "alpha", Regular.easeIn, 0, 1, 1.25, true);
private var partInterval:int;
	
private function initNarrative():void{
	
	nar.clickArea.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		count++;
		if(count == currentNarObj.textArray.length){
			endNarrative();
		}else{
			showTextAt(count);
		}
	});

	nar.skipBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		endNarrative();
	});	
}

private function endNarrative():void{
	clearTimeout(partInterval);
	if(currentNarObj.val){
		specialArena(currentNarObj.val);
	}else {
		FX.playMusic(FX.topMusic);		
		showMap();
	}
}

public function showNarrative(narName:String):void{
	showNew(nar);
	count = 0;	
	currentNarObj = narObjList[narName];
	FX.stopMusic();
	if(narName === 'intro'){
		nar.skipBtn.visible = false;
	}else{
		nar.skipBtn.visible = true;
	}	
	showTextAt(count);
}

public function showCreditsOnly():void {	
	showNew(nar);
	count = 9;	
	currentNarObj = narObjList.ending2;
	FX.stopMusic();
	nar.skipBtn.visible = true;	
	showTextAt(count);
}

private function showTextAt(count:int){

	nar.center.text = '';
	nar.subcenter.text = '';
	nar.credits.text = '';
	nar.main.text = '';
	nar.sub.text = '';
	clearTimeout(partInterval);
	var a:Array = currentNarObj.textArray[count];
	if(a){
		var count:int = 0;
		var lastTbName:String;
		var self = this;
		animatePart();
	}


	function animatePart(){
		if(count < a.length){
			if(lastTbName != null){
				self[lastTbName + 'XTween'].stop();
				self[lastTbName + 'AlphaTween'].stop();	
			}
			var currObj:Object = a[count];
			var visualText:String = currObj.text;
			var tbName:String = currObj.location;
			var tf:TextField = nar[tbName];
			if(currObj.func){
				currObj.func();
			}
			tf.text = visualText;		
			self[tbName + 'XTween'].start();
			self[tbName + 'AlphaTween'].start();
			lastTbName = tbName;
			count++;
			partInterval = setTimeout(animatePart, 760);		
		}
	}
}

private var narObjList:Object = {
	
intro: { 
textArray:[

[{text: "\"Give someone a mask and they'll show their true face.\"", location: "center", func: function(){FX.playMusic(FX.intro)}}, {text: "Oscar Wilde", location: "subcenter"}],
[{text: "\"Quotation is a serviceable substitute for wit.\"", location: "center"}, {text: "Oscar Wilde", location: "subcenter"}],
[{text: "Zye awakens in an unfamiliar place.", location: "main"}, {text: "\"Where am I?\"", location: "sub"}],
[{text: "He seems to be in a forest, but the trees and shrubbery look peculiar, like polygonal sculptures.", location: "main"}, {text: "What’s going on?", location: "sub"}],
[{text: "Zye’s periphery is reduced by a visored helmet he wears but has no recollection of putting on. He looks at his arms and legs and sees that he’s wearing a strange black suit that covers him from head to the toe. The suit is close-fitting but tough; perhaps some kind of armor?", location: "main"}, {text: "\"What am I wearing?\"", location: "sub"}],
[{text: "He frantically searches his mind for answers, but to no avail. He cannot even remember where he was before he awoke to this puzzling situation.\n\nGathering his senses somewhat, he tries to remove the armor that has been presumably forced onto him, but it has no openings.\n\nWith a hundred questions still unanswered and a million more brewing, an entity materializes before him.", location: "main"}],
[{text: "This entity appears to be… a YouTube comment?", location: "main"}, {text: "\"…what the hell am I seeing?\"", location: "sub"}],
[{text: "It floats in the air, rhythmically bobbing up and down, until it slowly approaches Zye. Stunned and bewildered, he stands frozen until the comment completes its approach and then violently lurches at him while spinning centripetally.", location: "main"}],
[{text: "Fueled by a burst of adrenaline, Zye leaps backward, sustaining only minor damage from the comment's razor sharp edges. Like most YouTube comments, this one is out for blood.\n\nIn an apparent reaction to Zye’s dire situation, a sword and shield materialize in his right and left hands.", location: "main"}],
[{text: "Oddities of the situation aside, when you’re threatened, you know to flee or fight.", location: "main"}]
], 
val: 'firstBattle'
},

intro_part_2: { 
textArray:[

[{text: "With the YouTube comment defeated, Zye looks around ready for more threats to appear… but none do. Being alone in this strange place begins to feel as threatening as the thought of new company… until another entity begins to materialize. \n\nZye readies himself.", location: "main"}, {text: "\"Not again...\"", location: "sub"}],
[{text: "This time, instead of a YouTube comment, a colorful, pulsating, amorphous creature appears. It reassures Zye that it is not his enemy. Could it be friendly?", location: "main"}, {text: "\"I am your ally. Come, let me tell you what is happening and how I can help you.\"", location: "sub"}]
], 
val: 'meetBit'
},

intro_hive: { 
textArray:[

[{text: "With Bit's assistance, Zye carefully navigates labyrinthine caves until he arrives at the Hive. \n\nHe immediately experiences sensory overload.", location: "main"}],
[{text: "The loud incessant chirping of tiny blue birds buzzing around the cave walls, the stench of dead horses slowly decaying, the sight of the same dead horses being relentlessly stabbed by the pitchforks of an enraged mob.", location: "main"}, {text: "\"I don't know what to make of any of this.\"", location: "sub"}],
[{text: "Nothing living here seems to have a sense of self. Every creature acts with a singular purpose shared by its brethren.", location: "main"}],
[{text: "After taking a moment to recollect himself. Zye reluctantly presses onward.", location: "main"}],
[{text: "Welcome to the world of social media.", location: "main"}, {text: "The Hive.", location: "subcenter"}]
], 
val: null
},

intro_pit: { 
textArray:[

[{text: "Zye descends into the Pit. \n\nThe landscape is a cold industrial homage to violence.", location: "main"}],
[{text: "Spiked pits, pools of blood, intense fires, war... this is not a place for the weak. \n\nOnly the numb and heartless can survive here.", location: "main"}],
[{text: "Welcome to the world of online gaming.", location: "main"}, {text: "The Pit.", location: "subcenter"}]
], 
val: null
},

intro_bastion: { 
textArray:[

[{text: "Zye breaks into the Bastion in pursuit of the Oracle. \n\nFor a place deemed to be a fortress, Zye finds it curious that it appears to be constructed of glass.", location: "main"}],
[{text: "Welcome to the world of corporate and government influence.", location: "main"}, {text: "The Bastion.", location: "subcenter"}]
], 
val: null
},

ending: { 
textArray:[

[{text: "The Hate Virus crashes to the ground, defeated. Between the final breaths it desperately pulls into its gaping mouth, it utters,", location: "main"}, {text: "\"How did you do it?... How did you beat me?\"", location: "subcenter"}],
[{text: "No longer fearing the monster before him, Zye sheaths his weapon.", location: "main"}, {text: "\"It's simple. I was stronger than you.\"", location: "subcenter"}],
[{text: "The virus sputters and writhes as it disintegrates into nothing.", location: "main"}],
[{text: "Zye stands a while in silent recovery, until a familiar friend approaches.", location: "main"}]
], 
val: 'endingArena'
},

ending2: { 
textArray:[

[{text: "When he opens them...", location: "main", func: function(){FX.playMusic(FX.ending);}}],
[{text: "He awakens at home, in his bed.", location: "main"}],
[{text: "Was it a dream after all?\n\nNo. His memories of being in the internet are still of vivid clarity.", location: "main"}],
[{text: "How was he pulled into that world? Who knows. Perhaps somehow through the machinations of PRISM. After all, she needed a human to gather the hate energy for her nefarious plan.", location: "main"}],
[{text: "Perhaps she even had access to technology that could codify a human brain and pull them into a digital world.", location: "main"}, {text: "I mean, it's possible.", location: "subcenter"}],
[{text: "So what does Zye do now that he's finally free from the clutches internet?", location: "main"}],
[{text: "Take a guess...", location: "main"}, {text: "Fin.", location: "subcenter"}],
[{text: "\"Life's simple. Be happy without making other people unhappy.\"", location: "center"}, {text: "Nigel Fisher", location: "subcenter"}],
[{text: "\"...And hey, if you can, make other people happy too.\"", location: "center"}, {text: "Nicholas Fisher", location: "subcenter"}],
[{text: "Game By\n\nNicholas Fisher", location: "credits"}],
[{text: "Music from freemusicarchive.org\n\n" +
"G-Point by Inflammator (http://freemusicarchive.org/music/Inflammator/The_Wastelands)\n" +
"Honeys Pie by Wake (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"Glytch Funk by Wake (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"Steppin by Wake (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"Honeys Pie by Wake (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"Laundromatted by Lawrence Grey (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"Enterprise 1 by Languis (http://freemusicarchive.org/music/dublab/Bonus_Beat_Blast_2011)\n" +
"The Void by Remain (http://freemusicarchive.org/music/Remain/Remain/)\n" +
"All Your Organs Get A Laugh by Mystery Mammal (http://freemusicarchive.org/music/Mystery_Mammal/Risk_Society/All_Your_Organs_Get_A_Laugh)",
location: "credits"}],
[{text: "Music from freepd.com\n\n" +
"Electronic M TechWeather by Frank nora\n" +
"Electronic A Groove Out by Frank Nora\n" +
"Electronic C Squee Crash by Frank Nora\n" +
"Electronic U popper by Frank Nora\n" +
"Electro Shaker Heaven by Frank Nora\n" +
"Cold Silence by Knight of Fire\n" +
"You, yourself, and the main character by Komiku\n" +
"Spikey by Kevin MacLeod\n" +
"Piano Monolog by Kevin MacLeod\n" +
"Epilogue by *imp*",
location: "credits"}],
[{text: "Music from AudioJungle.com\n\n" +
"Dark Hybrid Trailer by Vladislav Martirosov\n" +
"The devil stands before you by Symphony-of-Specters\n\n" +
"Music from estudiocafofo.com\n\n" +
"Dark 1 by Estudio Cafofo",
location: "credits"}],
[{text: "Sound Effects (freesound.org & soundbible.com)\n\nPBCrichton, grunz, Ryan Smith, NenadSimic, swuing, y89312, plasterbrain, RunnerPack, NoiseCollector, Mike Koenig", location: "credits"}],
[{text: "This game was made with the Gamua Starling Framework", location: "credits"}],
[{text: "Special Thanks\n\nThe Glitch MMO team (glitchthegame.com) for being awesome and releasing their assets and animations into public domain.\n\nAnd also, to all of my friends that helped me test the game.", location: "credits"}],
], 
val: null
}
};