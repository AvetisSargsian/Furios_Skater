package models
{
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	public class PhisicWorldModel extends Actor
	{	
		private var _physicsWorld:b2World;
		private var timer:Timer;
		private var methodsArray:Array;
		public const worldScale:int = 30;
		
		public function PhisicWorldModel()
		{
			super();
			initWorld();
		}
//		=========================================================
		[PostConstruct]
		public function init():void	{}
//		=========================================================
		public function get physicsWorld():b2World
		{
			return _physicsWorld;
		}
//		=========================================================
		private function initWorld():void
		{
			var worldAABB:b2AABB = new b2AABB();
			worldAABB.lowerBound.Set(-1000, -1000);
			worldAABB.upperBound.Set(1000, 1000);
			var gravity:b2Vec2 = new b2Vec2(0, 9.8);
			var doSleep:Boolean = true;
			_physicsWorld = new b2World(worldAABB, gravity, doSleep);
			
			trace("PhiscsWorld is Created")
			
			timer = new Timer(1000/60);
			timer.addEventListener(TimerEvent.TIMER,updateWorld);
			
			methodsArray = new Array();
		}
//		=========================================================
		protected function updateWorld(event:TimerEvent):void
		{
			_physicsWorld.Step(1/30, 10);
			update();
		}
//		=========================================================
		public function start():void
		{
			timer.start();
			update();
		}
//		=========================================================
		public function stop():void
		{
			timer.stop();
			update();
		}
//		=========================================================
		public function pouse():void
		{
			
		}
//		=========================================================
		public function addOnUpdateMethod(func:Function):void
		{
			methodsArray.push(func);
		}
//		=========================================================
		private function runMethods():void
		{
			for (var i:int = 0,l:int = methodsArray.length;i<l;i++)
			{
				methodsArray[i]();
			}
		}
//		=========================================================
		private function update():void
		{
			dispatchWith(Constants.WORLD_MODEL);
			runMethods();
		}
		
	}
}