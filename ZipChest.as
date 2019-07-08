package classes {

	import starling.events.Event;
	
	public class ZipChest extends Combatant {

		public var idleMc:SuperMovieClip;
		public var itemObj:Object;
		public var stock:int;
		public var chestName:String;
		public var bitcoins:Boolean = false;

		public function ZipChest(){
			idleMc = new SuperMovieClip('zipChest', GV.COMBATANT_SPRITESHEET, 0, -10);
			GV.s.juggler.add(idleMc);
			sContainer.addChild(idleMc);
			floats = true;
		}

		public function openChest():void{
			if (bitcoins){
				GVP.stats.bitcoins += stock;
				GV.hero.statusMsg('Bitcoins x' + stock, GV.STS_NEUTRAL);
				GVP.chestList.firstMap[chestName] = true;
				isDead = true;
			}else{
				if (Assignables.changeStock(itemObj, stock)){
					GV.hero.statusMsg(itemObj.gameName + ' x' + stock, GV.STS_NEUTRAL);
					GVP.chestList.firstMap[chestName] = true;
					isDead = true;
				}else{
					GV.hero.statusMsg('CANNOT HOLD ' + stock + ' MORE ' + itemObj.gameName + '(s)', GV.STS_RED);
					FX.error.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				}				
			}
		}
		override public function faceRight():void{scaleX = Math.abs(scaleX);}
	}
}
