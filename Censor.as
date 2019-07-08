package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class Censor extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('censor', GV.COMBATANT_SPRITESHEET, 0, -10);

		public function Censor(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Your ass whoopin' is available in this region", "I should censor this beating for the kids.", "Paint it black.", "Be neither seen, nor heard."]);	
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;			
		}

		public function uniqueAi():void{
			if(distanceBetween(GV.hero.pos, pos) > 1 ){
				movementAI();
			}
			startAbility(slots[RED]);
			startAbility(slots[GREEN]);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}

		public function blackMistAnimation():void{						
			FX.showParticleEffect(FX.blackMistPool, x, y, 0.3);
			spinAnimationAndExecuteEffects();
		}	

		public function blackOutAnimation():void{			
			GV.arena.showCensor();
			FX.showParticleEffect(FX.blackMistPool, x, y, 0.3);
			spinAnimationInert();
		}
	}
}
