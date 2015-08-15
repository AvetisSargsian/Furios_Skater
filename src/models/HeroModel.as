package models
{
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Contacts.b2ContactEdge;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	public class HeroModel extends Actor
	{	
		
		[Inject]
		public var world:PhisicWorldModel;
		
		private var _head:b2Body;
		private var _torso1:b2Body;
		private var _torso2:b2Body;
		private var _torso3:b2Body;
		private var _upperArmL:b2Body;
		private var _upperArmR:b2Body;
		private var _lowerArmL:b2Body;
		private var _lowerArmR:b2Body;
		private var _upperLegL:b2Body;
		private var _upperLegR:b2Body;
		private var _lowerLegL:b2Body;
		private var _lowerLegR:b2Body;
		private var _body_part1:b2Body;
		private var _body_part2:b2Body;
		private var _body_part3:b2Body;
		
		public function HeroModel()
		{
			super();
		}
//		==============================================
		[PostConstruct]
		public function init():void
		{
			trace("Hero is Created")
			create(world.physicsWorld);
		}
//		==============================================
		public function get body_part3():b2Body
		{
			return _body_part3;
		}
//		==============================================
		public function get body_part2():b2Body
		{
			return _body_part2;
		}
//		==============================================
		public function get body_part1():b2Body
		{
			return _body_part1;
		}
//		==============================================
		public function get lowerLegR():b2Body
		{
			return _lowerLegR;
		}
//		==============================================
		public function get lowerLegL():b2Body
		{
			return _lowerLegL;
		}
//		==============================================
		public function get upperLegR():b2Body
		{
			return _upperLegR;
		}
//		==============================================
		public function get upperLegL():b2Body
		{
			return _upperLegL;
		}
//		==============================================
		public function get lowerArmR():b2Body
		{
			return _lowerArmR;
		}
//		==============================================
		public function get lowerArmL():b2Body
		{
			return _lowerArmL;
		}
//		==============================================
		public function get upperArmR():b2Body
		{
			return _upperArmR;
		}
//		==============================================
		public function get upperArmL():b2Body
		{
			return _upperArmL;
		}
//		==============================================
		public function get torso3():b2Body
		{
			return _torso3;
		}
//		==============================================
		public function get torso2():b2Body
		{
			return _torso2;
		}
//		==============================================
		public function get torso1():b2Body
		{
			return _torso1;
		}
//		==============================================
		public function get head():b2Body
		{
			return _head;
		}
//		===============================================================
		private function create(phis_world:b2World):void
		{
			var startX:Number = 95; 
			var startY:Number = 290;
			
			var m_physScale:int = world.worldScale;
			var bd:b2BodyDef;
			var circ:b2CircleDef = new b2CircleDef();
			var box:b2PolygonDef = new b2PolygonDef();
			var jd:b2RevoluteJointDef = new b2RevoluteJointDef();
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			var bodyBoxShape:b2PolygonDef = new b2PolygonDef();
			var circShape:b2CircleDef = new b2CircleDef();			
			// Head
			circ.radius = 12.5 / m_physScale;
			circ.density = 0.7;
			circ.friction = 0.4;
			circ.restitution = 0.3;
			bd = new b2BodyDef();
			bd.position.Set(startX / m_physScale, startY / m_physScale);
			_head = phis_world.CreateBody(bd);
			head.CreateShape(circ);
			head.SetMassFromShapes();
			// Torso1
			box.SetAsBox(15 / m_physScale, 10 / m_physScale);
			box.density = 0.7;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new b2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 28) / m_physScale);
			bd.fixedRotation = true;
			_torso1 = phis_world.CreateBody(bd);
			_torso1.CreateShape(box);
			_torso1.SetMassFromShapes();
			// Torso2
			bd = new b2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 43) / m_physScale);
			_torso2 = phis_world.CreateBody(bd);
			_torso2.CreateShape(box);
			_torso2.SetMassFromShapes();
			// Torso3
			bd = new b2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 58) / m_physScale);
			_torso3 = phis_world.CreateBody(bd);
			_torso3.CreateShape(box);
			_torso3.SetMassFromShapes();
			// UpperArm
			box.SetAsBox(18 / m_physScale, 6.5 / m_physScale);
			box.density = 0.7;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new b2BodyDef();
			// L
			bd.position.Set((startX - 30) / m_physScale, (startY + 20) / m_physScale);
			_upperArmL = phis_world.CreateBody(bd);
			_upperArmL.CreateShape(box);
			_upperArmL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 30) / m_physScale, (startY + 20) / m_physScale);
			_upperArmR = phis_world.CreateBody(bd);
			_upperArmR.CreateShape(box);
			_upperArmR.SetMassFromShapes();
			// LowerArm
			box.SetAsBox(17 / m_physScale, 6 / m_physScale);
			box.density = 0.7;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new b2BodyDef();
			// L
			bd.position.Set((startX - 57) / m_physScale, (startY + 20) / m_physScale);
			_lowerArmL = phis_world.CreateBody(bd);
			_lowerArmL.CreateShape(box);
			_lowerArmL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 57) / m_physScale, (startY + 20) / m_physScale);
			_lowerArmR = phis_world.CreateBody(bd);
			_lowerArmR.CreateShape(box);
			_lowerArmR.SetMassFromShapes();
			// UpperLeg
			box.SetAsBox(7.5 / m_physScale, 22 / m_physScale);
			box.density = 0.7;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new b2BodyDef();
			// L
			bd.position.Set((startX - 14) / m_physScale, (startY + 85) / m_physScale);
			bd.angle = 20/ (180/Math.PI);
			_upperLegL = phis_world.CreateBody(bd);
			_upperLegL.CreateShape(box);
			_upperLegL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 14) / m_physScale, (startY + 85) / m_physScale);
			bd.angle = -20/ (180/Math.PI);
			_upperLegR = phis_world.CreateBody(bd);
			_upperLegR.CreateShape(box);
			_upperLegR.SetMassFromShapes();
			// LowerLeg
			box.SetAsBox(6 / m_physScale, 20 / m_physScale);
			box.density = 1.5;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new b2BodyDef();
			// L
			bd.position.Set((startX - 20) / m_physScale, (startY + 120) / m_physScale);
			_lowerLegL = phis_world.CreateBody(bd);
			_lowerLegL.CreateShape(box);
			_lowerLegL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 20) / m_physScale, (startY + 120) / m_physScale);
			_lowerLegR = phis_world.CreateBody(bd);
			_lowerLegR.CreateShape(box);
			_lowerLegR.SetMassFromShapes();
			
			// JOINTS
			jd.enableLimit = true;
			
			// Head to shoulders
			jd.lowerAngle = -10 / (180/Math.PI);
			jd.upperAngle = 10 / (180/Math.PI);
			jd.Initialize(_torso1, _head, new b2Vec2(startX / m_physScale, (startY + 15) / m_physScale));
			phis_world.CreateJoint(jd);
			
			// Upper arm to shoulders
			// L
			jd.lowerAngle = -85 / (180/Math.PI);
			jd.upperAngle = 130 / (180/Math.PI);
			jd.Initialize(_torso1, _upperArmL, new b2Vec2((startX - 18) / m_physScale, (startY + 20) / m_physScale));
			phis_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -130 / (180/Math.PI);
			jd.upperAngle = 85 / (180/Math.PI);
			jd.Initialize(_torso1, _upperArmR, new b2Vec2((startX + 18) / m_physScale, (startY + 20) / m_physScale));
			phis_world.CreateJoint(jd);
			
			// Lower arm to upper arm
			// L
			jd.lowerAngle = -130 / (180/Math.PI);
			jd.upperAngle = 10 / (180/Math.PI);
			jd.Initialize(_upperArmL, _lowerArmL, new b2Vec2((startX - 45) / m_physScale, (startY + 20) / m_physScale));
			phis_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -10 / (180/Math.PI);
			jd.upperAngle = 130 / (180/Math.PI);
			jd.Initialize(_upperArmR, _lowerArmR, new b2Vec2((startX + 45) / m_physScale, (startY + 20) / m_physScale));
			phis_world.CreateJoint(jd);
			
			// Shoulders/stomach
			jd.lowerAngle = -7/ (180/Math.PI);
			jd.upperAngle = 7/ (180/Math.PI);
			jd.Initialize(_torso1, _torso2, new b2Vec2(startX / m_physScale, (startY + 35) / m_physScale));
			phis_world.CreateJoint(jd);
			// Stomach/hips
			jd.Initialize(_torso2, _torso3, new b2Vec2(startX / m_physScale, (startY + 50) / m_physScale));
			phis_world.CreateJoint(jd);
			// Torso to upper leg
			// L
			jd.lowerAngle = -25 / (180/Math.PI);
			jd.upperAngle = 45 / (180/Math.PI);
			jd.Initialize(_torso3, _upperLegL, new b2Vec2((startX - 12) / m_physScale, (startY + 72) / m_physScale));
			phis_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -45 / (180/Math.PI);
			jd.upperAngle = 25 / (180/Math.PI);
			jd.Initialize(_torso3, _upperLegR, new b2Vec2((startX + 12) / m_physScale, (startY + 72) / m_physScale));
			phis_world.CreateJoint(jd);
			// Upper leg to lower leg
			// L
			jd.lowerAngle = -7/ (180/Math.PI);
			jd.upperAngle = 10/ (180/Math.PI);
			jd.Initialize(_upperLegL, _lowerLegL, new b2Vec2((startX - 20) / m_physScale, (startY + 105) / m_physScale));
			phis_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -10/ (180/Math.PI);
			jd.upperAngle = 7/ (180/Math.PI);
			jd.Initialize(_upperLegR, _lowerLegR, new b2Vec2((startX + 20) / m_physScale, (startY + 105) / m_physScale));
			phis_world.CreateJoint(jd);	
			//poly
			bodyDef.position.Set((startX+5)/m_physScale, (startY+145)/m_physScale);
			bodyDef.angularDamping = 7;
			_body_part1 = phis_world.CreateBody(bodyDef);
			bodyBoxShape.SetAsBox(50/m_physScale, 5/m_physScale);
			bodyBoxShape.density = 3;
			bodyBoxShape.friction = 0.4;
			bodyBoxShape.restitution = 0.3;
			_body_part1.CreateShape(bodyBoxShape);
			_body_part1.SetMassFromShapes();
			//whill1
			bodyDef = new b2BodyDef();
			bodyDef.angularDamping = 5;
			bodyDef.position.Set((startX-25)/m_physScale, (startY+155)/m_physScale);
			_body_part2 = phis_world.CreateBody(bodyDef);
			circShape.radius = 7.0 / m_physScale;
			circShape.density = 1.0;
			circShape.friction = 1;
			circShape.restitution = 0,5;
			_body_part2.CreateShape(circShape);
			_body_part2.SetMassFromShapes();
			//whill2	
			bodyDef.position.Set((startX+35)/m_physScale, (startY+155)/m_physScale);
			_body_part3 = phis_world.CreateBody(bodyDef);
			_body_part3.CreateShape(circShape);
			_body_part3.SetMassFromShapes();
			//legs to scate
			jd.lowerAngle = -2/ (180/Math.PI);
			jd.upperAngle = 2/ (180/Math.PI);
			jd.Initialize(_lowerLegL, _body_part1, new b2Vec2((startX-20)/ m_physScale, (startY+145) / m_physScale));
			phis_world.CreateJoint(jd);
			
			jd.lowerAngle = -2/(180/Math.PI);
			jd.upperAngle = 2/(180/Math.PI);
			jd.Initialize(_lowerLegR, _body_part1, new b2Vec2((startX+30) / m_physScale, (startY+145) / m_physScale));
			phis_world.CreateJoint(jd);
			
			jd = new b2RevoluteJointDef();
			jd.enableLimit = false;
			
			jd.Initialize(_body_part1, _body_part2, body_part2.GetWorldCenter());
			phis_world.CreateJoint(jd);
			jd.Initialize(_body_part1, _body_part3,body_part3.GetWorldCenter());
			phis_world.CreateJoint(jd);
			
			world.addOnUpdateMethod(update);
		}
