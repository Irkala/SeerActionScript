package com.robot.module.app
{
   import com.robot.app.darkPortal.DarkPortalModel;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorChoicePanel_2 extends Sprite implements IModule
   {
      
      private var _mainPanel:DarkProtalDoorMc2;
      
      private var _containerMc:MovieClip;
      
      private var _doorContainer:MovieClip;
      
      private var _commitBtn:SimpleButton;
      
      private var _cancelBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _door1:MovieClip;
      
      private var _door2:MovieClip;
      
      private var _point:Point = new Point(229.1,28.7);
      
      private var glowF:GlowFilter;
      
      private var doorIndex:uint = 0;
      
      private var closeFunc:Function = null;
      
      public function DarkDoorChoicePanel_2()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainPanel = new DarkProtalDoorMc2();
         this._containerMc = this._mainPanel["mc"];
         this.glowF = new GlowFilter();
         this.glowF.blurX = 16;
         this.glowF.blurY = 16;
         this.glowF.strength = 3;
         this.glowF.color = 16777215;
      }
      
      private function onFrameEventHandler(e:Event) : void
      {
         if(Boolean(this._containerMc["doorContainer"]))
         {
            this._doorContainer = this._containerMc["doorContainer"];
            this._containerMc.gotoAndStop(this._containerMc.totalFrames);
            this._containerMc.removeEventListener(Event.ENTER_FRAME,this.onFrameEventHandler);
            this._doorContainer.addEventListener(Event.ENTER_FRAME,this.onFrameEventHandler1);
         }
      }
      
      private function onFrameEventHandler1(e:Event) : void
      {
         if(Boolean(this._doorContainer["commit_btn"]) && Boolean(this._doorContainer["cancel_btn"]) && Boolean(this._doorContainer["close_btn"]) && Boolean(this._doorContainer["mm1"]))
         {
            this._doorContainer.removeEventListener(Event.ENTER_FRAME,this.onFrameEventHandler1);
            this._doorContainer.gotoAndStop(this._doorContainer.totalFrames);
            this._commitBtn = this._doorContainer["commit_btn"];
            this._commitBtn.mouseEnabled = false;
            this._cancelBtn = this._doorContainer["cancel_btn"];
            this._closeBtn = this._doorContainer["close_btn"];
            this._doorContainer["mm1"].mouseEnabled = false;
            this._doorContainer["mm1"].mouseChildren = false;
            this._doorContainer["mm2"].mouseEnabled = false;
            this._doorContainer["mm2"].mouseChildren = false;
            this._door1 = this._doorContainer["darkdoor_1"];
            this._door1.buttonMode = true;
            this._door1.mouseChildren = false;
            this._door2 = this._doorContainer["darkdoor_2"];
            this._door2.buttonMode = true;
            this._door2.mouseChildren = false;
            this.addEvent();
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         this._containerMc.gotoAndPlay(1);
         this._containerMc.addEventListener(Event.ENTER_FRAME,this.onFrameEventHandler);
         LevelManager.appLevel.addChild(this._mainPanel);
         this._mainPanel.x = this._point.x;
         this._mainPanel.y = this._point.y;
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
         this.glowF = null;
      }
      
      private function onDoorClickHandler(e:MouseEvent) : void
      {
         this._commitBtn.filters = [];
         this._commitBtn.mouseEnabled = true;
         switch(e.currentTarget.name)
         {
            case "darkdoor_1":
               this._door1.filters = [this.glowF];
               this._door2.filters = [];
               this.doorIndex = 1;
               break;
            case "darkdoor_2":
               this._door2.filters = [this.glowF];
               this._door1.filters = [];
               this.doorIndex = 2;
         }
      }
      
      private function removeEvent() : void
      {
         if(Boolean(this._commitBtn))
         {
            this._commitBtn.removeEventListener(MouseEvent.CLICK,this.onSureClickHandler);
            this._commitBtn = null;
         }
         if(Boolean(this._cancelBtn))
         {
            this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
            this._cancelBtn = null;
         }
         if(Boolean(this._closeBtn))
         {
            this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
            this._closeBtn = null;
         }
         if(Boolean(this._door1))
         {
            this._door1.removeEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
            this._door1 = null;
         }
         if(Boolean(this._door2))
         {
            this._door2.removeEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
            this._door2 = null;
         }
         if(this._containerMc.hasEventListener(Event.ENTER_FRAME))
         {
            this._containerMc.removeEventListener(Event.ENTER_FRAME,this.onFrameEventHandler);
         }
         if(this._doorContainer.hasEventListener(Event.ENTER_FRAME))
         {
            this._doorContainer.removeEventListener(Event.ENTER_FRAME,this.onFrameEventHandler1);
         }
      }
      
      private function addEvent() : void
      {
         this._commitBtn.addEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
         this._door1.addEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
         this._door2.addEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onSureClickHandler(e:MouseEvent) : void
      {
         switch(this.doorIndex)
         {
            case 1:
               DarkPortalModel.enterDarkProtal(12,this.hide,this.doorIndex);
               break;
            case 2:
               DarkPortalModel.enterDarkProtal(13,this.hide,this.doorIndex);
         }
      }
      
      private function onCancelClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
   }
}

