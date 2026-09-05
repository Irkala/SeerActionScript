package com.robot.module.app
{
   import com.robot.core.event.MailEvent;
   import com.robot.core.info.mail.SingleMailInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.mail.MailManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.module.app.mailBox.MailListItem;
   import com.robot.module.app.mailBox.ReadMailPanel;
   import com.robot.module.app.mailBox.WriteMailController;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import org.taomee.component.containers.VBox;
   import org.taomee.ds.HashMap;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class MailBox extends Sprite implements IModule
   {
      
      private var createBtn:SimpleButton;
      
      private var closeBtn:SimpleButton;
      
      private var itemMap:HashMap;
      
      private var readPanel:ReadMailPanel;
      
      private var clearBtn:SimpleButton;
      
      private var delBtn:SimpleButton;
      
      private var mainMC:MovieClip;
      
      private var _scrollBar:UIScrollBar;
      
      private var rect:Rectangle;
      
      private const LIST_LENGTH:int = 8;
      
      private var hashMap:HashMap;
      
      private var itemContainer:VBox;
      
      public function MailBox()
      {
         super();
      }
      
      public function hide() : void
      {
         var j:MailListItem = null;
         MailManager.delSysMail();
         itemMap.clear();
         for each(j in itemContainer.compList)
         {
            j.removeEventListener(MailListItem.READ_MAIL,readMail);
            j.removeEventListener(MailListItem.SELECT_CHANGE,onSelectChange);
            j.destroy();
         }
         itemContainer.removeAll();
         MailManager.removeEventListener(MailEvent.MAIL_LIST,onMailList);
         MailManager.removeEventListener(MailEvent.MAIL_SEND,onSend);
         MailManager.removeEventListener(MailEvent.MAIL_DELETE,onDelete);
         MailManager.removeEventListener(MailEvent.MAIL_CLEAR,onDelete);
         DisplayUtil.removeForParent(mainMC);
         DisplayUtil.removeForParent(closeBtn);
         if(readPanel)
         {
            readPanel.hide();
         }
         WriteMailController.hide();
         hashMap.clear();
         LevelManager.showMapLevel();
         MailManager.getUnRead();
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var index:int = int(_scrollBar.index);
         if(itemContainer.numChildren > 0)
         {
            rect.y = (itemContainer.getChildAt(0).height + itemContainer.gap) * index;
         }
         else
         {
            rect.y = 0;
         }
         itemContainer.scrollRect = rect;
      }
      
      private function createHandler(event:MouseEvent) : void
      {
         WriteMailController.write(WriteMailController.NORMAL);
      }
      
      private function onSelectChange(event:Event) : void
      {
         var item:MailListItem = event.currentTarget as MailListItem;
         if(item.isSelected)
         {
            hashMap.add(item.info.id,item.info);
         }
         else
         {
            hashMap.remove(item.info.id);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function clearHandler(event:MouseEvent) : void
      {
         if(MailManager.getMailInfos().length > 0)
         {
            Answer.show("你确定要清空所有邮件吗",function():void
            {
               MailManager.delAllMail();
            });
         }
      }
      
      private function onSend(event:MailEvent) : void
      {
         WriteMailController.hide();
         if(readPanel)
         {
            readPanel.hide();
         }
      }
      
      public function show() : void
      {
         MailManager.addEventListener(MailEvent.MAIL_LIST,onMailList);
         MailManager.addEventListener(MailEvent.MAIL_SEND,onSend);
         MailManager.addEventListener(MailEvent.MAIL_DELETE,onDelete);
         MailManager.addEventListener(MailEvent.MAIL_CLEAR,onDelete);
         mainMC["loadingMC"].visible = true;
         LevelManager.appLevel.addChild(mainMC);
         LevelManager.topLevel.addChild(closeBtn);
         MailManager.getMailList();
         LevelManager.hideMapLevel();
      }
      
      private function onReadMail(event:Event) : void
      {
         var item:MailListItem = itemMap.getValue(readPanel.info);
         item.clearNew();
      }
      
      private function readMail(event:Event) : void
      {
         var item:MailListItem = event.currentTarget as MailListItem;
         if(!readPanel)
         {
            readPanel = new ReadMailPanel();
            readPanel.addEventListener(ReadMailPanel.READ_MAIL,onReadMail);
         }
         readPanel.show(item.info);
         item.clearNew();
      }
      
      private function onDelete(event:MailEvent) : void
      {
         hashMap.clear();
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      private function onMailList(event:MailEvent) : void
      {
         var j:MailListItem = null;
         var array:Array = null;
         var i:SingleMailInfo = null;
         var item:MailListItem = null;
         for each(j in itemContainer.compList)
         {
            j.removeEventListener(MailListItem.READ_MAIL,readMail);
            j.removeEventListener(MailListItem.SELECT_CHANGE,onSelectChange);
            j.destroy();
         }
         itemContainer.removeAll();
         _scrollBar.index = 0;
         mainMC["loadingMC"].visible = false;
         array = MailManager.getMailInfos();
         _scrollBar.totalLength = array.length;
         for each(i in array)
         {
            item = new MailListItem();
            item.addEventListener(MailListItem.READ_MAIL,readMail);
            item.addEventListener(MailListItem.SELECT_CHANGE,onSelectChange);
            item.info = i;
            itemContainer.append(item);
            itemMap.add(i,item);
         }
      }
      
      public function destroy() : void
      {
         hide();
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         createBtn.removeEventListener(MouseEvent.CLICK,createHandler);
         delBtn.removeEventListener(MouseEvent.CLICK,delHandler);
         clearBtn.removeEventListener(MouseEvent.CLICK,clearHandler);
         closeBtn = null;
         createBtn = null;
         delBtn = null;
         clearBtn = null;
         itemContainer.destroy();
         itemContainer = null;
         _scrollBar.destroy();
         _scrollBar = null;
         WriteMailController.destroy();
         if(readPanel)
         {
            readPanel.destroy();
         }
         readPanel = null;
      }
      
      public function setup() : void
      {
         hashMap = new HashMap();
         itemMap = new HashMap();
         mainMC = new ui_mailBox_bg();
         closeBtn = mainMC["closeBtn"];
         delBtn = mainMC["delBtn"];
         createBtn = mainMC["createBtn"];
         clearBtn = mainMC["clearBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         createBtn.addEventListener(MouseEvent.CLICK,createHandler);
         delBtn.addEventListener(MouseEvent.CLICK,delHandler);
         clearBtn.addEventListener(MouseEvent.CLICK,clearHandler);
         itemContainer = new VBox(9);
         itemContainer.isMask = false;
         rect = new Rectangle(0,0,506,274);
         itemContainer.x = 250;
         itemContainer.y = 124;
         itemContainer.scrollRect = rect;
         itemContainer.cacheAsBitmap = true;
         mainMC.addChild(itemContainer);
         _scrollBar = new UIScrollBar(mainMC["barBall"],mainMC["barBg"],LIST_LENGTH,mainMC["upBtn"],mainMC["downBtn"]);
         _scrollBar.wheelObject = this;
         _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
      }
      
      private function delHandler(event:MouseEvent) : void
      {
         if(hashMap.length == 0)
         {
            Alarm.show("你还没有选择要删除的邮件");
            return;
         }
         Answer.show("你确定要删除选中的邮件吗？",function():void
         {
            MailManager.delMail(hashMap.getKeys());
         });
      }
   }
}

