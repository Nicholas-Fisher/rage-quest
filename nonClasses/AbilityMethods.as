public function meleeAbility():void{moving(true);}
public function movementAbility():void{moving(false);}

public function instantAbility():void{
	if (!slotForCurrentAction.selfTargeting) faceTarget();
	if (slotForCurrentAction.abilityAnimation != null){
		slotForCurrentAction.abilityAnimation();
	}else{		
		executeEffects();
	}
}

public function projectileAbility():void{
	faceTarget();
	if (slotForCurrentAction.abilityAnimation != null){
		slotForCurrentAction.abilityAnimation();
		setTimeout(launchProjectile, 250);
	}else{
		launchProjectile();
	}
}

public function faceTarget():void{
	if(currTarg[0] != pos[0]){
		if(currTarg[0] < pos[0]){
			faceLeft();
		}else{
			faceRight();
		}
	}
}

public function launchProjectile():void{

	if(!GV.arena || !GV.arena.isActive) return;	
	
	if(slotForCurrentAction.projectileTrailPool) projectileTrailPool = slotForCurrentAction.projectileTrailPool;

	targetPixelY = GV.arena.tileY(currTarg);

	var t:Array = currTarg;
	xd = GV.arena.tileX(pos) - GV.arena.tileX(t);
	yd = GV.arena.tileY(pos) - GV.arena.tileY(t);
	angle = Math.atan2(yd, xd);
	distance = Math.round(Math.sqrt(Math.pow(xd,2) + Math.pow(yd,2)));
	
	var effect:FFParticleSystem = FX.showParticleEffect(FX.poofForProjectilePool, x, y, 0.1);	
	effect.emitAngle = angle - Math.PI;
	effect.emitAngleVariance = Math.PI/6;
	effect.startSize = 25;
	slotForCurrentAction.projectileMc.rotation = angle;

	var p:SuperMovieClip = slotForCurrentAction.projectileMc;
	p.x = x;
	p.y = y;
	GV.s.juggler.add(p);
	startTrailEffect('projectileTrailPool');
	GV.arena.aboveCombatantContainer.addChild(p);
	addEventListener(starling.events.Event.ENTER_FRAME, movementOnFrameForProjectile);
	FX.genericMissle.play(GV.AUDIO_START_TIME, 0, GV.sfx);

	xd = x - targetPixelX;
	if(xd > 0){
		faceLeft();
	}else {
		faceRight();
	}	
}


public function doEffects():void{
	if(!GV.arena || !GV.arena.isActive) return;	
	GV.arena.currAbilUser = this;
	var ce:Object = calculatedEffects();
	GV.arena.selectTiles('effect', currTarg, slotForCurrentAction, 'targetTile');
	switch(slotForCurrentAction.effectTargetType){
		case 'good-guys': missed = GV.arena.doEffectsOnGoodGuys(ce); break;
		case 'enemies': missed = GV.arena.doEffectsOnEnemies(ce); break;
		default: missed = GV.arena.doEffectsOnAll(ce); break;
	}
}

private function pushCombatant(c:Combatant, dir:Array):void{
	if(c.isProtectee){
		statusMsg('CANNOT PUSH TARGET', GV.STS_RED);
		endAbility(false);
		return;
	}
	var t:Tile = GV.arena.getTile([c.pos[0] + dir[0], c.pos[1] + dir[1]]);
	if(t && !t.occupied){
		c.moveToPos(t.pos, true);
		endAbility();
	}else{
		statusMsg('CANNOT PUSH TARGET', GV.STS_RED);
		endAbility(false);
	}
}

