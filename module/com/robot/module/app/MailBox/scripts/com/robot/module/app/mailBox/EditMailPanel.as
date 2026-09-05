package com.robot.module.app.mailBox
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.MailTemplateXMLInfo;
   import com.robot.core.manager.LevelManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.gemo.IntDimension;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class EditMailPanel extends Sprite
   {
      
      public static const READY_TO_SEND:String = "readyToSend";
      
      private var maskMC:MovieClip;
      
      private var mainMC:MovieClip;
      
      private var templateID:uint;
      
      private var txtBg:MovieClip;
      
      private var okBtn:SimpleButton;
      
      private var txt:TextField;
      
      private var str:String;
      
      private var backBtn:SimpleButton;
      
      private var loadPanel:MLoadPane;
      
      public function EditMailPanel()
      {
         super();
         mainMC = new ui_mailBox_editPanel();
         addChild(mainMC);
         backBtn = mainMC["backBtn"];
         okBtn = mainMC["okBtn"];
         maskMC = mainMC["maskMC"];
         backBtn.addEventListener(MouseEvent.CLICK,backHandler);
         okBtn.addEventListener(MouseEvent.CLICK,okHandler);
         loadPanel = new MLoadPane(null,MLoadPane.FIT_WIDTH);
         loadPanel.offsetRect = false;
         loadPanel.setSizeWH(maskMC.width,maskMC.height);
         loadPanel.x = maskMC.x;
         loadPanel.y = maskMC.y;
         loadPanel.mask = maskMC;
         txtBg = new ui_mailBox_edit_txt_bg();
         txt = new TextField();
         txt.wordWrap = true;
         txt.multiline = true;
         txt.textColor = 16777215;
         txt.type = TextFieldType.INPUT;
         var tf:TextFormat = new TextFormat();
         tf.size = 12;
         tf.color = 16777215;
         tf.font = "Tahoma";
         txt.setTextFormat(tf);
         mainMC.addChild(loadPanel);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
         loadPanel.unload();
         txt.text = "";
         DisplayUtil.removeForParent(txt);
         DisplayUtil.removeForParent(txtBg);
      }
      
      private function changetTxt() : void
      {
         var pos:Point = MailTemplateXMLInfo.getTxtPos(templateID);
         var size:IntDimension = MailTemplateXMLInfo.getTxtSize(templateID);
         txt.width = size.width;
         txt.height = size.height;
         txt.x = loadPanel.x + pos.x;
         txt.y = loadPanel.y + pos.y;
         txtBg.x = txt.x - 5;
         txtBg.y = txt.y - 5;
         txtBg.width = txt.width + 10;
         txtBg.height = txt.height + 10;
         mainMC.addChild(txtBg);
         mainMC.addChild(txt);
      }
      
      private function okHandler(event:MouseEvent) : void
      {
         str = txt.text;
         dispatchEvent(new Event(READY_TO_SEND));
      }
      
      public function get mailContent() : String
      {
         return str;
      }
      
      private function backHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      private function onLoad(o:DisplayObject) : void
      {
         loadPanel.setIcon(o);
         changetTxt();
      }
      
      public function destroy() : void
      {
         hide();
         loadPanel.destroy();
         loadPanel = null;
         mainMC = null;
      }
      
      public function show(templateID:uint) : void
      {
         this.templateID = templateID;
         LevelManager.appLevel.addChild(this);
         ResourceManager.getResource(ClientConfig.getMailTemplateUrl(templateID),onLoad);
      }
   }
}

