private var saveID:int = -1;
private var slots:Vector.<MovieClip> = new <MovieClip>[save.slot0, save.slot1, save.slot2]
private var descripText:Vector.<String> = new Vector.<String>();
public var so:SharedObject = SharedObject.getLocal("rageQuestSaveData");
private var stubSaveSlotText:String = "To start a game, or load a saved a game, press on one of the slots on the left, and then press the start button at the bottom.\n\nTo delete a saved a game, press on one of the slots on the left, and then press delete button at the bottom.";
private const MAX_SAVE_NUM:int = 3;
private var defaultSaveObject:Object;

private function initGameDataScreen(){
	titleScreen.startBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showSave(true);
	});	
	
	toggleBtn(save.startBtn, false);
	toggleBtn(save.deleteBtn, false);
	defaultSaveObject = GVP.getSaveObject();
	titleScreen.startBtn.visible = true;
	titleScreen.loading.visible = false;
	save.menuBtn.visible = false;	
}

public function writeFileToSteamCloud():Boolean {
	if(!GV.steamSignedIn) return false; 
	var dataOut:ByteArray = new ByteArray();
	dataOut.writeUTFBytes(JSON.stringify(so.data));
	return GV.steamworksServices.fileWrite('RageQuestSaveFile.txt', dataOut);
}

public function readFileFromSteamCloud():Object {
	if(!GV.steamSignedIn) return null; 
	var dataIn:ByteArray = new ByteArray();
	if (GV.steamworksServices.fileRead('RageQuestSaveFile.txt', dataIn)){		
		var jsonString:String = dataIn.readUTFBytes(dataIn.length);
		if(jsonString){
			return JSON.parse(jsonString);			
		}			
	}
	return null;
}

public function saveGame():void{
	so.data['saveObject' + saveID] =  GVP.getSaveObject();	
	so.flush();
	writeFileToSteamCloud();
}

private function loadGame():void{	

	var currData:Object = so.data['saveObject' + saveID];
	if(currData){
		GVP.loadGameFromObject(currData);
	}else{
		GVP.loadGameFromObject(defaultSaveObject);
	}	

	//testArena(); return; // Enable this line to load straight into the test arena.
	if(questData.reachTheOracle.wasStarted){
		showMap();	
	}else{
		if(GV.DESKTOP_MODE){
			showOptions(true);
		}else{
			showNarrative('intro');			
		}		
	}
}

private function deleteSave():void{
	so.data['saveObject' + saveID] = null;
	so.flush();
	writeFileToSteamCloud();
	showSave();	
}

private function showSave(readFromSteamCloud:Boolean = false):void{

	saveID = -1;
	clearHighlights();
	showNew(save);	

	var i:int;	

	if(readFromSteamCloud){
		var steamSaveObject:Object = readFileFromSteamCloud();		
		if(steamSaveObject){
			for(i = 0; i < slots.length; i++){
			if(!so.data['saveObject' + i]){ // If no local save file for this slot.
				so.data['saveObject' + i] = steamSaveObject['saveObject' + i]; // Then use the steam clouds version.
				}
			}		
		}
	}

	// Populate save slot data.
	for(i = 0; i < MAX_SAVE_NUM; i++){
		var loadObject:Object = so.data['saveObject' + i];
		if(loadObject){							
			descripText[i] = "HP: " + loadObject.stats.hp
			+ "\nAP: " + loadObject.stats.ap
			+ "\nPOW: " + loadObject.stats.pow
			+ "\nDEF: " + loadObject.stats.def
			+ "\n\nBitcoins: " + loadObject.stats.bitcoins
			+ "\nStat Points: " + loadObject.stats.statPoints
			+ "\nTotal Bitcoins Earned: " + loadObject.stats.totalBitcoinsEarned
			+ "\nTotal Stat Points Earned: " + loadObject.stats.totalStatPointsEarned
			+ "\n\nCurrent Main Quest: " + loadObject.stats.currentMainQuest
			+ "\nTime Played: " + msToHours(loadObject.stats.totalPlayTime);
			slots[i].timeText.text = loadObject.saveTime || "";
		}else{
			slots[i].timeText.text = "New Game";		
			descripText[i] = stubSaveSlotText;
		}
	}
}

private function clearHighlights(){
	save.saveSlotDescriptionText.text = stubSaveSlotText;
	for(var i:int = 0; i < slots.length; i++){
		slots[i].back.gotoAndStop(0);
	}
}

private function selectSlot(num){
	if(!save.areYouSure.visible){
		saveID = num;
		clearHighlights();
		slots[saveID].back.gotoAndStop('highlight');
		save.saveSlotDescriptionText.text = descripText[saveID];
		toggleBtn(save.startBtn, true);
		if(so.data['saveObject' + saveID]){
			toggleBtn(save.deleteBtn, true);
		}else{
			toggleBtn(save.deleteBtn, false);
		}
	}
}

private function initSave():void{

	save.saveSlotDescriptionText.text = stubSaveSlotText;

	slots[0].slotNameText.text = 'Slot 1';
	slots[1].slotNameText.text = 'Slot 2';
	slots[2].slotNameText.text = 'Slot 3';
	save.areYouSure.visible = false;

	slots[0].addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		selectSlot(0);
	});

	slots[1].addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		selectSlot(1);
	});

	slots[2].addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		selectSlot(2);
	});

	if(GV.IS_STEAM || !GV.IS_GOOGLE_PLAY || GV.playSignedIn) save.signInBtn.visible = false;
	save.signInBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(GV.playGamesServices) {
			GV.playGamesServices.signIn();
		} else{
			showNotice('Google Play Games service is not available');
		}
	});

	save.startBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(saveID >=0){		
			loadGame();
		}
	});

	save.deleteBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(saveID >=0) {
			save.areYouSure.visible = true;
		}
	});

	save.areYouSure.yesBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(saveID >=0) {
			deleteSave();			
		}
		save.areYouSure.visible = false;
	});

	save.areYouSure.noBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		save.areYouSure.visible = false;
	});
}