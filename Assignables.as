package classes {

	public class Assignables{

		include 'nonClasses/assignableData/abilityData.as';
		include 'nonClasses/assignableData/itemData.as';
		include 'nonClasses/assignableData/equipmentData.as';


		public static var items:Vector.<Object>;
		public static var equipment:Vector.<Object>;
		public static var abilities:Vector.<Object>;
		public static var all:Vector.<Object>;


		public static function correctAbilityCosts():void{
			var baseCost:int = 195;
			for(var i:int = 0, ilen:int = abilities.length; i < ilen; i++){
				var newCost:int = baseCost + Math.round(baseCost*GVP.stats.abilitiesBought*0.8);
				abilities[i].cost = roundToFive(newCost);
			}	
		}

		public static function unacquiredAndBuyable(str:String = 'null'):Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>;
			var v:Vector.<Object>
			switch(str){
				case 'items': v = items; break;
				case 'abilities': v = abilities; break;
				case 'equipment': v = equipment; break;
				default: v = all; break;
			}
			for(var i:int = 0, ilen:int = v.length; i < ilen; i++){
				if(!v[i].objectStatus && !v[i].cannotBeBought) ret.push(v[i]);
			}
			return ret;
		}

		public static function buyable(str:String = 'null'):Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>;
			var v:Vector.<Object>
			switch(str){
				case 'items': v = items; break;
				case 'abilities': v = abilities; break;
				case 'equipment': v = equipment; break;
				default: v = all; break;
			}
			for(var i:int = 0, ilen:int = v.length; i < ilen; i++){
				if(!v[i].cannotBeBought) ret.push(v[i]);
			}
			return ret;
		}		

		public static function sellable(str:String = null):Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>;
			var v:Vector.<Object>
			switch(str){
				case 'items': v = items; break;
				case 'abilities': v = abilities; break;
				case 'equipment': v = equipment; break;
				default: v = all; break;
			}
			for(var i:int = 0, ilen:int = v.length; i < ilen; i++){
				if(v[i].stock && v[i].cost && v[i].objectStatus != 'equipped:weapon'  && v[i].objectStatus != 'equipped:shield') ret.push(v[i]);
			}
			return ret;
		}

		public static function equippable(str:String = null):Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>;
			var v:Vector.<Object>
			switch(str){
				case 'items': v = items; break;
				case 'abilities': v = abilities; break;
				case 'equipment': v = equipment; break;
				default: v = all; break;
			}
			for(var i:int = 0, ilen:int = v.length; i < ilen; i++){
				if(v[i].objectStatus && str === 'items' && !v[i].stock){
					v[i].objectStatus = null; // If we have items with no stock, then set object status to null (this fixed the peach bug).
				}
				if(v[i].objectStatus || v[i].stock) ret.push(v[i]);
			}
			return ret;
		}

		public static function buyableEquipment():Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>;
			var v:Vector.<Object> = equipment;
			for(var i:int = 0, ilen:int = v.length; i < ilen; i++){
				if(v[i].objectName != 'battleSuitSword' && v[i].objectName != 'battleSuitShield') ret.push(v[i]);
			}
			return ret;
		}

		public static function objectStatusCompare(a:Object, b:Object):Number {
			var scoreA:int = determineSortScore(a);
			var scoreB:int = determineSortScore(b);
			if (scoreA > scoreB){
				return -1;
			}else if (scoreA < scoreB){
				return 1;
			}else{
				return 0;
			}
		}

		public static function determineSortScore(o:Object):int{
			var score:int = 0;
			var s:String = o.objectStatus;
			if (s != 'not_assigned'){
				var sArray = s.split(':');
				var sColor:String  = sArray[0]; 
				var sIndex:int = sArray[1];
				if(sColor == 'green') score += 10;
				if(sColor == 'red') score += 20;
				if(sColor == 'blue') score += 30;
				score -= sIndex;
				return score;
			}
			return 0;
		}

		public static function assignedList(listColor:String):Vector.<Object>{
			var ret:Vector.<Object> = new Vector.<Object>(4);
			for(var i:int  = 0; i < all.length; i++){
				var s:String = all[i].objectStatus;
				if(s && s != 'not_assigned'){
					var sArray:Array = s.split(':');
					var sColor:String = sArray[0];
					var sIndex:String = sArray[1];
					if(sColor == listColor){
						ret[sIndex] = all[i];
					}
				}
			}
			return ret;
		}

		public static function returnObjectInSlot(slot:String):Object{
			for(var i:int = 0; i < all.length; i++){
				if(all[i].objectStatus == slot){
					return all[i]; 
				}
			}
			return null;
		}

		private static function isNotNull(item:Object, index:int, vector:Vector.<Object>):Boolean {
            return item != null;
		}

		public static function changeStock(o:Object, i:int):Boolean{
			var newStock:int = o.stock + i;
			if (newStock <= 9 && newStock >= 0){
				o.stock = newStock;
				if(!o.stock){
					o.objectStatus = null;
				}else if(!o.objectStatus){
					o.objectStatus = 'not_assigned';
				}
				return true;
			}
			return false;
		}
		public static function updateItemCosts():void{
			var increaseFactor:Number = 1 + (GVP.stats.pow - 20)/30;
			for(var i:int = 0; i < items.length; i++){			
				var newCost:int = Math.round(items[i].baseCost*increaseFactor);
				items[i].cost = roundToFive(newCost);
			}
		}

		public static function roundToFive(i:int){
			return i + (5 - i%5);
		}
	}
}
