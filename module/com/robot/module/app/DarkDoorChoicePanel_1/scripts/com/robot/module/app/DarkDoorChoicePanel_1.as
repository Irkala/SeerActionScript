package com.robot.module.app
{
   import com.robot.app.darkPortal.DarkPortalModel;
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorChoicePanel_1 extends Sprite implements IModule
   {
      
      private var _mainPanel:DarkProtalDoorMc1;
      
      private var _containerMc:Sprite;
      
      private var _sureBtn:SimpleButton;
      
      private var _cancelBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _point:Point = new Point(497.9,32.9);
      
      public function DarkDoorChoicePanel_1()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainPanel = new DarkProtalDoorMc1();
         this._containerMc = this._mainPanel["mc"];
         this._sureBtn = this._containerMc["sureBtn"];
         this._cancelBtn = this._containerMc["cancelBtn"];
         this._closeBtn = this._mainPanel["closeBtn"];
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         this._mainPanel.gotoAndPlay(1);
         LevelManager.appLevel.addChild(this._mainPanel);
         this._mainPanel.x = this._point.x;
         this._mainPanel.y = this._point.y;
         this.addEvent();
      }
      
      public function hide() : void
      {
         this.removeEvent();
         DisplayUtil.removeForParent(this._mainPanel);
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function destroy() : void
      {
         this.hide();
         this._mainPanel = null;
         this._containerMc = null;
         this._sureBtn = null;
         this._cancelBtn = null;
         this._closeBtn = null;
      }
      
      private function removeEvent() : void
      {
         this._sureBtn.removeEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
      }
      
      private function addEvent() : void
      {
         this._sureBtn.addEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onSureClickHandler(e:MouseEvent) : void
      {
         this._sureBtn.removeEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         setTimeout(function():void
         {
            if(Boolean(_sureBtn))
            {
               _sureBtn.addEventListener(MouseEvent.CLICK,onSureClickHandler);
            }
         },2000);
         DarkPortalModel.enterDarkProtal(6,this.hide);
      }
      
      private function onCancelClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
   }
}

