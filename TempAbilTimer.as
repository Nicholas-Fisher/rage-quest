package classes {

	import starling.events.Event;

	public class TempAbilTimer {

		public var effects:Object;
		public var tempIdleAnimation:String;
		public var selfTargeting:Boolean;
		public var targetCombatant:Combatant;
		public var destroyFlag:Boolean = false;
		public var timeLeft:Number = 0;
		
		public function TempAbilTimer(tempAbilSeconds, _effects, _tempIdleAnimation, _targetCombatant){

			effects = _effects;
			tempIdleAnimation = _tempIdleAnimation;
			targetCombatant = _targetCombatant;
			timeLeft = tempAbilSeconds;

			targetCombatant.addEventListener(starling.events.Event.ENTER_FRAME, tick);

			if(tempIdleAnimation){
				targetCombatant.idleAnimation = targetCombatant[tempIdleAnimation];
				targetCombatant.idleAnimation();
			}
		}

		public function tick():void{
			
			if(!GV.arena.paused && !GV.arena.inAction){	
				if(timeLeft > 0){
					 timeLeft -= GV.tick;
				}else{
					if(targetCombatant){
						if (targetCombatant){ 
							if (effects.defChange && effects.defChange < 0){ 
								targetCombatant.reasonsToBlock--;
								if(targetCombatant.reasonsToBlock < 0){
									targetCombatant.reasonsToBlock = 0;
								}
							}							
							GV.arena.doEffectsOnTarget(effects, targetCombatant.pos)
						};	
						targetCombatant.idleAnimation = (targetCombatant.hasOwnProperty("uniqueIdleAnimation")) ? targetCombatant['uniqueIdleAnimation'] : function():void{};
						targetCombatant.idleAnimation();					
						GV.arena.hudUpdate();
					}
					destroyFlag = true;
					targetCombatant.cleanTimerArray();
					targetCombatant.removeEventListener(starling.events.Event.ENTER_FRAME, tick);
				}
			}
		}
	}
}