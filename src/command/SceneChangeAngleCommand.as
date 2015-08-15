package command
{
	import Box2D.Common.Math.b2Vec2;
	
	import events.GameEvent;
	
	import flash.geom.Point;
	
	import models.GameModel;
	import models.HeroModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class SceneChangeAngleCommand extends Command
	{
		[Inject]
		public var game_model:GameModel;
		
		[Inject]
		public var event:GameEvent;
		
		[Inject]
		public var hero:HeroModel;
		
		public function SceneChangeAngleCommand()
		{
			super();
		}	
		
		override public function execute():void
		{
			var angle:Point = event.data as Point;
			var force:b2Vec2 = new b2Vec2(angle.x,angle.y);
			if (hero.isTouchingWith(game_model.ground))
			{
				hero.applyForce(force);
			}
		}
	}
}