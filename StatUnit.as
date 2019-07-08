package classes {

	import starling.display.Sprite;

	public class StatUnit extends Sprite {

		include 'nonClasses/Utility.as';

		public var id:int;
		public var hpBar:HudBar;
		public var apBar:HudBar;
		public var square:SuperImage;
		public var statBack:SuperImage;
		public var hpBack:SuperImage;
		public var swordIcon:SuperImage;
		public var shieldIcon:SuperImage;
		public var lvlText:SuperText;
		public var hpText:SuperText;
        public var apText:SuperText;
		public var powText:SuperText;
		public var defText:SuperText;
		public var abilTextBacks:Vector.<SuperImage> = new Vector.<SuperImage>();
		public var abilText:Vector.<SuperText> = new Vector.<SuperText>();
		public var abilityTimers:Vector.<AbilityTimer> = new Vector.<AbilityTimer>();
		public var isFree:Boolean = true;
		private var isForHero:Boolean = false;
		private const HUD_BACK_ALPHA:Number = 0.65;
		private const LEVEL_FONT_SIZE:int = 22;
		private const ABIL_NAME_FONT_SIZE:int = 22;

		public function StatUnit(i:int, _isForHero:Boolean = false){
	
			isForHero = _isForHero;
			id = i;

			if(isForHero){

				hpBar = new HudBar('greenMeter');
				apBar = new HudBar('blueMeter');
				abilityTimers[0] = new AbilityTimer('blue');
				abilityTimers[1] = new AbilityTimer('red');
				abilityTimers[2] = new AbilityTimer('green');

				swordIcon = new SuperImage('powSymbol0000', GV.HUD_SPRITESHEET)
				shieldIcon = new SuperImage('defSymbol0000', GV.HUD_SPRITESHEET);

				powText = new SuperText(70, 30, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0x666666, 'left');
				defText = new SuperText(70, 30, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0x666666, 'left');
				hpText = new SuperText(200, 25, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0x666666, 'center');
				apText = new SuperText(200, 25, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0x666666, 'center');

				hpBar.x = 10;
				hpBar.y = 25;
				hpText.x = 10;
				hpText.y = 0;
				apBar.x = 10;
				apBar.y = 65;
				apText.x = 10;
				apText.y = 40;

				powText.y = defText.y = 80;
				powText.x = 40;
				defText.x = 135;

				abilityTimers[0].x = GV.arena.redBtn.x + 50 - GV.BTN_RADIUS;
				abilityTimers[1].x = GV.arena.redBtn.x + 50 - GV.BTN_RADIUS;
				abilityTimers[2].x = GV.arena.redBtn.x + 50 - GV.BTN_RADIUS;
				abilityTimers[0].y = GV.arena.blueBtn.y + 97 - GV.BTN_RADIUS;
				abilityTimers[1].y = GV.arena.redBtn.y + 97 - GV.BTN_RADIUS;
				abilityTimers[2].y = GV.arena.greenBtn.y + 97 - GV.BTN_RADIUS;
				
				swordIcon.x = 10
				shieldIcon.x = 110;
				swordIcon.y = shieldIcon.y = 85;


			}else{
				
				var bgX:int = 1120 - i*170;

				statBack = new SuperImage('opaqueBack0000', GV.HUD_SPRITESHEET, bgX, 40);
				hpBack = new SuperImage('opaqueBack0000', GV.HUD_SPRITESHEET, bgX, 0);
				swordIcon = new SuperImage('powSymbol0000', GV.HUD_SPRITESHEET)
				shieldIcon = new SuperImage('defSymbol0000', GV.HUD_SPRITESHEET);
				square = new SuperImage('colorBoxes000' + i,  GV.HUD_SPRITESHEET);
				abilityTimers[0] = new AbilityTimer('blue');
				abilityTimers[1] = new AbilityTimer('red');
				abilityTimers[2] = new AbilityTimer('green');
				abilTextBacks[0] = new SuperImage('abilityNameBackBlue0000', GV.HUD_SPRITESHEET, bgX, 38 + 5);
				abilTextBacks[1] = new SuperImage('abilityNameBackRed0000', GV.HUD_SPRITESHEET, bgX, 58 + 5);
				abilTextBacks[2] = new SuperImage('abilityNameBackGreen0000', GV.HUD_SPRITESHEET, bgX, 78 + 5);
				hpBar = new HudBar('greenMeter');

				// super text added last to layer on top of rest				
				powText = new SuperText(45, 30, '', GV.FONT_1, GV.HUD_FONT_SIZE - 2, 0x666666, 'left');
				defText = new SuperText(45, 30, '', GV.FONT_1, GV.HUD_FONT_SIZE - 2, 0x666666, 'left');


				if(GVP.options.condensedHUD){
					abilText[0] = new SuperText(150, 30, '', GV.FONT_2, (ABIL_NAME_FONT_SIZE - 6), 0xffffff, 'left');
					abilText[1] = new SuperText(150, 30, '', GV.FONT_2, (ABIL_NAME_FONT_SIZE - 6), 0xffffff, 'left');
					abilText[2] = new SuperText(150, 30, '', GV.FONT_2, (ABIL_NAME_FONT_SIZE - 6), 0xffffff, 'left');
				}else{
					abilText[0] = new SuperText(150, 30, '', GV.FONT_2, ABIL_NAME_FONT_SIZE, 0xffffff, 'center');
					abilText[1] = new SuperText(150, 30, '', GV.FONT_2, ABIL_NAME_FONT_SIZE, 0xffffff, 'center');
					abilText[2] = new SuperText(150, 30, '', GV.FONT_2, ABIL_NAME_FONT_SIZE, 0xffffff, 'center');
				}

				hpText =  new SuperText(125, 25, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0x666666);
				lvlText = new SuperText(25, 22, '', GV.FONT_2, 18, 0xffffff, 'center'); // optimize?

				lvlText.x = square.x = bgX + 125;
				lvlText.y = square.y = 2;

				statBack.alpha = HUD_BACK_ALPHA;
				statBack.visible = false;

				hpBack.alpha = HUD_BACK_ALPHA;
				
				swordIcon.x = bgX;
				shieldIcon.x = bgX + 80;

				hpBar.x = bgX;
				hpBar.y = 27;
				hpBar.scaleX = 0.75;

				hpText.x = bgX;
				hpText.y = 0;

				powText.x = bgX + 30
				defText.x = bgX + 100;

				abilTextBacks[0].alpha = HUD_BACK_ALPHA;
				abilTextBacks[1].alpha = HUD_BACK_ALPHA;
				abilTextBacks[2].alpha = HUD_BACK_ALPHA;

				powText.y = defText.y = 40;
				swordIcon.y = shieldIcon.y = 45;


				if(GVP.options.condensedHUD){
									
					hpBar.scaleY = 0.8;

					if(!isForHero){
						abilityTimers[0].scaleX = abilityTimers[0].scaleY = 0.75;
						abilityTimers[1].scaleX = abilityTimers[1].scaleY = 0.75;
						abilityTimers[2].scaleX = abilityTimers[2].scaleY = 0.75;						
						abilityTimers[0].isForhero = false;
						abilityTimers[1].isForhero = false;
						abilityTimers[2].isForhero = false;
					}

					var ttt:int = 30;

					abilityTimers[0].y = ttt + 52;
					abilityTimers[1].y = ttt + 52 + 30;
					abilityTimers[2].y = ttt + 52 + 60;
					abilityTimers[0].x = bgX + 17;
					abilityTimers[1].x = bgX + 17;
					abilityTimers[2].x = bgX + 17;

					abilText[0].x = bgX + 40;
					abilText[1].x = bgX + 40;
					abilText[2].x = bgX + 40;
					abilText[0].y = ttt + 42;
					abilText[1].y = ttt + 42 + 30;
					abilText[2].y = ttt + 42 + 60;

					abilTextBacks[0].x = bgX + 38;
					abilTextBacks[1].x = bgX + 38;
					abilTextBacks[2].x = bgX + 38;
					abilTextBacks[0].y = ttt + 42 ;
					abilTextBacks[1].y = ttt + 42 + 30;
					abilTextBacks[2].y = ttt + 42 + 60;

					abilTextBacks[0].scaleX = 0.75;
					abilTextBacks[1].scaleX = 0.75;
					abilTextBacks[2].scaleX = 0.75;
					abilTextBacks[0].scaleY = 1.35;
					abilTextBacks[1].scaleY = 1.35;
					abilTextBacks[2].scaleY = 1.35;

					//abilText[0].visible = true;
					//abilText[1].visible = true;
					//abilText[2].visible = true;	
					//abilTextBacks[0].visible = true;
					//abilTextBacks[1].visible = true;
					//abilTextBacks[2].visible = true;
					//swordIcon.visible = true;
					//shieldIcon.visible = true;
					//powText.visible = true;
					//defText.visible = true;
					//statBack.visible = true;

				}else{

					abilityTimers[0].y = 65;
					abilityTimers[1].y = 65;
					abilityTimers[2].y = 65;
					abilityTimers[0].x = bgX + 25;
					abilityTimers[1].x = bgX + 75;
					abilityTimers[2].x = bgX + 125;
					
					abilText[0].x = bgX;
					abilText[1].x = bgX;
					abilText[2].x = bgX;
					abilText[0].y = 38;
					abilText[1].y = 58;
					abilText[2].y = 78;

					abilText[0].visible = false;
					abilText[1].visible = false;
					abilText[2].visible = false;		
					abilTextBacks[0].visible = false;
					abilTextBacks[1].visible = false;
					abilTextBacks[2].visible = false;
					swordIcon.visible = false;
					shieldIcon.visible = false;
					powText.visible = false;
					defText.visible = false;
				}

			}
			makeInvisible();
		}

		public function preDispose():void{

			GV.arena.buttonContainer.removeChild(abilityTimers[0]);
			GV.arena.buttonContainer.removeChild(abilityTimers[1]);
			GV.arena.buttonContainer.removeChild(abilityTimers[2]);
			
			GV.arena.alwaysFlattenedContainer.removeChild(square);
			GV.arena.alwaysFlattenedContainer.removeChild(statBack);
			GV.arena.alwaysFlattenedContainer.removeChild(hpBack);
			GV.arena.alwaysFlattenedContainer.removeChild(swordIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(shieldIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[0]);
			GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[1]);
			GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[2]);	
			GV.arena.alwaysFlattenedContainer.removeChild(hpBar);
			GV.arena.alwaysFlattenedContainer.removeChild(apBar);

			GV.arena.alwaysFlatTextContainer.removeChild(abilText[0]);
			GV.arena.alwaysFlatTextContainer.removeChild(abilText[1]);
			GV.arena.alwaysFlatTextContainer.removeChild(abilText[2]);	
			GV.arena.alwaysFlatTextContainer.removeChild(hpText);
			GV.arena.alwaysFlatTextContainer.removeChild(apText);
			GV.arena.alwaysFlatTextContainer.removeChild(powText);
			GV.arena.alwaysFlatTextContainer.removeChild(defText);
			GV.arena.alwaysFlatTextContainer.removeChild(lvlText);
		}

		public function showAbilTimers(c:Combatant):void{

			for(var i:int = 0; i < GV.SLOT_NUM; i++){
				if(c.slots[i].assigned){
					abilityTimers[i].visible = true;
					abilityTimers[i].showTimer();
				} else{
					abilityTimers[i].visible = false;
					abilityTimers[i].makeInvisible();
				}
			}

			powText.visible = false;
			defText.visible = false;
			swordIcon.visible = false;
			shieldIcon.visible = false;
			statBack.visible = false;
		}

		public function showAbilNames(c:Combatant):void{

			for(var i:int = 0; i < GV.SLOT_NUM; i++){
				if(c.slots[i].assigned){
					abilText[i].visible = true;
					abilTextBacks[i].visible = true;
					abilityTimers[i].visible = false;	
				} else {
					abilText[i].visible = false;
					abilTextBacks[i].visible = false;
					abilityTimers[i].visible = false;	
				}
			}
		}

		public function showStats(c:Combatant):void{
			
			powText.visible = true;
			defText.visible = true;
			swordIcon.visible = true;
			shieldIcon.visible = true;
			statBack.visible = true;

			for(var i:int = 0; i < GV.SLOT_NUM; i++){			
				abilText[i].visible = false;
				abilTextBacks[i].visible = false;
			}
		}

		// this has to be done after the slot creations since the stat unit doesn't and cannot exist then
		public function setup(c:Combatant):void{
			isFree = false;
			makeVisible();
			hpText.text = c.hp + ' / ' + c.maxHp
			hpBar.percentCompleted(c.hp/c.maxHp);
			powText.text = c.pow.toString()
			defText.text = c.def.toString()
			if(!c.isHero){
				if(c.isSummon){
					lvlText.text = 'S';
				}else{
					lvlText.text = c.lvl.toString();
				}
				abilText[0].text = c.slots[0].gameName;
				abilText[1].text = c.slots[1].gameName;
				abilText[2].text = c.slots[2].gameName;
				if(!GVP.options.condensedHUD){				
					switch(GV.arena.toggleInt){
						case 1: showAbilTimers(c); break;
						case 2: showAbilNames(c); break;
						case 3: showStats(c); break;
					}
				}
			}else{
				apText.text = c.ap + ' / ' + c.maxAp			
			}

			for (var i:int = 0, ilen:int = GV.SLOT_NUM; i < ilen; i++){
				if(c.slots[i].assigned){
					c.slots[i].abilityTimer = abilityTimers[i];
					abilityTimers[i].slot = c.slots[i];
					abilityTimers[i].neutral(true);
				} else {
					abilTextBacks[i].visible = false;	
				}
			}

		}

		public function makeFree():void{
			isFree = true;
			makeInvisible();
		}

		public function makeVisible():void{

			if(isForHero){
				GV.arena.alwaysFlattenedContainer.addChild(apBar);
				GV.arena.alwaysFlatTextContainer.addChild(apText);
			}else{
				GV.arena.alwaysFlattenedContainer.addChild(abilTextBacks[0]);
				GV.arena.alwaysFlattenedContainer.addChild(abilTextBacks[1]);
				GV.arena.alwaysFlattenedContainer.addChild(abilTextBacks[2]);	
				GV.arena.alwaysFlattenedContainer.addChild(statBack);
				GV.arena.alwaysFlattenedContainer.addChild(hpBack);
				GV.arena.alwaysFlatTextContainer.addChild(abilText[0]);
				GV.arena.alwaysFlatTextContainer.addChild(abilText[1]);
				GV.arena.alwaysFlatTextContainer.addChild(abilText[2]);	
				GV.arena.alwaysFlattenedContainer.addChild(square);
				GV.arena.alwaysFlatTextContainer.addChild(lvlText);
			}
			GV.arena.buttonContainer.addChild(abilityTimers[0]);
			GV.arena.buttonContainer.addChild(abilityTimers[1]);
			GV.arena.buttonContainer.addChild(abilityTimers[2]);
			GV.arena.alwaysFlattenedContainer.addChild(swordIcon);
			GV.arena.alwaysFlattenedContainer.addChild(shieldIcon);
			GV.arena.alwaysFlattenedContainer.addChild(hpBar);
			GV.arena.alwaysFlatTextContainer.addChild(hpText);
			GV.arena.alwaysFlatTextContainer.addChild(powText);
			GV.arena.alwaysFlatTextContainer.addChild(defText);
		}

		public function makeInvisible():void{
			
			if(isForHero){
				GV.arena.alwaysFlattenedContainer.removeChild(apBar);
				GV.arena.alwaysFlatTextContainer.removeChild(apText);
			}else{
				if (!GV.arena.isSafe){				
					GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[0]);
					GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[1]);
					GV.arena.alwaysFlattenedContainer.removeChild(abilTextBacks[2]);	
					GV.arena.alwaysFlattenedContainer.removeChild(statBack);
					GV.arena.alwaysFlattenedContainer.removeChild(hpBack);
					GV.arena.alwaysFlatTextContainer.removeChild(abilText[0]);
					GV.arena.alwaysFlatTextContainer.removeChild(abilText[1]);
					GV.arena.alwaysFlatTextContainer.removeChild(abilText[2]);	
					GV.arena.alwaysFlattenedContainer.removeChild(square);
					GV.arena.alwaysFlatTextContainer.removeChild(lvlText);
				}
			}
			GV.arena.buttonContainer.removeChild(abilityTimers[0]);
			GV.arena.buttonContainer.removeChild(abilityTimers[1]);
			GV.arena.buttonContainer.removeChild(abilityTimers[2]);
			GV.arena.alwaysFlattenedContainer.removeChild(swordIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(shieldIcon);
			GV.arena.alwaysFlattenedContainer.removeChild(hpBar);
			GV.arena.alwaysFlatTextContainer.removeChild(hpText);
			GV.arena.alwaysFlatTextContainer.removeChild(powText);
			GV.arena.alwaysFlatTextContainer.removeChild(defText);
		}

		public function nullItAll():void {
			superNull(hpBar); hpBar = null;
			superNull(apBar); apBar = null;
			superNull(square); square = null;
			superNull(statBack); statBack = null;
			superNull(hpBack); hpBack = null;
			superNull(swordIcon); swordIcon = null;
			superNull(shieldIcon); shieldIcon = null;
			superNull(lvlText); lvlText = null;
			superNull(hpText); hpText = null;
        	superNull(apText); apText = null;
			superNull(powText); powText = null;
			superNull(defText); defText = null;
			superNull(abilTextBacks); abilTextBacks = null;
			superNull(abilText); abilText = null;
			superNull(abilityTimers); abilityTimers = null;
		}
	}
}