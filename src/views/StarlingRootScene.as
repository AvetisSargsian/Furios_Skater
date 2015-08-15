package views
{
	import flash.ui.Keyboard;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class StarlingRootScene extends Sprite
	{
		private var _context:RobotlegsContext;
		
		public function StarlingRootScene()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
		}
//		==============================================================================
		private function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.BACK:
//					event.preventDefault();
					break;
				default:
					break;
			}	
		}
//		===============================================================
		private function onAddedToStage():void
		{
			_context = new RobotlegsContext(this); 
		}
//		===============================================================
		public function changeScreen(scene:Scene):void
		{
			var _currentScene:Scene = getChildByName("_currentScene") as Scene;
			if (_currentScene)
				_currentScene.removeFromParent(true);
			_currentScene = null;
			scene.name = "_currentScene";
			addChild(scene);
		}
	}
}