/*
This method is called whenever the combatant moves. If forMelee is true, the Ability will
be executed at the end of the movement, otherwise it will simply move the combatant to the
target position.
*/

private function moving(forMelee:Boolean):void{
	// If already occupied and this movement is not for an Ability
	if(!GV.arena || !GV.arena.isActive) return;	
	if(GV.arena.getTile(currTarg).occupied && !forMelee){
		statusMsg('CANNOT MOVE THERE', GV.STS_RED);
		endAbility();
	}else{
		xd = x - targetPixelX;
		if(!forMelee){
			if(xd > 0){
				faceLeft();
			}else {
				faceRight()
			}
			centerThis(); // just to fix shadow
			moveToPos(currTarg);
			addEventListener(starling.events.Event.ENTER_FRAME, movementOnFrame);
		}else{
			usingMelee = true; 
			faceOppositeDirectionAfterMoving = false;
			var offSetFromCenter:int = GV.TILE_WIDTH*0.5;
			if(xd > 0){
				faceLeft();
				if (xd > 60 * GV.scale){ // The tile isn't nearly directly above or belove
					targetPixelX += offSetFromCenter;
				}else{
					targetPixelX -= offSetFromCenter;
					faceOppositeDirectionAfterMoving = true;
				}
			}else{
				faceRight();
				if (xd < -60 * GV.scale){
					 targetPixelX -= offSetFromCenter;
				}else{
					targetPixelX += offSetFromCenter;
					faceOppositeDirectionAfterMoving = true;
				}
			}
			addEventListener(starling.events.Event.ENTER_FRAME, movementOnFrameforMelee);
		}
		speechBubble.hideSpeech();
		movementAnimation();
		moveSoundPlay();
		startTrailEffect('movementTrailPool');
	}
}


public function moveToPos(_pos:Array, isTeleport:Boolean = false){
	releaseTile();
	takeTile(_pos);
	if(!isHero){
		if(GV.arena.makingSelection) GV.arena.selectTilesForSelection();
	}
	for (var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){ // Relocate pointers to new position
		pointToLocation(slots[i], slots[i].targ);
	}
	if(isTeleport){
	 	finishMovement();
	 	centerThis();
	}
}

/*
The movementOnFrame methods handle the actual frame to frame visual representation
of the movement. movementOnFrame reorients the combatants position while movementOnFrameforMelee
does not and executes an Ability, then moves the combatant back to their original position. movementOnFrame
is executed when moving back to the combatants original position after executing an ability.
*/

protected function movementOnFrame(e:starling.events.Event):void{
	moveTowardTarget(this);
	if(distance < MOVEMENT_SPEED*GV.speedFactor){

		if(faceOppositeDirectionAfterMoving){
			faceOppositeDirection();
			faceOppositeDirectionAfterMoving = false
		}

		finishMovement();
		removeEventListener(starling.events.Event.ENTER_FRAME, movementOnFrame);
	}
}

