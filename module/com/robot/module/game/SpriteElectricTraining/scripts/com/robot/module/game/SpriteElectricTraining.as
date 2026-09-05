package com.robot.module.game
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.utils.Direction;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpriteElectricTraining extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var confrimTrainBtn:SimpleButton;
      
      private var _showMc:MovieClip;
      
      private var sprite_mc:MovieClip;
      
      private var traSucessPanel:MovieClip;
      
      private var spriteElecTrainPanel:MovieClip;
      
      private var electricMC:MovieClip;
      
      private var confirmBtn:SimpleButton;
      
      public function SpriteElectricTraining()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(spriteElecTrainPanel);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(spriteElecTrainPanel))
         {
            return;
         }
         LevelManager.appLevel.addChild(spriteElecTrainPanel);
         DisplayUtil.align(spriteElecTrainPanel,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_3"));
         hide();
      }
      
      public function destroy() : void
      {
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onConfirm(evt:MouseEvent) : void
      {
         var num:uint = uint(electricMC.currentFrame);
         confirmBtn.removeEventListener(MouseEvent.CLICK,onConfirm);
         confirmBtn.mouseEnabled = false;
         electricMC.gotoAndStop(num);
         hide();
         if(num > 8 && num < 18 || num > 32 && num < 42)
         {
            LevelManager.appLevel.addChild(traSucessPanel);
            DisplayUtil.align(traSucessPanel,null,AlignType.MIDDLE_CENTER);
            return;
         }
         if(num <= 8 || num >= 42)
         {
            EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","big"));
            return;
         }
         if(num >= 18 && num <= 32)
         {
            EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","small"));
            return;
         }
      }
      
      public function setup() : void
      {
         spriteElecTrainPanel = new SpriteElecTrainingPanel();
         electricMC = spriteElecTrainPanel["electricMC"];
         confirmBtn = spriteElecTrainPanel["confirmBtn"];
         confirmBtn.addEventListener(MouseEvent.CLICK,onConfirm);
         closeBtn = spriteElecTrainPanel["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         traSucessPanel = new TrainingSuccessPanel();
         confrimTrainBtn = traSucessPanel["confirmBtn"];
         confrimTrainBtn.addEventListener(MouseEvent.CLICK,confirmTrainSucess);
         sprite_mc = traSucessPanel["sprite_mc"];
         ResourceManager.getResource(ClientConfig.getPetSwfPath(MainManager.actorModel.pet.info.petID),onShowComplete,"pet");
         var info:PetInfo = PetManager.getPetInfo(MainManager.actorModel.pet.info.catchTime);
         traSucessPanel["shuxing"].text = PetXMLInfo.getTypeCN(info.id);
         traSucessPanel["spriteName"].text = PetXMLInfo.getName(info.id);
         traSucessPanel["spriteLevel"].text = info.level;
         traSucessPanel["gongji"].text = info.attack;
         traSucessPanel["tegong"].text = info.s_a;
         traSucessPanel["sudu"].text = info.speed;
         traSucessPanel["fangyu"].text = info.defence;
         traSucessPanel["tefang"].text = info.s_d;
         traSucessPanel["tili"].text = info.hp;
      }
      
      private function confirmTrainSucess(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(traSucessPanel);
         EventManager.dispatchEvent(new DynamicEvent("Training_Pet_Sucess","game_3"));
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         if(_showMc)
         {
            _showMc.gotoAndStop(Direction.DOWN);
            sprite_mc.addChild(_showMc);
            _showMc.x = _showMc.width;
            _showMc.y = _showMc.height;
         }
      }
   }
}

