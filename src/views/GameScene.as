package views
{
	import flash.events.AccelerometerEvent;
	import flash.geom.Point;
	import flash.sensors.Accelerometer;
	import flash.ui.Keyboard;
	
	import starling.events.Event;
	import starling.events.KeyboardEvent;

	public class GameScene extends Scene implements ICharacter
	{
		private var _speed:Number;
		private var _angle:Point;
		
		public function GameScene()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			
			if (Accelerometer.isSupported)
			{
				_angle = new Point(0,0);
				var accl:Accelerometer = new Accelerometer();
				accl.addEventListener(AccelerometerEvent.UPDATE, accelUpdateHandler);
			}
		}
//		=============================================================================
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			var bg:ParalaxBGView = new ParalaxBGView();
			bg.name = "bg";
			bg.speed = _speed;
			addChild(bg);
			
			var hero:HeroView = new HeroView();
			hero.name = "hero";
			addChild(hero);
			
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			dispatchEventWith(Constants.START);
		}
//		===========================================================================
		private function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.RIGHT:
					angle = new Point(-10 * -1, 0)
					break;
				case Keyboard.LEFT:
					angle = new Point(-10 * 1, 0)
					break;
				case Keyboard.UP:
					angle = new Point(0, -65);
					break;
				case Keyboard.DOWN:
					angle = new Point(0, 400);
					break;
			}	
		}
//		===========================================================================
		protected function accelUpdateHandler(event:AccelerometerEvent):void
		{
			var aX:Number = event.accelerationX;
			var aY:Number = event.accelerationY;
			var aZ:Number = event.accelerationZ;
					
			if (aX<-1) aX = -1;
			if (aX>1) aX = 1;
			if (aY<-1) aY = -1;
			if (aY>1) aY = 1;
			if (aZ<-1) aZ = -1;
			if (aZ>1) aZ = 1;
						
			var mag:Number = Math.sqrt(aX*aX+aY*aY+aZ*aZ);
			var angleAY:Number = Math.round((180/Math.PI)*Math.acos(aY/mag));
			var angleAX:Number = -1 * (Math.round((180/Math.PI)*Math.asin(aX/mag)));
			//			aX наклон в лево 90 в право -90
			var angleAZ:Number = Math.round((180/Math.PI)*Math.atan(aZ/mag));
			//			aZ наклон от себя +45 к себе -45
						
			if (angleAY < -90) angleAY = -90;
			if (angleAY > 90) angleAY = 90;
						
			if (angleAX < -90) angleAX = -90;
			if (angleAX > 90) angleAX = 90;
						
			if (angleAZ < -90) angleAZ = -90;
			if (angleAZ > 90) angleAZ = 90;
						
			if (angleAX < 0) 
			{
				_angle.x = angleAX;
				_angle.y = 0;
			}
			else if (angleAX >= 0) 
			{
				_angle.x = angleAX;
				_angle.y = 0;
			}
			if (angleAZ > 30)
			{
				_angle.x = 0;
				_angle.y = -65;
			}			
			dispatchEventWith(Constants.NEW_ANGLE);
		}
//		===========================================================================
		public function set angle(value:Point):void
		{
			_angle = value;
			dispatchEventWith(Constants.NEW_ANGLE);
		}
//		============================================================================
		public function get angle():Point
		{
			return _angle;
		}
//		============================================================================
		public function set speed(value:Number):void
		{
			_speed = value;
			var bg:ParalaxBGView = getChildByName("bg") as ParalaxBGView;
			bg.speed = _speed;
		}
//		===============================================================
		private function onEnterFrame(event:Event):void
		{
			update();
		}
//		===============================================================
		public function update():void
		{		
			for (var i:int=0,l:int = numChildren;i<l;i++)
			{
				var child:ICharacter = getChildAt(i) as ICharacter;
				if(child)
					child.update();
			}
		}
//		===============================================================
	}
}