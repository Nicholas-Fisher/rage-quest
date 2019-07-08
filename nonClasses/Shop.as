private var shopCatSlots:Vector.<MovieClip> = new <MovieClip>[shop.catalogue.item0, shop.catalogue.item1, shop.catalogue.item2, shop.catalogue.item3, shop.catalogue.item4, shop.catalogue.item5, shop.catalogue.item6, shop.catalogue.item7, shop.catalogue.item8, shop.catalogue.item9];

public function initShop():void{

	shop.catalogue.currencySymbols.stop();

	shop.backBtn.visible = false;

	shop.buyMenuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		shop.backBtn.visible = true;
		shop.buyMenu.visible = true;
		shop.catalogue.buySellBtn.gotoAndStop(1);
	});
	shop.sellMenuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		shop.backBtn.visible = true;
		shop.catalogue.buySellBtn.gotoAndStop(2);
		showShopCatalogue('sell');

	});
	shop.buyMenu.itemsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShopCatalogue('items');
	});
	shop.buyMenu.abilitiesBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShopCatalogue('abilities');
	});
	shop.buyMenu.statsBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShopCatalogue('stats');
	});
	shop.buyMenu.equipmentBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShopCatalogue('equipment');
	});

	shop.catalogue.botScroll.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		currPage++;
		updateshopCatSlots();
	});
	shop.catalogue.topScroll.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		currPage--;
		updateshopCatSlots();
	});

	for(var i:int = 0, ilen:int = shopCatSlots.length; i < ilen; i++){
		shopCatSlots[i].gameNameText.mouseEnabled = false;
		shopCatSlots[i].stockText.mouseEnabled = false;
		shopCatSlots[i].amountText.mouseEnabled = false;
		shopCatSlots[i].icon.mouseEnabled = false;
		shopCatSlots[i].catSlotBox.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
			FX.btnClick.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			shop.catalogue.errorText.text = "";
			for(var j:int = 0, jlen:int = shopCatSlots.length; j < jlen; j++){
				shopCatSlots[j].catSlotBox.gotoAndStop(0);
				if(shopCatSlots[j].catSlotBox == e.target){
					currentSelectionInfo = thingsToChooseFrom[j + (currPage - 1)*(shopCatSlots.length)];
				}
			}
			e.target.gotoAndStop('highlight');
			toggleBtn(shop.catalogue.infoBtn, true);
			toggleBtn(shop.catalogue.buySellBtn, true);
		});
	}
	shop.catalogue.buySellBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		if(currentSelectionInfo){
			if(shop.catalogue.buySellBtn.currentFrame == 1){ // Buy		
				completeBuyTransaction();
			}else{ // Sell
				completeSellTransaction();
			}
			GV.stage.saveGame();
		}
	});
	
	shop.menuBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showMenu();
		currentSelectionInfo = null;
	});

	shop.backBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		shop.stats.visible = false;
		shop.catalogue.infoBtn.visible = true;
		if(shop.info.visible){
			shop.info.visible = false;
		}else if(shop.catalogue.visible){
			shop.catalogue.visible = false;
		}else{
			shop.backBtn.visible = false;
			shop.buyMenu.visible = false;
		}
	});
	shop.catalogue.infoBtn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
		showShopInfo();
	});
}

public function showShop():void{
	shop.stats.visible = false;
	shop.buyMenu.visible = false;
	shop.catalogue.visible = false;
	shop.info.visible = false;
	shop.backBtn.visible = false;
	showNew(shop);
}

public function showShopInfo():void{
	shop.info.visible = true;
	shop.info.icon.gotoAndStop(currentSelectionInfo.pic); 
	shop.info.itemNameText.text = currentSelectionInfo.gameName;
	shop.info.itemDescriptionText.text = currentSelectionInfo.description;
	shop.info.itemStatsText.text = infoText(currentSelectionInfo);
	shop.info.infoGfx.rangeGfx.showRange(true, currentSelectionInfo.effects, currentSelectionInfo.abilitySelectType, currentSelectionInfo.abilityRange, currentSelectionInfo.selfTargeting);
	shop.info.infoGfx.aoeGfx.showRange(false, currentSelectionInfo.effects, currentSelectionInfo.effectSelectType, currentSelectionInfo.effectRange, currentSelectionInfo.selfTargeting);
}

