package
{
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	import views.StarlingRootScene;
	
	[SWF(width="854", height="480", frameRate="60", backgroundColor="#000000")]
	
	public class Furios_Skater extends Sprite
	{
		private var myStarling:Starling;
		
		public function Furios_Skater()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;
			
			Starling.multitouchEnabled = true;
			Starling.handleLostContext = !iOS;
			
			var viewPort:Rectangle = RectangleUtil.fit( new Rectangle(0, 0, Constants.STAGE_WIDTH, Constants.STAGE_HEIGHT), 
				new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight),	ScaleMode.SHOW_ALL);										
			myStarling = new Starling(StarlingRootScene, stage, viewPort);
			viewPort = null;
			
			//			myStarling.showStats = true;
			myStarling.stage.stageWidth  = Constants.STAGE_WIDTH;
			myStarling.stage.stageHeight = Constants.STAGE_HEIGHT;
			myStarling.simulateMultitouch = true;
			myStarling.antiAliasing = 1;
			
			myStarling.addEventListener(starling.events.Event.ROOT_CREATED, 
				function(event:Object, app:StarlingRootScene):void
				{	
					myStarling.removeEventListener(starling.events.Event.ROOT_CREATED, arguments.callee);
					stage.color = 0x000000;
					myStarling.start();
				});
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			NativeApplication.nativeApplication.addEventListener(
				flash.events.Event.ACTIVATE, function (e:flash.events.Event):void 
				{
					NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
					myStarling.start();
				});
			
			NativeApplication.nativeApplication.addEventListener(
				flash.events.Event.DEACTIVATE, function (e:flash.events.Event):void 
				{ 	
					NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.NORMAL;
					myStarling.stop(true);
				});
		}
	}
}