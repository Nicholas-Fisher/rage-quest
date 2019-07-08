package classes {

	import starling.events.Event;
	import flash.utils.*;
	import classes.FFParticleSystem.FFParticleSystem;
	
	public class TimeBomb extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('timeBombIdle', GV.COMBATANT_SPRITESHEET, 0, 0, false, 4);
		private var p:FFParticleSystem;

		public function TimeBomb(){}

		public function uniqueAi():void{
			startAbility(slots[RED]);
		}

		public function uniqueRunAfterInit(){
			p = FX.showParticleEffect(FX.sparkTrailPool, x, y-15, 0, false);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
		}
		public function selfDestructAnimation():void{
			p.stop();
			GV.arena.kill(this);
			executeEffects();
		}
	}
}
