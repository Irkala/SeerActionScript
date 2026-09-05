package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class DarkProtalBookPanel extends Sprite implements IModule
   {
      
      private var _panel:DarkProtalBookMc;
      
      public function DarkProtalBookPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         _panel["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseHandler);
         DisplayUtil.removeForParent(_panel);
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_panel))
         {
            LevelManager.appLevel.addChild(_panel);
            _panel.gotoAndStop(1);
         }
         _panel["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseHandler);
         _panel.x = 151;
         _panel.y = 70;
      }
      
      public function setup() : void
      {
         _panel = new DarkProtalBookMc();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
      }
   }
}

