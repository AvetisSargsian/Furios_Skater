package views
{	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.utils.getQualifiedClassName;
	
	import starling.display.Button;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class MainMenuScene extends Scene
	{
		public var bg_quad:Quad;
		
		public function MainMenuScene()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			bg_quad = new Quad(Constants.STAGE_WIDTH,Constants.STAGE_HEIGHT,Color.PURPLE);
			addChild(bg_quad);
			
			var bgShape:Shape = new Shape();
			bgShape.graphics.clear();
			bgShape.graphics.beginFill(Color.YELLOW);
			bgShape.graphics.drawRoundRect(0, 0, 150, 60, 15, 15);
			bgShape.graphics.endFill();
			
			var bgBitmapData:BitmapData = new BitmapData(150, 60, true,0x00000000);
			bgBitmapData.draw(bgShape);
			
			var buttonTexture:Texture = Texture.fromBitmapData(bgBitmapData, false, false, 1);
			
			var btn:Button = new Button(buttonTexture,"Play Game");
			btn.name = getQualifiedClassName(GameScene);
			btn.alignPivot();
			btn.x = 427;
			btn.y = 200;
			addChild(btn);
		}
	}
}