package classes {

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import flash.events.Event;	
	import flash.utils.*;

	import dragonBones.Armature;
	import dragonBones.Bone;
	import dragonBones.events.AnimationEvent;
	import dragonBones.animation.WorldClock;
	import dragonBones.factories.StarlingFactory;

	public class ArmatureCombatant extends Combatant{

		protected var armatureClip:Sprite;
		protected var factory:StarlingFactory;
		protected var afterAnim:String;
		protected var armatureName:String;
		protected var moveBack:Boolean = false;  // Useful for armature combatants with melee attacks.
		protected var armatureComplete:Function;
		protected var armature:Armature;

		public function ArmatureCombatant(){
			isArmature = true;
			factory = new StarlingFactory();
			factory.addEventListener(flash.events.Event.COMPLETE, textureCompleteHandler, false, 0, true);
		}

		protected function textureCompleteHandler(e:flash.events.Event):void {

			armature = factory.buildArmature(armatureName);
			armatureClip = armature.display as Sprite;
			addChild(armatureClip);
			WorldClock.clock.add(armature);
			addEventListener(starling.events.Event.ENTER_FRAME, onEnterFrameHandler);
			armature.addEventListener(AnimationEvent.COMPLETE, armatureComplete, false, 0, true);
			idleAnimation();

			if(unitType == 'OmegaPenguin'){
				pivotX = width >> 1;
				pivotY = height >> 1;
				scaleX = 1.25;
				scaleY = 1.25;
			}

			if(unitType == 'AlphaWolf'){
				scaleX = 1.25;
				scaleY = 1.25;
			}

			if(GV.arena && GV.arena.isActive) {	
				addToStage();
			}else{
				GV.sc.addChild(this);
				if(unitType == 'Penguin'){
					x -= 25;
					y -= 40;
				}
				if(unitType == 'Flamer' || unitType == 'Hacker'){					
					runAfterInit();
				}	
			}
		}

		public function armatureNullItAll(){

			removeEventListener(starling.events.Event.ENTER_FRAME, onEnterFrameHandler);
			armature.removeEventListener(AnimationEvent.COMPLETE, armatureComplete);
			factory.removeEventListener(flash.events.Event.COMPLETE, textureCompleteHandler);
			WorldClock.clock.remove(armature);
			armature.dispose();

			superNull(armatureClip); armatureClip = null;
			superNull(factory); factory = null;
			superNull(afterAnim); afterAnim = null;
			superNull(armatureName); armatureName = null;
			superNull(armatureComplete); armatureComplete = null;
			superNull(armature); armature = null;
		}

		protected function changeBoneHelper(str:String, tName:String){
		    var _image:Image = factory.getTextureDisplay(tName) as Image;
		   	var _bone:Bone = armature.getBone(str); 
		   	_bone.display.dispose();
		    _bone.display = _image;	
		}
		
		protected function onEnterFrameHandler(e:starling.events.Event):void{
			WorldClock.clock.advanceTime(-1);
		}
	}
}