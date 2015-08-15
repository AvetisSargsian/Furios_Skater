package events
{
	import starling.events.Event;
	
	public class GameEvent extends Event
	{
		public static const CHANGE_ANGLE:String = "changeAngle";
		
		public function GameEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}