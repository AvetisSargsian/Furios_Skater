package mediator
{
	import models.HeroModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import views.HeroView;
	
	public class HeroMediator extends Mediator
	{
		[Inject]
		public var hero_view:HeroView;
		
		[Inject]
		public var hero_model:HeroModel
		private var i:int = 0;
		
		override public function onRegister():void
		{
			addContextListener(Constants.HERO_MODEL,modelEventHandler);
		}
		
		private function modelEventHandler():void
		{
			//updateView
			//head
			hero_view._head.x = hero_model.head.GetPosition().x * 30;
			hero_view._head.y = hero_model.head.GetPosition().y * 30;
			hero_view._head.rotation = hero_model.head.GetAngle();
			//body
			hero_view._torso1.x = hero_model.torso1.GetPosition().x * 30;
			hero_view._torso1.y = hero_model.torso1.GetPosition().y * 30;
			hero_view._torso1.rotation = hero_model.torso1.GetAngle();
			
			hero_view._torso2.x = hero_model.torso2.GetPosition().x * 30;
			hero_view._torso2.y = hero_model.torso2.GetPosition().y * 30;
			hero_view._torso2.rotation = hero_model.torso2.GetAngle();
			
			hero_view._torso3.x = hero_model.torso3.GetPosition().x * 30;
			hero_view._torso3.y = hero_model.torso3.GetPosition().y * 30;
			hero_view._torso3.rotation = hero_model.torso3.GetAngle();
			//arms
			hero_view._upperArmL.x = hero_model.upperArmL.GetPosition().x * 30;
			hero_view._upperArmL.y = hero_model.upperArmL.GetPosition().y * 30;
			hero_view._upperArmL.rotation = hero_model.upperArmL.GetAngle();
			
			hero_view._upperArmR.x = hero_model.upperArmR.GetPosition().x * 30;
			hero_view._upperArmR.y = hero_model.upperArmR.GetPosition().y * 30;
			hero_view._upperArmR.rotation = hero_model.upperArmR.GetAngle();
			
			hero_view._lowerArmL.x = hero_model.lowerArmL.GetPosition().x * 30;
			hero_view._lowerArmL.y = hero_model.lowerArmL.GetPosition().y * 30;
			hero_view._lowerArmL.rotation = hero_model.lowerArmL.GetAngle();
			
			hero_view._lowerArmR.x = hero_model.lowerArmR.GetPosition().x * 30;
			hero_view._lowerArmR.y = hero_model.lowerArmR.GetPosition().y * 30;
			hero_view._lowerArmR.rotation = hero_model.lowerArmR.GetAngle();
			//legs
			hero_view._upperLegL.x = hero_model.upperLegL.GetPosition().x * 30;
			hero_view._upperLegL.y = hero_model.upperLegL.GetPosition().y * 30;
			hero_view._upperLegL.rotation = hero_model.upperLegL.GetAngle();
			
			hero_view._upperLegR.x = hero_model.upperLegR.GetPosition().x * 30;
			hero_view._upperLegR.y = hero_model.upperLegR.GetPosition().y * 30;
			hero_view._upperLegR.rotation = hero_model.upperLegR.GetAngle();
			
			hero_view._lowerLegL.x = hero_model.lowerLegL.GetPosition().x * 30;
			hero_view._lowerLegL.y = hero_model.lowerLegL.GetPosition().y * 30;
			hero_view._lowerLegL.rotation = hero_model.lowerLegL.GetAngle();
			
			hero_view._lowerLegR.x = hero_model.lowerLegR.GetPosition().x * 30;
			hero_view._lowerLegR.y = hero_model.lowerLegR.GetPosition().y * 30;
			hero_view._lowerLegR.rotation = hero_model.lowerLegR.GetAngle();
			//scate
			hero_view._body_part1.x = hero_model.body_part1.GetPosition().x * 30;
			hero_view._body_part1.y = hero_model.body_part1.GetPosition().y * 30
			hero_view._body_part1.rotation = hero_model.body_part1.GetAngle();
			
			hero_view._body_part2.x = hero_model.body_part2.GetPosition().x * 30;
			hero_view._body_part2.y = hero_model.body_part2.GetPosition().y * 30
			hero_view._body_part2.rotation = hero_model.body_part2.GetAngle();
			
			hero_view._body_part3.x = hero_model.body_part3.GetPosition().x * 30;
			hero_view._body_part3.y = hero_model.body_part3.GetPosition().y * 30
			hero_view._body_part3.rotation = hero_model.body_part3.GetAngle();			
		}
	}
}