private function hitFX():void{
	if(slotForCurrentAction.hitFX){
		var hitFX = slotForCurrentAction.hitFX;
		switch(hitFX){
			case 'explosion': FX.showExplosion(targetPixelX, targetPixelY, 0.1); break;
			case 'sodaExplosion': FX.showParticleEffect(FX.sodaExplosionPool, targetPixelX, targetPixelY, 0.1); break;
			case 'shoopExplosion': FX.showParticleEffect(FX.shoopExplosionPool, targetPixelX, targetPixelY, 0.1); break;
			case 'prismExplosion': FX.showParticleEffect(FX.prismExplosionPool, targetPixelX, targetPixelY, 0.3); break;
			case 'corruptExplosion': FX.showParticleEffect(FX.corruptExplosionPool, targetPixelX, targetPixelY, 0.1); break;
			case 'fire': FX.showParticleEffect(FX.explosionPool, targetPixelX, targetPixelY, 0.1); break;
			case 'poof': FX.showParticleEffect(FX.poofPool, targetPixelX, targetPixelY, 0.1); break;
			case 'flare': FX.showParticleEffect(FX.explosionPool, targetPixelX, targetPixelY, 0.1); break;
			case 'rage': FX.showParticleEffect(FX.explosionPool, targetPixelX, targetPixelY, 0.1); break;
		}
	} 
}

