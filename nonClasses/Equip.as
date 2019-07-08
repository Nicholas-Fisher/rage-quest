private var equipCatSlots:Vector.<MovieClip> = new <MovieClip>[equip.catalogue.item0, equip.catalogue.item1, equip.catalogue.item2, equip.catalogue.item3, equip.catalogue.item4, equip.catalogue.item5, equip.catalogue.item6, equip.catalogue.item7, equip.catalogue.item8, equip.catalogue.item9];
private var abilSlotBtns:Vector.<MovieClip> = new <MovieClip>[

equip.abilityAssigner.red_0, equip.abilityAssigner.red_1, equip.abilityAssigner.red_2, equip.abilityAssigner.red_3, 
equip.abilityAssigner.blue_0, equip.abilityAssigner.blue_1, equip.abilityAssigner.blue_2, equip.abilityAssigner.blue_3, 
equip.abilityAssigner.green_0, equip.abilityAssigner.green_1, equip.abilityAssigner.green_2, equip.abilityAssigner.green_3

];

private var isQuickSwapShown:Boolean = false;
	
private var currSlotToAssignTo:String;

private var alreadyRanAssignableStuff:Boolean = false;

public function initEquip():void{

	equip.itemsAbilitiesBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showEquipUseable();
	});
	equip.weaponShieldBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		equip.backBtn.visible = true;
		showEquipCatalogue('equipment');
	});
	equip.abilityAssigner.equipAbilityBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		equip.backBtn.visible = true;
		showEquipCatalogue('abilities');
	});
	equip.abilityAssigner.equipItemBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		equip.backBtn.visible = true;
		showEquipCatalogue('items');
	});

	equip.catalogue.botScroll.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		currPage++;
		updateEquipCatSlots();
	});
	equip.catalogue.topScroll.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		currPage--;
		updateEquipCatSlots();
	});

	equip.abilityAssigner.quickSwapMenu.visible = false;
	equip.abilityAssigner.quickSwapInfo.visible = false;
	equip.abilityAssigner.quickSwapBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if (isQuickSwapShown){			
			equip.abilityAssigner.abilityInfo.visible = true;
			equip.abilityAssigner.equipAbilityBtn.visible = true;
			equip.abilityAssigner.equipItemBtn.visible = true;
			equip.abilityAssigner.quickSwapMenu.visible = false;
			equip.abilityAssigner.quickSwapInfo.visible = false;
		} else {
			equip.abilityAssigner.abilityInfo.visible = false;
			equip.abilityAssigner.equipAbilityBtn.visible = false;
			equip.abilityAssigner.equipItemBtn.visible = false;
			equip.abilityAssigner.quickSwapMenu.visible = true;
			equip.abilityAssigner.quickSwapInfo.visible = true;
		}
		isQuickSwapShown = !isQuickSwapShown;
	});	

	var i:int;

	for(i = 0; i < equipCatSlots.length; i++) {
		equipCatSlots[i].gameNameText.mouseEnabled = false;
		equipCatSlots[i].stockText.mouseEnabled = false;
		equipCatSlots[i].icon.mouseEnabled = false;
		equipCatSlots[i].amountText.mouseEnabled = false;
		equipCatSlots[i].amountText.textColor = 0xFFFFFF;
		equipCatSlots[i].amountText.background = true;
		equipCatSlots[i].catSlotBox.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
			FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			equip.catalogue.errorText.text = "";
			for(var j:int = 0, jlen:int = equipCatSlots.length; j < jlen; j++){
				equipCatSlots[j].catSlotBox.gotoAndStop(0);
				if(equipCatSlots[j].catSlotBox == e.target){
					currentSelectionInfo = thingsToChooseFrom[j + (currPage - 1)*(equipCatSlots.length)];
				}
			}
			e.target.gotoAndStop('highlight');
			toggleBtn(equip.catalogue.infoBtn, true);
		});
	}

	for(i = 0; i < abilSlotBtns.length; i++){
		abilSlotBtns[i].mouseChildren = false;
		abilSlotBtns[i].equipStock.visible = false;
		abilSlotBtns[i].equipAp.visible = false;
		abilSlotBtns[i].addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
			toggleBtn(equip.abilityAssigner.equipAbilityBtn, true);
			toggleBtn(equip.abilityAssigner.equipItemBtn, true);
			equip.abilityAssigner.quickSwapMenu.alpha = 1;
			currSlotToAssignTo = e.target.name;
			clearAbilityAssignerHiglights();
			e.target.btn.gotoAndStop('highlight');
			var statusStr:String = convertBtnNameToSlot(currSlotToAssignTo);
			var o:Object = Assignables.returnObjectInSlot(statusStr);
			equip.abilityAssigner.abilityInfo.text = o ? infoText(o) : 'Each color can have up to four actions (abilities/items) assigned to it. Press on a slot on the left to assign an action to it. The action assigned to the first column will be the default action for that color. Any action can be assigned or reassigned to any slot. There is no benefit to having empty slots, so you might as well assign something to every slot if you can.';
		});
	}


	equip.catalogue.equipBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(currentSelectionInfo){
			var statusStr:String;
			if(currentSelectionInfo.classification){ // If it has a dragon bones position then we're dealing with a weapon or shield
				if(currentSelectionInfo.classification == 'weapon'){
					statusStr = 'equipped:weapon';
				}else{
					statusStr = 'equipped:shield';
				}
			}else{
				statusStr = convertBtnNameToSlot(currSlotToAssignTo);
			}
			var oldObjectInSlot:Object = Assignables.returnObjectInSlot(statusStr);
			
			// If this is not for equipment.
			if(oldObjectInSlot){
				if(!currentSelectionInfo.classification && oldObjectInSlot.objectStatus != null && currentSelectionInfo.objectStatus != null){
					oldObjectInSlot.objectStatus = currentSelectionInfo.objectStatus; // Swap old ability position with new ability position.
				}else{
					oldObjectInSlot.objectStatus = 'not_assigned'; // Removing the object that used to occupy this slot.
				}
			}

			currentSelectionInfo.objectStatus = statusStr;
			goBack();
			GV.stage.saveGame();
		}
	});
	
	equip.menuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showMenu();
	});
	equip.backBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		goBack();
	});
	equip.catalogue.infoBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showEquipInfo();
	});

	equip.backBtn.visible = false;
}

