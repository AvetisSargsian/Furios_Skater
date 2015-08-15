package
{
	import org.robotlegs.starling.core.IInjector;
	
	import starling.errors.AbstractClassError;

	public class Constants
	{
		public function Constants() { throw new AbstractClassError(); }
		
		public static var INJECTOR:IInjector;
			
		public static const STAGE_WIDTH:int  = 854;
		public static const STAGE_HEIGHT:int = 480;
		
		public static const START:String = "Start";
		public static const  STOP:String = "Stop";
		public static const POUSE:String = "Pouse";
		public static const NEW_ANGLE:String = "newAngle";
		public static const GAME_START:String = "gameStart";
		public static const GAME_MODEL:String = "gameModelUpdate";
		public static const NAVIGATION_MODEL:String = "navigationModelUpdate";
		public static const HERO_MODEL:String = "heroModelUpdate";
		public static const OBSTACLE_MODEL:String = "obstacleModelUpdate";
		public static const WORLD_MODEL:String = "WrldModelUpdate";
		
	}
}