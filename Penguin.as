package classes {

	import flash.utils.*;
	import dragonBones.events.AnimationEvent;
	
	public class Penguin extends ArmatureCombatant {

		[Embed(source = "../penguin.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;

		public function Penguin(){

			introMessage = introMessageRandomizer(new <String>["Enjoy your movie. Thanks, you too!", "...", "...HI?", "My feet hurt.", "Why is everyone looking at me?"]);
			armatureName = "penguin";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
			
			if(slots[GREEN]) slots[GREEN].speech = "You're making me nervous!!";
		}

		public function uniqueAi():void{
			if(GV.arena.summonIsDecoy){
				if(slots[BLUE].startable) movementAI();
			}else{
				if(slots[BLUE].startable) evasionAI();
			}
			attackAI();
			if(distanceBetween(GV.hero.pos, pos) <= 1 ){
				startAbility(slots[GREEN]);
			}
		}

		public function uniqueRunAfterInit():void{
			pivotX = width >> 1;
			pivotY = height >> 1;
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
			armature.animation.gotoAndPlay("casting");
			setTimeout(executeEffects, 1000);
			FX.penguinSound.play(GV.AUDIO_START_TIME, 0, GV.sfx);
		}

		public function castingAnimation():void{
			armature.animation.gotoAndPlay("casting");			
			FX.penguinSound.play(GV.AUDIO_START_TIME, 0, GV.sfx);
		}

		override protected function centerShadow():void{	
			shadow.x = x;
			shadow.y = y + shadowHeight + 6;
		}
	}
}