public function showShopCatalogue(_catType:String){
	currPage = 1;
	catType = _catType;
	shop.stats.visible = catType == 'stats';
	shop.backBtn.visible = true;
	shop.catalogue.infoBtn.visible = true;

	updateshopCatSlots();
	shopClearSelection();

	if(_catType == 'stats'){
		shop.catalogue.currencyText.text = GVP.stats.statPoints.toString();
	}else{
		shop.catalogue.currencyText.text = GVP.stats.bitcoins.toString();
	}
	shop.catalogue.errorText.text = '';
	shop.catalogue.visible = true;
	shop.catalogue.topScroll.visible = false;
	shop.catalogue.botScroll.visible = (thingsToChooseFrom.length > shopCatSlots.length);
	toggleBtn(shop.catalogue.buySellBtn, false);
	toggleBtn(shop.catalogue.infoBtn, false);
}

private function shopClearSelection():void{
	for(var j:int = 0, jlen:int = shopCatSlots.length; j < jlen; j++){
		shopCatSlots[j].catSlotBox.gotoAndStop(0);
	}
	currentSelectionInfo = null;
}

private function updatePaginationStuffShop():void{
	shop.catalogue.currPageText.text = 'Pg. ' + currPage;
	shop.catalogue.botScroll.pageText.text = 'Pg. ' + (currPage + 1);
	shop.catalogue.topScroll.pageText.text = 'Pg. ' + (currPage - 1);
	shop.catalogue.currPageText.visible = (thingsToChooseFrom.length > shopCatSlots.length);
	shop.catalogue.topScroll.visible = (currPage > 1);
	shop.catalogue.botScroll.visible = (thingsToChooseFrom.length > currPage*shopCatSlots.length);
}

private function updateshopCatSlots():void{

	shop.catalogue.currencySymbols.gotoAndStop(1);
	switch(catType){
		case 'items':thingsToChooseFrom = Assignables.buyable('items'); break;
		case 'abilities':thingsToChooseFrom = Assignables.unacquiredAndBuyable('abilities'); break;
		case 'equipment':thingsToChooseFrom = Assignables.buyableEquipment(); break;
		case 
			'stats':thingsToChooseFrom = Stats.all; 
			shop.catalogue.currencyText.text = GVP.stats.statPoints;
			shop.catalogue.currencySymbols.gotoAndStop(2);
			shop.stats.hp.text = GVP.stats.hp;
			shop.stats.ap.text = GVP.stats.ap;
			shop.stats.pow.text = GVP.stats.pow;
			shop.stats.def.text = GVP.stats.def;
			shop.catalogue.infoBtn.visible = false;
		break;
		case 'sell':thingsToChooseFrom = Assignables.sellable('items').concat(Assignables.sellable('equipment')); break;
	}

	if(currPage >= 2){ // For all pages except the first.
		if(thingsToChooseFrom.length <= shopCatSlots.length*(currPage-1)){
			currPage--;
		}
	}else{ // For the first page.
		if(thingsToChooseFrom.length <= shopCatSlots.length){
			shop.catalogue.topScroll.visible = false;
			shop.catalogue.botScroll.visible = false;
		}
	}
	updatePaginationStuffShop();

	var showStock:Boolean = catType == 'items' || catType =='sell' || catType =='equipment';
	if(showStock){
 		shop.catalogue.stockSymbol1.text = '#'
 		shop.catalogue.stockSymbol2.text = '#'
	}else{
		shop.catalogue.stockSymbol1.text = ''
		shop.catalogue.stockSymbol2.text = ''
	}

	var i:int;

	for(i = 0; i < shopCatSlots.length; i++){
		shopCatSlots[i].visible = false;
	}
	
	if(thingsToChooseFrom && thingsToChooseFrom.length > 0){	
		sortThings();
		var startingIndex:int = (currPage - 1)*(shopCatSlots.length);
		var maxj:int = Math.min(thingsToChooseFrom.length, shopCatSlots.length + startingIndex);
		for(var j:int = startingIndex; j < maxj; j++){

			i = j - startingIndex;	
			shopCatSlots[i].visible = true;
			shopCatSlots[i].catSlotBox.mouseEnabled = true;
			shopCatSlots[i].gameNameText.text = thingsToChooseFrom[j].gameName;
			shopCatSlots[i].icon.gotoAndStop(thingsToChooseFrom[j].pic);

			if(catType == 'sell'){
				shopCatSlots[i].amountText.text = Math.round(thingsToChooseFrom[j].cost/2);
			}else{
				shopCatSlots[i].amountText.text = thingsToChooseFrom[j].cost;
			}

			if(showStock){
				shopCatSlots[i].stockText.text = thingsToChooseFrom[j].stock;
			}else{
				shopCatSlots[i].stockText.text = '';
			}
		}
	}else{
		toggleBtn(shop.catalogue.infoBtn, false);
		toggleBtn(shop.catalogue.buySellBtn, false);
	}
}

