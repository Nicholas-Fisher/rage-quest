package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class FakeNews extends Combatant {

		public var leftMc:SuperMovieClip = new SuperMovieClip('fakeNewsLeft', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var rightMc:SuperMovieClip = new SuperMovieClip('fakeNewsRight', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var idleMc:SuperMovieClip = leftMc;
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);

		public function FakeNews(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Since when do facts have to be factual?", "One sec, let me just finish writing your obituary.", "Reality could use a little more sex appeal.", "I like my take a lot more."]);	
		}

		public function uniqueAi():void{
			if(slots[BLUE].startable && hp/maxHp < 0.25){ //0.25
				startAbility(slots[BLUE]);
			}
			attackAI();
			if(GV.arena.alwaysFlattenedContainer.visible){
				startAbility(slots[GREEN]);
			}
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}

		public function uniqueDeathAnimation():void{
			GV.arena.alwaysFlattenedContainer.visible = true;
			GV.arena.alwaysFlatTextContainer.visible = true;
			defaultdeathAnimation();
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;
		}
		override public function faceLeft():void{
			if(isNotTurner) return;
			if(isFlat){			
				facing = 1;
				skewY = 0.5;
				shadow.skewY = skewY;
			}else{
				facing = 1; scaleX = Math.abs(scaleX);
			}
			idleMc = rightMc;
			changeAnimation(rightMc);
		}
		override public function faceRight():void{
			if(isNotTurner) return;
			if(isFlat){			
				facing = -1;
				skewY = -0.5;
				shadow.skewY = skewY;
			}else{
				facing = -1; scaleX = Math.abs(scaleX)*-1;
			}
			idleMc = leftMc;
			changeAnimation(leftMc);
		}
	}
}
