package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class AdBlock extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('adBlockIdle', GV.COMBATANT_SPRITESHEET, 0, -10);

		public function AdBlock(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Quick, to my side!", "Ads, your days are numbered!", "It's a good day to block ads."]);
		}

		public function uniqueAi():void{
			startAbility(slots[BLUE]);
			attackAISummon();
			if(!GV.arena.noSummons){
				startAbility(slots[GREEN]);
			}
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}
		
		public function summonExitAnimation():void{
			var thought:int = Math.ceil(Math.random()*3)
			switch(thought){
				case 1: speechBubble.showSpeech("You got this, Zye."); break;
				case 2: speechBubble.showSpeech("I've got nothing left to give."); break;
				case 3: speechBubble.showSpeech("Adios amigos."); break;
			}
			setTimeout(summonExit, 1500);
		}

		private function summonExit():void{
			GV.arena.killSummon();
			executeEffects();
		}
	}
}
