package classes {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	
	public class Trailer extends MovieClip {
		
		public var executionPipeline:Array;
		public var currQuote:MovieClip;
		public var partsStarted:Array = new Array();
		// public var bigText1:String = "WHERE AM I?"
		public var wordInterval:int;
		public var currWordCount:int = 0;
		public var currWordArray:Array = new Array();
		public const NUMBER_OF_PARTS:int = 20;
		public const FADE_RATE:Number = 0.01;
		public const FADE_RATE_FAST:Number = 0.05;
		public const SPEECH_TIME:int = 500;
		public const PART_BUFFER:int = 2000;
		public function Trailer() {
			for(var i:int = 0; i < NUMBER_OF_PARTS; i++){
				partsStarted[i] = false;
			}
			invis(q1);
			invis(q2);
			invis(TC)
			invis(availableNow)
			reset();			
			//setTimeout(part11, PART_BUFFER); // part2
			setTimeout(part13, 0);
			addEventListener(Event.ENTER_FRAME, onFrame, false, 0, true);
		}

		private function onFrame(e:flash.events.Event):void{
			trace(getTimer()/1000);			
		}

		public function reset():void {
			bigText.text = "";
			smallText.text = "";		
			chopText.text = "";
		}

		public function part0():void {
			partsStarted[0] = true;
			currQuote = q1;
			genericFadeInCurrQuote();
		}

		public function part1():void {
			partsStarted[1] = true;
			currQuote = q2;
			genericFadeInCurrQuote();
		}

		public function part2():void {
			partsStarted[2] = true;
			// currWordArray = bigText1.split(" ");
			// currWordCount = 0;
			// wordInterval = setInterval(showNewWord, 400);
			setTimeout(function(){
				bigText.text = "Where am I?";
				genericFadeInBigText();
			}, SPEECH_TIME);			
			setTimeout(part4, PART_BUFFER);
		}

		// public function part3(){
		// 	partsStarted[3] = true;
		// 	blackBackground.visible = false;
		// 	bigText.text = "";
		// 	// justZye.visible = true;
		// 	setTimeout(part4, 2500);
		// }

		public function part4():void{
			partsStarted[4] = true;			
			setTimeout(function(){
				smallText.text = "You're in the internet.";
				genericFadeInsmallText();
			}, SPEECH_TIME);
			setTimeout(part6, PART_BUFFER);
		}

		// public function part5(){
		// 	partsStarted[5] = true;
		// 	smallText.text = "";
		// 	blackBackground.visible = false;
		// 	// theInternet.visible = true;
		// 	setTimeout(part6, PART_BUFFER);
		// }

		public function part6():void{
			partsStarted[6] = true;
			reset();
			setTimeout(function(){
				bigText.text = "How do I get out of here?";
				genericFadeInBigText();
			}, SPEECH_TIME);
			setTimeout(part8, PART_BUFFER);
		}

		// public function part7(){
		// 	partsStarted[7] = true;
		// 	blackBackground.visible = false;
		// 	bigText.text = "";
		// 	justZye.visible = true;
		// 	justZye.gotoAndPlay('run');
		// 	setTimeout(part8, 2500);
		// }

		public function part8():void{
			partsStarted[8] = true;					
			setTimeout(function(){
				smallText.text = "Harness the energy of this place.";
				genericFadeInsmallText();
			}, SPEECH_TIME);
			setTimeout(part9, PART_BUFFER*1.5);
		}

		public function part9():void{
			partsStarted[9] = true;
			reset();
			setTimeout(function(){
				bigText.text = "...What energy?";
				genericFadeInBigText();
			}, SPEECH_TIME);		
			setTimeout(part10, PART_BUFFER);
		}

		public function part10():void{
			partsStarted[10] = true;				
			setTimeout(function(){
				smallText.text = "HATE.";
				genericFadeInsmallText();
			}, SPEECH_TIME*3);
		}

		public function part11():void{
			partsStarted[11] = true;				
			setTimeout(function(){
				chopText.text = "Use the tools of the internet.";
				genericFadeInChopText();
			}, 0);
		}

		public function part12():void{
			partsStarted[12] = true;				
			setTimeout(function(){
				chopText.text = "In a game about internet hate...";
				genericFadeInChopText();
			}, 0);
		}

		public function part13():void{
			partsStarted[13] = true;				
			setTimeout(function(){
				genericFadeInTC();
			}, 0);
		}

		public function part14():void{
			partsStarted[14] = true;				
			setTimeout(function(){
				genericFadeInAvailableNow();
			}, 0);
		}


		// public function showNewWord():void{
		// 	if(currWordCount < currWordArray.length){
		// 		bigText.appendText(currWordArray[currWordCount]);
		// 		if(currWordCount < currWordArray.length - 1){
		// 			bigText.appendText(' ');
		// 		}
		// 		currWordCount++;	
		// 	}else{
		// 		if(!partsStarted[3]){
		// 			setTimeout(part3, 1500);
		// 		}else{
		// 			setTimeout(part4, 1500);
		// 		}	
		// 	}
		// }

		public function invis(mc:MovieClip):void{
			mc.alpha = 0;
			mc.visible = false;
		}

		public function genericFadeInAvailableNow():void{		
			availableNow.visible = true;	
			availableNow.alpha = 0;
			addEventListener(Event.ENTER_FRAME, genericFadeInAvailableNowOnFrame);
		}

		public function genericFadeInAvailableNowOnFrame(e:Event):void{			
			if(availableNow.alpha < 1){			
				availableNow.alpha += FADE_RATE_FAST;
			}else{
				availableNow.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInAvailableNowOnFrame);
				//setTimeout(genericFadeOutBigText, 500);
			}
		}

		public function genericFadeInTC():void{		
			TC.visible = true;	
			TC.alpha = 0;
			addEventListener(Event.ENTER_FRAME, genericFadeInTCOnFrame);
		}

		public function genericFadeInTCOnFrame(e:Event):void{			
			if(TC.alpha < 1){			
				TC.alpha += FADE_RATE_FAST;
			}else{
				TC.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInTCOnFrame);
				//setTimeout(genericFadeOutBigText, 500);
			}
		}


		public function genericFadeInBigText():void{		
			bigText.visible = true;	
			bigText.alpha = 0;
			addEventListener(Event.ENTER_FRAME, genericFadeInOnFrameBigText);
		}

		public function genericFadeInOnFrameBigText(e:Event):void{			
			if(bigText.alpha < 1){			
				bigText.alpha += FADE_RATE_FAST;
			}else{
				bigText.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInOnFrameBigText);
				//setTimeout(genericFadeOutBigText, 500);
			}
		}

		public function genericFadeOutBigText():void{
			addEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameBigText);
		}

		public function genericFadeOutOnFrameBigText(e:Event):void{
			if(bigText.alpha > 0){
				bigText.alpha -= FADE_RATE_FAST;
			}else{
				bigText.alpha = 0;
				removeEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameBigText);						
			}
		}

		public function genericFadeInsmallText():void{		
			smallText.visible = true;	
			smallText.alpha = 0;
			addEventListener(Event.ENTER_FRAME, genericFadeInOnFrameSmallText);
		}

		public function genericFadeInOnFrameSmallText(e:Event):void{			
			if(smallText.alpha < 1){			
				smallText.alpha += FADE_RATE_FAST;
			}else{
				smallText.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInOnFrameSmallText);
				//setTimeout(genericFadeOutSmallText, 500);
			}
		}

		public function genericFadeOutSmallText():void{
			addEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameSmallText);
		}

		public function genericFadeOutOnFrameSmallText(e:Event):void{
			if(smallText.alpha > 0){
				smallText.alpha -= FADE_RATE_FAST;
			}else{
				smallText.alpha = 0;
				removeEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameSmallText);						
			}
		}

		public function genericFadeInChopText():void{		
			chopText.visible = true;	
			chopText.alpha = 0;
			addEventListener(Event.ENTER_FRAME, genericFadeInOnFrameChopText);
		}

		public function genericFadeInOnFrameChopText(e:Event):void{			
			if(chopText.alpha < 1){			
				chopText.alpha += FADE_RATE_FAST;
			}else{
				chopText.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInOnFrameChopText);			
			}
		}


		public function genericFadeInCurrQuote():void{		
			currQuote.visible = true;	
			addEventListener(Event.ENTER_FRAME, genericFadeInOnFrameCurrQuote);
		}

		public function genericFadeInOnFrameCurrQuote(e:Event):void{			
			if(currQuote.alpha < 1){			
				currQuote.alpha += FADE_RATE;
			}else{
				currQuote.alpha = 1;
				removeEventListener(Event.ENTER_FRAME, genericFadeInOnFrameCurrQuote);
				setTimeout(genericFadeOutCurrQuote, PART_BUFFER/2);
			}
		}

		public function genericFadeOutCurrQuote():void{
			addEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameCurrQuote);
		}

		public function genericFadeOutOnFrameCurrQuote(e:Event):void{
			if(currQuote.alpha > 0){
				currQuote.alpha -= FADE_RATE;
			}else{
				currQuote.alpha = 0;
				removeEventListener(Event.ENTER_FRAME, genericFadeOutOnFrameCurrQuote);				
				if(!partsStarted[1]){
					setTimeout(part1, PART_BUFFER/2);
				}else{
					setTimeout(part2, 750);
				}			
			}
		}
	}
}
