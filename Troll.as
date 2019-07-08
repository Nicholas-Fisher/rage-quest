package classes {

	import dragonBones.events.AnimationEvent;

	public class Troll extends ArmatureCombatant {

		[Embed(source = "../rageEnemy.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;

		public function Troll(){
			
			introMessage = introMessageRandomizer(new <String>["TROLOLOL.", "ROFLMAO", "FALAFEL", "LULZ"]);
			armatureName = "rage";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(slots[GREEN].startable){
				for (var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){
					var s:Slot = GV.arena.hero.slots[i];
					if(s.targ && s.isCharging && areEqual(s.targ, pos)){
						startAbility(slots[GREEN]);
					}
				}
			}
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
		
		public function uniqueMovementAnimation():void{armature.animation.gotoAndPlay("run");}

		public function uniqueIdleAnimation():void{armature.animation.gotoAndPlay("idle");}

		public function attackAnimation():void{
			armature.animation.gotoAndPlay("magnet"); afterAnim = 'effects'
		}

		public function castingAnimation():void{
			FX.showParticleEffect(FX.redCastingPool, x, y, 0.1);
			armature.animation.gotoAndPlay("casting"); afterAnim = 'effects'
		}

		public function uniqueRunAfterInit(){
			changeBoneHelper("head", "parts/head1");
			changeBoneHelper("weapon", "parts/weapon3");
		}
	}
}