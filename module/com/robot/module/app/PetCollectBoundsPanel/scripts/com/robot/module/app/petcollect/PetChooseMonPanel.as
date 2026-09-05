package com.robot.module.app.petcollect
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class PetChooseMonPanel
   {
      
      public function PetChooseMonPanel()
      {
         super();
      }
      
      public static function show(param1:Function) : void
      {
         var i:int = 0;
         var sprite:Sprite = null;
         var closeBtn:SimpleButton = null;
         var dragBtn:SimpleButton = null;
         var grassBtn:MovieClip = null;
         var fireBtn:MovieClip = null;
         var waterBtn:MovieClip = null;
         var onRollOver:Function = null;
         var onRollOut:Function = null;
         var onSelect:Function = null;
         var onDragDown:Function = null;
         var onDragUp:Function = null;
         var onClose:Function = null;
         var event:Function = param1;
         sprite = null;
         closeBtn = null;
         dragBtn = null;
         grassBtn = null;
         fireBtn = null;
         waterBtn = null;
         onRollOver = null;
         onRollOut = null;
         onSelect = null;
         onDragDown = null;
         onDragUp = null;
         onClose = null;
         var cheak:Function = function(param1:int):void
         {
            if(param1 == 1 || param1 == 2 || param1 == 3)
            {
               grassBtn.filters = [ColorFilter.setGrayscale()];
               grassBtn.mouseEnabled = false;
               grassBtn.mouseChildren = false;
            }
            else if(param1 == 7 || param1 == 8 || param1 == 9)
            {
               fireBtn.filters = [ColorFilter.setGrayscale()];
               fireBtn.mouseEnabled = false;
               fireBtn.mouseChildren = false;
            }
            else if(param1 == 4 || param1 == 5 || param1 == 6)
            {
               waterBtn.filters = [ColorFilter.setGrayscale()];
               waterBtn.mouseEnabled = false;
               waterBtn.mouseChildren = false;
            }
         };
         onRollOver = function(param1:MouseEvent):void
         {
            (param1.currentTarget as MovieClip).gotoAndPlay(2);
         };
         onRollOut = function(param1:MouseEvent):void
         {
            (param1.currentTarget as MovieClip).gotoAndStop(1);
         };
         onSelect = function(param1:MouseEvent):void
         {
            if(param1.currentTarget == grassBtn)
            {
               event(1);
            }
            else if(param1.currentTarget == fireBtn)
            {
               event(7);
            }
            else if(param1.currentTarget == waterBtn)
            {
               event(4);
            }
            onClose(null);
         };
         onDragDown = function(param1:MouseEvent):void
         {
            sprite.startDrag();
         };
         onDragUp = function(param1:MouseEvent):void
         {
            sprite.stopDrag();
         };
         onClose = function(param1:MouseEvent):void
         {
            DisplayUtil.removeForParent(sprite);
            closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
            dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
            dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
            grassBtn.removeEventListener(MouseEvent.CLICK,onSelect);
            fireBtn.removeEventListener(MouseEvent.CLICK,onSelect);
            waterBtn.removeEventListener(MouseEvent.CLICK,onSelect);
            grassBtn.removeEventListener(MouseEvent.ROLL_OVER,onRollOver);
            fireBtn.removeEventListener(MouseEvent.ROLL_OVER,onRollOver);
            waterBtn.removeEventListener(MouseEvent.ROLL_OVER,onRollOver);
            grassBtn.removeEventListener(MouseEvent.ROLL_OUT,onRollOut);
            fireBtn.removeEventListener(MouseEvent.ROLL_OUT,onRollOut);
            waterBtn.removeEventListener(MouseEvent.ROLL_OUT,onRollOut);
         };
         sprite = new UI_ChooseMon();
         LevelManager.topLevel.addChild(sprite);
         DisplayUtil.align(sprite,null,AlignType.MIDDLE_CENTER);
         closeBtn = sprite["closeBtn"];
         dragBtn = sprite["dragBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         grassBtn = sprite["grassBtn"];
         fireBtn = sprite["fireBtn"];
         waterBtn = sprite["waterBtn"];
         grassBtn.buttonMode = true;
         fireBtn.buttonMode = true;
         waterBtn.buttonMode = true;
         grassBtn.gotoAndStop(1);
         fireBtn.gotoAndStop(1);
         waterBtn.gotoAndStop(1);
         grassBtn.addEventListener(MouseEvent.ROLL_OVER,onRollOver);
         fireBtn.addEventListener(MouseEvent.ROLL_OVER,onRollOver);
         waterBtn.addEventListener(MouseEvent.ROLL_OVER,onRollOver);
         grassBtn.addEventListener(MouseEvent.ROLL_OUT,onRollOut);
         fireBtn.addEventListener(MouseEvent.ROLL_OUT,onRollOut);
         waterBtn.addEventListener(MouseEvent.ROLL_OUT,onRollOut);
         grassBtn.addEventListener(MouseEvent.CLICK,onSelect);
         fireBtn.addEventListener(MouseEvent.CLICK,onSelect);
         waterBtn.addEventListener(MouseEvent.CLICK,onSelect);
         i = 1;
         while(i <= 9)
         {
            if(PetManager.containsBagForID(i))
            {
               cheak(i);
            }
            else if(PetManager.containsStorageForID(i))
            {
               cheak(i);
            }
            i++;
         }
      }
   }
}

