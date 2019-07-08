public function initOptions():void{

	var sliders:Vector.<Slider> = new Vector.<Slider>();
	sliders[0] = ops.volSFXSlider;
	sliders[1] = ops.volBGMSlider;
	sliders[2] = ops.aaSlider;
	sliders[3] = ops.resSlider;

	for(var i:int = 0; i < sliders.length; i++){	
		var mysliderthumb = Sprite(sliders[i].getChildAt(1));
		mysliderthumb.height = 45;
		mysliderthumb.width = 45;
		var myslidertrack = Sprite(sliders[i].getChildAt(0));
		myslidertrack.height = 30;
	}

	ops.menuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showMenu();
	});

	ops.startGameBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showNarrative('intro');
	});

	ops.fullscreenCb.addEventListener(MouseEvent.CLICK, onFullscreenChange);
	ops.condensedHUDCb.addEventListener(MouseEvent.CLICK, onCondensedHUDChange);
	ops.showPointersCb.addEventListener(MouseEvent.CLICK, onShowPointersChange);
	ops.volSFXSlider.addEventListener(SliderEvent.CHANGE, onVolSFXSliderChange);
	ops.volBGMSlider.addEventListener(SliderEvent.CHANGE, onVolBGMSliderChange);
	ops.aaSlider.addEventListener(SliderEvent.CHANGE, onAASliderChange);
	ops.resSlider.addEventListener(SliderEvent.CHANGE, onResSliderChange);
	ops.backBtn.visible = false;

	if(GV.DESKTOP_MODE) ops.mobileBlockerMc.visible = false;
}

private function showOptions(forIntro:Boolean = false):void{
	ops.resText.text = GVP.options.resolution[0] + ' x ' + GVP.options.resolution[1];
	ops.resSlider.value = (GVP.options.resolution[0]/640 - 1)/0.5;	
	ops.aaSlider.value = GVP.options.antiAliasing ? Math.round(GVP.options.antiAliasing/4) : 0;
	ops.volSFXSlider.value = GVP.options.volumeSFX*10;
	ops.volBGMSlider.value = GVP.options.volumeBGM*10;
	ops.fullscreenCb.gotoAndStop(GVP.options.fullscreen + 1);
	ops.condensedHUDCb.gotoAndStop(GVP.options.condensedHUD + 1);
	ops.showPointersCb.gotoAndStop(GVP.options.showPointers + 1);
	showNew(ops);
	ops.menuBtn.visible = true;
	ops.startGameBtn.visible = false;
	if(forIntro){
		ops.menuBtn.visible = false;
		ops.startGameBtn.visible = true;
	}
}

private	function onVolSFXSliderChange(e:SliderEvent):void {
	var val:Number = e.target.value;
	if(val) val = val/10;
	GVP.options.volumeSFX = val;
	GV.sfx.volume = val;	
}

private	function onVolBGMSliderChange(e:SliderEvent):void {
	var val:Number = e.target.value;
	if(val) val = val/10;
	GVP.options.volumeBGM = val;
	GV.bgm.volume = val;
	FX.stopMusic();
	FX.playMusic(FX.topMusic);
}

private	function onAASliderChange(e:SliderEvent):void {
	var val:Number = e.target.value*4;
	GVP.options.antiAliasing = val;
	GV.s.antiAliasing = val;	
}

private	function onResSliderChange(e:SliderEvent):void {
	var m:Number = e.target.value*0.5 + 1;
	var w:int = 640*m;
	var h:int = 360*m;
	if (w < GV.stage.stage.fullScreenWidth && h < GV.stage.stage.fullScreenHeight){
		GVP.setWindowSize(w, h);
		GVP.options.resolution = [w,h];
		ops.resText.text = w + ' x ' + h;
		ops.fullscreenCb.gotoAndStop(1);
		GVP.options.fullscreen = 0;
	} else {
		ops.resText.text = 'Selection exceeds screen size';
	}	
}

private	function onFullscreenChange(e:MouseEvent):void {
	var isOn:Boolean = (e.target.currentFrame == 2);
	if(isOn){
		e.target.gotoAndStop(1);
		GVP.options.fullscreen = 0;
	}else{
		e.target.gotoAndStop(2);
		ops.resText.text = 'Fullscreen';
		GVP.options.fullscreen = 1;
	}
	GVP.correctWindowSize();
}

private	function onCondensedHUDChange(e:MouseEvent):void {
	var isOn:Boolean = (e.target.currentFrame == 2);
	if(isOn){
		e.target.gotoAndStop(1);
		GVP.options.condensedHUD = 0;
	}else{
		e.target.gotoAndStop(2);
		GVP.options.condensedHUD = 1;
	}
}

private	function onShowPointersChange(e:MouseEvent):void {
	var isOn:Boolean = (e.target.currentFrame == 2);
	if(isOn){
		e.target.gotoAndStop(1);
		GVP.options.showPointers = 0;
	}else{
		e.target.gotoAndStop(2);
		GVP.options.showPointers = 1;
	}
}
