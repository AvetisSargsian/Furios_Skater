package
{
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import flash.display.Bitmap;

	public class Assets
	{
		[Embed(source="bgLayer.jpg")]
		public static const BgLayer1:Class;
		
		[Embed(source="bgLayer1.png")]
		public static const BgLayer2:Class;
		
		[Embed(source="bgLayer2.png")]
		public static const BgLayer3:Class;
		
		[Embed(source="bgLayer3.png")]
		public static const BgLayer4:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}