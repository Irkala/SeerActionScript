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
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpritePhysicalTraining extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var bLeft:Boolean = false;
      
      private var barArr:Array = [];
      
      private var sprite_mc:MovieClip;
      
      private var _showMc:MovieClip;
      
      private var bTop:Boolean = false;
      
      private var hitArr:Array = [];
      
      private var bRight:Boolean = false;
      
      private var bBottom:Boolean = false;
      
      private var spritePhyTraining:MovieClip;
      
      private var topHit:MovieClip;
      
      public function SpritePhysicalTraining()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(spritePhyTraining);
      }
      
      private function moveRight() : void
      {
         sprite_mc.x += 3;
      }
      
      private function checkHit() : void
      {
         if(hitArr[0].visible)
         {
            if(sprite_mc.hitTestObject(hitArr[0]))
            {
               DisplayUtil.removeForParent(hitArr[0]);
               hitArr[1].visible = true;
            }
         }
         if(hitArr[1].visible)
         {
            if(sprite_mc.hitTestObject(hitArr[1]))
            {
               DisplayUtil.removeForParent(hitArr[1]);
               hitArr[2].visible = true;
            }
         }
         if(hitArr[2].visible)
         {
            if(sprite_mc.hitTestObject(hitArr[2]))
            {
               DisplayUtil.removeForParent(hitArr[2]);
               EventManager.dispatchEvent(new DynamicEvent("Training_Pet_Sucess","game_1"));
               MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
               this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
               hide();
            }
         }
         if(sprite_mc.hitTestObject(topHit))
         {
            EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_1"));
            MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
            this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
            hide();
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_1"));
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
         hide();
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(spritePhyTraining))
         {
            return;
         }
         LevelManager.appLevel.addChild(spritePhyTraining);
         DisplayUtil.align(spritePhyTraining,null,AlignType.MIDDLE_CENTER);
      }
      
      private function moveBottom() : void
      {
         sprite_mc.y += 4;
      }
      
      private function onEntFrame(evt:Event) : void
      {
         sprite_mc.y -= 0.3;
         checkBar();
         checkHit();
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
               moveTop();
               break;
            case 39:
               moveRight();
               break;
            case 40:
               moveBottom();
         }
      }
      
      private function moveTop() : void
      {
         sprite_mc.y -= 4;
      }
      
      private function checkBar() : void
      {
         if(sprite_mc.hitTestObject(barArr[0]))
         {
            if(sprite_mc.y + sprite_mc.height / 2 < barArr[0].y)
            {
               sprite_mc.y = barArr[0].y - sprite_mc.height;
            }
            else if(sprite_mc.y + sprite_mc.height / 2 > barArr[0].y)
            {
               sprite_mc.y = barArr[0].y;
            }
         }
         if(sprite_mc.hitTestObject(barArr[1]))
         {
            if(sprite_mc.x + sprite_mc.width / 2 >= barArr[1].x)
            {
               sprite_mc.x = barArr[1].x;
            }
            else if(sprite_mc.x + sprite_mc.width / 2 < barArr[1].x)
            {
               sprite_mc.x = barArr[1].x - sprite_mc.width - _showMc.width / 2;
            }
         }
         if(sprite_mc.hitTestObject(barArr[2]))
         {
            if(sprite_mc.x + sprite_mc.width / 2 >= barArr[2].x)
            {
               sprite_mc.x = barArr[2].x;
            }
            else if(sprite_mc.x + sprite_mc.width / 2 <= barArr[2].x)
            {
               sprite_mc.x = barArr[2].x - sprite_mc.width - _showMc.width / 2;
            }
         }
         if(sprite_mc.hitTestObject(barArr[3]))
         {
            if(sprite_mc.y + sprite_mc.height / 2 <= barArr[3].y)
            {
               sprite_mc.y = barArr[3].y - sprite_mc.height;
            }
            else if(sprite_mc.y + sprite_mc.height / 2 > barArr[3].y)
            {
               sprite_mc.y = barArr[3].y;
            }
         }
         if(sprite_mc.x < 250)
         {
            sprite_mc.x = 250;
         }
         if(sprite_mc.x > 495)
         {
            sprite_mc.x = 495;
         }
         if(sprite_mc.y > 322)
         {
            sprite_mc.y = 322;
         }
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
      
      private function moveLeft() : void
      {
         sprite_mc.x -= 3;
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
         var barName:String = null;
         var mc:MovieClip = null;
         var hitName:String = null;
         var hitMc:MovieClip = null;
         spritePhyTraining = new SpritePhyTrainingPanel();
         sprite_mc = spritePhyTraining["sprite_mc"];
         ResourceManager.getResource(ClientConfig.getPetSwfPath(MainManager.actorModel.pet.info.petID),onShowComplete,"pet");
         topHit = spritePhyTraining["topHit"];
         for(var i:uint = 0; i < 4; i++)
         {
            barName = "bar_" + i;
            mc = spritePhyTraining[barName];
            barArr.push(mc);
         }
         for(var j:uint = 0; j < 3; j++)
         {
            hitName = "hit_" + j;
            hitMc = spritePhyTraining[hitName];
            hitArr.push(hitMc);
            if(j != 0)
            {
               hitMc.visible = false;
            }
         }
         closeBtn = spritePhyTraining["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
      }
   }
}

