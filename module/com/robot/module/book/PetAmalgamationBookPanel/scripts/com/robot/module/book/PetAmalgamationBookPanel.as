package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetAmalgamationBookPanel extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var close_btn:SimpleButton;
      
      public function PetAmalgamationBookPanel()
      {
         super();
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         hide();
         close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         close_btn = null;
         mainUI = null;
      }
      
      public function setup() : void
      {
         mainUI = new PetAmalgamationBookUI();
         close_btn = mainUI["close_btn"];
         close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}

