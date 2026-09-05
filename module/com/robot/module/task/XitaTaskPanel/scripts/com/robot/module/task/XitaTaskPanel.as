package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.manager.DepthManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class XitaTaskPanel extends Sprite implements IModule
   {
      
      private static const tip:Array = ["追击玄冰兽","玄冰兽曾在冰原上看到过。","玄冰兽曾在冰窖迷宫中看到过。","玄冰兽曾在冰窖迷宫中看到过。","路过溶洞时曾看到过。"];
      
      private var _closeBtn:SimpleButton;
      
      private var _dragBtn:SimpleButton;
      
      private var _mainUI:Sprite;
      
      public function XitaTaskPanel()
      {
         super();
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
         TasksManager.getProStatusList(8,function(arr:Array):void
         {
            var item:DisplayObject = null;
            for(var i:int = 1; i < 6; i++)
            {
               if(arr[i])
               {
                  item = _mainUI.getChildByName("d_" + i.toString());
                  item.filters = [];
               }
            }
         });
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         var item:Sprite = null;
         _mainUI = new UI_XitaTaskPanel();
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         for(var i:int = 1; i < 6; i++)
         {
            item = _mainUI.getChildByName("d_" + i.toString()) as Sprite;
            item.filters = [ColorFilter.setGrayscale()];
            ToolTipManager.add(item,tip[i - 1]);
         }
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
      }
      
      public function destroy() : void
      {
         var item:Sprite = null;
         for(var i:int = 1; i < 6; i++)
         {
            item = _mainUI.getChildByName("d_" + i.toString()) as Sprite;
            item.filters = [];
            ToolTipManager.remove(item);
            item = null;
         }
         hide();
         _mainUI = null;
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(_mainUI);
         _mainUI.startDrag();
      }
   }
}

