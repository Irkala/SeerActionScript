package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gaiya.FetchSet_Panel;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class GaiyaFetchSetPanel extends Sprite implements IModule
   {
      
      private var _xieBtn:SimpleButton;
      
      private var _xueBtn:SimpleButton;
      
      private var _defID:uint;
      
      private var _closeBtn:SimpleButton;
      
      private var _shiBtn:SimpleButton;
      
      private var _ui:Sprite;
      
      private var _selectID:uint;
      
      public function GaiyaFetchSetPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_ui);
      }
      
      private function getName(param1:uint) : String
      {
         var _loc2_:String = "";
         if(param1 == 1)
         {
            _loc2_ = "血印";
         }
         else if(param1 == 2)
         {
            _loc2_ = "邪印";
         }
         else if(param1 == 3)
         {
            _loc2_ = "天印";
         }
         return TextFormatUtil.getRedTxt(_loc2_);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_ui);
         DisplayUtil.align(_ui,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onSelectClick(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         if(event.currentTarget == _xueBtn)
         {
            _selectID = 1;
         }
         else if(event.currentTarget == _xieBtn)
         {
            _selectID = 2;
         }
         else if(event.currentTarget == _shiBtn)
         {
            _selectID = 3;
         }
         Answer.show("    盖亚在同一时间只能保持一种魂印，是否要替换原有魂印？",function():void
         {
            SocketConnection.addCmdListener(CommandID.M_2148,onM2148);
            SocketConnection.send(CommandID.M_2148,_selectID);
         });
         destroy();
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      private function onM2148(param1:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.M_2148,onM2148);
         Alarm.show("盖亚的" + getName(_defID) + "已经替换成了" + getName(_selectID));
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         destroy();
      }
      
      public function setup() : void
      {
         _ui = new FetchSet_Panel();
         _closeBtn = _ui["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _xueBtn = _ui["xueBtn"];
         _xueBtn.enabled = false;
         _xueBtn.filters = [ColorFilter.setGrayscale()];
         _xieBtn = _ui["xieBtn"];
         _xieBtn.enabled = false;
         _xieBtn.filters = [ColorFilter.setGrayscale()];
         _shiBtn = _ui["shiBtn"];
         _shiBtn.enabled = false;
         _shiBtn.filters = [ColorFilter.setGrayscale()];
         SocketConnection.addCmdListener(CommandID.M_2149,onGaiyaEffect);
         SocketConnection.send(CommandID.M_2149);
      }
      
      private function onGaiyaEffect(param1:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.M_2149,onGaiyaEffect);
         openBtn(_xueBtn);
         openBtn(_xieBtn);
         openBtn(_shiBtn);
      }
      
      private function openBtn(param1:SimpleButton) : void
      {
         param1.enabled = true;
         param1.filters = [];
         param1.addEventListener(MouseEvent.CLICK,onSelectClick);
      }
      
      public function destroy() : void
      {
         SocketConnection.removeCmdListener(CommandID.M_2149,onGaiyaEffect);
         hide();
         _xueBtn.removeEventListener(MouseEvent.CLICK,onSelectClick);
         _xueBtn = null;
         _xieBtn.removeEventListener(MouseEvent.CLICK,onSelectClick);
         _xieBtn = null;
         _shiBtn.removeEventListener(MouseEvent.CLICK,onSelectClick);
         _shiBtn = null;
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _closeBtn = null;
         _ui = null;
      }
   }
}

