package
{
	import command.GameStartCommand;
	import command.NavigationCommand;
	import command.SceneChangeAngleCommand;
	
	import events.GameEvent;
	import events.NavigationEvent;
	
	import mediator.BGGameMediator;
	import mediator.GameMediator;
	import mediator.HeroMediator;
	import mediator.MainMenuMediator;
	import mediator.RoadMediator;
	import mediator.StarlingRootSceneMediator;
	
	import models.*;
	
	import org.robotlegs.starling.core.IInjector;
	import org.robotlegs.starling.mvcs.Context;
	
	import starling.display.DisplayObjectContainer;
	
	import views.GameScene;
	import views.HeroView;
	import views.MainMenuScene;
	import views.ParalaxBGView;
	import views.RoadView;
	import views.StarlingRootScene;
	
	public class RobotlegsContext extends Context
	{
		public function RobotlegsContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
//		===========================================================================
		override protected function get injector():IInjector
		{
			return super.injector;
		}
//		===========================================================================
		override protected function set injector(value:IInjector):void
		{
			super.injector = value;
		}
//		===========================================================================
		override public function startup():void
		{
			this.commandMap.mapEvent(NavigationEvent.CHANGE_SCREEN, NavigationCommand, NavigationEvent);
			this.commandMap.mapEvent(GameEvent.CHANGE_ANGLE, SceneChangeAngleCommand,GameEvent);
			this.commandMap.mapEvent(Constants.GAME_START, GameStartCommand);

			this.injector.mapSingleton(NavigationModel);
			this.injector.mapSingleton(GameModel);
			this.injector.mapSingleton(HeroModel);
			this.injector.mapSingleton(PhisicWorldModel);
			this.injector.mapClass(ObstacleModel,ObstacleModel);			

			this.mediatorMap.mapView(StarlingRootScene, StarlingRootSceneMediator);
			this.mediatorMap.mapView(MainMenuScene, MainMenuMediator);
			this.mediatorMap.mapView(GameScene,GameMediator);
			this.mediatorMap.mapView(HeroView,HeroMediator);
			this.mediatorMap.mapView(RoadView,RoadMediator);
			this.mediatorMap.mapView(ParalaxBGView,BGGameMediator);			
			
			Constants.INJECTOR = injector;//????!!!!
//			this.dispatchEventWith(ContextEventType.STARTUP);
			
			super.startup();
		}
	}
}