package classes {

	import starling.events.Event;
    import flash.utils.*;
	
	public class Malphaware extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('malphawareIdle', GV.BOSS1_SPRITESHEET);
		public var movementMc:SuperMovieClip = new SuperMovieClip('malphawareMoving', GV.BOSS1_SPRITESHEET);
		public var meleeMc:SuperMovieClip = new SuperMovieClip('malphawareMelee', GV.BOSS1_SPRITESHEET, -130);
		public var fragmentMc:SuperMovieClip = new SuperMovieClip('malphawareFragment', GV.BOSS1_SPRITESHEET, -17, -17);
		public var spawnMc:SuperMovieClip = new SuperMovieClip('malphawareSpawning', GV.BOSS1_SPRITESHEET, -62);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function Malphaware(){
			introMessage = introMessageRandomizer(new <String>["My existence pains me.", "Infection is purity.", "You look too clean.", "Kneel to your god."]);
			spawnMc.loop = false;
			fragmentMc.loop = false;
			meleeMc.addEventListener(Event.COMPLETE, moveBackToOurTile);
			spawnMc.addEventListener(Event.COMPLETE, uniqueIdleAnimation);
			fragmentMc.addEventListener(Event.COMPLETE, uniqueIdleAnimation);			
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(GV.arena.currEnemyNum < GV.MAX_ENEMY_NUM){
				startAbility(slots[GREEN], GV.arena.getRandomFreePos());
			}
		}

		public function uniqueMoveSoundPlay():void{FX.playSlimeMove();}
		public function uniqueMoveSoundStop():void{FX.stopSlimeMove();}
		public function uniqueMovementAnimation():void{ if(GV.arena.inAction) changeAnimation(movementMc);}
		public function uniqueIdleAnimation():void{changeAnimation(idleMc); blocking = false;}
		public function meleeAnimation():void{changeAnimation(meleeMc); FX.squish1.play(GV.AUDIO_START_TIME, 0, GV.sfx);}
		public function fragmentAnimation():void{
			FX.squish2.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			FX.showParticleEffect(FX.corruptSlimeySplashPool, x, y, 0.1);
			changeAnimation(fragmentMc); 
		}
	}
}
