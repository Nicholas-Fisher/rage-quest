public function evasionAI():void{
	var heroTile:Tile = GV.hero.ourTile;
	var scopeCheck:Boolean = slots[RED].abilitySelectType == 'cross' ? !perpindicular(GV.hero.pos, pos) : false;
	if(distanceBetween(GV.hero.pos, pos) > slots[RED].abilityRange || scopeCheck){
		heroTile.traversableForAI = true;		
		var path:Array = tileToMoveTo(GV.arena.getTile(pos), heroTile);
		heroTile.traversableForAI = false;		
		if(path && path.length > 1){    
			path[1].traversableForAI = false; // Make other dudes not try to move here after a buddy already picked it out
			startAbility(slots[BLUE], path[1].pos);
		}
	}else if(distanceBetween(GV.hero.pos, pos) == 1){ // Flee
		var heroPos:Array = heroTile.pos;
		var dir:Array = [pos[0] - heroPos[0], pos[1] - heroPos[1]];
		var tilePosVector:Vector.<Array> = new Vector.<Array>();

		tilePosVector[0] = [pos[0] + dir[0], pos[1] + dir[1]];
		tilePosVector[1] = [pos[0], pos[1] + dir[1]];
		tilePosVector[2] = [pos[0] + dir[0], pos[1]];
		tilePosVector[3] = [pos[0] + 1, pos[1] + dir[1]];
		tilePosVector[4] = [pos[0] - 1, pos[1] + dir[1]];
		tilePosVector[5] = [pos[0] + dir[0], pos[1] + 1];
		tilePosVector[6] = [pos[0] + dir[0], pos[1] - 1];
		tilePosVector[7] = [pos[0] - 1, pos[1] + 1];
		tilePosVector[8] = [pos[0] + 0, pos[1] + 1];
		tilePosVector[9] = [pos[0] + 1, pos[1] + 1];
		tilePosVector[10] = [pos[0] - 1, pos[1] - 1];
		tilePosVector[11] = [pos[0] + 0, pos[1] - 1];
		tilePosVector[12] = [pos[0] + 1, pos[1] - 1];
		tilePosVector[13] = [pos[0] - 1, pos[1]];
		tilePosVector[14] = [pos[0] + 1, pos[1]];

		for(var i:int = 0; i < tilePosVector.length; i++){
			var t:Tile =  GV.arena.getTile(tilePosVector[i])
			if(t && !t.occupied && t.traversableForAI){
				startAbility(slots[BLUE], t.pos);
				return;
			}
		}
	}
}

public function attackAI(slotForAttack:int = 1):void{

	var targ:Combatant;
	if(GV.arena.summonIsDecoy) targ = GV.arena.summon;
	else if(GV.arena.protectee) targ = GV.arena.protectee;
	else targ = GV.hero;

	var targetPos:Array = targ.pos;

	// Target where target is going instead if they are about to move.
	for(var i:int = 0; i < GV.SLOT_NUM; i++){
		var curr = targ.slots[i];
		if(curr.targ){
			var targTile:Tile = GV.arena.getTile(curr.targ);
			if(curr.isForMovement && curr.isCharging && curr.targ && !targTile.occupied && distanceBetween(curr.targ, targ.pos) <= curr.abilityRange && curr.charge < slots[RED].chargeTime){	
				targetPos = curr.targ;					
			}	
		}
	}

	if(slots[slotForAttack].startable && !slots[slotForAttack].isCharging){
		if(distanceBetween(targetPos, pos) <= slots[slotForAttack].abilityRange){
			helper(targetPos);
		} else if(GV.arena.summon && distanceBetween(GV.arena.summon.pos, pos) <= slots[slotForAttack].abilityRange) {
			helper(GV.arena.summon.pos);
		}
	}

	function helper(p){
		var scopeCheck:Boolean = slots[slotForAttack].abilitySelectType == 'cross' ? perpindicular(p, pos) : true;
		if(scopeCheck){
			startAbility(slots[slotForAttack], p);
		}
	}
}

public function movementAI():void{

	var targ:Combatant;
	if(GV.arena.summonIsDecoy) targ = GV.arena.summon;
	else if(GV.arena.protectee) targ = GV.arena.protectee;
	else targ = GV.hero;

	var targetPos:Array = targ.pos;
	var targTile:Tile = targ.ourTile;

	// Target where target is going instead if they are about to move.
	for(var i:int = 0; i < GV.SLOT_NUM; i++){
		var curr = targ.slots[i];
		if(curr.targ){
			targTile = GV.arena.getTile(targetPos);
			if(curr.isForMovement && curr.isCharging && curr.targ && !targTile.occupied && distanceBetween(curr.targ, targ.pos) <= curr.abilityRange){		
				targetPos = curr.targ;				
			}
		}
	}
	
	if(slots[BLUE].startable && !slots[BLUE].isCharging){
		var scopeCheck:Boolean = slots[RED].abilitySelectType == 'cross' ? !perpindicular(targetPos, pos) : false;
		if(distanceBetween(targetPos, pos) > slots[RED].abilityRange || scopeCheck){
			targTile.traversableForAI = true;			
			var path:Array = tileToMoveTo(GV.arena.getTile(pos), targTile);
			targTile.traversableForAI = false;			
			if(path && path.length > 1){
				path[1].traversableForAI = false; // Make other dudes not try to move here after a buddy already picked it out
				startAbility(slots[BLUE], path[1].pos);
			}
		}
	}
}

public function movementAISummon():void{
	if(slots[BLUE].startable && !slots[BLUE].isCharging){
		var closestEnemyTile:Tile = GV.arena.getClosestEnemyTileTo(pos);
		var scopeCheck:Boolean = slots[RED].abilitySelectType == 'cross' ? !perpindicular(closestEnemyTile.pos, pos) : false;
		if(closestEnemyTile && distanceBetween(closestEnemyTile.pos, pos) > slots[RED].abilityRange || scopeCheck){
			closestEnemyTile.traversableForAI = true;
			var path:Array = tileToMoveTo(GV.arena.getTile(pos), closestEnemyTile);
			closestEnemyTile.traversableForAI = false;
			if(path && path.length > 1){    
				path[1].traversableForAI = false; // Make other dudes not try to move here after a buddy already picked it out
				startAbility(slots[BLUE], path[1].pos);
			}
		}
	}
}

public function attackAISummon():void{
	if(slots[RED].startable && !slots[RED].isCharging){
		for(var i:int = 0, ilen:int = GV.arena.bg.length; i < ilen; i++){
			var targ:Combatant = GV.arena.bg[i];
			if(targ && !targ.isSimple){					
				var scopeCheck:Boolean = slots[RED].abilitySelectType == 'cross' ? perpindicular(targ.pos, pos) : true;
				if(distanceBetween(targ.pos, pos) <= slots[RED].abilityRange && scopeCheck){
					startAbility(slots[RED], targ.pos);
				}
			}
		}
	}
}

public function healAI():void{

	var targ:Combatant;
	var i:int;
	for(i = 0; i < GV.arena.bg.length; i++){
		targ = GV.arena.bg[i];
		if(slots[GREEN].startable && targ.hp < targ.maxHp && distanceBetween(targ.pos, pos) <= slots[GREEN].abilityRange && !targ.isProtectee && targ.pos != pos && targ != this){
			startAbility(slots[GREEN], targ.pos);
			return;
		}
	}
}
