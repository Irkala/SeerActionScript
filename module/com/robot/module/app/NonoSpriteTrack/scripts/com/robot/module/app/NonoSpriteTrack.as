package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import com.robot.module.app.spriteTrack.MapTrackPanel;
   import com.robot.module.app.spriteTrack.SpriteTrackPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NonoSpriteTrack extends Sprite implements IModule
   {
      
      private var spriteTrackBtn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var mapTrackBtn:SimpleButton;
      
      private var spriteTrackPanel:SpriteTrackPanel;
      
      private var _closeBtn:SimpleButton;
      
      private var mapTrackPanel:MapTrackPanel;
      
      public function NonoSpriteTrack()
      {
         super();
      }
      
      public function destroy() : void
      {
         removeEvent();
         mapTrackPanel.destroy();
         spriteTrackPanel.destroy();
         if(mainUI)
         {
            DisplayUtil.removeForParent(mainUI);
            mainUI = null;
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function showPanel(evt:DynamicEvent) : void
      {
         EventManager.removeEventListener("back",showPanel);
         show();
      }
      
      public function setup() : void
      {
         mainUI = new ui_SpriteTrack_main();
         mapTrackBtn = mainUI["mapTrackBtn"];
         mapTrackBtn.addEventListener(MouseEvent.CLICK,showMapTrack);
         spriteTrackBtn = mainUI["spriteTrackBtn"];
         spriteTrackBtn.addEventListener(MouseEvent.CLICK,showSpriteTrack);
         _closeBtn = mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         mapTrackPanel = new MapTrackPanel();
         spriteTrackPanel = new SpriteTrackPanel();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(mainUI);
         mainUI.x = 260;
         mainUI.y = 30;
         EventManager.addEventListener("back",showPanel);
      }
      
      private function showSpriteTrack(evt:MouseEvent) : void
      {
         hide();
         hideMapTrack();
         LevelManager.appLevel.addChild(spriteTrackPanel);
         spriteTrackPanel.x = 160;
         spriteTrackPanel.y = 30;
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      private function hideSpriteTrack() : void
      {
         if(spriteTrackPanel)
         {
            DisplayUtil.removeForParent(spriteTrackPanel);
         }
      }
      
      private function hideMapTrack() : void
      {
         if(mapTrackPanel)
         {
            DisplayUtil.removeForParent(mapTrackPanel);
         }
      }
      
      private function removeEvent() : void
      {
         EventManager.removeEventListener("back",showPanel);
      }
      
      private function showMapTrack(evt:MouseEvent) : void
      {
         hide();
         hideSpriteTrack();
         LevelManager.appLevel.addChild(mapTrackPanel);
         mapTrackPanel.x = 160;
         mapTrackPanel.y = 30;
      }
   }
}

