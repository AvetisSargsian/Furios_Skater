package models
{	
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	public class GameModel extends Actor
	{
		private var _speed:Number;
		private var status:int;
		private var _ground:b2Body;
		
		[Inject]
		public var _hero:HeroModel;
		
		[Inject]
		public var world:PhisicWorldModel;
		
		public function GameModel()
		{
			super();
		}
//		=================================================================
		[PostConstruct]
		public function init():void
		{
			trace("GameModel is Created");
			initB2DWorld();			
//			var myClassInstance:ObstacleModel = Constants.INJECTOR.instantiate(ObstacleModel);
//			var myClassInstance1:ObstacleModel = Constants.INJECTOR.instantiate(ObstacleModel);
//			var myClassInstance2:ObstacleModel = Constants.INJECTOR.instantiate(ObstacleModel);
			
//			var myClassInstance:ObstacleModel = Constants.INJECTOR.getInstance(ObstacleModel);
//			var myClassInstance1:ObstacleModel = Constants.INJECTOR.getInstance(ObstacleModel);
//			var myClassInstance2:ObstacleModel = Constants.INJECTOR.getInstance(ObstacleModel);	
		}
//		=================================================================
		private function initB2DWorld():void
		{	
			_speed = 5;
			
			var scale:int = world.worldScale;
			var body:b2Body;
			var bobyDef:b2BodyDef = new b2BodyDef();
			var bodyBox:b2PolygonDef = new b2PolygonDef();
			
			// Left
			bobyDef.position.Set(-95/scale, 480/scale/2);
			bodyBox.SetAsBox(100/scale, 480/scale/2);
			body = world.physicsWorld.CreateBody(bobyDef);
			body.CreateShape(bodyBox);
			body.SetMassFromShapes();
			// Right
			bobyDef.position.Set((854+95) / scale, 480/scale/2);
			body = world.physicsWorld.CreateBody(bobyDef);
			body.CreateShape(bodyBox);
			body.SetMassFromShapes();
			// Top?????????
			bobyDef.position.Set(854/scale/2, -95/scale);
			bodyBox.SetAsBox(854/scale/2, 100/scale);
			body = world.physicsWorld.CreateBody(bobyDef);
			body.CreateShape(bodyBox);
			body.SetMassFromShapes();
			// Bottom
			bobyDef.position.Set(854/2/scale, (480+70)/scale); 
			_ground = world.physicsWorld.CreateBody(bobyDef);
			_ground.CreateShape(bodyBox);
			_ground.SetMassFromShapes();
		}
//		==================================================================
		public function get ground():b2Body
		{
			return _ground;
		}
//		==================================================================
		public function get speed():Number
		{
			return _speed;
		}
//		==================================================================
		public function update():void
		{
			dispatchWith(Constants.GAME_MODEL);
		}
	}
}