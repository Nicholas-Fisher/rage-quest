package classes {

	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	import starling.events.ResizeEvent;

	import flash.utils.*;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
    import flash.events.Event;
    import flash.events.NativeWindowBoundsEvent;
	import flash.display.StageDisplayState;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.MovieClip;
	import flash.geom.*;
	import flash.media.Sound;	
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;	
	import flash.desktop.NativeApplication;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.system.System;

	import fl.events.SliderEvent;
	import fl.controls.Slider;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;

	import com.amanitadesign.steam.FRESteamWorks;

	import com.grumpycarrot.ane.playgameservices.PlayGamesServices;
	import com.grumpycarrot.ane.playgameservices.PlayGamesServicesEvent;

	public class Main extends Sprite {

		include 'nonClasses/FC.as';
		include 'nonClasses/GameSaving.as';

		private var timeStamp:Number = 0;		
		private var starling:Starling;		
		private var currentMusic:Sound;		
		private var Steamworks:FRESteamWorks;
		private var GooglePlay:PlayGamesServices;

		public function Main(){

		    Starling.handleLostContext = true;
		    stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, reportKeyDown, false, 0, true);
			addEventListener(starling.events.Event.ENTER_FRAME, onFrame, false, 0, true);			

			if(!GV.DESKTOP_MODE){			
				var gameSize:Rectangle;
				var fullScreen:Rectangle;
				var viewPort:Rectangle;	

				stage.displayState = StageDisplayState.FULL_SCREEN;
				stage.showDefaultContextMenu = false;				

				var fsw:Number = stage.fullScreenWidth;
				var fsh:Number = stage.fullScreenHeight;

				starling = new Starling(SC, stage);
				starling.stage.stageWidth  = 1280;
				starling.stage.stageHeight = 720;							

				gameSize =  new Rectangle(0, 0, 1280, 720);
				fullScreen =  new Rectangle(0, 0, fsw,  fsh);

				viewPort = RectangleUtil.fit(gameSize, fullScreen, ScaleMode.SHOW_ALL);
				starling.viewPort = viewPort;

				fc = Starling.current.nativeOverlay;
			}else{
				if(stage.nativeWindow.stage){
					GV.chromeWidth = stage.nativeWindow.width - stage.nativeWindow.stage.stageWidth;
					GV.chromeHeight = stage.nativeWindow.height - stage.nativeWindow.stage.stageHeight;
				}
				stage.nativeWindow.width = 1280 + GV.chromeWidth;
 				stage.nativeWindow.height = 720 + GV.chromeHeight;
				
				starling = new Starling(SC, stage);

				fc = Starling.current.nativeOverlay;
				
				stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE, function(e:flash.events.NativeWindowBoundsEvent):void{
					resizeGame();
				});	
			}

			// if(GV.TEST_MODE) starling.showStats = true;		    
		    GV.stage = this;
		    GV.s = starling;
		    GV.fc = fc;

		    showNew(titleScreen, true);
			titleScreen.loading.visible = true;
			titleScreen.startBtn.visible = false;
			titleScreen.versionText.text = "Rage Quest " + GV.VERSION;
			if(!GV.IS_DEMO){
				titleScreen.demoText.visible = false;
			}
			
			starling.start();				
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE , handleDeactivate);
			NativeApplication.nativeApplication.addEventListener(Event.EXITING , handleDeactivate);
			NativeApplication.nativeApplication.addEventListener(Event.SUSPEND , handleDeactivate);

		    function handleDeactivate(event:Event):void {			              	
		       	SoundMixer.soundTransform = new SoundTransform(0);
		       	GV.s.stop(true);
		       	System.pause();	
		    }

		    NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate);

		    function handleActivate(event:Event):void {		        		       	 		    
		        System.resume();
		        SoundMixer.soundTransform = new SoundTransform(1);
		        GV.s.start();		      
		    }

			steamInit();
		    googlePlayGamesInit();
		    startGame();
		}

		private function startGame():void {
			setTimeout(initFC, 250);
		}

		private function googlePlayGamesInit():void {
			if(GV.IS_GOOGLE_PLAY){
		    	try {
	    			GooglePlay = PlayGamesServices.getInstance();
					GV.playGamesServices = GooglePlay;					
					GooglePlay.addEventListener(PlayGamesServicesEvent.GOOGLE_PLAY_GAMES_EVENT, onGooglePlayGames);		
					// ("initAPI",enableSavedGames,enableTurnBaseMulti,connectOnStart,maxAutoSignInAttempts,showPopUps)	
					// GVP.stats.attemptGooglePlaySignInOnStartUp
					GooglePlay.initAPI(false,false,false,3,true);					
	    		} catch(e:Error) {		
	    			GV.playSignedIn = false;
	    			GVP.stats.attemptGooglePlaySignInOnStartUp = false;					
	    		}
		    }
		}

		private function onGooglePlayGames(event:PlayGamesServicesEvent):void{					
			try {	
				if (event.responseCode == PlayGamesServicesEvent.ON_SIGN_IN_SUCCESS) {				
					GV.playSignedIn = true;
					save.signInBtn.visible = false;
					GVP.stats.attemptGooglePlaySignInOnStartUp = true;
					men.achievementsBtn.visible = true;
				} 
				
				else if (event.responseCode == PlayGamesServicesEvent.ON_SIGN_OUT_SUCCESS) {
					GV.playSignedIn = false;
					save.signInBtn.visible = true;
					GVP.stats.attemptGooglePlaySignInOnStartUp = false;	
					men.achievementsBtn.visible = false;				
				}
				
				else if (event.responseCode == PlayGamesServicesEvent.ON_SIGN_IN_FAIL) {				
					GV.playSignedIn = false;
					save.signInBtn.visible = true;
					GVP.stats.attemptGooglePlaySignInOnStartUp = false;	
					men.achievementsBtn.visible = false;				
				}	
			} catch(e:Error) {					
				GV.playSignedIn = false;
	    	}
		}	

		private function steamInit():void {
		    if(GV.IS_STEAM){
		    	try {				
					Steamworks = new FRESteamWorks();					
					if(Steamworks.init()){														
						GV.steamSignedIn = true;
						GV.steamworksServices = Steamworks;						
					}						
					
				} catch(e:Error) {	
					GV.steamSignedIn = false;									
				}
		    }		    
		}


		private function reportKeyDown(event:flash.events.KeyboardEvent):void {
    		switch(event.keyCode){
    			case Keyboard.BACK: 
    			case Keyboard.BACKSPACE: 
    				event.preventDefault();
					event.stopImmediatePropagation();
    				onBackButton(); 
    			break;
				case Keyboard.T: if(GV.TEST_MODE){ trace(System.totalMemory / 1024); } break;
    		}
    		if(!GV.arena || !GV.arena.isActive || GV.arena.inConversation) return;
    		switch(event.keyCode){
    			case Keyboard.NUMBER_1: GV.arena.onBlueClick(); break;
    			case Keyboard.NUMBER_2: GV.arena.onRedClick(); break;
    			case Keyboard.NUMBER_3: GV.arena.onGreenClick(); break;
    			case Keyboard.SPACE: GV.arena.onPauseClick(); break;
    			case Keyboard.TAB: GV.arena.onToggleClick(); break;
    			case Keyboard.Q: GV.arena.onReserveAbil1Click(); break;
    			case Keyboard.W: GV.arena.onReserveAbil2Click(); break;
    			case Keyboard.E: GV.arena.onReserveAbil3Click(); break;
    			case Keyboard.R: GV.arena.onReserveAbil4Click(); break;
    			case Keyboard.S: GV.arena.onSpeedClick(); break;    			
    			case Keyboard.M: if(GV.TEST_MODE){ GV.arena.cheat(); } break;
    		}
    	}

		private function onFrame(e:flash.events.Event):void{
			var t:Number = getTimer();
			GV.timeSinceLastFrame  = t - timeStamp;
			timeStamp = t;
			//if(GV.TEST_MODE){ trace(System.totalMemory / 1024); } 	
		}

		public function resizeGame():void{				
			starling.viewPort = new Rectangle(0, 0, stage.stageWidth,  stage.stageHeight);		
		}
	}
}
