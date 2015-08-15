package views
{
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class HeroView extends Sprite implements ICharacter
	{
		public var _head:Shape;
		public var _torso1:Shape;
		public var _torso2:Shape;
		public var _torso3:Shape;
		public var _upperArmL:Shape;
		public var _upperArmR:Shape;
		public var _lowerArmL:Shape;
		public var _lowerArmR:Shape;
		public var _upperLegL:Shape;
		public var _upperLegR:Shape;
		public var _lowerLegL:Shape;
		public var _lowerLegR:Shape;
		public var _body_part1:Shape;
		public var _body_part2:Shape;
		public var _body_part3:Shape;
		
		public function HeroView()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			_head = new Shape();
			//head
			_head.graphics.lineStyle(1, 0x0);
			_head.graphics.beginFill(0xff0000);
			_head.graphics.drawCircle(0, 0, 13);
			//eyes			
			var angle:Number = deg2rad(-45);
			var x_eye:int = Math.cos(angle) * 10;
			var y_eye:int = Math.sin(angle) * 10;
			_head.graphics.beginFill(0x0000ff);
			_head.graphics.drawCircle(x_eye,y_eye, 5);
			_head.graphics.beginFill(0x000000);
			_head.graphics.drawCircle(x_eye,y_eye, 2);
			angle = deg2rad(-135);
			x_eye = Math.cos(angle) * 10;
			y_eye = Math.sin(angle) * 10;
			_head.graphics.beginFill(0x0000ff);
			_head.graphics.drawCircle(x_eye,y_eye, 5);
			_head.graphics.beginFill(0x000000);
			_head.graphics.drawCircle(x_eye,y_eye, 2);
			//nose
			_head.graphics.beginFill(0x0000ff);
			_head.graphics.moveTo(0,-8);
			_head.graphics.lineTo(4.5,5);
			_head.graphics.lineTo(-4.5,5);
			_head.graphics.lineTo(0,-8);
			_head.graphics.endFill();
			//lips
			_head.graphics.lineStyle(1.5, 0x0);
			_head.graphics.moveTo(-9,10);
			_head.graphics.lineTo(-7,12);
			_head.graphics.lineTo(7,12);
			_head.graphics.lineTo(9,10);
			addChild(_head);
			
//			//body
			_torso1 = new Shape();
			_torso1.graphics.lineStyle(1.5, 0x0);
			_torso1.graphics.beginFill(0xff0000,0.7);
			_torso1.graphics.drawRect(-15,-10,30,20);
			_torso1.graphics.endFill();
			addChild(_torso1);
			
			_torso2 = new Shape();
			_torso2.graphics.lineStyle(1.5, 0x0);
			_torso2.graphics.beginFill(0xff0000,0.7);
			_torso2.graphics.drawRect(-15,-10,30,20);
			_torso2.graphics.endFill();
			addChild(_torso2);
			
			_torso3 = new Shape();
			_torso3.graphics.lineStyle(1.5, 0x0);
			_torso3.graphics.beginFill(0xff0000,0.7);
			_torso3.graphics.drawRect(-15,-10,30,20);
			_torso3.graphics.endFill();
			addChild(_torso3);
//			//hends			
			_upperArmL = new Shape();
			_upperArmL.graphics.lineStyle(1.5, 0x0);
			_upperArmL.graphics.beginFill(0xff0000,0.7);
			_upperArmL.graphics.drawRect(-15,-6.5,30,13);
			addChild(_upperArmL);
			
			_upperArmR = new Shape();
			_upperArmR.graphics.lineStyle(1.5, 0x0);
			_upperArmR.graphics.beginFill(0xff0000,0.7);
			_upperArmR.graphics.drawRect(-15,-6.5,30,13);
			addChild(_upperArmR);
			
			_lowerArmL = new Shape();
			_lowerArmL.graphics.lineStyle(1.5, 0x0);
			_lowerArmL.graphics.beginFill(0xff0000,0.7);
			_lowerArmL.graphics.drawRect(-14,-6,28,12);
			addChild(_lowerArmL);
			
			_lowerArmR = new Shape();
			_lowerArmR.graphics.lineStyle(1.5, 0x0);
			_lowerArmR.graphics.beginFill(0xff0000,0.7);
			_lowerArmR.graphics.drawRect(-14,-6,28,12);
			addChild(_lowerArmR);
//			//legs
			_upperLegL = new Shape();
			_upperLegL.graphics.lineStyle(1.5, 0x0);
			_upperLegL.graphics.beginFill(0xff0000);			
			_upperLegL.graphics.drawRect(-7.5,-22,15,44);
			addChild(_upperLegL);
			
			_upperLegR = new Shape();
			_upperLegR.graphics.lineStyle(1.5, 0x0);
			_upperLegR.graphics.beginFill(0xff0000);			
			_upperLegR.graphics.drawRect(-7.5,-22,15,44);
			addChild(_upperLegR);
			
			_lowerLegL = new Shape();
			_lowerLegL.graphics.lineStyle(1.5, 0x0);
			_lowerLegL.graphics.beginFill(0xff0000);			
			_lowerLegL.graphics.drawRect(-6,-20,12,40);
			addChild(_lowerLegL);
			
			_lowerLegR = new Shape();
			_lowerLegR.graphics.lineStyle(1.5, 0x0);
			_lowerLegR.graphics.beginFill(0xff0000);			
			_lowerLegR.graphics.drawRect(-6,-20,12,40);
			addChild(_lowerLegR);
			
//			//scate
			_body_part1 = new Shape();
			_body_part1.graphics.beginFill(0xffff00);
			_body_part1.graphics.drawRect(-50,-5,100,10);
			addChild(_body_part1);
			
			_body_part2 = new Shape();
			_body_part2.graphics.lineStyle(1.5, 0x0ff);
			_body_part2.graphics.drawCircle(0,0, 7);
			_body_part2.graphics.moveTo(0,0);
			_body_part2.graphics.lineTo(0,-7);
			addChild(_body_part2);
			
			_body_part3 = new Shape();
			_body_part3.graphics.lineStyle(1.5, 0x0ff);
			_body_part3.graphics.drawCircle(0,0, 7);
			_body_part3.graphics.moveTo(0,0);
			_body_part3.graphics.lineTo(0,-7);
			addChild(_body_part3);
		}
		
		public function update():void
		{
//			trace(this.x,this.y);
		}
	}
}