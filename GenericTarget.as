package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class GenericTarget extends Combatant {

		public var idleMc:SuperMovieClip;
		public var c:Combatant;
		public var spriteSheet:int
		private var avatar:String;
		private var spamArray:Vector.<Spam> = new Vector.<Spam>();
		private var isCombatant:Boolean = false;

		
		public function GenericTarget(_avatar:String, _introMessage:String = null){

			avatar = _avatar;

			spriteSheet = GV.COMBATANT_SPRITESHEET;
			
			switch(_avatar){
				case "corruptedMalwareIdle": spriteSheet = GV.BOSS1_SPRITESHEET; break;
			}

			// Must match Conversationalist var of the same kind.
			isCombatant = !(_avatar == 'eggplant' || _avatar == 'hate' || _avatar == 'someguy0' || _avatar == 'someguy1' || _avatar == 'jaysTweet' || _avatar == 'popUpSign' || _avatar == 'accessPointClean' || _avatar == 'heroCompanion' || _avatar == 'userGhost'|| _avatar == 'myself' || _avatar == 'oracleLight' || _avatar == 'corruptedMalwareIdle' || _avatar == 'pepe');

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
			superNull(c); c = null;
			superNull(spamArray); spamArray = null;
		}

		public function changeLook(name:String):void{
			GV.s.juggler.remove(idleMc);
			removeChild(idleMc);
			idleMc = new SuperMovieClip(name, spriteSheet);
			GV.s.juggler.add(idleMc);
			addChild(idleMc);
			uniqueRunAfterInit();
			if(floats) initFloatTween();
			if(grows) initSizeTween();	
		}

		public function showAvatar(className:String){
			var MyClass:Class = getDefinitionByName('classes::' + className) as Class;
			c = new MyClass();
			c.pos = pos;
			c.init(2);	
			c.isSummon = false
			GV.arena.summon = null;
			c.ourTile.occupant = this;
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
				case 'popUpSign': floats = true; break;
				case 'jaysTweet': floats = true; faceLeft(); break;
				case 'popUpSign': floats = true; faceLeft(); isNotTurner = true; break;
			}
		}

		override public function defaultHitAnimation():void{
			if(c){
				c.shakeAnimation(200, false);
			}else{
				shakeAnimation(200, false);
			}
		}

		override public function defaultdeathAnimation():void{
			if(c){
				c.genericFade();
			}else{
				genericFade();
			}
		}

		public function uniqueRunAfterInit(){

			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[0]);
			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[1]);
			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[2]);

			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.statBack);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.swordIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.shieldIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[0]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[1]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[2]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.apBar);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.square);
			
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[0]);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[1]);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[2]);	
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.apText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.powText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.defText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.lvlText);

			colorIndicatorContainer.removeChild(colorIndicator);

			statUnit.hpText.x += statUnit.square.width/2;

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
