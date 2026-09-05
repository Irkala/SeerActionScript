package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.repair.RepairItemMC;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class RepairItemPanel extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var isRepairAll:Boolean = false;
      
      private var panel:MovieClip;
      
      private var repairArray:Array = [];
      
      private var list:Array = [];
      
      private var _repairItem:RepairItemMC;
      
      private var currentPage:uint;
      
      private var nextBtn:SimpleButton;
      
      private var repairAllBtn:SimpleButton;
      
      private var perNum:uint = 8;
      
      private var totalPage:uint;
      
      private var prevBtn:SimpleButton;
      
      public function RepairItemPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         panel = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         repairAllBtn.removeEventListener(MouseEvent.CLICK,repairAll);
         closeBtn = null;
         repairAllBtn = null;
         _repairItem = null;
         prevBtn.removeEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.removeEventListener(MouseEvent.CLICK,nextHandler);
         prevBtn = null;
         nextBtn = null;
      }
      
      public function hide() : void
      {
         var i:RepairItemMC = null;
         for each(i in list)
         {
            DisplayUtil.removeForParent(i);
            i.destroy();
            list = [];
         }
         ItemManager.removeEventListener(ItemEvent.CLOTH_LIST,onListCloth);
         SocketConnection.removeCmdListener(CommandID.ITEM_REPAIR,onItemRepair);
         DisplayUtil.removeForParent(panel);
      }
      
      private function onListCloth(event:ItemEvent) : void
      {
         var i:uint = 0;
         var j:uint = 0;
         var info:SingleItemInfo = null;
         var mc:RepairItemMC = null;
         repairArray = [];
         var array:Array = ItemManager.getClothIDs();
         for each(i in array)
         {
            info = ItemManager.getClothInfo(i);
            if(ItemXMLInfo.getLifeTime(info.itemID) != 0)
            {
               if(info.leftTime < 1)
               {
                  repairArray.push(i);
               }
            }
         }
         if(repairArray.length == 0)
         {
            hide();
            Alarm.show("你身上没有需要修理的装备哦!");
            return;
         }
         list = [];
         for each(j in repairArray)
         {
            mc = new RepairItemMC();
            mc.itemID = j;
            mc.addEventListener(RepairItemMC.REPAIR,onItemClick);
            list.push(mc);
         }
         initPage();
      }
      
      private function initPage() : void
      {
         totalPage = Math.ceil(list.length / perNum);
         if(totalPage == 0)
         {
            totalPage = 1;
         }
         panel["pageTxt"].text = currentPage + "/" + totalPage;
         showItem();
      }
      
      private function onItemClick(event:Event) : void
      {
         var mc:RepairItemMC = event.currentTarget as RepairItemMC;
         _repairItem = mc;
      }
      
      private function repairAll(event:MouseEvent) : void
      {
         var i:RepairItemMC = null;
         var by:ByteArray = new ByteArray();
         for each(i in list)
         {
            by.writeUnsignedInt(i.itemID);
         }
         SocketConnection.send(CommandID.ITEM_REPAIR,list.length,by);
         isRepairAll = true;
      }
      
      private function prevHandler(event:MouseEvent) : void
      {
         if(currentPage == 1)
         {
            return;
         }
         --currentPage;
         initPage();
      }
      
      public function show() : void
      {
         currentPage = 1;
         SocketConnection.addCmdListener(CommandID.ITEM_REPAIR,onItemRepair);
         ItemManager.addEventListener(ItemEvent.CLOTH_LIST,onListCloth);
         ItemManager.getCloth();
         DisplayUtil.align(panel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(panel);
      }
      
      private function nextHandler(event:MouseEvent) : void
      {
         if(currentPage == totalPage)
         {
            return;
         }
         ++currentPage;
         initPage();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function showItem() : void
      {
         var mc:RepairItemMC = null;
         var temp:Array = null;
         var count:uint = 0;
         var i:RepairItemMC = null;
         if(list.length == 0)
         {
            hide();
            return;
         }
         for each(mc in list)
         {
            DisplayUtil.removeForParent(mc);
         }
         temp = list.slice((currentPage - 1) * perNum,currentPage * perNum);
         count = 0;
         for each(i in temp)
         {
            i.x = 35 + i.width * (count % 4);
            i.y = 50 + (i.height + 10) * Math.floor(count / 4);
            panel.addChild(i);
            count++;
         }
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         panel = new repair_panel();
         closeBtn = panel["closeBtn"];
         repairAllBtn = panel["repairAllBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         repairAllBtn.addEventListener(MouseEvent.CLICK,repairAll);
         prevBtn = panel["prevBtn"];
         nextBtn = panel["nextBtn"];
         prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);
      }
      
      private function onItemRepair(event:SocketEvent) : void
      {
         var singleInfo:SingleItemInfo = null;
         var time:uint = 0;
         var index:int = 0;
         var num:uint = (event.data as ByteArray).readUnsignedInt();
         Alarm.show("修理完毕，你现在还有" + num + "个赛尔豆");
         MainManager.actorInfo.coins = num;
         if(_repairItem)
         {
            singleInfo = ItemManager.getClothInfo(_repairItem.itemID);
            time = uint(ItemXMLInfo.getLifeTime(_repairItem.itemID));
            singleInfo.leftTime = time * 24 * 60 * 60;
            DisplayUtil.removeForParent(_repairItem);
            _repairItem.destroy();
            index = list.indexOf(_repairItem);
            if(index != -1)
            {
               list.splice(index,1);
            }
            _repairItem = null;
         }
         if(isRepairAll)
         {
            hide();
            isRepairAll = false;
            return;
         }
         currentPage = 1;
         initPage();
      }
   }
}

