package classes {

	import starling.events.Event;
	
	public class Hate extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('hateVirus', GV.BOSS4_SPRITESHEET, 0, -10);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function Hate(){
			floats = true;
			noEndActionDelay = true;		
			var newScale:Number = 0.8;
			scaleX = newScale*(Math.abs(scaleX)/scaleX);
			scaleY = newScale;
			shadow.scaleY *= newScale;
			shadow.scaleX *= newScale;
			alignPivot();
		}

		public function uniqueAi():void{			
			attackAI();
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			if(statUnit){
				statUnit.abilityTimers[0].visible = false;				
				statUnit.abilityTimers[2].visible = false;
			}
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;			
		}

		public function attackAnimation():void{			
			var thought:int = Math.floor(Math.random()*24)
			switch(thought){
				case 0: speechBubble.showSpeech("You're so ugly.", true); break;
				case 1: speechBubble.showSpeech("You're nothing.", true); break;
				case 2: speechBubble.showSpeech("Failure.", true); break;
				case 3: speechBubble.showSpeech("Moron", true); break;
				case 4: speechBubble.showSpeech("Idiot.", true); break;
				case 5: speechBubble.showSpeech("Waste of life.", true); break;
				case 6: speechBubble.showSpeech("Retard.", true); break;
				case 7: speechBubble.showSpeech("Loser.", true); break;
				case 8: speechBubble.showSpeech("Just die already.", true); break;
				case 9: speechBubble.showSpeech("Why do you even try.", true); break;
				case 10: speechBubble.showSpeech("Get out of my country.", true); break;
				case 11: speechBubble.showSpeech("You deserved it.", true); break;
				case 12: speechBubble.showSpeech("You'll always be worthless.", true); break;
				case 13: speechBubble.showSpeech("Nothing you do matters.", true); break;
				case 14: speechBubble.showSpeech("Kill yourself", true); break;
				case 15: speechBubble.showSpeech("Die.", true); break;
				case 16: speechBubble.showSpeech("Give up.", true); break;
				case 17: speechBubble.showSpeech("Give up already.", true); break;
				case 18: speechBubble.showSpeech("You're such an idiot.", true); break;
				case 19: speechBubble.showSpeech("Why do you even try?", true); break;
				case 20: speechBubble.showSpeech("Just give up already.", true); break;
				case 21: speechBubble.showSpeech("You don't have a chance.", true); break;
				case 22: speechBubble.showSpeech("We're better off without you.", true); break;
				case 23: speechBubble.showSpeech("You'll never do better.", true); break;
				default: speechBubble.showSpeech("We're all sick of you.", true); break;
			}
			executeEffects();
		}
	}
}