//		=============================================================
		public function destroy():void
		{
			
		}
//		=============================================================
		public function update():void
		{
			dispatchWith(Constants.HERO_MODEL);
		}
//		=============================================================
		public function applyForce(force:b2Vec2):void
		{
			if (force.y == 0)
			{
				force.Multiply(1/2);
				_body_part1.ApplyImpulse(force,_body_part1.GetWorldCenter());
				_torso3.ApplyImpulse(force,_torso3.GetWorldCenter());
			}else
			{
				force.Multiply(1/2);
				_head.ApplyImpulse(force,_head.GetWorldCenter());
				_torso3.ApplyImpulse(force,_torso3.GetWorldCenter());
			}
			force.Multiply(1/2);
			_lowerArmL.ApplyForce(force,_lowerArmL.GetWorldCenter());
			_lowerArmR.ApplyForce(force,_lowerArmR.GetWorldCenter());
		}
		
		public function isTouchingWith(body:b2Body):Boolean
		{
//			var dict:Dictionary = new Dictionary();
//			var whill_1:Object = new Object();
//			var whill_2:Object = new Object();
//			
//			whill_1.toString = function ():String {return "whill_1"}
//			whill_2.toString = function ():String {return "whill_2"}	
//			
//			dict[whill_1] = _body_part2;
//			dict[whill_2] = _body_part3;
//			dict["whill"] = "STRING";
//			
//			for (var ob:Object in dict)
//			{
//				trace(ob,dict[ob]);
//				trace(ob == whill_1 ? true : false);
//			}
//			delete dict["whill"];
			
			
			var contact:b2ContactEdge;
			for (contact = _body_part2.m_contactList; contact; contact = contact.next) 
			{
				if (contact.other == body)
				{
					return true;
				}
			}
			for (contact = _body_part3.m_contactList; contact; contact = contact.next) 
			{
				if (contact.other == body)
				{
					return true;
				}
			}
			return false;
		}
	}
}