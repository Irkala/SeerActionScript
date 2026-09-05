package com.robot.module.app.complain
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class ComplainAnswer
   {
      
      public function ComplainAnswer()
      {
         super();
      }
      
      public static function show(str:String, applyFun:Function = null, cancelFun:Function = null) : Sprite
      {
         var txt:TextField;
         var sprite:Sprite = null;
         var applyBtn:SimpleButton = null;
         var cancelBtn:SimpleButton = null;
         var apply:Function = null;
         var cancel:Function = null;
         apply = function(event:MouseEvent):void
         {
            LevelManager.openMouseEvent();
            if(applyFun != null)
            {
               applyFun();
            }
            applyBtn.removeEventListener(MouseEvent.CLICK,apply);
            cancelBtn.removeEventListener(MouseEvent.CLICK,cancel);
            DisplayUtil.removeForParent(sprite);
         };
         cancel = function(event:MouseEvent):void
         {
            LevelManager.openMouseEvent();
            if(cancelFun != null)
            {
               cancelFun();
            }
            applyBtn.removeEventListener(MouseEvent.CLICK,apply);
            cancelBtn.removeEventListener(MouseEvent.CLICK,cancel);
            DisplayUtil.removeForParent(sprite);
         };
         sprite = new ui_complain_answer();
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
         LevelManager.closeMouseEvent();
         txt = sprite["txt"];
         txt.autoSize = TextFormatAlign.LEFT;
         txt.htmlText = str;
         txt.addEventListener(TextEvent.LINK,function(e:TextEvent):void
         {
            e.stopImmediatePropagation();
            sprite.dispatchEvent(e);
         });
         applyBtn = sprite["applyBtn"];
         cancelBtn = sprite["cancelBtn"];
         applyBtn.addEventListener(MouseEvent.CLICK,apply);
         cancelBtn.addEventListener(MouseEvent.CLICK,cancel);
         return sprite;
      }
   }
}

