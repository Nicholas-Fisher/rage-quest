package classes {

	import starling.display.Image;
	import starling.textures.Texture;

	public class SuperImage extends Image {

		public function SuperImage(name:String, atlas:int, _x:int = 0, _y:int = 0, centerPivotFlag:Boolean = false){

			var t:Texture;
			t = Assets.getAtlasTexture(atlas, name);
			super(t);
			if(centerPivotFlag) alignPivot(); // moved up.
			x = _x;
			y = _y;
		}
	}
}