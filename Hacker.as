package classes {

	import dragonBones.events.AnimationEvent;

	public class Hacker extends ArmatureCombatant {

		[Embed(source = "../rageEnemy.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;

		public function Hacker(){
			
			introMessage = introMessageRandomizer(new <String>["Winning fairly is for pussies.", "MMR IS LIFE.", "Will killing you up my bars?", "It's not hacks, I'm just pro."]);
			armatureName = "rage";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
		}

		public function uniqueAi():void{
			startAbility(slots[BLUE]);
			attackAI();
			startAbility(slots[GREEN]);
		}
		
		private function uniqueArmatureComplete(e:AnimationEvent):void{
			switch(afterAnim){
				case 'idle':
					idleAnimation();
				break;
				case 'gunshot':
					FX.gunshot.play(GV.AUDIO_START_TIME, 0, GV.sfx);
					executeEffects();
				break;
				case 'effects':							
					executeEffects();
				break;				
				case 'teleport':
					randomTeleportAbility();
				break;
				case 'moveBack':
					moveBackToOurTile(); 
					moveBack = false;
				break;
			}
		}
		
		public function uniqueMovementAnimation():void{armature.animation.gotoAndPlay("run");}

		public function uniqueIdleAnimation():void{

			armature.animation.gotoAndPlay("idle");
		}

		public function attackAnimation():void{
			armature.animation.gotoAndPlay("attack");
			afterAnim = 'gunshot';
		}

		public function teleportAnimation():void{
			armature.animation.gotoAndPlay("casting"); afterAnim = 'teleport'
		}

		public function castingAnimation():void{
			armature.animation.gotoAndPlay("casting"); afterAnim = 'effects'
		}

		public function aimBotAnimation():void{
			attackAnimation();
		}

		public function lagSwitchAnimation():void{
			executeEffects();
		}

		public function uniqueRunAfterInit(){
			changeBoneHelper("head", "parts/head3");
			changeBoneHelper("weapon", "parts/weapon1");
		}
	}
}