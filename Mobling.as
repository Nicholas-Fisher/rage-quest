package classes {

	import starling.events.Event;
	
	public class Mobling extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('moblingIdle', GV.BOSS2_SPRITESHEET, 0, -10);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('pitchforkMissle', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function Mobling(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Taste my pitchfork!", "For the swarm!", "Kill the outsider!", "I found a dead horse. Can we beat it?"]);	
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
		}

		public function stupifyAnimation():void{
			executeEffects();
		}

		public function uniqueMovementAnimation():void{
			skewX = 0.5*facing*-1;
			shadow.skewX = skewX;
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}
	}
}
