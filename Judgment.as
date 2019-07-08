package classes {

	import starling.events.Event;
    import starling.animation.Tween;
    import starling.animation.Transitions;
    import flash.utils.*;
	
	public class Judgment extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('judgmentIdle', GV.COMBATANT_SPRITESHEET, 0, -10);
		public var arrowUpMc:SuperMovieClip = new SuperMovieClip('judgmentUp', GV.COMBATANT_SPRITESHEET);
		public var arrowDownMc:SuperMovieClip = new SuperMovieClip('judgmentDown', GV.COMBATANT_SPRITESHEET);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);

		public function Judgment(){
			floats = true;
			introMessage = '';	
			arrowUpMc.loop = false;
			arrowDownMc.loop = false;
			introMessage = introMessageRandomizer(new <String>["I lack a nuanced opinion on this.", "I dislike you.", "...", "Your views lack perfect alignment with my own. Dislike."]);
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			healAI();
		}
		
		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
		}
		public function upAnimation():void{
			projectileTrailPool = FX.likeMissleTrailPool;
			changeAnimation(arrowUpMc);
		}
		public function downAnimation():void{
			projectileTrailPool = FX.dislikeMissleTrailPool;
			changeAnimation(arrowDownMc);
		}
	}
}