private function showEquipUseable():void{
	equip.backBtn.visible = true;
	equip.abilityAssigner.visible = true;
	toggleBtn(equip.abilityAssigner.equipAbilityBtn, false);
	toggleBtn(equip.abilityAssigner.equipItemBtn, false);
	equip.abilityAssigner.quickSwapMenu.alpha = 0.5;
	currSlotToAssignTo = null;
	updateAbilityAssigner();
	clearAbilityAssignerHiglights();
}

private function goBack():void{
		if(equip.info.visible){ // info -> catalogue
			equip.info.visible = false;
		}else if(equip.catalogue.visible){
			if(catType == 'equipment'){ // sword shield catalogue -> menu
					equip.backBtn.visible = false;
				}else{ // catalogue -> abilityAssigner
					updateAbilityAssigner();
				}
				equip.catalogue.visible = false;
		}else{ // abilityAssigner -> menu
			equip.abilityAssigner.visible = false;
			equip.backBtn.visible = false;
		}
}
private function clearAbilityAssignerHiglights():void{
	for(var i:int = 0, ilen:int = abilSlotBtns.length; i < ilen; i++){
		abilSlotBtns[i].btn.gotoAndStop(0);
	}
}

private function convertBtnNameToSlot(n:String):String{
	var s:Array = n.split('_');
	return s[0] + ':' + s[1];
}

private function updateAbilityAssigner():void{
	for(var i:int = 0, ilen:int = abilSlotBtns.length; i < ilen; i++){
		var statusStr:String = convertBtnNameToSlot(abilSlotBtns[i].name);
		var o:Object = Assignables.returnObjectInSlot(statusStr);
		abilSlotBtns[i].icon.gotoAndStop(0);
		abilSlotBtns[i].equipStock.visible = false;
		abilSlotBtns[i].equipAp.visible = false;
		if(o){
			abilSlotBtns[i].icon.gotoAndStop(o.pic);
			if(o.stock){
				abilSlotBtns[i].equipStock.visible = true;
				abilSlotBtns[i].equipStock.stockText.text = o.stock;
			}
			if(o.ap){
				abilSlotBtns[i].equipAp.visible = true;
				abilSlotBtns[i].equipAp.apText.text = o.ap;
			}
		}
	}
	equip.abilityAssigner.abilityInfo.text = 'Each color can have up to four actions (abilities/items) assigned to it. Press on a slot on the left to assign an action to it. The action assigned to the first column will be the default action for that color. Any action can be assigned or reassigned to any slot. There is no benefit to having empty slots, so you might as well assign something to every slot if you can.'
}

public function showEquip():void{
	equip.abilityAssigner.visible = false;
	equip.catalogue.visible = false;
	equip.info.visible = false;
	equip.backBtn.visible = false;
	initAssignableStuff();

	var itemsList:Vector.<Object> = Assignables.items;
	var abilitiesList:Vector.<Object> = Assignables.abilities;

	var i:int;
	var currBtn;

	for(i = 0; i < itemsList.length; i++) {
		currBtn = equip.abilityAssigner.quickSwapMenu['a' + i];
		if (currBtn) {
			currBtn.icon.visible = showIconForItemBtn(i);
		}
	}

	for(i = 0; i < abilitiesList.length; i++) {
		currBtn = equip.abilityAssigner.quickSwapMenu['i' + i];
		if (currBtn) {
			currBtn.icon.visible = showIconForAbilityBtn(i);
		}
	}

	showNew(equip);
}

