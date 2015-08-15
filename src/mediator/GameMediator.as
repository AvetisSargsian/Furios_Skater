package mediator
{
	import events.GameEvent;
	
	import models.GameModel;
	import models.HeroModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import starling.events.Event;
	
	import views.GameScene;
	
	public class GameMediator extends Mediator
	{
		[Inject]
		public var game_view:GameScene;
		
		[Inject]
		public var game_model:GameModel;
		
		override public function onRegister():void
		{
			addViewListener(Constants.START,sceneIsReady);
			addViewListener(Constants.NEW_ANGLE,onNewAngle);
		}
//		================================================================
		private function sceneIsReady():void
		{
			dispatchWith(Constants.GAME_START);
			game_view.speed = game_model.speed;
		}
//		================================================================
		private function onNewAngle():void
		{
			dispatch(new GameEvent(GameEvent.CHANGE_ANGLE,false,game_view.angle));
		}
	}
}