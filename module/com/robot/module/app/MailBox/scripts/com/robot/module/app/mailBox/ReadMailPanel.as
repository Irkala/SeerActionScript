package com.robot.module.app.mailBox
{
   import com.robot.app.cmd.SysMsgCmdListener;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.MailTemplateXMLInfo;
   import com.robot.core.event.MailEvent;
   import com.robot.core.info.mail.SingleMailInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.mail.MailManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.effect.ColorFilter;
   import org.taomee.gemo.IntDimension;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ReadMailPanel extends Sprite
   {
      
      public static const READ_MAIL:String = "readMail";
      
      private var maskMC:MovieClip;
      
      private var infoMC:MovieClip;
      
      private var _info:SingleMailInfo;
      
      private var mainMC:MovieClip;
      
      private var delBtn:SimpleButton;
      
      private var txtBg:MovieClip;
      
      private var writeBackBtn:SimpleButton;
      
      private var currentIndex:uint;
      
      private var prevBtn:SimpleButton;
      
      private var nextBtn:SimpleButton;
      
      private var sendBtn:SimpleButton;
      
      private var backBtn:SimpleButton;
      
      private var npcMC:Sprite;
      
      private var loadPanel:MLoadPane;
      
      private var txt:TextField;
      
      public function ReadMailPanel()
      {
         super();
         setup();
      }
      
      private function delHandler(event:MouseEvent) : void
      {
         MailManager.delMail([_info.id]);
      }
      
      private function onGetContent(info:SingleMailInfo) : void
      {
         DisplayUtil.removeAllChild(npcMC);
         this._info = info;
         trace("________________________",info.fromID);
         var date:Date = info.date;
         infoMC["dateTxt"].text = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
         infoMC["timeTxt"].text = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
         if(info.template > 10000 && info.template != 10012)
         {
            MailManager.addSysMail(info.id);
            writeBackBtn.mouseEnabled = false;
            sendBtn.mouseEnabled = false;
            writeBackBtn.filters = [ColorFilter.setGrayscale()];
            sendBtn.filters = [ColorFilter.setGrayscale()];
            if(info.fromID == 6)
            {
               infoMC["fromTxt"].text = "发信人：" + info.fromNick;
            }
            else
            {
               infoMC["fromTxt"].text = "发信人：" + SysMsgCmdListener.npcName[info.fromID];
            }
         }
         else
         {
            writeBackBtn.mouseEnabled = true;
            sendBtn.mouseEnabled = true;
            writeBackBtn.filters = [];
            sendBtn.filters = [];
            infoMC["fromTxt"].text = "发信人：" + info.fromNick;
         }
         ResourceManager.getResource(ClientConfig.getMailTemplateUrl(info.template),onLoad);
         dispatchEvent(new Event(READ_MAIL));
      }
      
      private function setup() : void
      {
         mainMC = new ui_mailBox_readPanel();
         addChild(mainMC);
         npcMC = new Sprite();
         npcMC.scaleX = npcMC.scaleY = 0.7;
         npcMC.x = 50 + 190;
         npcMC.y = 86 + 60;
         mainMC.addChild(npcMC);
         infoMC = mainMC["infoMC"];
         backBtn = mainMC["backBtn"];
         delBtn = mainMC["delBtn"];
         writeBackBtn = mainMC["writeBackBtn"];
         sendBtn = mainMC["sendBtn"];
         backBtn.addEventListener(MouseEvent.CLICK,backHandler);
         delBtn.addEventListener(MouseEvent.CLICK,delHandler);
         writeBackBtn.addEventListener(MouseEvent.CLICK,writeBackHandler);
         sendBtn.addEventListener(MouseEvent.CLICK,sendHandler);
         prevBtn = mainMC["prevBtn"];
         nextBtn = mainMC["nextBtn"];
         prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);
         maskMC = mainMC["maskMC"];
         loadPanel = new MLoadPane(null,MLoadPane.FIT_WIDTH);
         loadPanel.offsetRect = false;
         loadPanel.setSizeWH(maskMC.width,maskMC.height);
         loadPanel.x = maskMC.x;
         loadPanel.y = maskMC.y;
         loadPanel.mask = maskMC;
         txtBg = new ui_mailBox_edit_txt_bg();
         txt = new TextField();
         txt.textColor = 16777215;
         txt.wordWrap = true;
         txt.multiline = true;
         txt.selectable = false;
         mainMC.addChild(loadPanel);
         mainMC.addChild(infoMC);
      }
      
      private function changetTxt() : void
      {
         var tf:TextFormat;
         var pos:Point = MailTemplateXMLInfo.getTxtPos(_info.template);
         var size:IntDimension = MailTemplateXMLInfo.getTxtSize(_info.template);
         txt.width = size.width;
         txt.height = size.height;
         txt.x = loadPanel.x + pos.x;
         txt.y = loadPanel.y + pos.y;
         txt.text = _info.content;
         tf = new TextFormat();
         tf.size = 12;
         tf.color = 16777215;
         tf.font = "Tahoma";
         txt.setTextFormat(tf);
         txtBg.x = txt.x - 5;
         txtBg.y = txt.y - 5;
         txtBg.width = txt.width + 10;
         txtBg.height = txt.height + 10;
         mainMC.addChild(txtBg);
         mainMC.addChild(txt);
         mainMC.addChild(infoMC);
         if(info.template > 10000)
         {
            ResourceManager.getResource(ClientConfig.getNpcSwfPath(SysMsgCmdListener.npcLink[_info.fromID]),function(o:DisplayObject):void
            {
               npcMC.addChild(o);
               mainMC.addChild(npcMC);
            },"npc");
         }
      }
      
      private function prevHandler(event:MouseEvent) : void
      {
         var array:Array = MailManager.getMailInfos();
         var index:int = array.indexOf(_info);
         if(index > 0)
         {
            show(array[index - 1]);
         }
         else
         {
            Alarm.show("当前已经是第一封邮件了");
         }
      }
      
      private function sendHandler(event:MouseEvent) : void
      {
         WriteMailController.templateID = _info.template;
         WriteMailController.content = _info.content;
         WriteMailController.write(WriteMailController.SEND_TO_OTHER);
      }
      
      private function writeBackHandler(event:MouseEvent) : void
      {
         WriteMailController.friendList = [_info.fromID];
         WriteMailController.write(WriteMailController.WRITE_BACK);
      }
      
      public function show(info:SingleMailInfo) : void
      {
         if(!info.readed)
         {
            MailManager.setReaded([info.id]);
         }
         var array:Array = MailManager.getMailInfos();
         currentIndex = array.indexOf(info);
         LevelManager.appLevel.addChild(this);
         MailManager.getMailContent(info.id,onGetContent);
         MailManager.addEventListener(MailEvent.MAIL_LIST,onMailList);
      }
      
      private function backHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeAllChild(npcMC);
         loadPanel.unload();
         DisplayUtil.removeForParent(this);
         MailManager.removeEventListener(MailEvent.MAIL_LIST,onMailList);
      }
      
      private function onLoad(o:DisplayObject) : void
      {
         loadPanel.setIcon(o);
         changetTxt();
      }
      
      private function nextHandler(event:MouseEvent) : void
      {
         var array:Array = MailManager.getMailInfos();
         var index:int = array.indexOf(_info);
         if(index < array.length - 1)
         {
            show(array[index + 1]);
         }
         else
         {
            Alarm.show("当前已经是最后一封邮件了");
         }
      }
      
      public function destroy() : void
      {
         hide();
         infoMC = null;
         backBtn.removeEventListener(MouseEvent.CLICK,backHandler);
         delBtn.removeEventListener(MouseEvent.CLICK,delHandler);
         writeBackBtn.removeEventListener(MouseEvent.CLICK,writeBackHandler);
         sendBtn.removeEventListener(MouseEvent.CLICK,sendHandler);
         prevBtn.removeEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.removeEventListener(MouseEvent.CLICK,nextHandler);
         backBtn = null;
         delBtn = null;
         writeBackBtn = null;
         sendBtn = null;
         prevBtn = null;
         nextBtn = null;
      }
      
      private function onMailList(event:MailEvent) : void
      {
         var array:Array = MailManager.getMailInfos();
         if(array.length == 0)
         {
            hide();
            Alarm.show("你的邮箱中已经没有邮件了");
            return;
         }
         if(currentIndex >= array.length)
         {
            show(array[currentIndex - 1]);
         }
         else
         {
            show(array[currentIndex]);
         }
      }
      
      public function get info() : SingleMailInfo
      {
         return _info;
      }
   }
}

