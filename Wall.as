package classes {

	import starling.events.Event;
	import flash.utils.*;
	import classes.FFParticleSystem.FFParticleSystem;
	
	public class Wall extends Combatant {

		//public var idleMc:SuperMovieClip = new SuperMovieClip('wallIdle', GV.COMBATANT_SPRITESHEET);
		public var idleMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		private var p:FFParticleSystem;

		public function Wall(){
		}

		public function uniqueAi():void{
			startAbility(slots[RED]);
			startAbility(slots[GREEN]);
		}

		public function uniqueRunAfterInit(){
			p = FX.showParticleEffect(FX.explosionCorePool, x, y-20, 0, false);
			shadow.visible = false;
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