protected function executeEffects(neverMiss:Boolean = false):void{
	if(!GV.arena || !GV.arena.isActive || !slotForCurrentAction || !slotForCurrentAction.effects) return;
	missed = true;
	GV.arena.criticalIsHappening = Math.random() <= GV.CRITICAL_DAMAGE_CHANCE;
	if(GV.arena.isTutorial){
		GV.arena.criticalIsHappening = false;
	}
	var c:Combatant;
	var ce:Object = cancelingEffects();
	var tile:Tile;
	var targetCombatant:Combatant
	if(!(slotForCurrentAction.effects.hpChange || slotForCurrentAction.effects.defChange || slotForCurrentAction.effects.powChange || slotForCurrentAction.effects.powChange) || isSimple) missed = false;
	switch(slotForCurrentAction.effectType){
		case 'normal':
			doEffects();
		break;
		case 'obfuscation':
			GV.arena.alwaysFlattenedContainer.visible = false;
			GV.arena.alwaysFlatTextContainer.visible = false;
		break;
		case 'temporary':
			tile = GV.arena.getTile(currTarg);
			if(tile.occupant){
				targetCombatant = tile.occupant;
				if(calculatedEffects().defChange && calculatedEffects().defChange > 0){
					targetCombatant.reasonsToBlock++;					
				}
				missed = GV.arena.doEffectsOnTarget(calculatedEffects(), currTarg);
			}
			if(targetCombatant){ // If something was hit with it.
				var tempAbilTimer:TempAbilTimer = new TempAbilTimer(slotForCurrentAction.tempAbilSeconds, ce, slotForCurrentAction.tempIdleAnimation, targetCombatant) 
				targetCombatant.tempAbilTimers.push(tempAbilTimer);
			}
		break;
		case 'augment':	
			missed = false			
			tile = GV.arena.getTile(currTarg);
		 	tile.changeAugment(slotForCurrentAction, calculatedEffects());
		 	switch(slotForCurrentAction.augment){
		 		case 'infected': FX.showParticleEffect(FX.slimeySplashPool, targetPixelX, targetPixelY, 0.1); break;
		 		case 'explosive': FX.showParticleEffect(FX.explosionPool, targetPixelX, targetPixelY, 0.1); break;
		 		case 'heroInfected': FX.showParticleEffect(FX.slimeyPinkSplashPool, targetPixelX, targetPixelY, 0.1); break;	 		
		 		default: FX.showParticleEffect(FX.poofPool, targetPixelX, targetPixelY, 0.1); break;
		 	}
		 	
		break;
		case 'summon':
			if(GV.arena.noSummons){
				statusMsg('NO SUMMONING IN THIS FIGHT!', GV.STS_RED);
			}else{
				tile = GV.arena.getTile(currTarg);
				if(tile.occupied == false){
					if(GV.arena.summon){
						GV.arena.killSummon();
						GV.arena.summon.removeSelfIfDead();
					}
					missed = false;
					switch(slotForCurrentAction.unit){
						case 'CourageWolf': c = new CourageWolf; break;
						case 'TwitchChat': c = new TwitchChat; break;
						case 'AdBlock': c = new AdBlock; break;
						case 'ClickBait': 
							GV.arena.summonIsDecoy = true;
							c = new ClickBait; 
						break;
					}
					c.pos = currTarg;
					c.init();
					FX.showParticleEffect(FX.poofPool, targetPixelX, targetPixelY, 0.1);
					GV.arena.hero.speechBubble.showSpeech("Help me, " + GV.stage.fixName(slotForCurrentAction.unit) + ".");
				}else{
					statusMsg('TILE ALREADY OCCUPIED', GV.STS_RED);
				}
			}
		break;
		case 'shoop-da-whoop':
			doEffects();
		break;
		case 'push': // Abil must be one range.
			tile = GV.arena.getTile(currTarg);
			if(tile.occupant){
				missed = false;
				targetCombatant = tile.occupant;
				var dir:Array = [tile.pos[0] - pos[0], tile.pos[1] - pos[1]];
				doEffects();
				pushCombatant(targetCombatant, dir);
				targetCombatant.genericHit();
			}
		break;
		case 'leech':
			doEffects();
			tile = GV.arena.getTile(currTarg);
			if(tile.occupant){
				targetCombatant = tile.occupant;
				ce.hpChange = Math.max(0, ce.hpChange - targetCombatant.def);
				GV.arena.doEffectsOnTarget(ce, pos);
			}
		break;
		case 'agro':
			doEffects();
			tile = GV.arena.getTile(currTarg);
			if(tile.occupant){
				targetCombatant = tile.occupant;
				for (var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){
					var s:Slot = targetCombatant.slots[i];
					if(s.isCharging && !s.selfTargeting){
						if(s.isForMovement){
							var t:Tile = GV.arena.getTile(s.targ);
							t.traversableForAI = true;
						}
						s.targ = pos;
						targetCombatant.pointToLocation(s, pos);
						if(targetCombatant.isHero){
							GV.arena.getTile(pos).setTargetedAbilityPicture(s.id);
						}						
					}
				}
			}
		break;
		case 'spawn-enemy':
			tile = GV.arena.getTile(currTarg);
			if(tile.occupied == false){
				if(GV.arena.currEnemyNum < GV.MAX_ENEMY_NUM){
					missed = false;
					switch(slotForCurrentAction.unit){
						case 'CorruptedMalware': c = new CorruptedMalware; break;
						case 'Mobling': c = new Mobling; break;
						case 'Hate': c = new Hate; break;
						case 'UserData': c = new UserData; 
							c.lvl = 3;												
							UserData(c).prism = this;
							changePow(10);
							changeDef(5);
						break;
						case 'RandomGamer': 
							var r = Math.round(Math.random()*4);
							switch(r){
								case 1: c = new Flamer; break;
								case 2: c = new Troll; break;
								case 3: c = new Hacker; break;
								default: c = new Flamer; break;
							}
							c.lvl = 8;							
						break;
					}
					c.isSpawn = true;
					c.pos = currTarg;
					if(!c.lvl) c.lvl = lvl;
					c.init();
					GV.arena.bg.push(c);
				}else{
					statusMsg('TOO MANY ENEMIES', GV.STS_RED);
				}
			}else{
				statusMsg('TILE ALREADY OCCUPIED', GV.STS_RED);
			}
		break;
		case 'spawn-simple':
			tile = GV.arena.getTile(currTarg);
			if(tile.occupied == false){
				missed = false;
				switch(slotForCurrentAction.unit){
					case 'TimeBomb': c = new TimeBomb; break;
					case 'Wall': c = new Wall; break;
					case 'Trap': c = new Trap; break;
				}
				c.pos = currTarg;
				c.lvl = 1;
				c.init();
				GV.arena.bg.push(c);
			}else{
				statusMsg('TILE ALREADY OCCUPIED', GV.STS_RED);
			}
		break;
		case 'obstacle':
			doEffects();
			if(distanceBetween(currTarg, GV.arena.hero.pos) <= 1){
				GV.arena.hero.moveToPos([0,4], true);
				GV.arena.hero.genericHit();
			}
		break;
		case 'clear-augment':
			tile = GV.arena.getTile(currTarg);
			tile.clearAugment();
		break;
		case 'action':
			missed = false
			var o:Combatant = GV.arena.getTile(currTarg).occupant
			faceTarget();
			if(o){			
				switch(o.unitType){
					case 'ZipChest':
						var chest:ZipChest = ZipChest(o)
						chest.openChest();
					break;
					case 'Conversationalist':
						var talker:Conversationalist = Conversationalist(o);
						talker.faceHero();
						GV.arena.startConversation(talker);
					break;
					default: statusMsg('NO EFFECT', GV.STS_RED); break;
				}
			}
		break;
	}
	if(missed && !neverMiss){
		statusMsg('MISSED', GV.STS_RED);
	}
	hitFX();
	endAbility();
}

