package classes {

	import starling.events.Event;
    import flash.utils.*;
	
	public class HiveMind extends Combatant {

		public var shieldMc:SuperMovieClip = new SuperMovieClip('hiveMindShield', GV.BOSS2_SPRITESHEET, 0, 0, true);
		public var idleMc:SuperMovieClip = new SuperMovieClip('hiveMindIdle', GV.BOSS2_SPRITESHEET);
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);
		
		public function HiveMind(){
			introMessage = introMessageRandomizer(new <String>["Resistance is futile", "Assimilate.", "Be apart of something greater."]);
		}

		public function uniqueAi():void{
			if(GV.arena.currEnemyNum < GV.MAX_ENEMY_NUM){
				startAbility(slots[BLUE], GV.arena.getRandomFreePos());
			}
			startAbility(slots[RED]);
			startAbility(slots[GREEN]);
		}

		public function uniqueNullItAll():void{
			superNull(shieldMc); shieldMc = null;
			superNull(idleMc); idleMc = null;
			superNull(projectileMc); projectileMc = null;
			for(var prop:String in this) {
			  	superNull(this[prop]); this[prop] = null;
			}
        }

		public function uniqueRunAfterInit(){
			GV.arena.topBoy = this;
			if(GV.arena.combatantContainer.contains(this)) GV.arena.combatantContainer.setChildIndex(this, GV.arena.combatantContainer.numChildren - 1);
			shieldMc.x = width/2;
			shieldMc.y = height/2;
			shieldMc.visible = false;
			addChild(shieldMc);
		}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc); blocking = false;
			shieldMc.visible = false;
		}
		public function fragmentAnimation():void{
			//executeEffects();
		}
		public function invigorateAnimation():void{
			executeEffects();
		}
		public function defenseIdleAnimation():void{
			blocking = true;
			shieldMc.visible = true;
		}

		override public function faceLeft():void{
		}
		override public function faceRight():void{
		}
		override public function faceOppositeDirection():void{
		}
	}
}
