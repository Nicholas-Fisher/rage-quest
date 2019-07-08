package classes {

	import dragonBones.events.AnimationEvent;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	import flash.utils.*;

	public class Flamer extends ArmatureCombatant {

		[Embed(source = "../rageEnemy.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;
		private var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter();
		public var projectileMc:SuperMovieClip = new SuperMovieClip('invisImg', GV.COMBATANT_SPRITESHEET, 0, 0, true);		
		
		public function Flamer(){
			
			introMessage = introMessageRandomizer(new <String>["LRN2PLAY", "GET REKT", "EAT CRAP AND DIE", "I SEE UR HAX"]);
			armatureName = "rage";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
			colorMatrixFilter.tint(0xFF5555, 1);
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(slots[GREEN].startable && hp/maxHp < 0.25){
				filter = colorMatrixFilter;
				startAbility(slots[GREEN]);
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

		public function uniqueIdleAnimation():void{
			armature.animation.gotoAndPlay("idle");
		}

		public function coolOffAnimation():void{
			filter = null;
		}


		public function attackAnimation():void{
			armature.animation.gotoAndPlay("attack"); afterAnim = 'idle'
		}

		public function castingAnimation():void{
			armature.animation.gotoAndPlay("casting"); afterAnim = 'effects'
		}

		public function castingAnimationForConvo():void{
			armature.animation.gotoAndPlay("casting");
		}

		public function projectileAnimation():void{
			attackAnimation();
			shakeAnimation();
		}

		public function selfDestructAnimation():void{
			speechBubble.showSpeech('SCREW THIS, I\'M OUT.');
			setTimeout(afterSelfDestructAnimation, 1000);
		}

		public function rageAnimation():void{
			FX.showExplosion(x, y, 0.1);
			filter = colorMatrixFilter;
			idleAnimation();
		}

		public function afterSelfDestructAnimation():void{
			FX.showExplosion(x, y, 0.1);
			hp = 0;
			executeEffects();
		}

		public function uniqueRunAfterInit(){			
			changeBoneHelper("head", "parts/head2");
			changeBoneHelper("weapon", "parts/weapon4");
		}
		public function uniqueNullItAll():void{
			superNull(projectileMc); projectileMc = null;
			superNull(colorMatrixFilter); colorMatrixFilter = null;
		}
	}
}