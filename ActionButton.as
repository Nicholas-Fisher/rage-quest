package classes {

	import starling.display.Sprite
	import starling.display.Button;
	import starling.events.Event;	

	public class ActionButton extends Sprite {

		public var btn:Button;
		public var pic:SuperImage;
		public var clickFunc:Function;
		public var stockBox:SuperImage = new SuperImage('stockBox0000', GV.HUD_SPRITESHEET, 66, -7); //76 -7
		public var apBox:SuperImage = new SuperImage('apBox0000', GV.HUD_SPRITESHEET, -2, -1); //-2 -1 due to stroke length on border
		public var lockedPic:SuperImage = new SuperImage('notActiveLargeIcon0000', GV.HUD_SPRITESHEET, 0, 0, true);
		public var stockText:SuperText;
		public var apText:SuperText;
		public var isForTutorial:Boolean = false;
		public const CENTER_X:int = 50;
		public const CENTER_Y:int = 50;
		private var btnGlow = new SuperMovieClip('buttonGlow', GV.HUD_SPRITESHEET, 0, 0, true);		

		public function ActionButton(_clickFunc:Function, picName:String = null, small:Boolean = false){

			clickFunc = _clickFunc;
			pic = new SuperImage(picName + '0000', GV.HUD_SPRITESHEET, 0, 0, true);
			addEventListener(Event.TRIGGERED, onClick);
			addEventListener(Event.ADDED_TO_STAGE, init);
			if(small){
				btn = new Button(Assets.getAtlasTexture(GV.HUD_SPRITESHEET, 'actionButtonSmall0000'), '', Assets.getAtlasTexture(GV.HUD_SPRITESHEET, 'actionButton0001'));
			}else{
				btn = new Button(Assets.getAtlasTexture(GV.HUD_SPRITESHEET, 'actionButton0000'), '', Assets.getAtlasTexture(GV.HUD_SPRITESHEET, 'actionButtonSmall0001'));
			}
		}
		
		public function init(){
			
			addChild(btnGlow);
			addChild(btn);
			addChild(lockedPic);
			addChild(pic);
			addChild(stockBox);
			addChild(apBox);

			btn.x = CENTER_X;
			btn.y = CENTER_Y;
			btn.pivotX = btn.width/2;
			btn.pivotY = btn.height/2; 

			pic.x = CENTER_X;
			pic.y = CENTER_Y;
			pic.touchable = false;
			
			stockBox.touchable = false;

			stockText = new SuperText(35, 35, '-1', GV.FONT_1, GV.HUD_FONT_SIZE, 0xffffff, 'center', 'never_flat');			
			stockText.touchable = false;
			
			apBox.touchable = false;
			
			apText = new SuperText(35, 35, '-1', GV.FONT_1, GV.HUD_FONT_SIZE, 0xffffff, 'center', 'never_flat');			
			apText.touchable = false;

			lockedPic.x = CENTER_X;
			lockedPic.y = CENTER_Y;
			lockedPic.touchable = false;
			hideLock();

			btnGlow.x = CENTER_X;
			btnGlow.y = CENTER_Y;
			btnGlow.visible = false;

			pivotX = width/2;
			pivotY = height/2;

			addChild(apText);
			addChild(stockText);
			stockText.x = 65;

			hideStock();
			hideAp();

			touchable = true;

			hideAp();
			hideStock();
		}

		public function reset():void{
			show();
			hideStock();
			hideAp();
			btnGlow.visible = false;
			scaleX = 1;
			scaleY = 1;
			visible = true;		
			setPicture();
		}

		private function onClick(e:Event):void{
			FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			clickFunc();
		}

		public function setPicture(picName:String = null):void{
			if (pic){
				removeChild(pic);
				pic = null;
			} 		
			if(!picName) picName = "notActiveIcon";
			pic = new SuperImage(picName + '0000', GV.HUD_SPRITESHEET, 0, 0, true);
			addChild(pic);
			pic.x = 50;
			pic.y = 50;
			pic.touchable = false;
		}

		public function highlightBtn():void{
			scaleX = 1;
			scaleY = 1;
			GV.arena.actionButtonHighlight.visible = true;
			GV.arena.actionButtonHighlight.x = x - 8;
			GV.arena.actionButtonHighlight.y = y - 95;
			GV.s.juggler.removeTweens(GV.arena.actionButtonHighlight);
			GV.s.juggler.tween(GV.arena.actionButtonHighlight, 0.35, {
				transition: "SINE",
				reverse: true,
				repeatCount: 0,
				y: GV.arena.actionButtonHighlight.y - 10			
			});
			GV.s.juggler.removeTweens(this);
			GV.s.juggler.tween(this, 0.35, {
				transition: "SINE",
				reverse: true,
				repeatCount: 0,
				scaleX: 1.075,
				scaleY: 1.075
			});			
			enable();
		}

		public function disable():void{
			touchable = false;			
			isForTutorial = false;
		}

		public function enable():void{
			touchable = true;			
			isForTutorial = true;		
		}

		public function showLock():void{ lockedPic.visible = true;}

		public function hideLock():void{ lockedPic.visible = false;}

		public function showStock(stock:int = -1):void{
			if(stock !== -1) stockText.text = stock.toString();
			if(!stockText || stockText.text === '-1') return;
			stockText.visible = true;
			stockBox.visible = true;
		}

		public function hideStock():void{
			stockText.visible = false;
			stockBox.visible = false;
		}

		public function showAp(ap:int = -1):void{	
			if(ap !== -1) apText.text = ap.toString();
			if(!apText || apText.text === '-1') return;
			apText.visible = true;
			apBox.visible = true;
		}

		public function hideAp():void{
			apText.visible = false;
			apBox.visible = false;
		}

		public function remove():void{
			removeChild(btn)
			removeChild(lockedPic);
			removeChild(pic);
			removeChild(stockBox);
			removeChild(apBox);
			removeChild(btnGlow);
			GV.arena.neverFlatTextContainer.removeChild(stockText);
			GV.arena.neverFlatTextContainer.removeChild(apText);
		}

		public function hide():void{
			visible = false;
			hideAp();
			hideStock();
		}

		public function show():void{
			visible = true;
			showAp();
			showStock();
		}

		public function glow(i:int){
			btnGlow.visible = true;
			btnGlow.currentFrame = i;
		}
		public function hideGlow(){
			btnGlow.visible = false;
		}
		public function centerX():int{
			return x + 50;
		}
		public function centerY():int{
			return y + 50;
		}
	}
}