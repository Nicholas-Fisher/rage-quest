package classes {

	import starling.events.Event;
		import classes.FFParticleSystem.FFParticleSystem;
	
	public class PRISM extends Combatant{

		public var idleMc:SuperMovieClip = new SuperMovieClip('oracleLight', GV.COMBATANT_SPRITESHEET);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);	

		public function PRISM(){		
			introMessage = introMessageRandomizer(new <String>["It all must end."]);
			floats = true;
			particleEffect = FX.showParticleEffect(FX.oraclePool, x + 3, y + 45, 0);			
		}

		public function uniqueAi():void{
			startAbility(slots[BLUE]);
			attackAI();
			if(GV.arena.currEnemyNum < GV.MAX_ENEMY_NUM){
				startAbility(slots[GREEN], GV.arena.getRandomFreePos());
			}
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;
		}		

		public function attackAnimation():void{
			projectileTrailPool = FX.prismTrailPool;
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);		
		}

		public function uniqueRunAfterInit():void{
			particleEffect.emitterX = x + 3;
			particleEffect.emitterY = y + 45;
		}

		public function summonAnimation():void{
			projectileTrailPool = FX.redMisslePool;
		}
		public function uniqueTeleportAbility():void{			
			randomTeleportAbility();
			particleEffect.emitterX = x + 3;
			particleEffect.emitterY = y + 45;
		}
	}
}
