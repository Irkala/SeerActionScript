package com.robot.module.game.plantsVsZombies.card
{
   import com.robot.module.game.plantsVsZombies.ob.PlantsTopBoxObserver;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class BasePlantsCard extends Sprite
   {
      
      private var speed:Number = 1;
      
      private var index:uint;
      
      protected var _icon:Sprite;
      
      public function BasePlantsCard()
      {
         super();
         this.cacheAsBitmap = true;
         this.graphics.beginFill(0,0);
         this.graphics.drawRect(0,0,90,85);
         this.graphics.endFill();
         this.buttonMode = true;
         _icon = getIcon();
         DisplayUtil.align(_icon,this.getBounds(this),AlignType.BOTTOM_CENTER);
         addChild(_icon);
         this.addEventListener(MouseEvent.ROLL_OVER,onOver);
         this.addEventListener(MouseEvent.ROLL_OUT,onOut);
      }
      
      public function get type() : uint
      {
         return 0;
      }
      
      protected function onOver(event:MouseEvent) : void
      {
         CardTip.show(this);
      }
      
      protected function onOut(event:MouseEvent) : void
      {
         CardTip.hide();
      }
      
      private function onEnterFrame(event:Event) : void
      {
         var target:Number = this.width * index;
         if(this.x - speed - target <= 0)
         {
            this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
            this.x = target;
         }
         else
         {
            this.x -= speed;
         }
      }
      
      protected function getIcon() : Sprite
      {
         return null;
      }
      
      public function useCard() : void
      {
         destroy();
         DisplayUtil.removeForParent(this);
      }
      
      public function get icon() : Sprite
      {
         return _icon;
      }
      
      public function destroy() : void
      {
         CardTip.destroy();
         this.removeEventListener(MouseEvent.ROLL_OVER,onOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,onOut);
         _icon = null;
         this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
      }
      
      public function setup() : void
      {
         index = PlantsTopBoxObserver.cardArray.indexOf(this);
         this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
      }
   }
}

