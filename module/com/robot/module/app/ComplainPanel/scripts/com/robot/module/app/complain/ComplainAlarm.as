package com.robot.module.app.complain
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class ComplainAlarm
   {
      
      public function ComplainAlarm()
      {
         super();
      }
      
      public static function show() : Sprite
      {
         var sprite:Sprite = null;
         var applyBtn:SimpleButton = null;
         var apply:Function = null;
         apply = function(event:MouseEvent):void
         {
            applyBtn.removeEventListener(MouseEvent.CLICK,apply);
            DisplayUtil.removeForParent(sprite);
         };
         sprite = new ui_complain_alarm();
         var bgmc:Sprite = sprite["bgMc"];
         bgmc.addEventListener(MouseEvent.MOUSE_DOWN,function():void
         {
            sprite.startDrag();
         });
         bgmc.addEventListener(MouseEvent.MOUSE_UP,function():void
         {
            sprite.stopDrag();
         });
         LevelManager.topLevel.addChild(sprite);
         DisplayUtil.align(sprite,null,AlignType.MIDDLE_CENTER);
         applyBtn = sprite["applyBtn"];
         applyBtn.addEventListener(MouseEvent.CLICK,apply);
         return sprite;
      }
   }
}

