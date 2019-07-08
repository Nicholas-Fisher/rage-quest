package classes {

	import starling.display.Sprite;

	public class HudBar extends Sprite {

		private var bar:SuperMovieClip;

		public function HudBar(meterType:String){

			bar = new SuperMovieClip(meterType, GV.HUD_SPRITESHEET);
			addChild(new SuperImage('barBack0000', GV.HUD_SPRITESHEET));
			addChild(bar);
			addChild(new SuperImage('barBorder0000', GV.HUD_SPRITESHEET));
		}

		public function percentCompleted(percent:Number):void{
			bar.currentFrame = Math.floor(99 - 99*percent);
		}
	}
}