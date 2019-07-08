package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class YoutubeComment extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('youtubeComment', GV.COMBATANT_SPRITESHEET, 0, -10);

		public function YoutubeComment(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Suck a fart.", "*&$#@$%@!", "Evolution? Then why we still got monkeys?", "Natives and other immigrants need to LEAVE!!", "Like this if you aren't a conformist sheep."]);	
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(distanceBetween(GV.hero.pos, pos) <= 1 ){
				startAbility(slots[GREEN]);
			}
		}

		public function stupifyAnimation():void{
			var thought:int = Math.ceil(Math.random()*3)
			switch(thought){
				case 1: speechBubble.showSpeech('Evolution? Then why we still got monkeys?'); break;
				case 2: speechBubble.showSpeech('Natives and other immigrants need to LEAVE!!'); break;
				case 3: speechBubble.showSpeech('Like this if you aren\'t a conformist sheep.'); break;
			}
			setTimeout(executeEffects, 1750);
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
