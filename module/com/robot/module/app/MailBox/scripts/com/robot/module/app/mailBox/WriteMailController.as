package com.robot.module.app.mailBox
{
   import com.robot.core.manager.mail.MailManager;
   import com.robot.core.ui.alert.Answer;
   import flash.events.Event;
   
   public class WriteMailController
   {
      
      private static var friendPanel:SelectFriendPanel;
      
      private static var _type:uint;
      
      private static var editPanel:EditMailPanel;
      
      public static var friendList:Array;
      
      public static var templateID:uint;
      
      private static var templatePanel:SelectTemplatePanel;
      
      public static var content:String;
      
      public static const NORMAL:uint = 0;
      
      public static const WRITE_BACK:uint = 1;
      
      public static const SEND_TO_OTHER:uint = 2;
      
      public function WriteMailController()
      {
         super();
      }
      
      private static function onSelectFriend(event:Event) : void
      {
         friendList = friendPanel.friendList.slice();
         Answer.show("你确定要把信息发给选中的好友吗？",function():void
         {
            MailManager.sendMail(templateID,content,friendList);
            friendPanel.hide();
         });
      }
      
      public static function hide() : void
      {
         if(templatePanel)
         {
            templatePanel.hide();
         }
         if(friendPanel)
         {
            friendPanel.hide();
         }
         if(editPanel)
         {
            editPanel.hide();
         }
      }
      
      private static function onReadyToSend(event:Event) : void
      {
         content = editPanel.mailContent;
         if(_type == WRITE_BACK)
         {
            Answer.show("你确定现在就要发送信息吗？",function():void
            {
               editPanel.hide();
               MailManager.sendMail(templateID,content,friendList);
            });
         }
         else
         {
            showFriendPanel();
         }
      }
      
      private static function showFriendPanel() : void
      {
         if(templatePanel)
         {
            templatePanel.hide();
         }
         if(!friendPanel)
         {
            friendPanel = new SelectFriendPanel();
            friendPanel.addEventListener(SelectFriendPanel.SELECT_COMPLETE,onSelectFriend);
         }
         friendPanel.show();
      }
      
      private static function showEditPanel() : void
      {
         if(friendPanel)
         {
            friendPanel.hide();
         }
         if(!editPanel)
         {
            editPanel = new EditMailPanel();
            editPanel.addEventListener(EditMailPanel.READY_TO_SEND,onReadyToSend);
         }
         editPanel.show(templateID);
      }
      
      public static function write(type:uint) : void
      {
         _type = type;
         if(_type == NORMAL)
         {
            showTemplatePanel();
         }
         else if(_type == WRITE_BACK)
         {
            showTemplatePanel();
         }
         else if(_type == SEND_TO_OTHER)
         {
            showFriendPanel();
         }
      }
      
      private static function showTemplatePanel() : void
      {
         if(friendPanel)
         {
            friendPanel.hide();
         }
         if(editPanel)
         {
            editPanel.hide();
         }
         if(!templatePanel)
         {
            templatePanel = new SelectTemplatePanel();
            templatePanel.addEventListener(SelectTemplatePanel.CHOOSE_COMPLETE,onChooseTemplate);
         }
         templatePanel.show();
      }
      
      private static function onChooseTemplate(event:Event) : void
      {
         templateID = templatePanel.templateID;
         showEditPanel();
      }
      
      public static function destroy() : void
      {
         hide();
         if(templatePanel)
         {
            templatePanel.destroy();
            templatePanel.removeEventListener(SelectTemplatePanel.CHOOSE_COMPLETE,onChooseTemplate);
            templatePanel = null;
         }
         if(friendPanel)
         {
            friendPanel.destroy();
            friendPanel.removeEventListener(SelectFriendPanel.SELECT_COMPLETE,onSelectFriend);
            friendPanel = null;
         }
         if(editPanel)
         {
            editPanel.destroy();
            editPanel.removeEventListener(EditMailPanel.READY_TO_SEND,onReadyToSend);
            editPanel = null;
         }
      }
   }
}