public function completeBuyTransaction():void{

	switch(catType){
		case 'items': 
			if(currentSelectionInfo.stock < 9){
				if(haveEnough()){
					Assignables.changeStock(currentSelectionInfo, 1)
					spendCurrency();
					if (!GVP.notices.equipAbilItem) {
						GVP.notices.equipAbilItem = true;
						showNotice("To equip this item, simply select \"Items/Abilities\" from the EQUIP submenu.")
					}
				}
			}else{
				shop.catalogue.errorText.text = "You have the maximum amount.";
			}
		break;
		case 'equipment': 
			if(currentSelectionInfo.stock < 9){
				if(haveEnough()){
					Assignables.changeStock(currentSelectionInfo, 1)
					spendCurrency();
					if (!GVP.notices.equipSwordShield) {
						GVP.notices.equipSwordShield = true;
						showNotice("To equip this item, simply select \"Sword/Shield\" from the EQUIP submenu.")
					}
				}

			}else{
				shop.catalogue.errorText.text = "You have the maximum amount.";
			}
		break;
		case 'abilities': 
			if(haveEnough()){
				spendCurrency();
				if (!GVP.notices.equipAbilItem) {
					GVP.notices.equipAbilItem = true;
					showNotice("To equip this item, simply select \"Items/Abilities\" from the EQUIP submenu.")
				}
				currentSelectionInfo.objectStatus = 'not_assigned';
				GVP.stats.abilitiesBought++;
				Assignables.correctAbilityCosts();
				shopClearSelection();
			}
		break;
		case 'stats': 
			if(haveEnough(true)){
				spendCurrency(true);
				Stats.upgradeFuncs[currentSelectionInfo.upgradeFuncIndex]();
				shop.stats.hp.text = GVP.stats.hp;
				shop.stats.ap.text = GVP.stats.ap;
				shop.stats.pow.text = GVP.stats.pow;
				shop.stats.def.text = GVP.stats.def;
			}
		break;
	} 
	updateshopCatSlots();
}

public function haveEnough(isStats:Boolean = false):Boolean{
	if(isStats){
		if(GVP.stats.statPoints >= currentSelectionInfo.cost){
			return true;
		}else{
			shop.catalogue.errorText.text = "Not enough stat points.";
			FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			return false
		}
	}else{
		if(GVP.stats.bitcoins >= currentSelectionInfo.cost){
			return true;
		}else{
			shop.catalogue.errorText.text = "Not enough money.";
			FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			return false
		}
	}
	return false;
}

public function spendCurrency(isStats:Boolean = false):void{	
	if(isStats){
		GVP.stats.statPoints -= currentSelectionInfo.cost;
		shop.catalogue.currencyText.text = GVP.stats.statPoints.toString();		
	}else{
		GVP.stats.bitcoins -= currentSelectionInfo.cost;
		shop.catalogue.currencyText.text = GVP.stats.bitcoins.toString();		
	}
}

public function completeSellTransaction():void{
	Assignables.changeStock(currentSelectionInfo, -1)
	GVP.stats.bitcoins += Math.round(currentSelectionInfo.cost/2);
	shop.catalogue.currencyText.text = GVP.stats.bitcoins.toString();
	if(!currentSelectionInfo.stock){
		shopClearSelection();			
	}
	updateshopCatSlots();
}