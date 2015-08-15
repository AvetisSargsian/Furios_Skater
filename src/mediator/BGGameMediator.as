package mediator
{
	import org.robotlegs.starling.mvcs.Mediator;
	
	import views.ParalaxBGView;
	
	public class BGGameMediator extends Mediator
	{
		[Inject]
		public var bg_view:ParalaxBGView;
		
		override public function onRegister():void
		{
			
		}
	}
}