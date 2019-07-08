package classes {
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Button;
	
	public class SpamAd extends Sprite {	
		
		include 'nonClasses/Utility.as';
		private var ad:SuperImage;
		private var exitButton:Button = new Button(Assets.getAtlasTexture(GV.ABOVE_ALL_SPRITESHEET, 'exitButton0000'), '', Assets.getAtlasTexture(GV.ABOVE_ALL_SPRITESHEET, 'exitButton0000'));
		private var exitButtonFlash:SuperMovieClip = new SuperMovieClip('exitButtonFlash', GV.ABOVE_ALL_SPRITESHEET, 0, 0, true);

		public function SpamAd(){
			ad = new SuperImage('spamAd' + Math.ceil(Math.random()*2.9 + 0.1) + '0000', GV.ABOVE_ALL_SPRITESHEET);
			addChild(ad);
			addChild(exitButton);
			addChild(exitButtonFlash);
			exitButtonFlash.x = exitButton.x = 407;
			exitButtonFlash.y = exitButton.y = -18;
			exitButtonFlash.x += 37;
			exitButtonFlash.y += 35;
			exitButtonFlash.touchable = false;
			GV.s.juggler.add(exitButtonFlash);
			exitButtonFlash.play();			
			exitButton.addEventListener(starling.events.Event.TRIGGERED, close);
			GV.arena.spamContainer.addChild(this);
			x = Math.random()*(GV.s.stage.stageWidth - 500) - GV.arena.spamContainer.x;
			y = Math.random()*(GV.s.stage.stageHeight - 500) - GV.arena.spamContainer.y;
		}

		public function close():void{
			GV.arena.spamCount--;
			GV.s.juggler.remove(exitButtonFlash);
			superNull(exitButtonFlash); exitButtonFlash = null;
			superNull(exitButton); exitButton = null;
			superNull(ad); ad = null;			
			GV.arena.spamContainer.removeChild(this);
		}
	}
}