package classes {

	import starling.display.Sprite;
	import flash.utils.*;
	import starling.events.Event;

	public class SpeechBubble extends Sprite {

		private var speech:SuperText;
		private var bubble:SuperImage = new SuperImage('speechBubble0000', GV.COMBATANT_SPRITESHEET);
		private var talker:Combatant;
		private var baseX:int;
		private var baseY:int;
		private static const SPEECH_TEXT_SIZE:int = 20;

		public function SpeechBubble(c:Combatant){
			if(!GV.arena || !GV.arena.isActive) return;		
			speech = new SuperText(190, 85, "", GV.FONT_2, SPEECH_TEXT_SIZE, 0xffffff, 'speech_bubble');
			speech.x = 11;
			speech.y = 11;
			addChild(bubble);
			addChild(speech);
			pivotX = width/2;
			pivotY = height;
			visible = false;
			talker = c;
			bubble.alpha = 0.7;
			GV.arena.speechBubbleContainer.addChild(this);
		}

		public function showSpeech(msg:String, shake:Boolean = false):void{
			visible = true;
			x = talker.x;
			y = talker.y - talker.height/2;
			speech.text = msg;
			setTimeout(hideSpeech, 2250);			
			shakeAnimation(250);
			if(!talker.isHero) talker.shakeAnimation(250, false);
		}

		public function hideSpeech():void{
			visible = false;
		}

		public function shakeAnimation(ms:int = 1000):void{
			addEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
			baseX = x;
			baseY = y;
			setTimeout(onshakeFinish, ms);			
		}

		private function shakeOnFrame():void{
			x = baseX + (Math.random()*10 - 5);
			y = baseY + (Math.random()*10 - 5);
		}

		private function onshakeFinish():void{
			x = baseX;
			y = baseY;
			removeEventListener(starling.events.Event.ENTER_FRAME, shakeOnFrame);
		}
	}
}
