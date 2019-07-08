package classes {

	public class Pointer extends SuperMovieClip{

		include 'nonClasses/Utility.as';
		
		var maxFrameNum:int
		
		public function Pointer(prefix:String){
			super(prefix, GV.COMBATANT_SPRITESHEET);
			maxFrameNum =  numFrames - 1;
			visible = false;			
		}

		public function updateCharge(percent:Number):void{
			if(between(0, percent, 1))currentFrame = Math.floor((maxFrameNum)*percent); // error
			else if(percent >= 1) currentFrame = maxFrameNum;
		}

		public function updateCooldown(percent:Number):void{
			if(between(0, percent, 1)){
				currentFrame = maxFrameNum - Math.floor((maxFrameNum)*percent);
			}else if(percent >= 1) currentFrame = maxFrameNum;
		}
	}
}