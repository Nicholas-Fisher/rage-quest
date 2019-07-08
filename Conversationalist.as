package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class Conversationalist extends Combatant {

		public var idleMc:SuperMovieClip;		
		public var spriteSheet:int
		private var avatar:String;
		private var spamArray:Vector.<Spam> = new Vector.<Spam>();
		private var isCombatant:Boolean = false;

		public function Conversationalist(_avatar:String,  _conversation:String, _introMessage:String = null, _remove:Boolean = false){

			if(_remove){
				return;
			}
			
			introMessage = _introMessage;
			conversation = _conversation;
			avatar = _avatar;
			
			if(_avatar === 'hateVirus'){
				spriteSheet = GV.BOSS4_SPRITESHEET;
			}else {
				spriteSheet = GV.COMBATANT_SPRITESHEET;
			}		

			// Must match Generic Target var of the same kind.
			isCombatant = !(_avatar == 'eggplant' || _avatar == 'hate' || _avatar == 'someguy0' || _avatar == 'someguy1' || _avatar == 'jaysTweet' || _avatar == 'popUpSign' || _avatar == 'accessPointClean' || _avatar == 'heroCompanion' || _avatar == 'userGhost'|| _avatar == 'myself' || _avatar == 'hateVirus' ||  _avatar == 'oracleLight' || _avatar == 'corruptedMalwareIdle' || _avatar == 'pepe');

			if(!isCombatant){
				runBeforeInit();
				var _fps = (_avatar == 'heroCompanion') ? 30 : 60;
				idleMc = new SuperMovieClip(avatar, spriteSheet, 0, 0, false, _fps);
				GV.s.juggler.add(idleMc);
				sContainer.addChild(idleMc);
			}
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;			
			superNull(conversationAvatar); conversationAvatar = null;
			superNull(spamArray); spamArray = null;
		}

		public function conversationFinder():String{
			var d:Object = GV.stage.questData;
			var ret:String = conversation;	
			switch(conversation){
				case "its_beautiful":
					if(d.destroyTheGamerGate.isFinished){
						ret = "where_did_it_go"; 
					}
				break;
			}	
			if(!conversation){		
				switch(avatar){
					case 'Spambot':
						if(d.talkedToSpamBot2.isFinished) ret = "spambot5";
						else if(d.protectedAdBlock.isFinished) ret = "spambot4";
						else if(d.defeatedAdBlock.isActive) ret = "spambot3";
						else if(d.talkedToSpamBot1.isActive) ret = "spambot2";
						else ret = "spambot1";
					break;
					case 'Flamer':						
						if(d.hackTheHackers3.isFinished) ret = "flamer4";
						else if(d.hackTheHackers2.isActive) ret = "flamer3";
						else if(d.hackTheHackers1.isActive) ret = "flamer2";
						else ret = "flamer1";
					break;
					case 'accessPointClean':	
						if(d.reachTheAccessPoint.isFinished) ret = "access_point2";
						else ret = "access_point1";
					break;
					case 'swirlingHate':
						if(d.talkWithTheOracleAboutHive.isActive) ret = "access_point2";
						else if(d.reachTheAccessPoint.isActive) ret = "access_point1";
					break;
					case 'CourageWolf':
						if(d.completedTheGauntlet.isFinished) ret = "courage_wolf3";
						else if(d.theGauntlet.isActive) ret = "courage_wolf2";
						else ret = "courage_wolf1";
					break;
					case 'Scumbag':						
						if(!Assignables.abilityData.summonClickBait.objectStatus){
							ret = "scumbag1"
						}else{
							ret = "scumbag2"
						}
					break;
					case 'eggplant':						
						if(Assignables.itemData.peachItem.stock){
							ret = "eggplant1"
						}else{
							ret = "eggplant2"
						}
					break;					
					case 'oracleLight':
						if(d.searchForHateInHive.isActive) ret = "the_oracle2";
						else if(d.talkWithTheOracleAboutPit.isActive) ret = "the_oracle3";
						else if(d.searchForHateInPit.isActive) ret = "the_oracle4";
						else if(d.returnTheEnergyToTheOracle.isActive) ret = "the_oracle5";					
						else ret = "the_oracle";
					break;
					case 'heroCompanion':
						if(d.returnTheEnergyToTheOracle.isActive) ret = "bit1";
						else if(d.findTheOracle.isActive) ret = "bit2";				
					break;
				}
			}else{ // If conversation exists but we need to do special stuff to it.
				switch(conversation){				
					case 'redirect_my_hate':
						if(d.reachTheAccessPoint.isActive) ret = "fez_thanks";
						else if(d.reachTheAccessPoint.isFinished) ret = "fez_thanks2";
					break;			
					case 'the_writer':
						if(d.destroyTheGamerGate.isActive) ret = "the_writer_thanks";
						else if(d.destroyTheGamerGate.isFinished) ret = "the_writer_thanks2";
					break;
				}						
			}
			// Master overrides.
			if(avatar == 'heroCompanion'){
				if(conversation == 'final_conversation') return conversation;
				else if(d.defeatPRISM.isActive) ret = "bit3";	
				else if(d.defeatedPRISM.isActive) ret = "bit4";	
				else if(d.confrontTheHateVirus.wasStarted) ret = "bit5";	
			}
			return ret;
		}

		public function changeLook(name:String):void{
			GV.s.juggler.remove(idleMc);
			removeChild(idleMc);
			idleMc = new SuperMovieClip(name, spriteSheet);
			GV.s.juggler.add(idleMc);
			addChild(idleMc);
			uniqueRunAfterInit();
			if(floats){				
				initFloatTween();
			}
			if(grows) initSizeTween();	
		}

		public function showAvatar(className:String){
			var MyClass:Class = getDefinitionByName('classes::' + className) as Class;
			conversationAvatar = new MyClass();
			conversationAvatar.pos = pos;
			conversationAvatar.init(2);	
			conversationAvatar.isSummon = false
			GV.arena.summon = null;
			conversationAvatar.ourTile.occupant = this;
		}

		public function runBeforeInit(){
			switch(avatar){
				case 'myself': floats = true; isFlat = true; break;
				case 'userGhost': floats = true; isFlat = true; break;
				case 'someguy0': floats = true; isFlat = true; break;
				case 'someguy1': floats = true; isFlat = true; break;
				case 'hateVirus': floats = true; isFlat = false; break;											
				case 'heroCompanion': floats = true; isFlat = true; break;
				case 'hate': floats = true; isFlat = true; break;
				case 'oracleLight': floats = true; break;				
				case 'jaysTweet': 
					floats = true; 					
					isNotTurner = true; 					
				break;
				case 'popUpSign': 
					floats = true; 					
					isNotTurner = true; 					
				break;			
			}					
		}

		public function hateAbsorbAnimation():void{		
			hitAnimation();
			FX.showParticleEffect(FX.hateSwirlPool, x, y, 2.0);			
		}

		public function betrayal():void{
			FX.playMusic(FX.betrayed);
		}

		public function joyAbsorbAnimation():void{					
			FX.showParticleEffect(FX.bloatPool, x, y, 2.0);
		}

		public function uniqueRunAfterInit(){

			if(isCombatant){
				showAvatar(avatar);
			}

			switch(avatar){
				case 'myself':
				case 'someguy0':
				case 'someguy1':
					myParticleEffect = FX.showParticleEffect(FX.randomDataPool, x, y, 0);
				break;
				case 'userGhost':
					myParticleEffect = FX.showParticleEffect(FX.randomDataPool, x, y, 0);
				break;
				case 'oracleLight':
					myParticleEffect = FX.showParticleEffect(FX.oraclePool, x + 3, y + 45, 0);
				break;
				case 'heroCompanion':
					myParticleEffect = FX.showParticleEffect(FX.bitPool, x, y-10, 0, true);
				break;
				case 'hate':
					myParticleEffect = FX.showParticleEffect(FX.hatePool, x, y, 0, true);
				break;
				case 'accessPointClean':					
					idleMc.x -= 38;
					idleMc.y -= 12; // 12
					shadow.width = 100;
				break;
			}
		}
	}
}
