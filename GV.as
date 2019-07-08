package classes {

	import starling.core.Starling;
	import flash.media.SoundTransform;
	import flash.display.Sprite;
	
	import com.grumpycarrot.ane.playgameservices.PlayGamesServices;	
	import com.amanitadesign.steam.FRESteamWorks;

	public class GV
 	{
		// Don't forget to check Desktop Mode in GVP.

 		// Windows/Mac Desktop Steam
 		// public static const DESKTOP_MODE:Boolean = true; public static const IS_GOOGLE_PLAY:Boolean = false; public static const IS_STEAM:Boolean = true;

		// Android
 		// public static const DESKTOP_MODE:Boolean = false; public static const IS_GOOGLE_PLAY:Boolean = true; public static const IS_STEAM:Boolean = false;
 		
 		// iOS and Amazon
 		public static const DESKTOP_MODE:Boolean = false; public static const IS_GOOGLE_PLAY:Boolean = false; public static const IS_STEAM:Boolean = false;

 		public static const TEST_MODE:Boolean = false;
 		public static const IS_DEMO:Boolean = false;
 		public static const AUDIO_START_TIME:int = 0; 		
 		public static const VERSION:String = 'v1.1.20';
		public static const ONE_SHOT_ABILS = true;
		public static const BAR_FRAMES:int = 200; // Num of frames every bar uses.
		public static const SLOT_NUM:int = 3; // Number of abilities per character.
		public static const BTN_RADIUS:Number = 58.25;		

		public static const TILE_X:int = 6;
		public static const TILE_Y:int = 5;
		public static const TILE_WIDTH:int = 147;
		public static const TILE_HEIGHT:int = 117;

		public static const STS_GREEN:uint = 0x338833;
		public static const STS_RED:uint = 0x883333;
		public static const STS_NEUTRAL:uint = 0x555555;

		public static const MAX_OBJECT_NUM:int = 6; // combatants/summons and items.
		public static const MAX_ENEMY_NUM:int = 5;
		public static const MAX_STOCK_NUM:int = 9;
		public static const MARKER_ALPHA:Number = 0.65;
		public static const CRITICAL_DAMAGE_CHANCE:Number = 0.075; // Out of 1.

		public static const FONT_1:String = 'Orbitron';
		public static const FONT_2:String = 'Roboto';

		public static const HUD_FONT_SIZE:int = 25;
		public static const EFFECTTHRESHOLD:int = 5; // Ff an effect number is higher than this, then it's an item.
		public static const ABIL_BUFFER:int = 500;
		public static const SURFACE_SPRITESHEET:int = 0;
		public static const HUD_SPRITESHEET:int = 1;
		public static const COMBATANT_SPRITESHEET:int = 2;
		public static const ABOVE_ALL_SPRITESHEET:int = 3;
		public static const BOSS1_SPRITESHEET:int = 4;
		public static const BOSS2_SPRITESHEET:int = 5;
		public static const BOSS3_SPRITESHEET:int = 6;
		public static const BOSS4_SPRITESHEET:int = 7;
		public static const PIT_SPRITESHEET:int = 8;
		public static const HIVE_SPRITESHEET:int = 9;
		public static const BASTION_SPRITESHEET:int = 10;

		public static var playGamesServices:PlayGamesServices;
		public static var steamworksServices:FRESteamWorks;
		public static var playSignedIn:Boolean = false;
		public static var steamSignedIn:Boolean = false;
		public static var sfx:SoundTransform = new SoundTransform(GVP.options.volumeSFX); 
		public static var bgm:SoundTransform = new SoundTransform(GVP.options.volumeBGM);		

		// Conditions
		public static const PROTECTION = 1;
		public static const TIME_OUT = 2;

		// Specials
		public static const ADBLOCK = 1;
		public static const HACK_AP_REDUCTION = 4;
		public static const FLAMER_POW_REDUCTION = 6;
		
		public static var chromeHeight:int = 0;
		public static var chromeWidth:int = 0;
		public static var arena:Arena;
		public static var fc:Sprite;
		public static var stage:Main;
		public static var scale:Number = 1;
		public static var sc:SC;
		public static var s:Starling;
		public static var hero:Hero;

		public static var _timeSinceLastFrame:Number = 0;
		public static var tick:Number = 0;
		public static var speedFactor:Number = 0;
		public static var gameSpeedMultiplier:int = 1;
		public static function get timeSinceLastFrame():Number{return _timeSinceLastFrame;}

		public static function set timeSinceLastFrame(x:Number):void{
			_timeSinceLastFrame = x;
			speedFactor = (_timeSinceLastFrame/16.7);
			tick = _timeSinceLastFrame/(1000/gameSpeedMultiplier);
		}
		public static function showMap():void{
			stage.showMap();
		}
		public static function narIntroPart2():void{
			participationAwardAchievement();
			stage.showNarrative('intro_part_2');
		}
		public static function narEnding():void{
			justBeStrongerAchievement();
			stage.showNarrative('ending');
		}
		public static function narIntroHive():void{
			stage.showNarrative('intro_hive');
		}
		public static function narIntroPit():void{
			stage.showNarrative('intro_pit');
		}
		public static function narIntroBastion():void{
			stage.showNarrative('intro_bastion');
		}
		public static function narIntroCore():void{
			stage.showNarrative('intro_core');
		}
		public static function quickOpenS1in0():void{
			stage.quickOpenArena(0, 's1');
		}
		public static function quickOpenS2in0():void{
			stage.quickOpenArena(0, 's2');
		}
		public static function permaLock61in0():void{
			stage.permaLock(0, 'a6_1');
		}	
		public static function narDemoEnding():void{
			stage.showNotice("This concludes the demo. Purchase the full version of Rage Quest to complete Zye's journey!");
		}

		// Achievements
		public static function participationAwardAchievement():void{
			GVP.stats.participationAwardAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('ParticipationAward'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQAA'); }
		}
		public static function virusProtectionAchievement():void{
			GVP.stats.virusProtectionAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('VirusProtection'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQAQ'); }
		}
		public static function alphaAndOmegaAchievement():void{
			GVP.stats.alphaAndOmegaAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('TheAlphaAndOmega'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQBg'); }
		}
		public static function speakForMyselfAchievement():void{
			GVP.stats.speakForMyselfAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('IllSpeakForMyself'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQAg'); }
		}
		public static function gameOverAchievement():void{
			GVP.stats.gameOverAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('GameOver'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQAw'); }
		}
		public static function snowdenWouldBeProudAchievement():void{
			GVP.stats.snowdenWouldBeProudAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('SnowdenWouldBeProud'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQBA'); }
		}
		public static function justBeStrongerAchievement():void{
			GVP.stats.justBeStrongerAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('JustBeStronger'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQBQ'); }
		}
		public static function justPeachyAchievement():void{
			GVP.stats.justPeachyAchievement = true; 
			if(steamSignedIn){ steamworksServices.setAchievement('JustPeachy'); }
			if(playSignedIn){ playGamesServices.achievements.unlockAchievement('CgkI0o_jpJIOEAIQCQ'); }
		}		
		
		public static function showAchievements():void {
			if(playSignedIn){			
				playGamesServices.achievements.showAchievements();		
			};
		}

		public static function getBackgroundSpriteSheet():int{
			switch(GVP.stats.currentMap) {
				case 0: return SURFACE_SPRITESHEET; break;
				case 1: return HIVE_SPRITESHEET; break;
				case 2: return PIT_SPRITESHEET; break;
				case 3: return BASTION_SPRITESHEET; break;
			}
			return -1;		
		}

		public static function unlock71in1():void{
			alphaAndOmegaAchievement();
			stage.unlockArena(1, 'a7_1');
		}
		public static function unlock73in0():void{stage.unlockArena(0, 'a7_3');}
		public static function unlock62in0():void{stage.unlockArena(0, 'a6_2');}
		public static function unlock32in2():void{stage.unlockArena(2, 'a3_2');}
		public static function unlock83in2():void{stage.unlockArena(2, 'a8_3');}
		public static function unlock61in3():void{stage.unlockArena(3, 'a6_1');}
		public static function unlock81in3():void{stage.unlockArena(3, 'a8_1');}
		public static function unlock91in3():void{stage.unlockArena(3, 'a9_1');}		

		public static function addAdBlockSummon():void{
			var str:String = Assignables.abilityData.summonAdBlockAbil.objectStatus;
			if(!str) Assignables.abilityData.summonAdBlockAbil.objectStatus = 'not_assigned';
			Assignables.changeStock(Assignables.equipmentData.adBlockShield, 1)
		}
		public static function addCourageSummon():void{
			var str:String = Assignables.abilityData.summonCourageAbil.objectStatus;
			if(!str) Assignables.abilityData.summonCourageAbil.objectStatus = 'not_assigned';
		}	
		public static function addTwitchChatSummon():void{
			var str:String = Assignables.abilityData.summonTwitchChatAbil.objectStatus;
			if(!str) Assignables.abilityData.summonTwitchChatAbil.objectStatus = 'not_assigned';			
		}	
		public static function add300BitCoin():void{
			GVP.stats.bitcoins += 300;
		}	
		public static function add750BitCoin():void{
			GVP.stats.bitcoins += 750;
		}	
		public static function addAdBlockShield():void{
			Assignables.changeStock(Assignables.equipmentData.adBlockShield, 1)
		}
		
		public static function statsAssigner(className:String, lvl:int):Object{
			
			var ret: Object = { hp: 0, pow: 0, def: 0, rewardPoints: Math.round(30 * (1 + lvl / 2)) };

			ret.hp = 20 + lvl*15;
			ret.pow = 10 + lvl*5;
			ret.def = -1 + 1*lvl;
			
		    switch(className){
				
				//Misc
		        case 'ZipChest':
					ret.hp = 1;
					ret.pow = 0;
					ret.def = 0;
					ret.rewardPoints = 0;
				break;
		        case 'Conversationalist':
					ret.hp = 999;
					ret.pow = 0;
					ret.def = 10000;
					ret.rewardPoints = 0;
				break;
		        case 'TrainingDummy':
					ret.hp = 9000;
					ret.pow = 0;
					ret.def = 0;
					ret.rewardPoints = 0;
				break;

				//Bosses
		        case 'Malphaware':
					ret.hp = 400;
					ret.pow = 30;
					ret.def = 0;
					ret.rewardPoints = 300;
				break;
		        case 'CorruptedMalware':
					ret.hp = 100;
					ret.pow = 15;
					ret.def = 0;
					ret.rewardPoints = 5;
				break;
		        case 'HiveMind':
					ret.hp = 500;
					ret.pow = 50;
					ret.def = 10;
					ret.rewardPoints = 600;
				break;
		        case 'Mobling':
					ret.hp = 1;
					ret.pow = 35;
					ret.def = 0;
					ret.rewardPoints = 5;
				break;
		        case 'AlphaWolf':
					ret.hp = 300;
					ret.pow = 40;
					ret.def = 0;
					ret.rewardPoints = 200;
				break;
		        case 'OmegaPenguin':
					ret.hp = 200;
					ret.pow = 30;
					ret.def = 0;
					ret.rewardPoints = 200;
				break;
				case 'TwitchChatEnemy':
					ret.hp = 200;
					ret.pow = 40;
					ret.def = 0;
					ret.rewardPoints = 400;
				break;
				case 'Gamergate':
					ret.hp = 700;
					ret.pow = 60;
					ret.def = 20;
					ret.rewardPoints = 1500;
				break;
				case 'PRISM':
					ret.hp = 950;
					ret.pow = 80;
					ret.def = 30;
					ret.rewardPoints = 2500;
				break;
				case 'HateVirus':
					ret.hp = 999;
					ret.pow = 100;
					ret.def = 50;
					ret.rewardPoints = 0;
				break;
				case 'Hate':
					ret.hp = 20;
					ret.pow = 7;
					ret.def = 0;
					ret.rewardPoints = 0;
				break;

				//Summons
		        case 'TwitchChat':
					ret.hp = Math.round(GVP.stats.hp/1.5)
					ret.pow = GVP.stats.pow;
					ret.def = GVP.stats.def;
				break;
		        case 'CourageWolf':
					ret.hp = Math.round(GVP.stats.hp/1.5)
					ret.pow = GVP.stats.pow;
					ret.def = GVP.stats.def;
				break;
		        case 'AdBlock':
					ret.hp = Math.round(GVP.stats.hp/1.5);
					ret.pow = GVP.stats.pow;
					ret.def = GVP.stats.def;
				break;
		        case 'AdBlockEnemy':
					ret.hp = 100;
					ret.pow = 25;
					ret.def = 10;
					ret.rewardPoints = 3;
				break;
		        case 'ClickBait':
					ret.hp = 999;
					ret.pow = GVP.stats.pow;
					ret.def = 0;
				break;

				//Simple
		        case 'Wall':
					ret.hp = 999;
					ret.pow = GVP.stats.pow;
					ret.def = 999;
				break;
		        case 'TimeBomb':
					ret.hp = 999;
					ret.pow = GVP.stats.pow;
					ret.def = 999;
				break;
		        case 'Trap':
					ret.hp = 999;
					ret.pow = 30*lvl;
					ret.def = 999;
				break;
		        case 'GenericTarget':
					ret.hp = 500*lvl;
					ret.pow = 0;
					ret.def = 0;
				break;

				//Enemies
		        case 'InsanityWolf':
					ret.hp = 25 + lvl*15;
					ret.pow = 12 + lvl*7;
					ret.def = -1 + Math.round(0.5*lvl);
				break;
				case 'Bloatware':
					ret.hp = 20 + lvl*20;
					ret.def = -1 + Math.round(1.5*lvl);
				break;
		        case 'Spambot':
		        	ret.pow = 12 + lvl*3;
					ret.hp = 17 + lvl*13;
				break;
				case 'Judgment':
					ret.pow = 12 + lvl*3;
					ret.hp = 23 + lvl*12;
				break;
				case 'Scumbag':
					ret.pow = 12 + lvl*3;
					ret.hp = 23 + lvl*12;
				break;
				case 'Penguin':
					ret.pow = 12 + lvl*3;
					ret.hp = 19 + lvl*11;
				break;
				case 'Flamer':
					ret.hp = 20 + lvl*15;
					ret.pow = GV.arena && GV.arena.specialCheck(GV.FLAMER_POW_REDUCTION) ? 8 + lvl*4 : 10 + lvl*5;
				break;
				case 'Troll':
					ret.hp = 20 + lvl*10;
					ret.pow = 5 + Math.round(lvl*2.5);
				break;
				case 'Hacker':
					ret.hp = 15 + lvl*10;
					ret.def = -1 + Math.round(0.25*lvl);		
				break;
				case 'FakeNews':
					ret.hp = 20 + lvl*15;
					ret.pow = 24 + lvl*9;		
				break;
				case 'Censor':
					ret.pow = 12 + lvl*7;		
				break;
			}
			ret.pow = Math.round(ret.pow * 1); // It was 0.85 before.
			return ret;
		}
	}
}