package com.robot.module.app.mailBox
{
   import com.robot.core.config.xml.MailTemplateXMLInfo;
   import com.robot.core.info.mail.SingleMailInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import org.taomee.component.UIComponent;
   import org.taomee.component.control.MCheckBox;
   import org.taomee.component.control.MLabel;
   import org.taomee.component.event.ButtonEvent;
   import org.taomee.utils.DisplayUtil;
   
   public class MailListItem extends UIComponent
   {
      
      public static const READ_MAIL:String = "readMail";
      
      public static const SELECT_CHANGE:String = "selectChange";
      
      private var checkBox:MCheckBox;
      
      private var timeLabel:MLabel;
      
      private var nameLabel:MLabel;
      
      private var _info:SingleMailInfo;
      
      private var label:MLabel;
      
      private var mc:MovieClip;
      
      private var clickBtn:Sprite;
      
      private var newMC:MovieClip;
      
      public function MailListItem()
      {
         super();
         mc = new ui_mailBox_item_mc();
         containSprite.addChild(mc);
         checkBox = new MCheckBox();
         checkBox.addEventListener(ButtonEvent.RELEASE,onRelease);
         checkBox.text = "";
         checkBox.width = checkBox.height + 2;
         checkBox.scaleX = checkBox.scaleY = 1.25;
         containSprite.addChild(checkBox);
         setSizeWH(containSprite.width,mc.height);
         label = new MLabel();
         label.fontSize = 12;
         label.mouseChildren = false;
         label.buttonMode = true;
         label.x = 48;
         label.y = 3;
         label.textColor = 16777215;
         label.addEventListener(MouseEvent.CLICK,readMail);
         timeLabel = new MLabel();
         timeLabel.mouseChildren = false;
         timeLabel.mouseEnabled = false;
         timeLabel.fontSize = 12;
         timeLabel.autoFitWidth = true;
         timeLabel.y = 3;
         timeLabel.textColor = 16777215;
         nameLabel = new MLabel();
         nameLabel.fontSize = 12;
         nameLabel.textColor = 16777215;
         nameLabel.autoFitWidth = true;
         nameLabel.align = TextFormatAlign.CENTER;
         nameLabel.width = 125;
         nameLabel.x = 330;
         nameLabel.y = 3;
         newMC = new ui_mailBox_list_new();
         newMC.x = 290;
         newMC.y = 9;
         clickBtn = new Sprite();
         clickBtn.buttonMode = true;
         clickBtn.x = 48;
         clickBtn.graphics.beginFill(0,0);
         clickBtn.graphics.drawRect(0,0,270,this.height);
         clickBtn.graphics.endFill();
         containSprite.addChildAt(clickBtn,0);
         clickBtn.addEventListener(MouseEvent.CLICK,readMail);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         label.removeEventListener(MouseEvent.CLICK,readMail);
         checkBox.removeEventListener(ButtonEvent.RELEASE,onRelease);
         checkBox = null;
         label = null;
         timeLabel = null;
         nameLabel = null;
         mc = null;
      }
      
      public function get isSelected() : Boolean
      {
         return checkBox.selected;
      }
      
      public function clearNew() : void
      {
         DisplayUtil.removeForParent(newMC);
      }
      
      private function readMail(event:MouseEvent) : void
      {
         dispatchEvent(new Event(READ_MAIL));
      }
      
      public function get info() : SingleMailInfo
      {
         return _info;
      }
      
      private function onRelease(event:ButtonEvent) : void
      {
         dispatchEvent(new Event(SELECT_CHANGE));
      }
      
      public function set info(i:SingleMailInfo) : void
      {
         _info = i;
         label.clearTip();
         var date:Date = i.date;
         var str:String = "(" + date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + ")";
         timeLabel.text = str;
         timeLabel.x = 310 - timeLabel.width;
         label.width = 256 - timeLabel.width;
         label.text = MailTemplateXMLInfo.getTitle(i.template);
         containSprite.addChild(label);
         containSprite.addChild(timeLabel);
         containSprite.addChild(nameLabel);
         nameLabel.text = "From：" + i.fromNick;
         if(label.isOverflow)
         {
            label.toolTip = label.text;
         }
         if(_info.readed)
         {
            DisplayUtil.removeForParent(newMC);
         }
         else
         {
            addChild(newMC);
         }
      }
   }
}

