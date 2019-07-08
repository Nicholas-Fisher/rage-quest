package classes {

	import starling.events.Event;
    import flash.utils.*;
	
	public class HateVirus extends Combatant{

		public var idleMc:SuperMovieClip = new SuperMovieClip('hateVirus', GV.BOSS4_SPRITESHEET, 0, -10);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function HateVirus(){
			introMessage = introMessageRandomizer(new <String>["My power is immeasurable."]);
			floats = true;
		}

		public function uniqueAi():void{
			startAbility(slots[BLUE]);
			attackAI();
			if(GV.arena.currEnemyNum < GV.MAX_ENEMY_NUM){
				startAbility(slots[GREEN], GV.arena.getRandomFreePos());
			}
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;
		}		

		public function abilityAnimation():void{			
			shakeAnimation(250, false);
			FX.showParticleEffect(FX.poofPool, x, y, 0.1);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);		
		}
	}
}
