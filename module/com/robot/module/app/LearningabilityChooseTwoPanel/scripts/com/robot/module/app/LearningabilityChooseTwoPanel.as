package com.robot.module.app
{
   import com.robot.core.ui.alert.Alarm;
   import flash.events.MouseEvent;
   import org.taomee.utils.ArrayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LearningabilityChooseTwoPanel extends SimpleModule
   {
      
      private var _chooseIndexs:Array = [];
      
      private var _chooseFun:Function;
      
      public function LearningabilityChooseTwoPanel()
      {
         super();
      }
      
      override public function setup() : void
      {
         _ui = new LearningabilityChooseTwoUI();
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.addChooseBtnEvent(_loc1_);
            _loc1_++;
         }
         addMoudleEvent(_ui.okBtn,MouseEvent.CLICK,this.onOkbtnClick);
         this.setChooseItem();
      }
      
      override public function init(param1:Object = null) : void
      {
         this._chooseFun = param1 as Function;
      }
      
      private function setChooseItem() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            if(this._chooseIndexs.indexOf(_loc1_) != -1)
            {
               _ui["btn" + _loc1_].gotoAndStop(2);
            }
            else
            {
               _ui["btn" + _loc1_].gotoAndStop(1);
            }
            _loc1_++;
         }
      }
      
      private function addChooseBtnEvent(param1:int) : void
      {
         var i:int = param1;
         _ui["btn" + i].buttonMode = true;
         addMoudleEvent(_ui["btn" + i],MouseEvent.CLICK,function(param1:*):void
         {
            if(_chooseIndexs.indexOf(i) != -1)
            {
               ArrayUtil.removeValueFromArray(_chooseIndexs,i);
            }
            else if(_chooseIndexs.length == 2)
            {
               _chooseIndexs[1] = i;
            }
            else
            {
               _chooseIndexs.push(i);
            }
            setChooseItem();
         });
      }
      
      private function onOkbtnClick(param1:MouseEvent) : void
      {
         if(this._chooseIndexs.length < 2)
         {
            Alarm.show("还没有选择两个需要注满的学习力！");
         }
         else
         {
            hide();
            this._chooseFun(this._chooseIndexs);
         }
      }
   }
}