public function genericHit():void{
	hitAnimation();	
	effect('hpDown');
	FX.playHit();
}

public function endAbility(proceedWithCooldown:Boolean = true):void{	

	if(!GV.arena || !GV.arena.isActive) return;	

	usingMelee = false;

	if(slotForCurrentAction.cooldownTime > 0 && proceedWithCooldown){
		if(slotForCurrentAction.abilityTimer) slotForCurrentAction.abilityTimer.cooldown();	
		slotForCurrentAction.barContainer.visible = true;
		positionBars();
	}

	idleAnimation();
	if(proceedWithCooldown){
		addEventListener(starling.events.Event.ENTER_FRAME, slotForCurrentAction.cooldownAbilityFunc);
	}else{
		if(slotForCurrentAction.abilityTimer) slotForCurrentAction.abilityTimer.neutral();
	}
	GV.arena.endAction(this);
}

protected function calculatedEffects():Object{
	if (!slotForCurrentAction) return null;
	var e:Object = slotForCurrentAction.effects;
	return {
		hpChange: powCalc(e.hpChange) || 0,
		defChange: powCalc(e.defChange) || 0,
		powChange: powCalc(e.powChange) || 0,
		dotChange: powCalc(e.dotChange) || 0,
		apChange: powCalc(e.apChange) || 0,
		damageReturnChange: e.damageReturnChange || 0,
		timeChange: e.timeChange || 0
	}
}

private function cancelingEffects():Object{
	if (!slotForCurrentAction) return null;
	var e:Object = slotForCurrentAction.effects;
	return {
		hpChange: -1*powCalc(e.hpChange) || 0, 
		defChange: -1*powCalc(e.defChange) || 0, 
		powChange: -1*powCalc(e.powChange) || 0,
		dotChange: -1*powCalc(e.dotChange) || 0, 
		apChange: -1*powCalc(e.apChange) || 0,
		damageReturnChange: -1*e.damageReturnChange || 0
	};
}

public function powCalc(baseValue:Number = 0):int{
	return Math.abs(baseValue) >= GV.EFFECTTHRESHOLD ? baseValue : Math.ceil(pow*baseValue); // all values over 5 are considered flat values.
}

// If an ability is charging it will take an extra second to finish.
public function changeTime(amount:Number):void{
	if(amount){	
		var infoString:String = '';
		var c:uint;
		for(var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){
			slots[i].timeChangeAmount += amount;
			slots[i].timerTick(true);
		}
		if(amount < 0){
			infoString += 'SLOWED BY ' + Math.abs(amount).toString() + ' SEC';
			effect('timeUp');
			FX.playPowerDown();
			c = GV.STS_RED;
		}else{
			infoString += 'HASTENED BY ' + amount + ' SEC';
			effect('timeDown');
			FX.playPowerUp();
			c = GV.STS_GREEN;
		}
		statusMsg(infoString, c);
	}
}

public function changeDef(amount:Number):void{
	if(amount){
		var infoString:String = '';
		var c:uint;
		if(amount > 0 ){
			infoString += '+';
			effect('defUp');
			FX.playPowerUp();
			c = GV.STS_GREEN;
		}else{
			effect('defDown');
			FX.playPowerDown();
			c = GV.STS_RED;
		}
		infoString += amount.toString() + ' DEF';
		def += amount;
		if(statUnit) statUnit.defText.text = def.toString(); 
		statusMsg(infoString, c);
	}
}

