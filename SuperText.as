package classes {

	import starling.text.TextField;
	import starling.utils.HAlign;

	public class SuperText extends TextField {

		private var back:SuperImage = new SuperImage('statusMsgBackground0000', GV.HUD_SPRITESHEET, 0, 0, false);

		public function SuperText(_width:int, _height:int, _text:String, _fontName:String = 'Verdana', _fontSize:Number = 12, _color:uint = 0x0, _align:String = 'center', _container:String = null){
			super(_width, _height, _text, _fontName, _fontSize, _color);
			autoScale = false;
			batchable = true;
			switch(_align){
				case 'left': hAlign = starling.utils.HAlign.LEFT; break;
				case 'center': hAlign = starling.utils.HAlign.CENTER; break;
				case 'right': hAlign = starling.utils.HAlign.RIGHT; break;
			}

			switch(_container){
				case 'always_flat':GV.arena.alwaysFlatTextContainer.addChild(this); break;
				case 'never_flat':GV.arena.neverFlatTextContainer.addChild(this); break;
				case 'speech_bubble':GV.arena.speechBubbleContainer.addChild(this); break;
				case 'background':GV.arena.backgroundContainer.addChild(this); break;
			}
		}

		public function addBackground():void{
			if(!contains(back)) addChild(back);			
		}
	}
}