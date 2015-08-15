package command
{
	import models.GameModel;
	import models.PhisicWorldModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class GameStartCommand extends Command
	{	
		[Inject]
		public var world:PhisicWorldModel;
		
		public function GameStartCommand()
		{
			super();
		}
//		================================================
		override public function execute():void
		{
			this.world.start();	
		}
	}
}