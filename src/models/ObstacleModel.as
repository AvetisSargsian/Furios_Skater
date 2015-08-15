package models
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	public class ObstacleModel extends Actor
	{	
		[Inject]
		public var world:PhisicWorldModel;
		
		public function ObstacleModel()
		{
			super();
		}
//		================================================
		[PostConstruct]
		public function init():void
		{
			create(world.physicsWorld);
		}
//		================================================
		private function create(phis_world:b2World):void
		{
			world.addOnUpdateMethod(update);
		}
//		=================================================
		public function destroy():void
		{

		}
//		=================================================
		public function update():void
		{
			dispatchWith(Constants.OBSTACLE_MODEL);
		}
//		==================================================
		public function applyForce(force:b2Vec2):void
		{
			
		}
//		==================================================
		public function isTouchingWith(body:b2Body):Boolean
		{
			return false;
		}
	}
}