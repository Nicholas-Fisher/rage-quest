package classes {

	import starling.events.Event;
	import flash.utils.*;
	
	public class TwitchChat extends Combatant {

		public var idleMc:SuperMovieClip = new SuperMovieClip('twitchChatIdle', GV.COMBATANT_SPRITESHEET, 0, -10, false, 10);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);

		public function TwitchChat(){
			floats = true;
			introMessage = introMessageRandomizer(new <String>["Fresh meat, boys!", "Kappa.", "ENTERTAIN ME."]);
		}

		public function uniqueAi():void{
			startAbility(slots[BLUE], GV.hero.pos);
			attackAISummon();		
			startAbility(slots[GREEN]);
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
			skewX = 0;
			shadow.skewX = skewX;
		}

		public function hateAnimation():void{
			projectileTrailPool = FX.hatePool;
			spinAnimationInert();
		}
		public function supportAnimation():void{
			projectileTrailPool = FX.lovePool;
			spinAnimationInert();
		}

		public function summonExitAnimation():void{
			showRandomMsg([
				'LOL. GG. SALT. POGCHAMP. POGCHAMP. KAPPA. BIBLETHUMP.',
				'KAPPA. POGCHAMP. KAPPA. KAPPA. BIBLETHUMP. LMAO.',
			]);
			setTimeout(function(){
				GV.arena.killSummon();
				executeEffects();	
			}, 1500)
		}
	}
}
