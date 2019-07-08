package classes {

	import dragonBones.events.AnimationEvent;
	import flash.utils.*;
	
	public class CourageWolf extends ArmatureCombatant {

		[Embed(source = "../courageWolf.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;
		public var slashMc:SuperMovieClip = new SuperMovieClip('clawEffect', GV.COMBATANT_SPRITESHEET, 0, 0, true);

		public function CourageWolf(){

			introMessage = introMessageRandomizer(new <String>["Fear is a reflex, but courage is a choice!", "We got this!", "Believe in the me that believes in you!", "Fall twice, but rise thrice!"]);
			armatureName = "courageWolf";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;
		}

		public function uniqueAi():void{
			movementAISummon();
			attackAISummon();
			startAbility(slots[GREEN]);
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
				case 'meleeAnimationPart2':
					meleeAnimationPart2(); 
				break;
				case 'summonExit':
					GV.arena.killSummon();	
					executeEffects();									
				break;
			}
		}

		public function uniqueNullItAll():void{
			superNull(slashMc); slashMc = null;
		}	

		public function uniqueMovementAnimation():void{armature.animation.gotoAndPlay("run");}

		public function uniqueIdleAnimation():void{armature.animation.gotoAndPlay("idle");}

		public function summonExitAnimation():void{
			showRandomMsg([
				'Bite off more than you can chew, THEN CHEW IT.',
				'Hardship means someone FEARS YOUR PROGRESS.',
				'What doesn\'t kill you, IS GOING TO DIE.',
			]);
			setTimeout(function(){
				if(GV.arena){
					jumpAnimation();
				}				
			}, 1500)
		}

		public function jumpAnimation():void{armature.animation.gotoAndPlay("jump"); afterAnim = 'summonExit'}
		
		public function jumpAnimation2():void{armature.animation.gotoAndPlay("jump"); afterAnim = 'idle'}

		public function meleeAnimation():void{armature.animation.gotoAndPlay("attack"); afterAnim = 'meleeAnimationPart2';}

		public function meleeAnimationPart2():void{
			armature.animation.gotoAndPlay("attack"); afterAnim = 'meleeAnimationPart2';
			var targTile:Tile = GV.arena.getTile(currTarg);
			if(targTile.occupied){
				GV.arena.aboveCombatantContainer.addChild(slashMc);
				slashMc.x = targTile.occupant.x;
				slashMc.y = targTile.occupant.y;
			}
			slashMc.genericFade();
			moveBackToOurTile();
		}
	}
}