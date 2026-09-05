package com.robot.module.app.mailBox
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.MailTemplateXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.mailBox.templatePanel.SmallPicPanel;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.component.bgFill.SoildFillStyle;
   import org.taomee.component.containers.HBox;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.component.layout.FlowLayout;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class SelectTemplatePanel extends Sprite
   {
      
      public static const CHOOSE_COMPLETE:String = "chooseComplete";
      
      private var bigMask:MovieClip;
      
      private var mainMC:MovieClip;
      
      private var bigLoadPanel:MLoadPane;
      
      private var okBtn:SimpleButton;
      
      private var hbox:HBox;
      
      private var selectedID:uint;
      
      private var ids:Array = [];
      
      private var backBtn:SimpleButton;
      
      public function SelectTemplatePanel()
      {
         super();
         mainMC = new ui_mailBox_selectPanel();
         addChild(mainMC);
         bigMask = mainMC["bigMask"];
         bigLoadPanel = new MLoadPane(null,MLoadPane.FIT_WIDTH);
         bigLoadPanel.offsetRect = false;
         bigLoadPanel.bgFillStyle = new SoildFillStyle(0);
         bigLoadPanel.setSizeWH(bigMask.width,bigMask.height);
         bigLoadPanel.x = bigMask.x;
         bigLoadPanel.y = bigMask.y;
         mainMC.addChild(bigLoadPanel);
         bigLoadPanel.mask = bigMask;
         backBtn = mainMC["backBtn"];
         okBtn = mainMC["okBtn"];
         backBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         okBtn.addEventListener(MouseEvent.CLICK,okHandler);
         for(var i:uint = 0; i < 5; i++)
         {
            mainMC["typeBtn_" + i].buttonMode = true;
            mainMC["typeBtn_" + i].addEventListener(MouseEvent.CLICK,chooseCategory);
         }
         hbox = new HBox(7);
         hbox.valign = FlowLayout.MIDLLE;
         hbox.x = 226;
         hbox.y = 320;
         hbox.setSizeWH(522,104);
         mainMC.addChild(hbox);
      }
      
      public function hide() : void
      {
         selectedID = 0;
         DisplayUtil.removeForParent(this);
      }
      
      private function getItemList(id:uint = 1) : void
      {
         var c:SmallPicPanel = null;
         var i:uint = 0;
         var smallPic:SmallPicPanel = null;
         ids = MailTemplateXMLInfo.getCategoryList(id).slice();
         for each(c in hbox.compList)
         {
            c.removeEventListener(MouseEvent.CLICK,choosePic);
         }
         hbox.removeAll();
         bigLoadPanel.unload();
         for each(i in ids)
         {
            smallPic = new SmallPicPanel(i);
            smallPic.buttonMode = true;
            smallPic.addEventListener(MouseEvent.CLICK,choosePic);
            hbox.append(smallPic);
         }
         if(ids.length > 0)
         {
            ResourceManager.getResource(ClientConfig.getMailTemplateUrl(ids[0]),onLoadBig,"item");
            selectedID = ids[0];
         }
      }
      
      private function choosePic(event:MouseEvent) : void
      {
         var s:SmallPicPanel = event.currentTarget as SmallPicPanel;
         trace(s.id);
         selectedID = s.id;
         ResourceManager.getResource(ClientConfig.getMailTemplateUrl(s.id),onLoadBig,"item");
      }
      
      private function okHandler(event:MouseEvent) : void
      {
         if(selectedID == 0)
         {
            Alarm.show("你还没有选择邮件模板");
            return;
         }
         dispatchEvent(new Event(CHOOSE_COMPLETE));
      }
      
      public function get templateID() : uint
      {
         return selectedID;
      }
      
      private function onLoadBig(o:DisplayObject) : void
      {
         bigLoadPanel.setIcon(o);
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      private function chooseCategory(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         var num:uint = uint(mc.name.split("_")[1]) + 1;
         getItemList(num);
      }
      
      public function destroy() : void
      {
         var c:SmallPicPanel = null;
         hide();
         mainMC = null;
         for each(c in hbox.compList)
         {
            c.removeEventListener(MouseEvent.CLICK,choosePic);
         }
         hbox.destroy();
         hbox = null;
         backBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         okBtn.removeEventListener(MouseEvent.CLICK,okHandler);
         backBtn = null;
         okBtn = null;
         bigLoadPanel.destroy();
         bigLoadPanel = null;
         bigMask = null;
      }
      
      public function show() : void
      {
         getItemList();
         LevelManager.appLevel.addChild(this);
      }
   }
}