public function changePow(amount:Number):void{
	if(amount){	
		var infoString:String = '';
		var c:uint;
		if(amount > 0 ){
			infoString += '+';
			effect('powUp');
			FX.playPowerUp();
			c = GV.STS_GREEN;
		}else{
			effect('powDown');
			FX.playPowerDown();
			c = GV.STS_RED;
		}
		infoString += amount.toString() + ' POW';
		if(pow + amount < 0){ 
			pow = 0
		}else{
			pow += amount;
		}
		if(statUnit) statUnit.powText.text = pow.toString();
		statusMsg(infoString, c);
	}
}

public function changeHp(amount:Number, ignoreDamageReturn:Boolean = false, criticalIsHappening:Boolean = false):void{
	if(amount){
		var infoString:String = '';
		var c:uint;
		if(amount <= 0){

			var attacker:Combatant = GV.arena.currAbilUser;
			if(!ignoreDamageReturn && attacker && attacker != this && damageReturn){
				attacker.changeHp(Math.ceil(damageReturn*amount));
			}

			amount = Math.max(0, (amount*-1) - def); // make damage positive for clarity

			if(amount <= 0) amount = 1;
			if(criticalIsHappening){
				infoString += 'CRITICAL HIT! ';
				amount = Math.round(amount*1.5);
			}

			infoString += '-' + amount.toString() + ' HP';
			hp -= amount;
			hitAnimation();	
			effect('hpDown');
			FX.playHit();
			c = GV.STS_RED;
		}else{
			infoString += '+' + amount.toString() + ' HP';
			hp += amount;
			effect('hpUp');
			FX.refresh.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			c = GV.STS_GREEN;
		}
		if (hp > 0){
			if(hp > maxHp) hp = maxHp;
			if(statUnit) statUnit.hpText.text = hp + ' / ' + maxHp;
		}else{
			hp = 0;
			GV.arena.kill(this);
		}
		if(statUnit) statUnit.hpBar.percentCompleted(hp/maxHp);
		statusMsg(infoString, c, true);
	}
}

public function changeAp(amount:Number):void{
	if(amount){	
		var infoString:String = '';
		var c:uint;
		if(amount > 0){
			infoString += '+';
			effect('apUp');
			c = GV.STS_GREEN;
		}else{
			effect('apDown');
			c = GV.STS_RED;
		}
		infoString += amount.toString() + ' AP';
		ap += amount;
		if(ap > maxAp) ap = maxAp;
		if(ap < 0) ap = 0;
		if(statUnit) statUnit.apBar.percentCompleted(ap/maxAp);
		if(statUnit) statUnit.apText.text = ap + ' / ' + maxAp;
		statusMsg(infoString, c);
	}
}

public function changeDamageReturn(amount:Number):void{
	if(amount){	
		var infoString:String = '';
		var c:uint;
		var percent:int = Math.round(amount*100);
		if(amount > 0){
			infoString += '+' + percent + '% DAMAGE RETURN';
			c = GV.STS_GREEN;
		}else{
			infoString += percent + '% DAMAGE RETURN';
			c = GV.STS_RED;
		}
		damageReturn += amount;
		statusMsg(infoString, c);
	}
}

public function changeDot(amount:Number):void{
	if(amount){	
		var infoString:String = '';
		var c:uint;
		if(amount > 0){
			infoString += 'Damage Over Time: ' + amount;
			c = GV.STS_RED;
		}
		dot += amount;
		statusMsg(infoString, c);
	}
}

public function abilityAssigner():void{
	if(!isHero){
		slots[0].setAbility(EnemyAbils[unitType + '1']);
		slots[1].setAbility(EnemyAbils[unitType + '2']);
		slots[2].setAbility(EnemyAbils[unitType + '3']);
	}
};