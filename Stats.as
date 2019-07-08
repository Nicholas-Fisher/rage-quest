package classes {

	public class Stats {

		public static var statData:Object = {

			powStat: {

				gameName: 'Up POW by 1',
				pic: 'powUpIcon',
				description: 'Permanently increases POW by 1 point',
				storeOrder: 0,
				cost: 20,
				upgradeFuncIndex: 0
			},

			defStat: {

				gameName: 'Up DEF by 1',
				pic: 'defUpIcon',
				description: 'Permanently increases DEF by 1 point',
				storeOrder: 1,
				cost: 25,
				upgradeFuncIndex: 1
			},

			apStat: {

				gameName: 'Up AP by 2',
				pic: 'apUpIcon',
				description: 'Permanently increases AP by 1 point',
				storeOrder: 2,
				cost: 80,
				upgradeFuncIndex: 2
			},

			hpStat: {

				gameName: 'Up HP by 10',
				pic: 'hpUpIcon',
				description: 'Permanently increases HP by 10 points.',
				storeOrder: 3,
				cost: 40,
				upgradeFuncIndex: 3
			},

			pauseStat: {
				gameName: 'UP pauses by 1',
				pic: 'pauseDownIcon',
				description: 'Permanently increases pause stock by 1. Allowing you to pause once more per battle.',
				storeOrder: 4,
				cost: 150,
				upgradeFuncIndex: 4
			}

		}

		public static var all:Vector.<Object>;
		public static var upgradeFuncs:Vector.<Function> = new <Function>[increasePow, increaseDef, increaseAp, increaseHp, increasePause];

		public static function increasePow():void{	
			GVP.stats.pow += 1;
			statData.powStat.cost = Math.round(statData.powStat.cost*1.1275);
			Assignables.updateItemCosts();
		}

		public static function increaseDef():void{	
			GVP.stats.def += 1;
			statData.defStat.cost = Math.round(statData.defStat.cost*1.215);
		}

		public static function increaseAp():void{	
			GVP.stats.ap += 2;
			statData.apStat.cost = Math.round(statData.apStat.cost*1.225);
		}

		public static function increaseHp():void{	
			GVP.stats.hp += 10;
			statData.hpStat.cost = Math.round(statData.hpStat.cost*1.2215);
		}

		public static function increasePause():void{	
			GVP.stats.pauseStock += 1;
			statData.pauseStat.cost = Math.round(statData.pauseStat.cost*2);
		}
	}
}
