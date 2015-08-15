package command
{
	import events.NavigationEvent;
	
	import models.NavigationModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class NavigationCommand extends Command
	{
		[Inject]
		public var model:NavigationModel;
		
		[Inject]
		public var event:NavigationEvent;
		
		public function NavigationCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			this.model.setCurentScene(event.data.scene);
		}
	}
}