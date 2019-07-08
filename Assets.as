package classes {
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import flash.utils.ByteArray;
	import flash.system.System;

	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	

	public class Assets
	{		
		private static var sTextures:Dictionary = new Dictionary();
		private static var sTextureAtlas:Vector.<TextureAtlas> = new Vector.<TextureAtlas>(11);
	
		private static function prepareAtlas(i:int):void{
			if (sTextureAtlas[i] == null){			
				switch(i){
					case 0: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasZeroTexture'), XML(create('AtlasZeroXml'))); break;
					case 1: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasOneTexture'), XML(create('AtlasOneXml'))); break;
					case 2: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasTwoTexture'), XML(create('AtlasTwoXml'))); break;
					case 3: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasThreeTexture'), XML(create('AtlasThreeXml'))); break;
					case 4: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasFourTexture'), XML(create('AtlasFourXml'))); break;
					case 5: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasFiveTexture'), XML(create('AtlasFiveXml'))); break;
					case 6: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasSixTexture'), XML(create('AtlasSixXml'))); break;
					case 7: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasSevenTexture'), XML(create('AtlasSevenXml'))); break;
					case 8: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasEightTexture'), XML(create('AtlasEightXml'))); break;
					case 9: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasNineTexture'), XML(create('AtlasNineXml'))); break;
					case 10: sTextureAtlas[i] = new TextureAtlas(getTexture('AtlasTenTexture'), XML(create('AtlasTenXml'))); break;
				}
			}
		}
		public static function getAtlasTexture(i:int, name:String):Texture{
			prepareAtlas(i);
			return sTextureAtlas[i].getTexture(name);
		}
		public static function getAtlasTextures(i:int, prefix:String):Vector.<Texture>{
			prepareAtlas(i);
			return sTextureAtlas[i].getTextures(prefix);
		}
		public static function getTexture(name:String):Texture{
		            if (sTextures[name] == undefined) {
						var data:Object = create(name);
		                
		                if (data is Bitmap)
							sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false);
		                else if (data is ByteArray)
							sTextures[name] = Texture.fromAtfData(data as ByteArray);
		            }
		            return sTextures[name];
		}
		
		private static function create(name:String):Object{
			var textureClass:Class = AssetEmbeds;
			return new textureClass[name];
		}
	}
}