public function initAssignableStuff():void{

	if(alreadyRanAssignableStuff) return;
	alreadyRanAssignableStuff = true;

	var itemsList:Vector.<Object> = Assignables.items;
	var abilitiesList:Vector.<Object> = Assignables.abilities;

	var i:int;	
	var currBtn;

	for(i = 0; i < abilitiesList.length; i++){

		currBtn = equip.abilityAssigner.quickSwapMenu['i' + i];		
		currBtn.icon.mouseEnabled = false;		
		currBtn.icon.mouseChildren = false;	
		currBtn.icon.gotoAndStop(getAbilityByStoreOrder(i).pic);														
		currBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {		
			if(currSlotToAssignTo){								
				var currobj:Object = getAbilityByStoreOrder(int(e.target.name.substring(1, e.target.name.length)));				
				if (!currobj.objectStatus) return; // Ability not acquired yet.
				FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				var statusStr:String = convertBtnNameToSlot(currSlotToAssignTo);
				var oldObjectInSlot:Object = Assignables.returnObjectInSlot(statusStr);							
				if(oldObjectInSlot){
					if(!currobj.classification && oldObjectInSlot.objectStatus != null && currobj.objectStatus != null){
						oldObjectInSlot.objectStatus = currobj.objectStatus; // Swap old ability position with new ability position.
					}else{
						oldObjectInSlot.objectStatus = 'not_assigned'; // Removing the object that used to occupy this slot.
					}
				}				
				currobj.objectStatus = statusStr;
				updateAbilityAssigner();
				GV.stage.saveGame();
			}
		});
	}


	for(i = 0; i < itemsList.length; i++){

		currBtn = equip.abilityAssigner.quickSwapMenu['a' + i];		
		currBtn.icon.mouseEnabled = false;
		currBtn.icon.mouseChildren = false;
		currBtn.icon.gotoAndStop(getItemByStoreOrder(i).pic);														
		currBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {		
			if(currSlotToAssignTo){								
				var currobj:Object = getItemByStoreOrder(Number(e.target.name.substring(1, e.target.name.length)));				
				if (!currobj.stock > 0) return; // Item not in stock.
				FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				var statusStr:String = convertBtnNameToSlot(currSlotToAssignTo);
				var oldObjectInSlot:Object = Assignables.returnObjectInSlot(statusStr);							
				if(oldObjectInSlot){
					if(!currobj.classification && oldObjectInSlot.objectStatus != null && currobj.objectStatus != null){
						oldObjectInSlot.objectStatus = currobj.objectStatus; // Swap old ability position with new ability position.
					}else{
						oldObjectInSlot.objectStatus = 'not_assigned'; // Removing the object that used to occupy this slot.
					}
				}				
				currobj.objectStatus = statusStr;
				updateAbilityAssigner();
				GV.stage.saveGame();
			}
		});
	}	
}

public function getItemByStoreOrder(n:int):Object {
	var itemsList:Vector.<Object> = Assignables.items;
	var i:int
	for(i = 0; i < itemsList.length; i++) {		
		if(itemsList[i].storeOrder === n){
			return itemsList[i];
		}
	}	
	return null;	
}

public function getAbilityByStoreOrder(n:int):Object {
	var abilitiesList:Vector.<Object> = Assignables.abilities;
	var i:int
	for(i = 0; i < abilitiesList.length; i++) {		
		if(abilitiesList[i].storeOrder === n){
			return abilitiesList[i];
		}
	}	
	return null;	
}

public function showIconForItemBtn(n:int):Boolean {
	return getItemByStoreOrder(n).stock > 0;
}

public function showIconForAbilityBtn(n:int):Boolean {
	return Boolean(getAbilityByStoreOrder(n).objectStatus);
}


public function showEquipInfo():void{
	equip.info.visible = true;
	equip.info.icon.gotoAndStop(currentSelectionInfo.pic); 
	equip.info.itemNameText.text = currentSelectionInfo.gameName;
	equip.info.itemDescriptionText.text = currentSelectionInfo.description;
	equip.info.itemStatsText.text = infoText(currentSelectionInfo);
	if(currentSelectionInfo.classification){
		equip.info.infoGfx.visible = false;
	}else{
		equip.info.infoGfx.visible = true;
		equip.info.infoGfx.rangeGfx.showRange(true, currentSelectionInfo.effects, currentSelectionInfo.abilitySelectType, currentSelectionInfo.abilityRange, currentSelectionInfo.selfTargeting);
		equip.info.infoGfx.aoeGfx.showRange(false, currentSelectionInfo.effects, currentSelectionInfo.effectSelectType, currentSelectionInfo.effectRange, currentSelectionInfo.selfTargeting);
	}
}

