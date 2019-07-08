package classes {

	import flash.display.Bitmap;
	import classes.pixelperfect.*;
	import classes.FFParticleSystem.FFParticleSystem;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.ColorMatrixFilter;
	import starling.animation.Transitions;
	import flash.utils.*;

	public class Tile extends Sprite{

		include 'nonClasses/Utility.as';

		public var myBitmap:Bitmap;
		public var hitZone:PixelHitArea;
		public var touchImage:PixelImageTouch; //last arg is a treshold for alpha channel;
		public var animationContainer:starling.display.Sprite = new starling.display.Sprite;
		public var borderContainer:starling.display.Sprite = new starling.display.Sprite;
		public var dottedBorderContainer:starling.display.Sprite = new starling.display.Sprite;
		public var augmentContainer:starling.display.Sprite = new starling.display.Sprite;
		public var pos:Array = new Array(2);
		public var tempAbilSeconds:int;		
		public var effects:Object = null;
		public var effectType:String;
		public var effectTargetType:String;
		public var effectSelectType:String;
		public var effectRange:int;
		public var centerX:int;
		public var centerY:int;
		public var isSelected:Boolean = false;
		public var isTrap:Boolean = false;
		public var canBeSelected:Boolean = true;
		public var traversableForAI:Boolean = true;
		public var occupied:Boolean = false;
		public var isGoalTile:Boolean = false;
		public var augment:String = null;
		public var augmentTrigger:String = null;
		public var canBeBordered:Boolean = true;
		public var wasSelectedThisTurn:Boolean = false;
		public var occupant:Combatant;
		public var f:Number;
		public var g:Number;
		public var h:Number;
		public var parentTile:Tile;	
		public var link:String;
		public var tileType:String;
		public var targetedAbilityPic:SuperImage;
		private var trapCharge:int = 0;
		private var startTrapCharge:int = -1;
		private const WAVE_FADE_RATE:Number = 0.15;
		public var isForTutorial:Boolean = false;
		private var currColor:String = '';
		private var animationName:String;
		private var currBackgroundSheet:int;
		private var alphaRate:Number = 0.005;
		public var baseTile:SuperMovieClip;
		private var overTile:SuperMovieClip;
		private var effectAlpha:int;

		private var rt:SuperMovieClip = new SuperMovieClip('tileBeamHorzRed', GV.getBackgroundSpriteSheet(), 77, -20);
		private var rr:SuperMovieClip = new SuperMovieClip('tileBeamVertRed', GV.getBackgroundSpriteSheet(), 147, -20);
		private var rb:SuperMovieClip = new SuperMovieClip('tileBeamHorzRed', GV.getBackgroundSpriteSheet(), 0, 97);
		private var rl:SuperMovieClip = new SuperMovieClip('tileBeamVertRed', GV.getBackgroundSpriteSheet(), 0, -20);
		private var gt:SuperMovieClip = new SuperMovieClip('tileBeamHorzGreen', GV.getBackgroundSpriteSheet(), 77, -20);
		private var gr:SuperMovieClip = new SuperMovieClip('tileBeamVertGreen', GV.getBackgroundSpriteSheet(), 147, -20);
		private var gb:SuperMovieClip = new SuperMovieClip('tileBeamHorzGreen', GV.getBackgroundSpriteSheet(), 0, 97);
		private var gl:SuperMovieClip = new SuperMovieClip('tileBeamVertGreen', GV.getBackgroundSpriteSheet(), 0, -20);
		private var bt:SuperMovieClip = new SuperMovieClip('tileBeamHorzBlue', GV.getBackgroundSpriteSheet(), 77, -20);
		private var br:SuperMovieClip = new SuperMovieClip('tileBeamVertBlue', GV.getBackgroundSpriteSheet(), 147, -20);
		private var bb:SuperMovieClip = new SuperMovieClip('tileBeamHorzBlue', GV.getBackgroundSpriteSheet(), 0, 97);
		private var bl:SuperMovieClip = new SuperMovieClip('tileBeamVertBlue', GV.getBackgroundSpriteSheet(), 0, -20);
		private var c_t:SuperMovieClip = new SuperMovieClip('colorBorderHorz', GV.getBackgroundSpriteSheet(), 77.6, 0);
		private var c_r:SuperMovieClip = new SuperMovieClip('colorBorderVert', GV.getBackgroundSpriteSheet(), 147, 0);
		private var c_b:SuperMovieClip = new SuperMovieClip('colorBorderHorz', GV.getBackgroundSpriteSheet(), 0, 117.6);
		private var c_l:SuperMovieClip = new SuperMovieClip('colorBorderVert', GV.getBackgroundSpriteSheet(), 0, 0);
		public var tbrd:SuperImage = new SuperImage("topCombatBorder0000", GV.getBackgroundSpriteSheet(), 77.6, 0);
		public var rbrd:SuperImage = new SuperImage("rightCombatBorder0000", GV.getBackgroundSpriteSheet(), 147, 0);
		public var bbrd:SuperImage = new SuperImage("bottomCombatBorder0000", GV.getBackgroundSpriteSheet(), 0, 117.6);
		public var lbrd:SuperImage = new SuperImage("leftCombatBorder0000", GV.getBackgroundSpriteSheet(), 0, 0);
		private var clickTile:SuperMovieClip = new SuperMovieClip('clickTile', GV.getBackgroundSpriteSheet());
		private var redTile:SuperMovieClip = new SuperMovieClip('redTile', GV.getBackgroundSpriteSheet());
		private var blueTile:SuperMovieClip = new SuperMovieClip('blueTile', GV.getBackgroundSpriteSheet());
		private var greenTile:SuperMovieClip = new SuperMovieClip('greenTile', GV.getBackgroundSpriteSheet());
		private var infectedTile:SuperMovieClip = new SuperMovieClip('infectedTile', GV.getBackgroundSpriteSheet());
		private var powUpTile:SuperMovieClip = new SuperMovieClip('powUpTile', GV.getBackgroundSpriteSheet());
		private var defUpTile:SuperMovieClip = new SuperMovieClip('defUpTile', GV.getBackgroundSpriteSheet());
		private var heroInfectedTile:SuperMovieClip = new SuperMovieClip('heroInfectedTile', GV.getBackgroundSpriteSheet());
		private var explosiveTile:SuperMovieClip = new SuperMovieClip('explosiveTile', GV.getBackgroundSpriteSheet());		
		private var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter();
		private var wall:SuperMovieClip;

		private var currentAnimation:SuperMovieClip;  
		private var currentAugment:SuperMovieClip;  
		private var odd:int = 1;
		private var pic:SuperImage;
		private var isForObstacleCourse:Boolean = false;

		private const TILE_BLOCK_HEIGHT:Number = 141;	
		private const WATER_PARTICLES:int = 10;
		
		public function Tile(i:int, j:int){

			colorMatrixFilter.tint(0xFF7777, 1);

			rl.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(rl); borderContainer.removeChild(rl)});
			rt.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(rt); borderContainer.removeChild(rt)});
			rr.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(rr); borderContainer.removeChild(rr)});
			rb.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(rb); borderContainer.removeChild(rb)});
			gl.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(gl); borderContainer.removeChild(gl)});
			gt.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(gt); borderContainer.removeChild(gt)});
			gr.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(gr); borderContainer.removeChild(gr)});
			gb.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(gb); borderContainer.removeChild(gb)});
			bl.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(bl); borderContainer.removeChild(bl)});
			bt.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(bt); borderContainer.removeChild(bt)});
			br.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(br); borderContainer.removeChild(br)});
			bb.addEventListener(starling.events.Event.COMPLETE, function():void{GV.s.juggler.remove(bb); borderContainer.removeChild(bb)});
		
			myBitmap = new Bitmap(new TileBlack());
			hitZone = new PixelHitArea ( myBitmap, 0.2); // Second arg is sampling for bitmapData.
			touchImage = new PixelImageTouch ( Texture.fromBitmap (myBitmap), hitZone, 150 ); // Last argument is a threshold for alpha channel.
			myBitmap = null;
			hitZone = null

			redTile.alpha = 0.5;
			blueTile.alpha = 0.5;
			greenTile.alpha = 0.5;

			touchImage.alpha = 0;
			touchImage.visible = false;

			GV.arena.touchTileContainer.addChild(touchImage);
			init(i, j);
		}

		public function resetTile():void {
			scrubContainer(animationContainer);
			scrubContainer(borderContainer);
			scrubContainer(dottedBorderContainer);
			scrubContainer(augmentContainer);
			scrubContainer(this);			
			if(pic && GV.arena.backgroundContainer.contains(pic)){				
				GV.arena.backgroundContainer.removeChild(pic);
			}

			if(!GV.arena.touchTileContainer.contains(touchImage)){
				GV.arena.touchTileContainer.addChild(touchImage);
			}

			clearAugment();
			isSelected = false;
			isTrap = false;			
			wasSelectedThisTurn = false;
			occupied = false;
			isGoalTile = false;
			canBeSelected = true;
			traversableForAI = true;
			canBeBordered = true;
			augment = null;
			augmentTrigger = null;
			currentAnimation = null;
			currentAugment = null;
			overTile = null;
			isForTutorial = false;
			
			superNull(baseTile); baseTile = null;		
			superNull(pic); pic = null;

			touchImage.visible = false;
			touchImage.touchable = false;
			touchImage.removeEventListener(TouchEvent.TOUCH, onTouch);

			init(pos[0], pos[1]);
		}
		
		public function scrubContainer(c:Sprite):void {
			while (c.numChildren > 0) {
			    c.removeChildAt(0);
			}	
		}

		public function init(i:int, j:int):void {

			var tileAppearance:int;
			var emptyTile:String = "a" + (GVP.stats.currentMap + 1) + "-flat-empty";

			if (GV.arena.tileMap.length){ // If the tile map is not exhausted.
				var unparsedStr = GV.arena.tileMap[0];
				tileType = unparsedStr.charAt(0);
				tileAppearance = parseInt(unparsedStr.substring(1,4));
			}

			var yAdjust:int;	
			switch(tileType){
				case 't': yAdjust = -2; canBeBordered = false; break;
				case 'h': yAdjust = -1; canBeBordered = false; break;
				case 'm': yAdjust = 0; break;
				case 'l': yAdjust = 1; canBeBordered = false; break;
				case 'b': yAdjust = 2; canBeBordered = false; break;
			}
						
			x = ((i * GV.TILE_WIDTH) - ( j * (GV.TILE_WIDTH / 2 + 3))) - i; // - i to get rid of those borders.
			y = (j * GV.TILE_HEIGHT); //- j to get rid of those borders.

			y += 23.85*yAdjust;
			pos = [i, j];						
			centerX = x + GV.TILE_WIDTH*0.75;
			centerY = y + GV.TILE_HEIGHT*0.5;

			currBackgroundSheet = GV.getBackgroundSpriteSheet();

			switch(tileAppearance){

				case 00: baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet); break;

				/* Augs */
				
				case 98: baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet); manualAugment({hpChange: -40*(GVP.stats.currentMap+1)}, 'infected', 'proximity', null, 0, 'good-guys'); break;
				case 97: baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet); manualAugment({hpChange: -30*(GVP.stats.currentMap+1)}, 'explosive', 'damage', null, 1); break;
				case 96: baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet); manualAugment({powChange: 20*(GVP.stats.currentMap+1)}, 'powUp', 'proximity', 'temporary'); break;
				case 95: baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet); manualAugment({defChange: 10*(GVP.stats.currentMap+1)}, 'defUp', 'proximity', 'temporary'); break;

				/* In Battle Traps */

				case 94: 
					baseTile = new SuperMovieClip("whiteTile", currBackgroundSheet); 
					pic = new SuperImage('comment' + GV.arena.getFreeComment() + 'Tile0000', currBackgroundSheet); 
					if(!GV.arena.domainOfHate){
						isTrap = true;
						trapCharge = 30;
						startTrapCharge = 20	
					}	
				break;
				case 93:
					baseTile = new SuperMovieClip("whiteTile", currBackgroundSheet); 
					pic = new SuperImage('comment' + GV.arena.getFreeComment() + 'Tile0000', currBackgroundSheet); 
					if(!GV.arena.domainOfHate){
						isTrap = true;
						trapCharge = 30;
						startTrapCharge = 5	
					}				
				break;

				/* Minigame Traps */

				case 100: 
					baseTile = new SuperMovieClip("whiteTile", currBackgroundSheet); 
					pic = new SuperImage('comment' + GV.arena.getFreeComment() + 'Tile0000', currBackgroundSheet); 
					isTrap = true;
					trapCharge = 5;
					isForObstacleCourse = true;
				break;
				case 101: 
					baseTile = new SuperMovieClip("whiteTile", currBackgroundSheet); 
					pic = new SuperImage('comment' + GV.arena.getFreeComment() + 'Tile0000', currBackgroundSheet); 
					isTrap = true;
					trapCharge = 10;
					isForObstacleCourse = true;
				break;
				case 102: 
					baseTile = new SuperMovieClip("whiteTile", currBackgroundSheet); 
					pic = new SuperImage('comment' + GV.arena.getFreeComment() + 'Tile0000', currBackgroundSheet); 
					isTrap = true;
					trapCharge = 15;
					isForObstacleCourse = true;
				break;
				case 105: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("goalTile", currBackgroundSheet); 
					isGoalTile = true;
				break;

				/* Arena 1 */

				case 01: baseTile = new SuperMovieClip("a1-top-bridgetroll", currBackgroundSheet); break;
				case 04: baseTile = new SuperMovieClip("a1-top-3t1r", currBackgroundSheet); break;
				case 05: baseTile = new SuperMovieClip("a1-top-3t", currBackgroundSheet); break;
				case 06: baseTile = new SuperMovieClip("a1-top-2t", currBackgroundSheet); break;
				case 07: baseTile = new SuperMovieClip("a1-top-3tcat", currBackgroundSheet); break;
				case 08: baseTile = new SuperMovieClip("a1-top-welcome", currBackgroundSheet); break;
				case 09: baseTile = new SuperMovieClip("a1-top-catpen", currBackgroundSheet); break;
				case 10: baseTile = new SuperMovieClip("a1-top-spamA", currBackgroundSheet); break;
				case 26: baseTile = new SuperMovieClip("a1-top-spamB", currBackgroundSheet); break;
				case 28: baseTile = new SuperMovieClip("a1-top-spamC", currBackgroundSheet); break;
				case 29: baseTile = new SuperMovieClip("a1-top-youtube", currBackgroundSheet); break;
				case 30: baseTile = new SuperMovieClip("a1-top-double-rainbow", currBackgroundSheet); break;

				case 02: baseTile = new SuperMovieClip("a1-flat-grassA", currBackgroundSheet); break;
				case 11: baseTile = new SuperMovieClip("a1-flat-grassB", currBackgroundSheet); break;
				case 14: baseTile = new SuperMovieClip("a1-flat-grassC", currBackgroundSheet); break;
				case 25: baseTile = new SuperMovieClip("a1-flat-grassD", currBackgroundSheet); break;

				case 19: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a1-top-edgeA", currBackgroundSheet); 
				break;
				case 27: // latest 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a1-top-edgeB", currBackgroundSheet); 
				break;
				case 20: 
					baseTile = new SuperMovieClip("a1-flat-grassC", currBackgroundSheet);
					overTile = new SuperMovieClip("a1-right-edgeA", currBackgroundSheet); 
				break;
				case 21: 
					baseTile = new SuperMovieClip("a1-bottom-edgeA", currBackgroundSheet); 
				break; // latest one
				case 22: 
					baseTile = new SuperMovieClip("a1-flat-grassC", currBackgroundSheet);
					overTile = new SuperMovieClip("a1-left-edgeA", currBackgroundSheet); 
				break;

				case 23: 
					baseTile = new SuperMovieClip("a1-flat-grassD", currBackgroundSheet);
					overTile = new SuperMovieClip("a1-corner-edgeA", currBackgroundSheet); 
				break;
				case 24: 
					baseTile = new SuperMovieClip("a1-flat-grassC", currBackgroundSheet);
					overTile = new SuperMovieClip("a1-corner-edgeB", currBackgroundSheet); 
				break;

				case 15: baseTile = new SuperMovieClip("a1-water-corner", currBackgroundSheet);break;
				case 16: baseTile = new SuperMovieClip("a1-water-top", currBackgroundSheet);break;
				case 17: baseTile = new SuperMovieClip("a1-water-left", currBackgroundSheet);break;
				
				case 12: baseTile = new SuperMovieClip("a1-bot-rocks", currBackgroundSheet); break;
				case 13: baseTile = new SuperMovieClip("a1-bot-pond", currBackgroundSheet); break;
				case 03: baseTile = new SuperMovieClip("a1-bot-1t3r", currBackgroundSheet); break;
				case 18: baseTile = new SuperMovieClip("a1-bot-shrubs", currBackgroundSheet); break;

				/* Arena 2 */

				case 31: baseTile = new SuperMovieClip("a2-flat-A", currBackgroundSheet); break;
				case 32: baseTile = new SuperMovieClip("a2-flat-B", currBackgroundSheet); break;
				case 33: baseTile = new SuperMovieClip("a2-flat-C", currBackgroundSheet); break;
				case 34: baseTile = new SuperMovieClip("a2-flat-D", currBackgroundSheet); break;

				case 35: baseTile = new SuperMovieClip("a2-top-votes", currBackgroundSheet); break;
				case 36: baseTile = new SuperMovieClip("a2-top-twittergraveyard", currBackgroundSheet); break;
				case 37: baseTile = new SuperMovieClip("a2-top-spires", currBackgroundSheet); break;	
				case 38: baseTile = new SuperMovieClip("a2-top-deadhorse", currBackgroundSheet); break;
				case 39: baseTile = new SuperMovieClip("a2-top-clickbait", currBackgroundSheet); break;

				case 40: baseTile = new SuperMovieClip("a2-water-corner", currBackgroundSheet);break;
				case 41: baseTile = new SuperMovieClip("a2-water-top", currBackgroundSheet);break;
				case 42: baseTile = new SuperMovieClip("a2-water-left", currBackgroundSheet);break;

				case 43: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-top-edgeA", currBackgroundSheet); 
				break;
				case 44: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-right-edgeA", currBackgroundSheet); 
				break;
				case 45: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-bottom-edgeA", currBackgroundSheet); 
				break;
				case 46: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-left-edgeA", currBackgroundSheet); 
				break;
				case 47: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-corner-edgeA", currBackgroundSheet); 
				break;
				case 48: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a2-corner-edgeB", currBackgroundSheet); 
				break;

				case 49: baseTile = new SuperMovieClip("a2-bot-memegenerator", currBackgroundSheet); break;
				case 50: baseTile = new SuperMovieClip("a2-bot-rocksA", currBackgroundSheet); break;
				case 51: baseTile = new SuperMovieClip("a2-bot-rocksB", currBackgroundSheet); break;
				case 52: baseTile = new SuperMovieClip("a2-bot-tweets", currBackgroundSheet); break;

				/* Arena 3 */

				case 53: baseTile = new SuperMovieClip("a3-flat-A", currBackgroundSheet); break;
				case 54: baseTile = new SuperMovieClip("a3-flat-B", currBackgroundSheet); break;
				case 55: baseTile = new SuperMovieClip("a3-flat-C", currBackgroundSheet); break;
				case 56: baseTile = new SuperMovieClip("a3-flat-D", currBackgroundSheet); break;

				case 57: baseTile = new SuperMovieClip("a3-top-church", currBackgroundSheet); break;
				case 58: baseTile = new SuperMovieClip("a3-top-hacker", currBackgroundSheet); break
				case 59: baseTile = new SuperMovieClip("a3-top-graphics", currBackgroundSheet); break
				case 60: baseTile = new SuperMovieClip("a3-top-teamps", currBackgroundSheet); break;
				case 61: baseTile = new SuperMovieClip("a3-top-teamxb", currBackgroundSheet); break;
				case 62: baseTile = new SuperMovieClip("a3-top-troll", currBackgroundSheet); break;

				case 63: baseTile = new SuperMovieClip("a3-bot-explosiveBarrels", currBackgroundSheet); break
				case 64: baseTile = new SuperMovieClip("a3-bot-rageVolcano", currBackgroundSheet); break

				case 65: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a3-corner-edge", currBackgroundSheet); break; 
				break;
				case 66: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a3-top-edge", currBackgroundSheet); break;
				break;

				case 67: baseTile = new SuperMovieClip("a3-spikesA", currBackgroundSheet);break;
				case 68: baseTile = new SuperMovieClip("a3-spikesB", currBackgroundSheet);break;
				case 69: baseTile = new SuperMovieClip("a3-spikesC", currBackgroundSheet);break;

				/* Arena 4 */

				case 70: baseTile = new SuperMovieClip("a4-flat-A", currBackgroundSheet); break;
				case 71: baseTile = new SuperMovieClip("a4-flat-B", currBackgroundSheet); break;
				case 72: baseTile = new SuperMovieClip("a4-flat-C", currBackgroundSheet); break;
				case 73: baseTile = new SuperMovieClip("a4-flat-D", currBackgroundSheet); break;

				case 74: baseTile = new SuperMovieClip("a4-top-cameraNest", currBackgroundSheet); break;
				case 75: baseTile = new SuperMovieClip("a4-top-camerasA", currBackgroundSheet); break
				case 76: baseTile = new SuperMovieClip("a4-top-graph", currBackgroundSheet); break;
				case 77: baseTile = new SuperMovieClip("a4-top-userData", currBackgroundSheet); break;

				case 78: baseTile = new SuperMovieClip("a4-bot-camerasB", currBackgroundSheet); break
				case 79: baseTile = new SuperMovieClip("a4-bot-domeCamera", currBackgroundSheet); break
				case 80: baseTile = new SuperMovieClip("a4-bot-fakeNews", currBackgroundSheet); break

				case 84: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a4-corner-edge", currBackgroundSheet); break; 
				break;
				case 85: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a4-top-edge", currBackgroundSheet); break;
				break;
				case 86: 
					baseTile = new SuperMovieClip(emptyTile, currBackgroundSheet);
					overTile = new SuperMovieClip("a4-bottom-edge", currBackgroundSheet); break;
				break;

				/* Special */

				//case 80: baseTile = new SuperMovieClip("steelTile", currBackgroundSheet); break;
				case 81: baseTile = new SuperMovieClip("glassTile", currBackgroundSheet); break;
				case 82: baseTile = new SuperMovieClip("lightTile", currBackgroundSheet); break;
				case 83: baseTile = new SuperMovieClip("darkTile", currBackgroundSheet); break;
			}

			if(tileType == 'c'){
				combatify();
			}else{
				doodadify();
			}

			if(tileType == 'n'){ 
				canBeBordered = false; 
			}else{
				GV.arena.backgroundContainer.addChild(baseTile);
			}
			
			if(pic){
				GV.arena.backgroundContainer.addChild(pic);
				pic.x = x;
				pic.y = y;
			}
			
			baseTile.y = y;
			baseTile.x = x;
			baseTile.pivotY += baseTile.height - TILE_BLOCK_HEIGHT;
			if(overTile){
				GV.arena.higherDoodadContainer.addChild(overTile);
				overTile.y = y;
				overTile.x = x;
				overTile.pivotY += overTile.height - TILE_BLOCK_HEIGHT;
			}
			GV.arena.tileMap.shift();

			if(tileType != 'n'){		
				if(x < GV.arena.leftMostArenaX) GV.arena.leftMostArenaX = x;
				var rX:Number = x + 225;
				if(rX > GV.arena.rightMostArenaX) GV.arena.rightMostArenaX = rX;

				var specialY:Number = y - 23.85*yAdjust;

				if(specialY < GV.arena.topMostArenaY) GV.arena.topMostArenaY = specialY;
				var rY:Number = specialY + 143;
				if(rY > GV.arena.bottomMostArenaY) GV.arena.bottomMostArenaY = rY;				
			}
			
			touchable = false;
			isForTutorial = false;
		}

		public function trapify():void{
			if(isTrap){
				var c:Trap = new Trap(trapCharge, startTrapCharge, isForObstacleCourse);
				if(isForObstacleCourse){
					c.lvl = 1;
					c.pow = 0;
				}else{
					c.lvl = GVP.stats.currentMap+1;
				}
				c.pos = pos;
				c.init();
				GV.arena.bg.push(c);
			}
		}

		public function doodadify():void{
			traversableForAI = false;
			canBeSelected = false;
			occupied = true;
			GV.arena.touchTileContainer.removeChild(touchImage);
		}

		public function combatify():void{
			
			GV.arena.combatTilePositions.push(pos);
			touchImage.visible = true;
			touchImage.touchable = true;
			touchImage.addEventListener(TouchEvent.TOUCH, onTouch);		
			
			dottedBorderContainer.x = x;
			dottedBorderContainer.y = y - 2;
			borderContainer.x = x - 2;
			borderContainer.y = y -2;

			augmentContainer.x = animationContainer.x = x;
			augmentContainer.y = animationContainer.y = y;
			touchImage.x = x;
			touchImage.y = y;

			if(!GV.arena.arenaData.noTileBorders) GV.arena.borderContainer.addChild(dottedBorderContainer);						
			GV.arena.borderContainer.addChild(borderContainer);
			GV.arena.borderContainer.addChild(augmentContainer);
			GV.arena.borderContainer.addChild(animationContainer);
		}

		private function onTouch (e:TouchEvent):void{
			var touch:Touch = e.getTouch(stage);
			if(touch && touch.phase == TouchPhase.BEGAN){
				if(GV.arena.isTutorial) {
					if(isForTutorial) {
						isForTutorial = false;						
						GV.arena.paused = false;
						GV.arena.onTileClick(pos);
						GV.arena.disableAllTiles();
						GV.arena.actionButtonHighlight.visible = false;
						clickAnimation();					
					}
				}else{
					GV.arena.onTileClick(pos);
					clickAnimation();
				}
			}			
		}

		public function effectBorder(){
			if(isSelected){	
				showColorEffect(1);
			}
		}

		public function colorBorder(fancy:Boolean = false){

			if(isSelected){	
				var frame:int = 0;

				switch(currColor){
					case 'blueTile': 
						frame = 0; 
					break;
					case 'redTile': 
						frame = 1; 
					break;
					case 'greenTile': 
						frame = 2; 
					break;
				}

				if(fancy) showColorEffect(frame);
				c_t.currentFrame = frame;
				c_r.currentFrame = frame;
				c_b.currentFrame = frame;
				c_l.currentFrame = frame;
				var currTile:Tile;
				currTile = GV.arena.getTile([pos[0], pos[1] - 1]);
				if(!currTile || (currTile && !currTile.isSelected)){borderContainer.addChild(c_t); }
				currTile = GV.arena.getTile([pos[0] + 1, pos[1]]);
				if(!currTile || (currTile && !currTile.isSelected)){borderContainer.addChild(c_r); }
				currTile = GV.arena.getTile([pos[0], pos[1] + 1]);
				if(!currTile || (currTile && !currTile.isSelected)){borderContainer.addChild(c_b); }
				currTile = GV.arena.getTile([pos[0] - 1, pos[1]]);
				if(!currTile || (currTile && !currTile.isSelected)){borderContainer.addChild(c_l); }
			}
		}

		public function showColorEffect(c:int){

			switch(c){
				case 0: showEffect(bt,br,bb,bl); break;
				case 1: showEffect(rt,rr,rb,rl); break;
				case 2: showEffect(gt,gr,gb,gl); break;
			}
		}

		public function showEffect(t:SuperMovieClip, r:SuperMovieClip, b:SuperMovieClip, l:SuperMovieClip):void{
			var currTile:Tile;
			currTile = GV.arena.getTile([pos[0], pos[1] - 1]);
			if(!currTile || (currTile && !currTile.isSelected)){ GV.s.juggler.add(t); borderContainer.addChild(t); }
			currTile = GV.arena.getTile([pos[0] + 1, pos[1]]);
			if(!currTile || (currTile && !currTile.isSelected)){ GV.s.juggler.add(r); borderContainer.addChild(r); }
			currTile = GV.arena.getTile([pos[0], pos[1] + 1]);
			if(!currTile || (currTile && !currTile.isSelected)){ GV.s.juggler.add(b); borderContainer.addChild(b); }
			currTile = GV.arena.getTile([pos[0] - 1, pos[1]]);
			if(!currTile || (currTile && !currTile.isSelected)){ GV.s.juggler.add(l); borderContainer.addChild(l); }
		}

		public function clickAnimation():void{
			animationContainer.addChild(clickTile);
			clickTile.alpha = 1;
			addEventListener(starling.events.Event.ENTER_FRAME, lowerAlphaForClick);
		}

		private function lowerAlphaForClick(e:starling.events.Event):void{                 
			if(clickTile.alpha > 0){
				clickTile.alpha -= 0.05 * GV.speedFactor;
			}else{
				removeEventListener(starling.events.Event.ENTER_FRAME, lowerAlphaForClick);
				animationContainer.removeChild(clickTile);
			}
		} 

		public function explosiveAnimation():void{
			FX.showExplosion(centerX, centerY, 0.1);
		}

		public function selectionAnimation():void{
			switch(animationName){
				case 'blueTile': currColor = animationName; changeAnimation(this[animationName]); break;
				case 'redTile': currColor = animationName; changeAnimation(this[animationName]); break;
				case 'greenTile': currColor = animationName; changeAnimation(this[animationName]); break;
			}
		}

		public function select(_animationName:String):void{
			isSelected = true;
			if(GV.arena.currSelectionType == "effect") {
				wasSelectedThisTurn = true;
			}
			if(_animationName){				
				animationName = _animationName;
				selectionAnimation();
			}
		}

		public function deselect():void{
			currColor = null;
			isSelected = false;
		}

		public function unmark():void{
			wasSelectedThisTurn = false;
		}

		public function removeAnimation():void{
			borderContainer.removeChild(c_t);
			borderContainer.removeChild(c_r);
			borderContainer.removeChild(c_b);
			borderContainer.removeChild(c_l);
			animationName = null;
			animationContainer.removeChild(currentAnimation);
		}

		private function changeAnimation(newMc:SuperMovieClip, alphaDirection:String = null):void{
			removeAnimation();
			currentAnimation = newMc;
			animationContainer.addChild(currentAnimation);
			removeEventListener(starling.events.Event.ENTER_FRAME, lowerAlpha);
			removeEventListener(starling.events.Event.ENTER_FRAME, raiseAlpha);
			switch(alphaDirection){
				case 'lower_alpha_slow':
				addEventListener(starling.events.Event.ENTER_FRAME, lowerAlpha);
				alphaRate = 0.025;
				animationContainer.alpha = 1;
				break;
				case 'lower_alpha_fast':
				addEventListener(starling.events.Event.ENTER_FRAME, lowerAlpha);
				alphaRate = 0.05;
				animationContainer.alpha = 0.5;
				break;
				case 'raise_alpha':
				animationContainer.alpha = 0;
				addEventListener(starling.events.Event.ENTER_FRAME, raiseAlpha);
				break;
			}
		}

		private function lowerAlpha(e:starling.events.Event):void{                 
			if(animationContainer.alpha > 0){
				animationContainer.alpha -= alphaRate * GV.speedFactor;
			}else{
				removeEventListener(starling.events.Event.ENTER_FRAME, lowerAlpha);
				removeAnimation();
				if (isSelected && currColor){
					animationName = currColor;
					selectionAnimation();
				} 
			}
		}

		private function raiseAlpha(e:starling.events.Event):void{                 
			if(animationContainer.alpha < 0.2){
				animationContainer.alpha += 0.015 * GV.speedFactor;
			}else{
				removeEventListener(starling.events.Event.ENTER_FRAME, raiseAlpha);
			}
		}

		private function manualAugment(_effects:Object, _augment:String, _augmentTrigger:String, _effectType:String = null , _effectRange:int = 0, _effectTargetType:String = null, _effectSelectType:String = null):void{
			clearAugment();
			if(_augmentTrigger == 'damage') GV.arena.damageTrigTiles.push(this);
			effects = _effects;
			augment = _augment;		
		 	effectTargetType = _effectTargetType;
		 	effectType = _effectType;
		 	effectRange = _effectRange;
		 	effectSelectType = _effectSelectType;
		 	augmentTrigger = _augmentTrigger;
		 	tempAbilSeconds = 20;
			augmentContainer.addChild(this[augment + 'Tile']);
			currentAugment = this[augment + 'Tile'];
		}

		public function changeAugment(slot:Slot, _effects:Object):void{
			clearAugment();
			if(slot.augmentTrigger == 'damage') GV.arena.damageTrigTiles.push(this);
			augment = slot.augment;					
			effects = _effects;
		 	effectTargetType = slot.effectTargetType;
		 	effectRange = slot.effectRange;
		 	effectSelectType = slot.effectSelectType;
		 	augmentTrigger = slot.augmentTrigger;
			augmentContainer.addChild(this[augment + 'Tile']);
			currentAugment = this[augment + 'Tile'];
		}
		
		public function augmentAnimation():void{
			if (augment && hasOwnProperty(augment + 'Animation')) this[augment + 'Animation']();
			clearAugment();
		}

		public function clearAugment():void{
			if (currentAugment){
				augmentContainer.removeChild(currentAugment);
			}
			effects = null;
			effectType = null;
		 	effectTargetType = null;
		 	effectRange = 0;
		 	effectSelectType = null;
		 	augmentTrigger = null;
			currentAugment = null;
			augment = null;
		}

		public function placeCombatantInCenter(c:Combatant):void{
			c.x = centerX;
			c.y = centerY - c.tilePositionOffset;
		}
		public function triggerAugment():void{
			if(!effects) return;
			if(effectType == 'temporary'){		
				var cancelingEffects:Object = {
					hpChange: -1*effects.hpChange, 
					defChange: -1*effects.defChange, 
					powChange: -1*effects.powChange,
					dotChange: -1*effects.dotChange, 
					apChange: -1*effects.apChange,
					damageReturnChange: -1*effects.damageReturnChange
				};
				GV.arena.doEffectsOnTarget(effects, pos);		
				var tempAbilTimer:TempAbilTimer = new TempAbilTimer(tempAbilSeconds, cancelingEffects, null, occupant) 
				occupant.tempAbilTimers.push(tempAbilTimer);
				GV.arena.selectTiles('tile', pos, null, 'targetTile');
			}else{	
				GV.arena.selectTiles('effect', pos, {effectSelectType: effectSelectType, effectRange: effectRange}, 'targetTile'); // targets self
				switch (effectTargetType){
					case 'enemies': GV.arena.doEffectsOnEnemies(effects, true); break;
					case 'good-guys': GV.arena.doEffectsOnGoodGuys(effects, true); break;
					default: GV.arena.doEffectsOnAll(effects, true); break;
				}
			}
			augmentAnimation();
		}

		public function createLink(arenaName:String):void{
			link = arenaName;
		}

		public function showQueueMarker(i:int):SuperMovieClip{
			switch(i){
				case 0: 
					GV.arena.bQueueMarker.visible = true; 
					GV.arena.bQueueMarker.x = centerX;
					GV.arena.bQueueMarker.y = centerY; 
					return GV.arena.bQueueMarker;
				break;
				case 1: 
					GV.arena.rQueueMarker.visible = true; 
					GV.arena.rQueueMarker.x = centerX;
					GV.arena.rQueueMarker.y = centerY;
					return GV.arena.rQueueMarker; 
				break;
				case 2: 
					GV.arena.gQueueMarker.visible = true; 
					GV.arena.gQueueMarker.x = centerX;
					GV.arena.gQueueMarker.y = centerY; 
					return GV.arena.gQueueMarker;
				break;
			}
			return null
		}

		public function clearQueueMarker(i:int):void{
			switch(i){
				case 0: GV.arena.bQueueMarker.visible = false; break;
				case 1: GV.arena.rQueueMarker.visible = false; break;
				case 2: GV.arena.gQueueMarker.visible = false; break;
			}
		}

		public function highlightTile():void{

			GV.arena.actionButtonHighlight.visible = true;
			var highlightCenterX:Number = centerX;
			var highlightCenterY:Number = centerY;
			if(GVP.options.condensedHUD && !GV.arena.isSafe){
				highlightCenterX*= 0.9;
				highlightCenterY*= 0.9;
			}

			GV.arena.actionButtonHighlight.x = GV.arena.backgroundContainer.x + highlightCenterX;
			GV.arena.actionButtonHighlight.y = GV.arena.backgroundContainer.y + highlightCenterY - 25;
			GV.s.juggler.removeTweens(GV.arena.actionButtonHighlight);
			GV.s.juggler.tween(GV.arena.actionButtonHighlight, 0.35, {
				transition: "SINE",
				reverse: true,
				repeatCount: 0,
				y: GV.arena.actionButtonHighlight.y - 10			
			});

			isForTutorial = true;
			baseTile.filter = colorMatrixFilter;
			GV.arena.backgroundContainer.flatten();
		}

		public function setTargetedAbilityPicture(id:int, showAnim:Boolean = true):void{
			if(!GV.arena.isSafe){
				var currPic = GV.arena.heroAbilTargetPics[id];
				GV.arena.aboveCombatantContainer.addChild(currPic);
				GV.arena.aboveCombatantContainer.setChildIndex(currPic, 3);
				currPic.x = centerX;
				currPic.y = centerY;
				currPic.scaleX = currPic.scaleY = 1;

				if(showAnim){				
					GV.s.juggler.tween(currPic, 0.25, {
					   	transition: Transitions.EASE_OUT,
					   	reverse: true,
					   	repeatCount: 2,
					   	scaleX: 1.5,
					   	scaleY: 1.5,
					   	onComplete: function():void{currPic.scaleX = currPic.scaleY = 1;}
					});
				}
			}
		}
	}
}