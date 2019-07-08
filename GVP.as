package classes {

	import flash.display.Stage
	import starling.core.Starling;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.display.NativeWindow;
	import flash.geom.*;

	public class GVP {
		
		private static const DESKTOP_MODE:Boolean = false;

		public static var stats:Object = {
			hp: 175,		
			ap: 10,
			pow: 20,
			def: 0,
			pauseDecrease: 0,
			pauseStock: 5,
			bitcoins: 0,
			totalBitcoinsEarned: 0,
			statPoints: 0,
			totalStatPointsEarned: 0,			
			currentMap: 0,			
			abilitiesBought: 0,
			currentMainQuest: 'None',
			totalPlayTime: 0,
			hasVisitedWorld: [false, false, false, false, false],
			participationAwardAchievement: false,
			virusProtectionAchievement: false,
			alphaAndOmegaAchievement: false,
			speakForMyselfAchievement: false,
			gameOverAchievement: false,
			snowdenWouldBeProudAchievement: false,
			justBeStrongerAchievement: false,
			justPeachyAchievement: false,
			attemptGooglePlaySignInOnStartUp: true
		}	

		public static var options:Object = {
			antiAliasing: DESKTOP_MODE ? 16 : 0,
			volumeSFX: 0.4,
			volumeBGM: 0.2,
			resolution: [1280, 720],
			fullscreen: 0,
			condensedHUD: DESKTOP_MODE ? 1 : 0,
			showPointers: 1
		}

		public static var notices:Object = {
			equipAbilItem: false,
			equipSwordShield: false,
			spendBitcoin: false,	
			firstEndOfBattle: true
		}

		public static var chestList:Object = {
			firstMap: {}
		}

		public static function getSaveObject():Object{
			var d:Date = new Date();
			var timeString:String = d.getFullYear() +'-' + d.getMonth() +'-' + d.getDate() + ' @ ' + d.getHours() + ':' + (d.getMinutes()<10?'0':'') + d.getMinutes();
			var saveObject:Object = {
				stats: stats,
				options: options,
				notices: notices,
				chestList: chestList,
				questData: GV.stage.questData,
				firstMapData: GV.stage.firstMapData,
				secondMapData: GV.stage.secondMapData,
				thirdMapData: GV.stage.thirdMapData,
				fourthMapData: GV.stage.fourthMapData,
				itemData: Assignables.itemData,
				equipmentData: Assignables.equipmentData,
				abilityData: Assignables.abilityData,
				statData: Stats.statData,
				saveTime: timeString
			}
			return saveObject;
		}

		public static function objectToArray(dataObject:Object):Vector.<Object>{		
			var a:Vector.<Object> = new Vector.<Object>;
			for(var propertyName:String in dataObject) {
				var e:Object = dataObject[propertyName];
				a.push(e);
			}
			return a;
		}

		public static function loadGameFromObject(loadObject:Object):void{						
			stats = loadObject.stats;
			options = loadObject.options;
			notices = loadObject.notices;
			chestList = loadObject.chestList;					
			GV.stage.questData = loadObject.questData;

			var prop:String;
			var mapDataArray:Array = [GV.stage.firstMapData, GV.stage.secondMapData, GV.stage.thirdMapData, GV.stage.fourthMapData];
			var loadedMapDataArray:Array = [loadObject.firstMapData, loadObject.secondMapData, loadObject.thirdMapData, loadObject.fourthMapData];

			for(var i:int = 0; i < mapDataArray.length; i++){
				for(prop in mapDataArray[i]){
					mapDataArray[i][prop].permalocked = loadedMapDataArray[i][prop].permalocked;
					mapDataArray[i][prop].locked = loadedMapDataArray[i][prop].locked;
					mapDataArray[i][prop].defeated = loadedMapDataArray[i][prop].defeated;
					mapDataArray[i][prop].sideQuestGoal = loadedMapDataArray[i][prop].sideQuestGoal;
					mapDataArray[i][prop].alreadyHadConversation = loadedMapDataArray[i][prop].alreadyHadConversation;
				}	
			}
			
			for(prop in loadObject.itemData){
				Assignables.itemData[prop].objectStatus = loadObject.itemData[prop].objectStatus;
				Assignables.itemData[prop].stock = loadObject.itemData[prop].stock;
			}
			
			for(prop in loadObject.equipmentData){
				Assignables.equipmentData[prop].objectStatus = loadObject.equipmentData[prop].objectStatus;
				Assignables.equipmentData[prop].stock = loadObject.equipmentData[prop].stock;
			}
			
			for(prop in loadObject.abilityData){
				Assignables.abilityData[prop].objectStatus = loadObject.abilityData[prop].objectStatus;
			}

			Stats.statData =  loadObject.statData;			

			GV.stage.reloadQuestDataAfterLoad();

			Assignables.items = objectToArray(Assignables.itemData);
			Assignables.abilities = objectToArray(Assignables.abilityData);
			Assignables.equipment = objectToArray(Assignables.equipmentData);
			Assignables.all = Assignables.items.concat(Assignables.abilities.concat(Assignables.equipment));			
			Stats.all = objectToArray(Stats.statData);
			Assignables.correctAbilityCosts();
			Assignables.updateItemCosts();

			GV.s.antiAliasing = options.antiAliasting;
			GV.sfx.volume = options.volumeSFX;
			GV.bgm.volume = options.volumeBGM;			
			FX.playMusic(FX.topMusic);
			correctWindowSize();
							
			if(stats.participationAwardAchievement){
				GV.participationAwardAchievement();
			}
			if(stats.virusProtectionAchievement){
				GV.virusProtectionAchievement();
			}
			if(stats.alphaAndOmegaAchievement){
				GV.alphaAndOmegaAchievement();
			}
			if(stats.speakForMyselfAchievement){
				GV.speakForMyselfAchievement();
			}
			if(stats.gameOverAchievement){
				GV.gameOverAchievement();
			}
			if(stats.snowdenWouldBeProudAchievement){
				GV.snowdenWouldBeProudAchievement();
			}
			if(stats.justBeStrongerAchievement){
				GV.justBeStrongerAchievement();
			}
			if(stats.justPeachyAchievement){
				GV.justPeachyAchievement();
			}
		}

		public static function setWindowSize(newWidth:int, newHeight:int):void{			
			var win:NativeWindow = GV.stage.stage.nativeWindow;
			win.bounds = new Rectangle(win.x, win.y, newWidth + GV.chromeWidth, newHeight + GV.chromeHeight);
		}

		public static function correctWindowSize():void{
			if(GV.DESKTOP_MODE){
				if(options.fullscreen){
					GV.stage.stage.nativeWindow.maximize();
				}else{
					if(options.resolution[0] > GV.stage.stage.fullScreenWidth || options.resolution[1] > GV.stage.stage.fullScreenHeight){
						options.resolution = [640, 360];
					}
					setWindowSize(options.resolution[0],options.resolution[1]);
				}
			}
		}
	}
}
