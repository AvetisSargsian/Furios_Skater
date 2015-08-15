package mediator 
{
    import events.GameEvent;
    import events.NavigationEvent;
    
    import flash.utils.getQualifiedClassName;
    
    import models.NavigationModel;
    
    import org.robotlegs.starling.base.ContextEventType;
    import org.robotlegs.starling.mvcs.Mediator;
    
    import starling.display.Button;
    import starling.events.Event;
    
    import views.MainMenuScene;
    import views.StarlingRootScene;

    public class StarlingRootSceneMediator extends Mediator 
	{
        [Inject]
        public var view:StarlingRootScene;
		
		[Inject]
		public var model:NavigationModel;
		
		override public function onRegister():void
		{
			addContextListener(ContextEventType.STARTUP_COMPLETE, onStartup);
			addContextListener(Constants.NAVIGATION_MODEL,onNavigationEvent);
			
			addViewListener(Event.TRIGGERED,onViewButtonsTrigered);
			
		}
//		=========================================================================================
		private function onViewButtonsTrigered(event:Event):void
		{
			var btn:Button = event.target as Button;
			dispatch(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,false,{"scene":btn.name}));
		}
//		=========================================================================================
		private function onNavigationEvent(event:Event):void
		{
			view.changeScreen(model.curentScene);
		}
//		=========================================================================================
		private function onStartup():void
		{
			dispatch(	new NavigationEvent(NavigationEvent.CHANGE_SCREEN,
						false,{"scene":getQualifiedClassName(MainMenuScene)}));
		}
	}
}
