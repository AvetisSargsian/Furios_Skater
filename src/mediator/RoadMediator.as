package mediator
{
	import org.robotlegs.starling.mvcs.Mediator;
	
	import views.RoadView;
	
	public class RoadMediator extends Mediator
	{
		[Inject]
		public var road_view:RoadView
		
		override public function onRegister():void
		{
			
		}
	}
}