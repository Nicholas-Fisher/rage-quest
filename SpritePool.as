package classes{
	
	import starling.display.DisplayObject;
	import classes.FFParticleSystem.SystemOptions;
	import flash.utils.*;

	public class SpritePool
	{
		private var pool:Array;
		private var counter:int;
		private var Function
		
		public function SpritePool(type:Class, len:int, args:Array = null)
		{
			pool = new Array();
			counter = len;
			if(!args) args = new Array();

			var i:int = len;

			while(--i > -1){
				switch (args.length) {
				    case 0:pool[i] = new type(); break;
				    case 1:pool[i] = new type(args[0]); break;
				    case 2:pool[i] = new type(args[0], args[1]); break;
				    case 3:pool[i] = new type(args[0], args[1], args[2]); break;
				    case 4:pool[i] = new type(args[0], args[1], args[2], args[3]); break;
				    default: throw new Error('too many arguments in SpritePool');
				}
			}
		}
		
		public function getSprite():DisplayObject
		{
			if(counter > 0)
				return pool[--counter];
			else
				throw new Error('You exhausted the pool! Class: ' + getQualifiedClassName(pool[0]));
		}
		
		public function returnSprite(s:DisplayObject):void
		{
			pool[counter++] = s;
		}
	}
}