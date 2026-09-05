package com.robot.module.app
{
   import com.robot.app.darkPortal.DarkPortalModel;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorChoicePanel_10 extends Sprite implements IModule
   {
      
      private var _sureBtn:SimpleButton;
      
      private var _cancelBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _doorArr:Array;
      
      private var _mainPanel:MovieClip;
      
      private var _glowF:GlowFilter;
      
      private var _currentIndex:int;
      
      private var _hasAddEvent:Boolean = false;
      
      public function DarkDoorChoicePanel_10()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainPanel = new DarkProtalDoorMc10();
         this._mainPanel.gotoAndStop(1);
         this._mainPanel.x = 249.7;
         this._mainPanel.y = 131.65;
         this._glowF = new GlowFilter();
         this._glowF.blurX = 16;
         this._glowF.blurY = 16;
         this._glowF.strength = 3;
         this._glowF.color = 16777215;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._mainPanel);
         this._mainPanel.gotoAndPlay(1);
         this._mainPanel.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this._currentIndex = -1;
         this._hasAddEvent = false;
      }
      
      private function onEnterFrame(e:Event) : void
      {
         var i:int = 0;
         if(this._mainPanel.currentFrame == this._mainPanel.totalFrames)
         {
            this._mainPanel.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this._mainPanel.gotoAndStop(this._mainPanel.totalFrames);
            this._doorArr = [];
            for(i = 0; i < 3; i++)
            {
               this._mainPanel["door" + i].buttonMode = true;
               this._doorArr.push(this._mainPanel["door" + i]);
            }
            this._sureBtn = this._mainPanel["sureBtn"];
            this._cancelBtn = this._mainPanel["cancelBtn"];
            this._closeBtn = this._mainPanel["closeBtn"];
            this._sureBtn.mouseEnabled = false;
            this.addEvent();
         }
      }
      
      private function addEvent() : void
      {
         for(var i:int = 0; i < 3; i++)
         {
            this._doorArr[i].addEventListener(MouseEvent.CLICK,this.onDoorClick);
         }
         this._sureBtn.addEventListener(MouseEvent.CLICK,this.onSureBtn);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancelBtn);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseBtn);
      }
      
      private function onDoorClick(e:MouseEvent) : void
      {
         var item:MovieClip = null;
         var target:MovieClip = e.currentTarget as MovieClip;
         this._currentIndex = int(target.name.substring(4));
         for each(item in this._doorArr)
         {
            if(item == target)
            {
               item.filters = [this._glowF];
            }
            else
            {
               item.filters = [];
            }
         }
         if(!this._sureBtn.mouseEnabled)
         {
            this._sureBtn.mouseEnabled = true;
         }
      }
      
      private function onSureBtn(e:MouseEvent) : void
      {
         if(this._currentIndex == -1)
         {
            Alarm.show("请选择一个你要进入的门!");
            return;
         }
         DarkPortalModel.enterDarkProtal(60 + this._currentIndex,this.hide,this._currentIndex);
      }
      
      private function onCancelBtn(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onCloseBtn(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function removeEvent() : void
      {
         var i:int = 0;
         if(this._hasAddEvent)
         {
            for(i = 0; i < 3; i++)
            {
               this._doorArr[i].removeEventListener(MouseEvent.CLICK,this.onDoorClick);
            }
            this._sureBtn.removeEventListener(MouseEvent.CLICK,this.onSureBtn);
            this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onCancelBtn);
            this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseBtn);
            this._hasAddEvent = false;
         }
         this._mainPanel.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._mainPanel);
         this.removeEvent();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function destroy() : void
      {
         this.hide();
         this._sureBtn = null;
         this._cancelBtn = null;
         this._closeBtn = null;
         this._mainPanel = null;
         this._glowF = null;
      }
   }
}

