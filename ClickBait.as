package classes {

	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	import flash.utils.*;
	
	public class ClickBait extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('clickBaitIdle', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var trapMc:SuperMovieClip = new SuperMovieClip('clickBaitTrap', GV.COMBATANT_SPRITESHEET);
		private var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter();

		public function ClickBait(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>[
				"9 sex toys you shouldn't use with an amateur clown!",
				"This girl was asked to leave a cake shop due to her revealing attire. You won't believe what happens next!",
				"This man knows the herbal remedy to ugliness! Cosmetic surgeons hate him!",
				"The top ten cities that terrorists would LOVE to hit next!",
				"The story of Rage Quest. First you'll be shocked, then you'll be inspired!"
				]);	
		}

		public function uniqueAi():void{
			if(slots[RED].startable && hp/maxHp < 0.9999){
				colorMatrixFilter.tint(0xFF5555, 1);
				filter = colorMatrixFilter;
				startAbility(slots[RED]);
			}
			startAbility(slots[GREEN]);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
		}

		public function selfDestructAnimation():void{
			speechBubble.showSpeech("It's a Trap!");
			colorMatrixFilter.reset();
			changeAnimation(trapMc);
			setTimeout(afterSelfDestructAnimation, 1000);
		}

		public function afterSelfDestructAnimation():void{
			FX.showExplosion(x, y, 0.1);
			GV.arena.killSummon();
			executeEffects();
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(trapMc); trapMc = null;
			superNull(colorMatrixFilter); colorMatrixFilter = null;
		}
	}
}