public function showEquipCatalogue(_catType:String){
	currPage = 1;
	catType = _catType;

	updateEquipCatSlots();
	
	for(var j:int = 0, jlen:int = equipCatSlots.length; j < jlen; j++){
		equipCatSlots[j].catSlotBox.gotoAndStop(0);
	}

	if(currSlotToAssignTo){
		var a:Array = currSlotToAssignTo.split('_');
		equip.catalogue.slotText.text = 'Equipping to ' + a[0].toUpperCase() + ' at slot ' + (Number(a[1]) + 1);
	}else{
		equip.catalogue.slotText.text = '';
	}

	currentSelectionInfo = null;
	equip.catalogue.errorText.text = '';
	equip.catalogue.visible = true;
	equip.catalogue.topScroll.visible = false;
	equip.catalogue.botScroll.visible = (thingsToChooseFrom.length > equipCatSlots.length);
	toggleBtn(equip.catalogue.infoBtn, false);

}

private function updatePaginationStuffEquip():void{
	equip.catalogue.currPageText.text = 'Pg. ' + currPage;
	equip.catalogue.botScroll.pageText.text = 'Pg. ' + (currPage + 1);
	equip.catalogue.topScroll.pageText.text = 'Pg. ' + (currPage - 1);
	equip.catalogue.currPageText.visible = (thingsToChooseFrom.length > equipCatSlots.length);
	equip.catalogue.topScroll.visible = (currPage > 1);
	equip.catalogue.botScroll.visible = (thingsToChooseFrom.length > currPage*equipCatSlots.length);
}

private function updateEquipCatSlots():void{

	thingsToChooseFrom = Assignables.equippable(catType);

	if(currPage >= 2){ // For all pages except the first.
		if(thingsToChooseFrom.length <= equipCatSlots.length*(currPage-1)){
			currPage--;
		}
	}else{ // For the first page.
		if(thingsToChooseFrom.length <= equipCatSlots.length){
			equip.catalogue.topScroll.visible = false;
			equip.catalogue.botScroll.visible = false;
		}
	}
	updatePaginationStuffEquip();

	if(catType != 'abilities'){
 		equip.catalogue.stockSymbol1.text = '#'
 		equip.catalogue.stockSymbol2.text = '#'
	}else{
		equip.catalogue.stockSymbol1.text = ''
		equip.catalogue.stockSymbol2.text = ''
	}

	var i:int;

	for(i = 0; i < equipCatSlots.length; i++){ //startnum
		equipCatSlots[i].amountText.text = '';
		equipCatSlots[i].amountText.backgroundColor = 0xFFFFFF;
		equipCatSlots[i].visible = false;
	}
	if(thingsToChooseFrom && thingsToChooseFrom.length > 0){	
		sortThings();
		var startingIndex:int = (currPage - 1)*(equipCatSlots.length);
		var maxj:int = Math.min(thingsToChooseFrom.length, equipCatSlots.length + startingIndex);
		for(var j:int = startingIndex; j < maxj; j++){

			i = j - startingIndex;
			equipCatSlots[i].visible = true;
			equipCatSlots[i].catSlotBox.mouseEnabled = true;
			equipCatSlots[i].gameNameText.text = thingsToChooseFrom[j].gameName;
			equipCatSlots[i].icon.gotoAndStop(thingsToChooseFrom[j].pic); 

			var s:String = thingsToChooseFrom[j].objectStatus;
			if(s != 'not_assigned'){
				var sArray:Array = s.split(':');
				if(sArray[0] == 'equipped'){
					equipCatSlots[i].amountText.text = 'E';
					equipCatSlots[i].amountText.backgroundColor = 0xBBBBBB;
				}else{
					var sColor:String = sArray[0];
					var sIndex:String = (int(sArray[1]) + 1).toString();
					if(sIndex) equipCatSlots[i].amountText.text = sIndex;
					switch(sColor){
						case 'blue': equipCatSlots[i].amountText.backgroundColor = 0x55CCCC; break;
						case 'red': equipCatSlots[i].amountText.backgroundColor = 0xCC5555; break;
						case 'green': equipCatSlots[i].amountText.backgroundColor = 0x55CC55; break;
					}
				}
			}else{
				equipCatSlots[i].amountText.text = '';
			}
			equipCatSlots[i].stockText.text = thingsToChooseFrom[j].stock ? thingsToChooseFrom[j].stock : '-';
		}
	}
}