package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class Spambot extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('spambotIdle', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var spamMc:SuperMovieClip = new SuperMovieClip('spambotAngry', GV.COMBATANT_SPRITESHEET);		
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		private var spamArray:Vector.<Spam> = new Vector.<Spam>();

		public function Spambot(){

			spamArray[0] = new Spam('spamMini0000');
			spamArray[1] = new Spam('spamMini0001');
			spamArray[2] = new Spam('spamMini0002');
			spamArray[3] = new Spam('spamMini0003');
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Congratulations, you will be my 1,000,000th victim!", "Your demise! An unlimited time offer!", "I hate Ad Block so much.", "Spam is food for the soul."]);
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			startAbility(slots[GREEN]);
		}

		public function uniqueMovementAnimation():void{
			skewX = 0.5*facing*-1;
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}

		public function projectileAnimation():void{
			changeAnimation(spamMc);
			spinAnimationInert();
		}

		public function spamAnimation():void{
			changeAnimation(spamMc);						
			spinAnimationInert();
			GV.arena.showSpam();
		}

		public function uniqueNullItAll(): void {
			spamArray[0].nullItAll();
			spamArray[1].nullItAll();
			spamArray[2].nullItAll();
			spamArray[3].nullItAll();
			spamArray[0] = null;
			spamArray[1] = null;
			spamArray[2] = null;
			spamArray[3] = null;
			superNull(idleMc); idleMc = null;
			superNull(spamMc); spamMc = null;			
			superNull(projectileMc); projectileMc = null;
			superNull(spamArray); spamArray = null;			
		}

		public function uniqueRunAfterInit(){
			for (var i:int = 0, ilen:int = 4; i < ilen; i++){
				sContainer.addChild(spamArray[i]);
			}
			changeAnimation(idleMc);
		}
	}
}
