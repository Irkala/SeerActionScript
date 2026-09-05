package com.robot.module.game
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.Direction;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpriteRaceTraining extends Sprite implements IModule
   {
      
      private static const leftVerge:Number = 295;
      
      private static const rightVerge:Number = 490;
      
      private var laserEmitterMC:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var timer:Timer;
      
      private var count:uint = 30;
      
      private var sprite_mc:MovieClip;
      
      private var _showMc:MovieClip;
      
      private var laserMC:MovieClip;
      
      private var timeTxt:TextField;
      
      private var spriteRaceTraPanel:MovieClip;
      
      private var bChange:Boolean = false;
      
      public function SpriteRaceTraining()
      {
         super();
      }
      
      private function onEntFrame(evt:Event) : void
      {
         if(bChange)
         {
            laserEmitterMC.x += 1;
         }
         else
         {
            --laserEmitterMC.x;
         }
         if(laserEmitterMC.x <= 285)
         {
            bChange = true;
         }
         if(laserEmitterMC.x >= 474)
         {
            bChange = false;
         }
         if(laserEmitterMC.currentFrame == laserEmitterMC.totalFrames)
         {
            laserEmitterMC.gotoAndStop(1);
         }
         var r:Number = Math.random();
         if(r < 0.04)
         {
            if(laserEmitterMC.currentFrame == 1)
            {
               laserEmitterMC.gotoAndPlay(2);
            }
         }
         if(sprite_mc.hitTestObject(laserMC))
         {
            trainingPetFalse();
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(spriteRaceTraPanel);
      }
      
      private function moveRight() : void
      {
         sprite_mc.x += 5;
         if(sprite_mc.x > rightVerge - _showMc.width)
         {
            sprite_mc.x = rightVerge - _showMc.width;
         }
      }
      
      public function setup() : void
      {
         spriteRaceTraPanel = new SpriteRaceTrainingPanel();
         sprite_mc = spriteRaceTraPanel["sprite_mc"];
         ResourceManager.getResource(ClientConfig.getPetSwfPath(MainManager.actorModel.pet.info.petID),onShowComplete,"pet");
         laserEmitterMC = spriteRaceTraPanel["laserEmitterMC"];
         laserMC = laserEmitterMC["laserMC"];
         laserEmitterMC.gotoAndPlay(1);
         closeBtn = spriteRaceTraPanel["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         timeTxt = spriteRaceTraPanel["timeTxt"];
         timeTxt.text = count.toString();
         timer = new Timer(1000);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.start();
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         if(_showMc)
         {
            _showMc.gotoAndStop(Direction.UP);
            sprite_mc.addChild(_showMc);
            _showMc.x = _showMc.width;
            _showMc.y = _showMc.height;
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         trainingPetFalse();
      }
      
      private function onKeyDown(evt:KeyboardEvent) : void
      {
         var keyCode:uint = evt.keyCode;
         switch(keyCode)
         {
            case 37:
               moveLeft();
               break;
            case 38:
               break;
            case 39:
               moveRight();
               break;
            case 40:
         }
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         if(count == 0)
         {
            timer.removeEventListener(TimerEvent.TIMER,onTimer);
            timer.stop();
            timer = null;
            timeTxt.text = "0";
            EventManager.dispatchEvent(new DynamicEvent("Training_Pet_Sucess","game_2"));
            this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
            hide();
         }
         --count;
         timeTxt.text = count.toString();
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(spriteRaceTraPanel))
         {
            return;
         }
         LevelManager.appLevel.addChild(spriteRaceTraPanel);
         DisplayUtil.align(spriteRaceTraPanel,null,AlignType.MIDDLE_CENTER);
      }
      
      private function moveLeft() : void
      {
         sprite_mc.x -= 5;
         if(sprite_mc.x < leftVerge - _showMc.width)
         {
            sprite_mc.x = leftVerge - _showMc.width;
         }
      }
      
      public function destroy() : void
      {
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
      }
      
      private function trainingPetFalse() : void
      {
         EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_2"));
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
         timer.removeEventListener(TimerEvent.TIMER,onTimer);
         timer.stop();
         timer = null;
         hide();
         trace("Training_Pet_False");
      }
   }
}

