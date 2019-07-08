package classes{

	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.animation.Tween;
	import flash.utils.*;
	
	public class Bloatware extends Combatant {

		public var idleMc:SuperMovieClip;
		public var smileMc:SuperMovieClip;
		private var bloat:Number = 1;
		
		public function Bloatware(){

			idleMc = new SuperMovieClip('bloatwareIdle', GV.COMBATANT_SPRITESHEET, 48, 50, true, 40);
			smileMc = new SuperMovieClip('bloatwareSmile', GV.COMBATANT_SPRITESHEET, 48, 50, true);
			introMessage = introMessageRandomizer(new <String>["Disk space is delectable", "Check out my gainz.", "Auto-starting", "*Burp*"]);
		}

		public function uniqueNullItAll():void{
			superNull(idleMc); idleMc = null;
			superNull(smileMc); smileMc = null;
		}

		public function uniqueAi():void{

			if (slots[BLUE].startable && !slots[BLUE].isCharging) {
				var h:Combatant;
				if(GV.arena.summonIsDecoy) h = GV.arena.summon;
				else if(GV.arena.protectee) h = GV.arena.protectee;
				else h = GV.hero;
				var xdif:int = h.pos[0] - pos[0];
				var ydif:int = h.pos[1] - pos[1];
				var xdir:int = xdif/Math.abs(xdif);
				var ydir:int = ydif/Math.abs(ydif);
				var mX:int = xdir < 0 ? pos[0] : ((GV.TILE_X - 1) - pos[0])*xdir; 
				var mY:int = ydir < 0 ? pos[1] : ((GV.TILE_Y - 1) - pos[1])*ydir; 
				var maxLen:int = Math.min(mX || GV.TILE_X, mY || GV.TILE_Y);
				var minLen:int = distanceBetween(GV.hero.pos, pos);
				var heroThere:Boolean = false;
				slots[BLUE].posVector = new Vector.<Array>();
				var heroAttackable:Boolean = false;

				for(var i:int = 0, ilen:int = maxLen + 1; i < ilen; i++){
					var currPos:Array = [pos[0] + i*xdir, pos[1] + i*ydir];
					if(!GV.arena.getTile(currPos).canBeSelected){
						break; // You can't travel over a chasm so screw the whole thing.
					}else{
						if(GV.arena.getTile(currPos).occupant == h) heroThere = true;
						if(!GV.arena.getTile(currPos).occupied && i >= minLen && heroThere) {
							startAbility(slots[BLUE], currPos);
							heroAttackable = true;
							break;
						}
						slots[BLUE].posVector.push(currPos);
					}
				}

				if(!heroAttackable){
					
					slots[BLUE].posVector = null;
					var targ:Combatant;
					if(GV.arena.summonIsDecoy) targ = GV.arena.summon;
					else if(GV.arena.protectee) targ = GV.arena.protectee;
					else targ = GV.hero
					
					if(slots[BLUE].startable && !slots[BLUE].isCharging){
						var targTile:Tile = targ.ourTile;
						var scopeCheck:Boolean = slots[RED].abilitySelectType == 'cross' ? !perpindicular(targ.pos, pos) : false;
						if(distanceBetween(targ.pos, pos) > slots[RED].abilityRange || scopeCheck){
							targTile.traversableForAI = true;
							var path:Array = tileToMoveTo(GV.arena.getTile(pos), targTile);
							targTile.traversableForAI = false;
							if(path && path.length > 1){
								path[1].traversableForAI = false; // Make other dudes not try to move here after a buddy already picked it out.
								startAbility(slots[BLUE], path[1].pos);
							}
						}
					}
					attackAI();
				}
			}
			if(bloat < 1.2){
				startAbility(slots[GREEN]);
			}
		}

		public function meleeAnimation():void{moveBackToOurTile();}

		public function uniqueIdleAnimation():void{
			changeAnimation(idleMc);
		}

		public function uniqueRunAfterInit(){
			addEventListener(starling.events.Event.ENTER_FRAME, onFrame);
		}

		public function onFrame(){
			var cf:int = idleMc.currentFrame;
			if(cf < 30){			
				shadow.scaleY = shadow.scaleX = 0.35 + bloat - (cf/300);
			}else{
				shadow.scaleY = shadow.scaleX = 0.35 + (bloat - 0.1) + ((cf%30)/300) ;
			}
		}

		public function bloatAnimation():void{
			var soundFx = Math.floor(Math.random()*5);
			switch(soundFx){
				case 0: FX.rubberStretch1.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				case 1: FX.rubberStretch2.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				case 2: FX.rubberStretch3.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				case 3: FX.rubberStretch4.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				default: FX.rubberStretch5.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			}
			bloat += 0.1;
			scaleX = bloat*(Math.abs(scaleX)/scaleX);
			scaleY = bloat;
			shadow.scaleX *= bloat;
			shadow.scaleY *= bloat;
			shadowHeight += 7;
			tilePositionOffset = height/3;
			centerShadow();
			FX.showParticleEffect(FX.bloatPool, x, y, 0.5);
			changeAnimation(smileMc);
			setTimeout(executeEffects, 750);
		}

		public function uniqueMovementAnimation():void{
			changeAnimation(smileMc);
		}

		override protected function movementOnFrameforMelee(e:starling.events.Event):void{
			rotation -= 0.1*(Math.abs(scaleX)/scaleX);
			moveTowardTarget(this);
			if(distance < MOVEMENT_SPEED*GV.speedFactor){
				if(faceOppositeDirectionAfterMoving){
					faceOppositeDirection();
					faceOppositeDirectionAfterMoving = false
				}else{
					faceOppositeDirectionAfterMoving = true;
				}

				finishMovement(true);
				removeEventListener(starling.events.Event.ENTER_FRAME, movementOnFrameforMelee);
			}
		}

		override protected function movementOnFrame(e:starling.events.Event):void{
			rotation -= 0.1*(Math.abs(scaleX)/scaleX);
			moveTowardTarget(this);
			if(distance < MOVEMENT_SPEED*GV.speedFactor){
				rotation = 0;

				if(faceOppositeDirectionAfterMoving){
					faceOppositeDirection();
					faceOppositeDirectionAfterMoving = false
				}

			finishMovement();
			removeEventListener(starling.events.Event.ENTER_FRAME, movementOnFrame);
			}
		}
	}
}
