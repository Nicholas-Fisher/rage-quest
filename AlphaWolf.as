package classes {

	import dragonBones.events.AnimationEvent;
	
	public class AlphaWolf extends ArmatureCombatant {

		[Embed(source = "../alphaWolf.png", mimeType = "application/octet-stream")]
		public static const ResourcesData:Class;
		public var slashMc:SuperMovieClip = new SuperMovieClip('clawEffect', GV.COMBATANT_SPRITESHEET, 0, 0, true);

		public function AlphaWolf(){

			introMessage = introMessageRandomizer(new <String>["Even my own kind thought I was crazy... BEFORE I ATE THEM."]);
			armatureName = "alphaWolf";
			factory.parseData(new ResourcesData());
			armatureComplete = uniqueArmatureComplete;			
		}

		public function uniqueAi():void{
			movementAI();
			attackAI();
			if(distanceBetween(GV.hero.pos, pos) <= 1 ){
				startAbility(slots[GREEN]);
			}
		}

		public function uniqueNullItAll():void{
			superNull(slashMc); slashMc = null;
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
			}
		}

		public function uniqueMovementAnimation():void{armature.animation.gotoAndPlay("run");}

		public function uniqueIdleAnimation():void{armature.animation.gotoAndPlay("idle");}

		public function jumpAnimation():void{armature.animation.gotoAndPlay("jump"); afterAnim = 'effects'; FX.dogBark1Sound.play(GV.AUDIO_START_TIME, 0, GV.sfx);}

		public function meleeAnimation():void{
			armature.animation.gotoAndPlay("attack");
			afterAnim = 'meleeAnimationPart2'; 
			FX.dogBark2Sound.play(GV.AUDIO_START_TIME, 0, GV.sfx);
		}

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