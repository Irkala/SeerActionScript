package com.robot.module.app
{
   import com.robot.app.petbag.ui.PetBagListItem;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.PetManager;
   import com.robot.core.mode.AppModel;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.uic.UIPanel;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetListPanel extends UIPanel implements IModule
   {
      
      private static const LIST_LENGTH:int = 6;
      
      private var _listCon:Sprite;
      
      private var _listData:Array;
      
      private var mainUI:PetMainUI = new PetMainUI();
      
      private var _curretItem:PetBagListItem;
      
      private var panel1:AppModel = null;
      
      public function PetListPanel()
      {
         super(mainUI);
      }
      
      private function onUpDate(e:PetEvent) : void
      {
         refreshItem();
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      public function show() : void
      {
         _show();
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         refreshItem();
         mainUI.commit_btn.addEventListener(MouseEvent.CLICK,onCommitClickHandler);
         PetManager.addEventListener(PetEvent.UPDATE_INFO,onUpDate);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      override public function destroy() : void
      {
         PetManager.removeEventListener(PetEvent.UPDATE_INFO,onUpDate);
         mainUI.commit_btn.removeEventListener(MouseEvent.CLICK,onCommitClickHandler);
         super.destroy();
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         if(_curretItem)
         {
            _curretItem.isSelect = false;
         }
         _curretItem = e.currentTarget as PetBagListItem;
         _curretItem.isSelect = true;
      }
      
      private function onCommitClickHandler(e:MouseEvent) : void
      {
         if(_curretItem != null)
         {
            hide();
            panel1 = new AppModel(ClientConfig.getAppModule("PetSkillSortPanel"),"正在打开技能排序面板");
            panel1.init(_curretItem.info);
            panel1.show();
         }
         else
         {
            Alarm.show("请选择你要为精灵的技能排序的精灵");
         }
      }
      
      public function refreshItem() : void
      {
         var dis:PetBagListItem = null;
         var info:PetInfo = null;
         var item:PetBagListItem = null;
         _curretItem = null;
         for(var k:int = 0; k < LIST_LENGTH; k++)
         {
            dis = _listCon.getChildAt(k) as PetBagListItem;
            dis.mouseEnabled = false;
            dis.hide();
            dis.removeEventListener(MouseEvent.CLICK,onItemClick);
         }
         var _listData:Array = PetManager.infos;
         _listData.sortOn("isDefault",Array.DESCENDING);
         var len:int = Math.min(LIST_LENGTH,PetManager.length);
         for(var i:int = 0; i < len; i++)
         {
            info = _listData[i] as PetInfo;
            item = _listCon.getChildAt(i) as PetBagListItem;
            item.show(info);
            item.name = info.id.toString();
            item.mouseEnabled = true;
            item.addEventListener(MouseEvent.CLICK,onItemClick);
         }
         if(len == 0)
         {
            mainUI.commit_btn.visible = false;
            return;
         }
      }
      
      public function setup() : void
      {
         var item:PetBagListItem = null;
         _listCon = new Sprite();
         _listCon.x = 30;
         _listCon.y = 70;
         addChild(_listCon);
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = new PetBagListItem();
            item.y = (item.height + 6) * int(i / 2);
            item.x = (item.width + 6) * (i % 2);
            _listCon.addChild(item);
         }
      }
   }
}

