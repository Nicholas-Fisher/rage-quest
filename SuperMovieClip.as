package classes {

	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.events.Event;

	public class SuperMovieClip extends MovieClip {

		public var fadeRate:Number;

		public function SuperMovieClip(prefix:String, atlas:int, _x:int = 0, _y:int = 0, centerPivotFlag:Boolean = false, _fps:Number = 60){

			var t:Vector.<Texture>;
			t = Assets.getAtlasTextures(atlas, prefix);
			super(t, _fps);
			x = _x;
			y = _y;
			if(centerPivotFlag){
				alignPivot();		
			}
		}

		public function reversePlay():void{
			currentFrame = numFrames - 1;
			addEventListener(starling.events.Event.ENTER_FRAME, reverseFrame);
		}

		private function reverseFrame():void{
			if (currentFrame > 0 ){
				currentFrame -=1
			}else{
				removeEventListener(starling.events.Event.ENTER_FRAME, reverseFrame);
				dispatchEvent(new Event(starling.events.Event.COMPLETE));
			}
		}

		public function genericFade(_fadeRate:Number = 0.025, destroyAfter:Boolean = true):void{
			fadeRate = _fadeRate;
			if(destroyAfter){
				addEventListener(Event.ENTER_FRAME, genericFaderOnFrame);
			}else{
				addEventListener(Event.ENTER_FRAME, genericNoDestroyFaderOnFrame);
			}
		}

		public function genericFaderOnFrame():void{
			if(alpha > 0){
				alpha -= fadeRate * GV.speedFactor;
			}else{
				alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFaderOnFrame);
				parent.removeChild(this);
				dispose();
			}
		}
		public function genericNoDestroyFaderOnFrame():void{
			if(alpha > 0){
				alpha -= fadeRate * GV.speedFactor;
			}else{
				removeEventListener(Event.ENTER_FRAME, genericNoDestroyFaderOnFrame);
			}
		}

		public function genericFadeIn(_fadeRate:Number = 0.025):void{
			fadeRate = _fadeRate;
			addEventListener(Event.ENTER_FRAME, genericFaderOnFrame);
		}

		public function genericFadeInOnFrame():void{
			if(alpha < 1){
				alpha += fadeRate * GV.speedFactor;
			}else{
				alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFaderOnFrame);
			}
		}
	}
}
