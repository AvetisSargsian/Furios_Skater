package models
{
	import flash.utils.getDefinitionByName;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import views.Scene;
	
	public class NavigationModel extends Actor
	{
		private var _curentScene:Scene;
		
		public function NavigationModel()
		{
			super();
		}

		public function get curentScene():Scene
		{
			return _curentScene;
		}

		public function setCurentScene(value:String):void
		{
			var sceneClass:Class = getDefinitionByName(value) as Class;
			_curentScene = new sceneClass() as Scene;
			update();
		}
		
		private function update():void
		{
			dispatchWith(Constants.NAVIGATION_MODEL);	
		}

	}
}