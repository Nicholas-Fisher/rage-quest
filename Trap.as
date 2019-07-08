package classes {

	import starling.events.Event;
	import flash.utils.*;
	import classes.FFParticleSystem.FFParticleSystem;
	
	public class Trap extends Combatant {

		//public var idleMc:SuperMovieClip = new SuperMovieClip('wallIdle', GV.COMBATANT_SPRITESHEET);
		public var idleMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET);
		private var trapCharge:int;
		private var startTrapCharge:int;
		private var isForObstacleCourse:Boolean;
		private var firstTime:Boolean = true;

		public function Trap(_trapCharge:int = 0, _startTrapCharge:int = -1, _isForObstacleCourse:Boolean = false){
			trapCharge = _trapCharge
			startTrapCharge = _startTrapCharge;
			isForObstacleCourse = _isForObstacleCourse
		}

		public function uniqueAi():void{
			if(GV.arena.isSafe) return;
			if(firstTime){
				firstTime = false;
				if(isForObstacleCourse){
					slots[RED].effectType = 'obstacle';
					slots[RED].effects = {hpChange: 0, apChange: 0, defChange: 0, powChange: 0, timeChange: 0, damageReturnChange: 0};
				}
				slots[RED].chargeTime = trapCharge;
				startAbility(slots[RED]);
				if(startTrapCharge != -1) slots[RED].charge = startTrapCharge;
			}else{
				startAbility(slots[RED]);
			}
		}

		public function uniqueRunAfterInit():void{}

		public function restart():void{
			if(GV.arena.isSafe) return;
			executeEffects();
			setTimeout(startRed, 100);
		}

		private function startRed():void{
			if(GV.arena.isSafe) return;
			if(!GV.arena || !GV.arena.isActive) return;
			startAbility(slots[RED]);
		}
	}
}