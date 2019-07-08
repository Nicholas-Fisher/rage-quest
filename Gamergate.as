package classes {

	import starling.events.Event;
    import flash.utils.*;
	
	public class Gamergate extends Combatant {
		
		public var idleMc:SuperMovieClip = new SuperMovieClip('gamergate0000', GV.BOSS3_SPRITESHEET, 15, 40);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function Gamergate(){
			introMessage = introMessageRandomizer(new <String>["Let's pretend trivial things are life and death matters.", "Ethics in video games journalism is suuuper important."]);
			shadow.visible = false;	
		}

		public function uniqueAi():void{
			attackAI();			
			attackAI(BLUE);
			if(GV.arena.currEnemyNum < 3){
				startAbility(slots[GREEN], GV.arena.getRandomFreePos());
			}
		}

		public function uniqueHitAnimation():void{
			if(slots[BLUE].isCharging){
				statusMsg(returnColorText(slots[BLUE].id) + ' CANCELLED', returnColor(slots[BLUE].id));
				slots[BLUE].markedForCooldown = true;
			}
			if(blocking){
				FX.shield.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			}else{
				shakeAnimation(200, false);
			}
		}

		public function uniqueIdleAnimation():void{changeAnimation(idleMc); blocking = false;}

		public function attackAnimation():void{
			projectileTrailPool = FX.hatePool;
		}

		public function summonAnimation():void{
			projectileTrailPool = FX.redMisslePool;
		}

		public function castingAnimation():void{
			executeEffects();
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;
		}
	}
}
