package classes {

	import starling.display.Sprite;

	public class Slot{
		
		include 'nonClasses/Utility.as';

		public var gameName:String;
		public var abilityAnimation:Function;
		public var tempIdleAnimation:String;
		public var tempAbilSeconds:int;
		public var effects:Object;
		public var startable:Boolean = true;
		public var isCharging:Boolean = false;
		public var ap:int = 0;
		public var charge:Number = 0;
		public var cooldown:Number = 0;
		public var chargeTime:Number;
		public var cooldownTime:Number;
		public var ability:Function;
		public var goesThroughThings:Boolean
		public var deselectCombatants:Boolean;
		public var abilitySelectType:String;
		public var abilityRange:int;
		public var effectType:String;
		public var effectSelectType:String;
		public var effectRange:int;
		public var effectTargetType:String;
		public var selfTargeting:Boolean;
		public var isForMovement:Boolean;
		public var hitFX:String = '';
		public var augment:String = '';
		public var augmentTrigger:String = '';
		public var projectileMc:SuperMovieClip;
		public var projectileTrailPool:SpritePool;
		public var hasConstantTrail:Boolean;
		public var markedForCooldown:Boolean = false;
		public var stock:int;
		public var o:Object;
		public var id:int;
		public var targ:Array; // co-od format of destination
		public var abilityTimer:AbilityTimer;
		public var pointer:Pointer;
		public var bar:Pointer;
		public var barContainer:Sprite = new Sprite;
		public var chargeAbilityFunc:Function;
		public var cooldownAbilityFunc:Function;
		public var assigned:Boolean = false;
		public var posVector:Vector.<Array> = new Vector.<Array>();
		public var c:Combatant;
		public var timeChangeAmount:int;
		public var speech:String;
		public var unit:String;
		public var hasAbilityQueued:Boolean = false ;
		public var queuedAbilTarg:Array;
		//public var pic:String;

		public function Slot(i:int, _c:Combatant){
			id = i;
			c = _c;
			switch(i){
				case 0:
				bar = new Pointer('abilBar');
				barContainer.addChild(bar);
				barContainer.addChild(new SuperImage('abilBlueCover0000', GV.COMBATANT_SPRITESHEET));
				pointer = new Pointer('bluePointer'); 
				pointer.pivotY = 5;
				chargeAbilityFunc = c.chargeAbility1;
				cooldownAbilityFunc = c.cooldownAbility1;
				break;
				case 1:
				bar = new Pointer('abilBar');
				barContainer.addChild(bar);
				barContainer.addChild(new SuperImage('abilRedCover0000', GV.COMBATANT_SPRITESHEET));
				pointer = new Pointer('redPointer');
				pointer.pivotY = 15;
				chargeAbilityFunc = c.chargeAbility2;
				cooldownAbilityFunc = c.cooldownAbility2;
				break;
				case 2:
				bar = new Pointer('abilBar');
				barContainer.addChild(bar);
				barContainer.addChild(new SuperImage('abilGreenCover0000', GV.COMBATANT_SPRITESHEET));
				pointer = new Pointer('greenPointer');
				pointer.pivotY = -5;
				chargeAbilityFunc = c.chargeAbility3;
				cooldownAbilityFunc = c.cooldownAbility3;	
				break;
			}
			bar.visible = true;
			barContainer.visible = false;
			pointer.pivotX = 100; 
			GV.arena.aboveCombatantContainer.addChild(pointer);
			GV.arena.belowCombatantContainer.addChild(barContainer);
		}

		public function setAbility(info:Object):void{

			if(info){

				assigned = true;
				o = info;

				gameName = info.gameName;
				abilityRange = info.abilityRange;
				abilitySelectType = info.abilitySelectType;
				effectRange = info.effectRange;
				effectSelectType = info.effectSelectType;
				effectType = info.effectType;
				effectTargetType = info.effectTargetType;
				selfTargeting = info.selfTargeting ? info.selfTargeting : false;
				deselectCombatants = info.deselectCombatants;
				goesThroughThings = info.goesThroughThings;
				hasConstantTrail = info.hasConstantTrail;
				stock = info.stock;
				ap = info.ap;
				augment = info.augment;
				augmentTrigger = info.augmentTrigger;
				hitFX = info.hitFX;
				tempAbilSeconds = info.tempAbilSeconds;
				tempIdleAnimation = info.tempIdleAnimation;
				unit = info.unit;

				projectileMc = null;
				abilityAnimation = null;
				ability = null;

				if(info.projectileMc) projectileMc = c[info.projectileMc];
				if(info.projectileTrailPool) projectileTrailPool = FX[info.projectileTrailPool];
				if(info.abilityAnimation) abilityAnimation = c[info.abilityAnimation];
				if(info.ability) ability = c[info.ability];
				isForMovement = info.ability === 'movementAbility';
				
				effects = info.effects || {hpChange: 0, apChange: 0, defChange: 0, powChange: 0, timeChange: 0, damageReturnChange: 0};
				chargeTime = info.charge;				
				cooldownTime = info.cooldown;

				if (c.isHero){
					if(GV.arena.heroAbilTargetPics[id]){
						GV.arena.aboveCombatantContainer.removeChild(GV.arena.heroAbilTargetPics[id]);
						GV.arena.heroAbilTargetPics[id] = null;
					}
					GV.arena.heroAbilTargetPics[id] = new SuperImage(info.pic + '0000', GV.COMBATANT_SPRITESHEET, 0, 0, true);
					GV.arena.heroAbilTargetPics[id].alpha = GV.MARKER_ALPHA;
					GV.arena.slotBtns[id].reset();
					GV.arena.slotBtns[id].setPicture(info.pic);		
					if(info.hasOwnProperty("ap")) GV.arena.slotBtns[id].showAp(ap);
					if(info.hasOwnProperty("stock")) GV.arena.slotBtns[id].showStock(stock);
				}
				if(abilityTimer) abilityTimer.refreshChargeTime();
			}else{
				if(c.isHero){
					assigned = false;
					switch(id){
						case 0: GV.arena.blueBtn.reset(); break;
						case 1: GV.arena.redBtn.reset(); break;
						case 2: GV.arena.greenBtn.reset(); break;
					}
				}
			}
		}

		public function timerTick(justUpdate:Boolean = false):void{

			if (!GV.arena || !GV.arena.isActive) return;
			if (!GV.arena.inAction && !GV.arena.paused){	

				var percent:Number;
				var i:Number = justUpdate ? 0 : GV.tick;

				if(charge){

					charge -= i + timeChangeAmount;
					if(charge < 0) charge = 0;
					if(abilityTimer) abilityTimer.setChargeTimer();
					timeChangeAmount = 0;

					percent = (chargeTime - charge)/chargeTime;
					pointer.updateCharge(percent);
					bar.updateCharge(percent);

				}else if(cooldown){

					cooldown -= i + timeChangeAmount;
					if(cooldown < 0) cooldown = 0;
					if(abilityTimer) abilityTimer.setCooldownTimer();
					timeChangeAmount = 0;
					
					percent = (cooldownTime - cooldown)/cooldownTime;
					bar.updateCooldown(percent);

				}else{

					if(abilityTimer) abilityTimer.neutral();
					
				}
			}
		}

		public function nullItAll():void {
			superNull(abilityAnimation); abilityAnimation = null;
			superNull(effects); effects = null;
			superNull(o); o = null;
			superNull(abilityTimer); abilityTimer = null;
			superNull(barContainer); barContainer = null;
			superNull(chargeAbilityFunc); chargeAbilityFunc = null;
			superNull(cooldownAbilityFunc); cooldownAbilityFunc = null;
			superNull(posVector); posVector = null;
			superNull(c); c = null;
			superNull(queuedAbilTarg); queuedAbilTarg = null;
		}
	}
}