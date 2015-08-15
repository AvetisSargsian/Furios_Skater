package mediator
{
	import org.robotlegs.starling.mvcs.Mediator;
	
	import starling.events.Event;
	
	import views.MainMenuScene;
	
	public class MainMenuMediator extends Mediator
	{
		[Inject]
		public var menu:MainMenuScene;
		
		override public function onRegister():void
		{
		}
	}
}