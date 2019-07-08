package classes {
	
	public class TrainingDummy extends Combatant{

		public var idleMc:SuperMovieClip = new SuperMovieClip('trainingDummy', GV.COMBATANT_SPRITESHEET);
		
		public function TrainingDummy(){
			introMessage = introMessageRandomizer(new <String>["GIVE ME YOUR BEST SHOT.", "HURT ME SO GOOD.", "SHOW ME WHAT YOU GOT."]);
		}

		public function uniqueAi():void{hp = 9000;}

		public function uniqueIdleAnimation():void{changeAnimation(idleMc);}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
		}

		public function uniqueRunAfterInit(){

			if(GV.arena.isSafe) return;

			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[0]);
			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[1]);
			GV.arena.buttonContainer.removeChild(statUnit.abilityTimers[2]);

			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.statBack);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.swordIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.shieldIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[0]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[1]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.abilTextBacks[2]);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.apBar);
			GV.arena.alwaysFlattenedContainer.removeChild(statUnit.square);
			
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[0]);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[1]);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.abilText[2]);	
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.apText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.powText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.defText);
			GV.arena.alwaysFlatTextContainer.removeChild(statUnit.lvlText);

			colorIndicatorContainer.removeChild(colorIndicator);

			statUnit.hpText.width = 200;

			statUnit.hpText.x -= statUnit.square.width;
		}
	}
}
