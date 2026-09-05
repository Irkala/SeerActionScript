package com.robot.module.app
{
   import com.robot.app.darkPortal.DarkPortalModel;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorChoicePanel_4 extends Sprite implements IModule
   {
      
      private var _sureBtn:SimpleButton;
      
      private var _cancelBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainPanel:DarkProtalDoorMc4;
      
      private var glowF:GlowFilter;
      
      private var _powerMc:Sprite;
      
      private var _closeFunc:Function;
      
      private var _curIndex:uint;
      
      public function DarkDoorChoicePanel_4()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainPanel = new DarkProtalDoorMc4();
         this._sureBtn = this._mainPanel["sureBtn"];
         this._sureBtn.mouseEnabled = false;
         this._cancelBtn = this._mainPanel["cancelBtn"];
         this._closeBtn = this._mainPanel["closeBtn"];
         this.glowF = new GlowFilter();
         this.glowF.blurX = 16;
         this.glowF.blurY = 16;
         this.glowF.strength = 3;
         this.glowF.color = 16777215;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._mainPanel);
         this._mainPanel.x = 264.7;
         this._mainPanel.y = 130.65;
         this.addEvent();
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
         this._closeFunc = null;
      }
      
      public function addEvent() : void
      {
         for(var i1:uint = 0; i1 < 3; i1++)
         {
            this._mainPanel["door" + i1].buttonMode = true;
            this._mainPanel["door" + i1].addEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
         }
         this._sureBtn.addEventListener(MouseEvent.CLICK,this.onSureBtnClickHandler);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancelBtnClickHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseBtnClickHandler);
      }
      
      private function onSureBtnClickHandler(e:MouseEvent) : void
      {
         if(!this._powerMc)
         {
            Alarm.show("请选择一个你要进入的门!");
            return;
         }
         DarkPortalModel.enterDarkProtal(24 + this._curIndex,this.hide,this._curIndex);
      }
      
      private function onCancelBtnClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onDoorClickHandler(e:MouseEvent) : void
      {
         this._sureBtn.mouseEnabled = true;
         if(Boolean(this._powerMc))
         {
            this._powerMc.filters = [];
         }
         this._powerMc = e.currentTarget as Sprite;
         this._powerMc.filters = [this.glowF];
         var nameStr:String = e.currentTarget.name;
         this._curIndex = uint(nameStr.slice(4,nameStr.length));
      }
      
      public function removeEvent() : void
      {
         for(var i1:uint = 0; i1 < 3; i1++)
         {
            this._mainPanel["door" + i1].removeEventListener(MouseEvent.CLICK,this.onDoorClickHandler);
         }
         this._sureBtn.removeEventListener(MouseEvent.CLICK,this.onSureBtnClickHandler);
         this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onCancelBtnClickHandler);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseBtnClickHandler);
      }
   }
}

