package classes {

	import flash.utils.*;
	import dragonBones.events.AnimationEvent;
	
	public class OmegaPenguin extends ArmatureCombatant {

		//public var idleMc:SuperMovieClip = new SuperMovieClip('penguinIdle', GV.COMBATANT_SPRITESHEET);
		//public var gazeMc:SuperMovieClip = new SuperMovieClip('penguinGaze', GV.COMBATANT_SPRITESHEET, 0, -5, false);
		[Embed(source = "../omegaPenguin.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;

		public function OmegaPenguin(){

			introMessage = introMessageRandomizer(new <String>["Even my own kind shuns me."]);
			armatureName = "omegaPenguin";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
		}

		public function uniqueAi():void{
			if(GV.arena.summonIsDecoy){
				if(slots[BLUE].startable) movementAI();
			}else{
				if(slots[BLUE].startable) evasionAI();
			}
			attackAI();
			healAI();
		}

		public function uniqueRunAfterInit():void{
			shadow.width = width*1.1
			shadow.height -= 5;
		}

		private function uniqueArmatureComplete(e:AnimationEvent):void{
			switch(afterAnim){
				case 'idle':
					idleAnimation();
				break;
				case 'effects':
					executeEffects();
				break;
				case 'moveBack':
					moveBackToOurTile(); 
					moveBack = false;
				break;
			}
		}
		
		public function uniqueMovementAnimation():void{armature.animation.gotoAndPlay("running");}

		public function uniqueIdleAnimation():void{armature.animation.gotoAndPlay("idle");}

		public function awkwardAnimation():void{
			castingAnimation();
			setTimeout(executeEffects, 1000);
		}

		public function castingAnimation():void{
			armature.animation.gotoAndPlay("casting");
		}

		//override protected function centerShadow():void{	
		//	shadow.x = x;
		//	shadow.y = y + shadowHeight + 6;
		//}
	}
}
