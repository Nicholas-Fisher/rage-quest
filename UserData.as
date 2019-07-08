package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class UserData extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('userDataIdle', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var powerMc:SuperMovieClip = new SuperMovieClip('userDataPowered', GV.COMBATANT_SPRITESHEET);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		public var prism = null;

		public function UserData(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["I know so much about them.", "I know their hopes... dreams.", "I know their fears.", "I know them better than they know themselves."]);	
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			startAbility(slots[GREEN]);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}

		public function uniqueDeathAnimation():void{
			if(prism){
				prism.changePow(-10);	
				prism.changeDef(-5);
			}		
			GV.arena.alwaysFlattenedContainer.visible = true;
			GV.arena.alwaysFlatTextContainer.visible = true;
			defaultdeathAnimation();
		}

		public function powerUpAnimation():void{
			changeAnimation(powerMc);
		}
	}
}
