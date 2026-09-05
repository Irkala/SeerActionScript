package com.robot.module.app
{
   import com.robot.app.panel.NatureChoosePanel;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.CommonUI;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class NatureChooseExtPanel extends Sprite implements IModule
   {
      
      private static const LIST_LENGTH:uint = 25;
      
      private var _nature:uint;
      
      private var _ui:MovieClip;
      
      public function NatureChooseExtPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._ui = new natureChoose_ui();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         this._ui.addEventListener(MouseEvent.CLICK,this.onClick);
         CommonUI.setEnabled(this._ui["ok"],false);
         this._ui["txt"].htmlText = "请选择你想转化的性格";
         LevelManager.appLevel.addChild(this._ui);
      }
      
      private function onClick(event:MouseEvent) : void
      {
         var index:int = 0;
         switch(event.target.name)
         {
            case "ok":
               Alert.show("确定要将" + NatureChoosePanel.petName + "转换为" + TextFormatUtil.getRedTxt(NatureXMLInfo.getName(this._nature)) + "性格吗？",function():void
               {
                  NatureChoosePanel.fun(_nature);
               });
               break;
            case "btn":
               index = int(event.target.parent.name.split("_")[1]);
               this._ui["item_" + (this._nature + 1)].gotoAndStop(1);
               this._nature = index - 1;
               this._ui["item_" + (this._nature + 1)].gotoAndStop(2);
               this._ui["txt"].htmlText = "确定要将" + NatureChoosePanel.petName + "转换为" + TextFormatUtil.getRedTxt(NatureXMLInfo.getName(this._nature)) + "性格吗？";
               CommonUI.setEnabled(this._ui["ok"],true);
               break;
            case "close":
               this.hide();
         }
      }
      
      public function hide() : void
      {
         NatureChoosePanel.cancel();
      }
      
      public function destroy() : void
      {
         this._ui.removeEventListener(MouseEvent.CLICK,this.onClick);
         DisplayUtil.removeForParent(this._ui);
         this._ui = null;
      }
   }
}

