package classes {

	import starling.display.Sprite;
	import starling.events.Event;
    import starling.animation.Tween;
    import starling.animation.Transitions;

	public class AbilityTimer extends Sprite{
		
		include 'nonClasses/Utility.as';

		public var backColor:SuperMovieClip;
		public var slot:Slot;
		public var isForhero:Boolean = true;
		private var onCharge:Boolean;
		private var onCooldown:Boolean;
		public var abilityTimerText:SuperText = new SuperText(50, 30, '', GV.FONT_1, GV.HUD_FONT_SIZE, 0xFFFFFF, 'center', 'never_flat');
		private var progressAnimation:SuperMovieClip = new SuperMovieClip('animatedAbilTimer', GV.HUD_SPRITESHEET, 0, 0, true);
		public var stateChangeAnimation:SuperMovieClip;
		private var color:int;

		public function AbilityTimer(_color:String){
			
			switch(_color){
				case 'blue':
					backColor = new SuperMovieClip('abilityTimerBackBlue', GV.HUD_SPRITESHEET, 0, 0, true); 
					stateChangeAnimation = new SuperMovieClip('abilTimerPingBlue', GV.HUD_SPRITESHEET, 0, 0, true);
					color = 0; 
				break;
				case 'red':
					backColor = new SuperMovieClip('abilityTimerBackRed', GV.HUD_SPRITESHEET, 0, 0, true); 
					stateChangeAnimation = new SuperMovieClip('abilTimerPingRed', GV.HUD_SPRITESHEET, 0, 0, true);
					color = 1; 
				break;
				case 'green':
					backColor = new SuperMovieClip('abilityTimerBackGreen', GV.HUD_SPRITESHEET, 0, 0, true); 
					stateChangeAnimation = new SuperMovieClip('abilTimerPingGreen', GV.HUD_SPRITESHEET, 0, 0, true);
					color = 2; 
				break;
				case 'grey':
					backColor = new SuperMovieClip('abilityTimerBackGrey', GV.HUD_SPRITESHEET, 0, 0, true); 
					stateChangeAnimation = new SuperMovieClip('abilTimerPingGrey', GV.HUD_SPRITESHEET, 0, 0, true);
					color = 3; 
				break;
			}

			touchable = false;
			
			addChild(backColor);
			addChild(progressAnimation);
			addChild(stateChangeAnimation);

			backColor.stop();
			progressAnimation.stop();
			stateChangeAnimation.stop();
			stateChangeAnimation.loop = false;
			stateChangeAnimation.visible = false;

			GV.s.juggler.add(progressAnimation);
			GV.s.juggler.add(stateChangeAnimation);
			
			GV.arena.buttonContainer.addChild(this);

			addChild(abilityTimerText);
			abilityTimerText.pivotX = abilityTimerText.width/2;
			abilityTimerText.pivotY = abilityTimerText.height/2;
			abilityTimerText.y += 4;

			stateChangeAnimation.addEventListener(Event.COMPLETE, function():void{
				stateChangeAnimation.visible = false;
				stateChangeAnimation.stop();
			});
		}

		public function animate():void{
			if(!(onCharge || onCooldown)) return;
			progressAnimation.visible = true;
			if(!GV.arena.paused) progressAnimation.play();
			
			GV.s.juggler.tween(this, 0.25, {
			   	transition: Transitions.EASE_OUT,
			   	reverse: true,
			   	repeatCount: 2,
			   	scaleX: 1.25,
			   	scaleY: 1.25,
			   	onComplete: function():void{
			   		if(GVP.options.condensedHUD && !isForhero){
			   			scaleX = scaleY = 0.75;
			   		}else{
			   			scaleX = scaleY = 1;
			   		}
			   		
			   	}
			});
							
		}

		public function stopAnimating():void{
			progressAnimation.visible = false;
			progressAnimation.stop();
		}

		public function playStateChangeAnimation():void{
			stateChangeAnimation.visible = true;
			stateChangeAnimation.play();
		}
		
		public function charge():void{			
			playStateChangeAnimation();
			backColor.currentFrame = 0;
			stateChangeAnimation.rotation = progressAnimation.rotation = backColor.rotation = 0;
			stateChangeAnimation.y = progressAnimation.y = backColor.y = 0;
			onCooldown = false;
			onCharge = true;
			if(slot) {
				var v:int = slot.chargeTime - slot.timeChangeAmount;
				if(v < 0) v = 0;
				abilityTimerText.text = v.toString();			
			}
			animate();
		}

		public function cooldown():void{			
			playStateChangeAnimation();
			backColor.currentFrame = 0;
			stateChangeAnimation.rotation = progressAnimation.rotation = backColor.rotation = Math.PI;
			stateChangeAnimation.y = progressAnimation.y = backColor.y = 8.9;
			onCooldown = true;
			onCharge = false;
			if(slot) {
				var v:int = slot.cooldownTime - slot.timeChangeAmount;
				if(v < 0) v = 0;
				abilityTimerText.text = v.toString();
			}
			animate();
		}

		public function refreshChargeTime():void{
			if(slot && slot.startable && !slot.isCharging){
				neutral();
			}
		}

		public function neutral(noAnim:Boolean = false):void{			
			if(slot && slot.isCharging) return;
			backColor.currentFrame = 1;
			backColor.rotation = 0;
			backColor.y = 0;
			onCooldown = false;
			onCharge = false;
			if(slot) {
				var v:int = slot.chargeTime - slot.timeChangeAmount;
				if(v < 0) v = 0;
				abilityTimerText.text = v.toString();
			}
			stopAnimating();
		}

		public function setChargeTimer():void{
			abilityTimerText.text = Math.ceil(slot.charge).toString();
		}

		public function setCooldownTimer():void{
			abilityTimerText.text = Math.ceil(slot.cooldown).toString();
		}

		public function onPause():void{
			progressAnimation.pause();
			if(onCharge && slot.charge < 10) abilityTimerText.text = (Math.ceil(slot.charge*10)/10).toString();
			else if(onCooldown && slot.cooldown < 10) abilityTimerText.text = (Math.ceil(slot.cooldown*10)/10).toString();
		}

		public function onUnPause():void{
			progressAnimation.play();
		}

		public function showTimer():void{
			abilityTimerText.visible = true;					
		}

		public function makeInvisible():void{
			abilityTimerText.visible = backColor.visible = false;
		}

		public function makeVisible():void{
			abilityTimerText.visible = backColor.visible = true;
		}

		public function nullItAll():void {
			superNull(backColor); backColor = null;
			superNull(slot); slot = null;
			superNull(abilityTimerText); abilityTimerText = null;
			superNull(progressAnimation); progressAnimation = null;
			superNull(stateChangeAnimation); stateChangeAnimation = null;
		}
	}
}