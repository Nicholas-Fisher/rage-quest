package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class AdBlockEnemy extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('adBlockIdle', GV.COMBATANT_SPRITESHEET, 0, -10);

		public function AdBlockEnemy(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["I could have been your ally."]);	
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			startAbility(slots[GREEN]);
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
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

		public function spamAnimation():void{
			GV.arena.showSpam();
			spinAnimationInert();
			endAbility();
		}
	}
}
