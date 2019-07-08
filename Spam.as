package classes{
	
	import flash.utils.*
    import starling.animation.Tween;
    import starling.animation.Transitions;
	
	public class Spam extends SuperImage{		
		
		private var popupInterval:int;
		
		public function Spam(prefix:String){
			super(prefix, GV.COMBATANT_SPRITESHEET);
			popUp();
		}
		
		public function popUp():void{
			if(!GV.arena || !GV.arena.isActive) return; // do i need this?	
			visible = true
			x = Math.round(Math.random()*70) - 35;
			y = Math.round(Math.random()*70) - 35;
			popupInterval = setTimeout(popUp, Math.round(Math.random() * 2000) + 1000);

			scaleX = scaleY = 0.25;
			GV.s.juggler.tween(this, 0.25, {
				transition: Transitions.EASE_OUT,
				reverse: false,
				repeatCount: 1,
				scaleX: 1,
				scaleY: 1,
				onComplete: function(): void { scaleX = scaleY = 1; }
			});
		}

		public function nullItAll():void {
			clearTimeout(popupInterval);
		}
	}
}