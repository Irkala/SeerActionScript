package com.robot.module.app
{
   import com.robot.app.cutBmp.CutBmpController;
   import com.robot.core.event.CutBmpEvent;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.module.app.cutBmp.ICutBmpCategory;
   import com.robot.module.app.cutBmp.cutWithChat.CutWithChatCategory;
   import com.robot.module.app.cutBmp.cutWithChat.DotDragManager;
   import com.robot.module.app.cutBmp.cutWithChat.LineSprite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class CutBmp extends Sprite implements IModule
   {
      
      public static var bmpLevel:Sprite;
      
      private var _type:uint;
      
      private var _toID:uint;
      
      private var category:ICutBmpCategory;
      
      public function CutBmp()
      {
         super();
      }
      
      public function hide() : void
      {
      }
      
      public function setup() : void
      {
      }
      
      public function show() : void
      {
         bmpLevel = new Sprite();
         var bmpData:BitmapData = new BitmapData(MainManager.getStageWidth(),MainManager.getStageHeight());
         bmpData.draw(MainManager.getStage());
         var bmp:Bitmap = new Bitmap(bmpData);
         bmpLevel.addChild(bmp);
         MainManager.getStage().addChild(bmpLevel);
         if(_type == CutBmpController.CHAT_TYPE)
         {
            category = new CutWithChatCategory();
         }
      }
      
      public function init(data:Object = null) : void
      {
         _type = data["_type"];
         _toID = data["_toID"];
         EventManager.addEventListener(RobotEvent.CUT_BMP,onCutBmp);
         EventManager.addEventListener(LineSprite.CLOSE_CUTBMP_TOOL,onClose);
      }
      
      private function onCutBmp(event:DynamicEvent) : void
      {
         var str:String = event.paramObject.toString();
         EventManager.dispatchEvent(new CutBmpEvent(CutBmpEvent.CUT_BMP_COMPLETE,str,_toID));
         DisplayUtil.removeForParent(bmpLevel);
         destroy();
      }
      
      private function onClose(event:Event) : void
      {
         destroy();
      }
      
      public function destroy() : void
      {
         EventManager.removeEventListener(LineSprite.CLOSE_CUTBMP_TOOL,onClose);
         EventManager.removeEventListener(RobotEvent.CUT_BMP,onCutBmp);
         category.destroy();
         category = null;
         DotDragManager.destroy();
         DisplayUtil.removeForParent(bmpLevel);
         bmpLevel = null;
      }
   }
}

