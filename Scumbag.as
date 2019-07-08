package classes {

	import starling.events.Event;
    import starling.animation.Tween;
    import starling.animation.Transitions;
    import flash.utils.*;
	
	public class Scumbag extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('scumbagIdle', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		public var moveBack:Boolean = false;

		public function Scumbag(){
			introMessage = introMessageRandomizer(new <String>["It's just a prank, bro.", "Come at me, bro.", "I wish I was a MAGA hat.", "YOLO."]);
			floats = true;
			introMessage = '';	
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(distanceBetween(GV.hero.pos, pos) <= 1){
				var targTile:Tile = GV.arena.getTile(GV.hero.pos);
				var dir:Array = [targTile.pos[0] - pos[0], targTile.pos[1] - pos[1]];
				var t:Tile = GV.arena.getTile([GV.hero.pos[0] + dir[0], GV.hero.pos[1] + dir[1]]);
				if(t && t.canBeSelected && !t.occupied && !t.isTrap){
					startAbility(slots[GREEN], GV.hero.pos);
				}
			}
		}
		
		public function uniqueMovementAnimation():void{
			rotation = 0.35;
		}
		
		public function uniqueIdleAnimation():void{
			rotation = 0;
			changeAnimation(idleMc);
		}

		public function meleeAnimation():void{
			moveBack = true;
			flickAnimation();
		}

		public function flickAnimation():void{
			rotation = 0;
			var goalRotation = scaleX > 0 ? -1.57 : 1.57;
           	GV.s.juggler.tween(this, 0.3, {
               transition: Transitions.EASE_IN,
               repeatCount: 1,
               onComplete: endFlickTween,
               rotation: goalRotation // 1.57
            });
		}

		private function endFlickTween():void{
	        GV.s.juggler.tween(this, 0.5, {
               transition: Transitions.EASE_OUT_ELASTIC,
               repeatCount: 1,
               onComplete: endFlick,
               rotation: 0
            });		
		}

		private function endFlick():void{
			if(moveBack){ 
				moveBack = false;
				moveBackToOurTile();
			}
		}
	}
}