protected function movementOnFrameforMelee(e:starling.events.Event):void{
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

protected function finishMovement(forMelee:Boolean = false):void{
	// End for normal movement
	var tile:Tile = GV.arena.getTile(pos);	 
	if(tile.augmentTrigger == 'proximity' && !doNotActivateMovementAugs){
		switch(tile.effectTargetType){
			case 'enemies': if(!isHero) tile.triggerAugment(); break;
			case 'good-guys': if(isHero) tile.triggerAugment(); break;
			default: tile.triggerAugment(); break;
		}
	}
	endTrailEffect();
	moveSoundStop();
	doNotActivateMovementAugs = false
	if(startedCurrAction){		
		x = targetPixelX;
		y = targetPixelY;
		if(forMelee){
			slotForCurrentAction.abilityAnimation();
		}else{
			if(usingMelee){
				executeEffects();
			}else{
				executeEffects(true);
			}
		}
	}
	if(isHero){	
		if(tile.link) GV.stage.quickOpenArena(GVP.stats.currentMap, tile.link);
		if(tile.isGoalTile) GV.arena.win();	
		for(var i:int = 0; i < GV.SLOT_NUM; i++){
			if(slots[i].selfTargeting && slots[i].charge > 0) GV.arena.getTile(pos).setTargetedAbilityPicture(slots[i].id, false);
		}
	}
}

private function movementOnFrameForProjectile(e:starling.events.Event):void{	
	moveTowardTarget(slotForCurrentAction.projectileMc);
	if(distance < MOVEMENT_SPEED*GV.speedFactor){
		GV.arena.aboveCombatantContainer.removeChild(slotForCurrentAction.projectileMc);
		GV.s.juggler.remove(slotForCurrentAction.projectileMc);
		removeEventListener(starling.events.Event.ENTER_FRAME, movementOnFrameForProjectile);
		if(trailP) endTrailEffect();
		executeEffects();
	}
}

public function moveTowardTarget(o:DisplayObject){	
	xd = o.x - targetPixelX;
	yd = o.y - targetPixelY;
	angle = Math.atan2(yd, xd);
	distance = Math.round(Math.sqrt(Math.pow(xd,2) + Math.pow(yd,2)));
	if(o != this){ // If o is a projectile
		o.x -=  Math.cos(angle) * MOVEMENT_SPEED*GV.speedFactor*1.5;
		o.y -=  Math.sin(angle) * MOVEMENT_SPEED*GV.speedFactor*1.5;
		if(trailP){
			trailP.emitterX = o.x;
			trailP.emitterY = o.y;	
		}
	}else{
		o.x -=  Math.cos(angle) * MOVEMENT_SPEED*GV.speedFactor;
		o.y -=  Math.sin(angle) * MOVEMENT_SPEED*GV.speedFactor;
		if(particleEffect){
			particleEffect.emitterX = x;
			particleEffect.emitterY = y;
		}
		centerShadow();
		centerIndicator();
		if(isCurrTrailConstant){	
			if(trailP){
				trailP.emitterX = x;
				trailP.emitterY = y + height / 2 - 12;
			}
		}
	}
}

/* Executed after the abilityAnimation in movementOnFrameforMelee is finished */
public function moveBackToOurTile():void{
	targetPixelX = GV.arena.tileX(pos);
	targetPixelY = GV.arena.tileY(pos, tilePositionOffset);
	movementAnimation();
	moveSoundPlay();
	doNotActivateMovementAugs = true;
	if(faceOppositeDirectionAfterMoving){
		faceOppositeDirection();
	}
	startTrailEffect('movementTrailPool');
	addEventListener(starling.events.Event.ENTER_FRAME, movementOnFrame);
}

protected function centerThis(){
	ourTile.placeCombatantInCenter(this);
	centerIndicator();
	centerShadow();
}
private function takeTile(_pos:Array):void{
	var tile:Tile = GV.arena.getTile(_pos);
	pos = _pos;
	tile.occupied = true;
	tile.occupant = this;
	tile.traversableForAI = false;
	// if (unitType === 'Wall'){
	// 	tile.canBeSelected = false;
	// }
	var i:int;
	if(ourTile){
		for (i = 0; i < GV.SLOT_NUM; i++){
			slots[i].barContainer.x -= ourTile.x;
			slots[i].barContainer.y -= ourTile.y;
		}
	}
	ourTile = tile;
	for (i = 0; i < GV.SLOT_NUM; i++){
		slots[i].barContainer.x += ourTile.x;
		slots[i].barContainer.y += ourTile.y;
	}
	GV.arena.selectTilesForSelection(true);
}

public function releaseTile():void{
	if(ourTile){	
		ourTile.occupied = false;
		ourTile.occupant = null;
		ourTile.traversableForAI = true;
	}
}

protected function startTrailEffect(trailPoolName:String):void{	
	if(unitType === 'Malware' || unitType === 'Malphaware'|| unitType === 'CorruptedMalware'){
		trailP = FX.showParticleEffect(this[trailPoolName], 0, 0, -1, true);  		
	}else{
		trailP = FX.showParticleEffect(this[trailPoolName], 0, 0, -1, false);  			
	}   
	if(slotForCurrentAction.hasConstantTrail){
		isCurrTrailConstant = true;
        trailP.start();
    }else{
		isCurrTrailConstant = false;
        clearInterval(trailInterval);
        trail();
        trailInterval = setInterval(trail, trailSpacing);
    }
}

protected function endTrailEffect():void{
	if(trailP){	
	    trailP.stop();
	    if(!isCurrTrailConstant){
		    clearInterval(trailInterval);
	    }   
	    trailP = null;
	}
}

protected function trail():void{
	if(!GV.arena || !GV.arena.isActive) return;
	if(trailP){	
	    var xd:int = x - targetPixelX;
	    var yd:int = y - targetPixelY;
	    var angle:Number = Math.atan2(yd, xd);
	    trailP.emitterX = x + 40 * Math.cos(angle);
	    trailP.emitterY = y + height / 2;
	    trailP.start(0.1);
	}
}