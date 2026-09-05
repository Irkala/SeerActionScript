package com.robot.module.app.timePasswordMachine
{
   import com.robot.app.ParseSocketError;
   import com.robot.app.bag.BagClothPreview;
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.TimePasswordXMLInfo;
   import com.robot.core.info.clothInfo.PeopleItemInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.skeleton.ClothPreview;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.ItemInBagAlert;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.ds.HashMap;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class InputPanel extends Sprite
   {
      
      private var runPanel:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var timer:Timer;
      
      private var isStop:Boolean = false;
      
      private var mainMC:MovieClip;
      
      private var index:uint;
      
      private var priceIDArray:Array = [];
      
      private var array:Array = TimePasswordXMLInfo.getIDList();
      
      private var startBtn:SimpleButton;
      
      private var btn:SimpleButton;
      
      private var mcMap:HashMap;
      
      private var isClose:Boolean = false;
      
      private var txt:TextField;
      
      public function InputPanel()
      {
         super();
         mainMC = new timePassword_input_panel();
         closeBtn = mainMC["closeBtn"];
         txt = mainMC["txt"];
         btn = mainMC["submitBtn"];
         txt.restrict = "A-Za-z0-9";
         txt.maxChars = 24;
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         btn.addEventListener(MouseEvent.CLICK,submit);
         runPanel = new timePassword_run_panel();
         initRunPanel();
      }
      
      public function hide() : void
      {
         isClose = true;
         DisplayUtil.removeForParent(this);
         EventManager.removeEventListener(ParseSocketError.TIME_PASSWORD_ERROR,onPasswordError);
         SocketConnection.removeCmdListener(CommandID.USER_TIME_PASSWORD,onUseTimePassword);
      }
      
      private function startRun(event:MouseEvent) : void
      {
         priceIDArray = [];
         isStop = false;
         startBtn.mouseEnabled = false;
         timer.start();
         setTimeout(next,200);
         index = Math.floor(Math.random() * 12);
         runPanel["mc_" + index].gotoAndStop(2);
      }
      
      private function next() : void
      {
         var i:uint = 0;
         var mc:MovieClip = null;
         if(isClose)
         {
            return;
         }
         try
         {
            if(isStop && runPanel["mc_" + index] == mcMap.getValue(priceIDArray.join(" ")))
            {
               setTimeout(function():void
               {
                  var i:uint = 0;
                  dispatchEvent(new Event(Event.CLOSE));
                  for each(i in priceIDArray)
                  {
                     ItemInBagAlert.show(i,"一个<font color=\'#ff0000\'>" + ItemXMLInfo.getName(i) + "</font>已经放入你的储存箱中！");
                  }
               },1000);
               return;
            }
            if(index == 11)
            {
               index = 0;
            }
            else
            {
               ++index;
            }
            for(i = 0; i < 12; i++)
            {
               mc = runPanel["mc_" + i];
               mc.gotoAndStop(1);
            }
            runPanel["mc_" + index].gotoAndStop(2);
            setTimeout(next,200);
         }
         catch(e:Error)
         {
         }
      }
      
      private function onPasswordError(e:Event) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function onUseTimePassword(event:SocketEvent) : void
      {
         var i:uint = 0;
         var id:uint = 0;
         var data:ByteArray = event.data as ByteArray;
         var count:uint = data.readUnsignedInt();
         for(i = 0; i < count; i++)
         {
            id = data.readUnsignedInt();
            priceIDArray.push(id);
         }
         isStop = true;
         trace("timepassword ------> ",priceIDArray.join(" "));
      }
      
      private function submit(event:MouseEvent) : void
      {
         if(txt.text == "")
         {
            Alarm.show("请输入时空密码！");
            return;
         }
         if(txt.text.length != 12 && txt.text.length != 16 && txt.text.length != 24)
         {
            Alarm.show("你输入的时空密码长度不对");
            return;
         }
         DisplayUtil.removeForParent(mainMC);
         this.addChild(runPanel);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
      }
      
      private function initRunPanel() : void
      {
         var i:String = null;
         var mc:MovieClip = null;
         var loadPanel:MLoadPane = null;
         var _showMc:Sprite = null;
         var clothPrev:BagClothPreview = null;
         var array:Array = null;
         var arr:Array = null;
         var id:uint = 0;
         mcMap = new HashMap();
         timer = new Timer(3000,1);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         startBtn = runPanel["startBtn"];
         startBtn.mouseEnabled = true;
         startBtn.addEventListener(MouseEvent.CLICK,startRun);
         var count:uint = 0;
         for each(i in array)
         {
            mc = runPanel["mc_" + count];
            mcMap.add(i,mc);
            mc.gotoAndStop(1);
            loadPanel = new MLoadPane(null,MLoadPane.FIT_HEIGHT);
            loadPanel.setSizeWH(70,70);
            loadPanel.x = (mc.width - loadPanel.width) / 2;
            loadPanel.y = (mc.height - loadPanel.height) / 2;
            if(i.indexOf(" ") != -1)
            {
               _showMc = UIManager.getSprite("ComposeMC");
               clothPrev = new BagClothPreview(_showMc,null,ClothPreview.MODEL_SHOW);
               array = i.split(" ");
               arr = [];
               for each(id in array)
               {
                  arr.push(new PeopleItemInfo(id));
               }
               clothPrev.changeCloth(arr);
               loadPanel.setIcon(_showMc);
            }
            else
            {
               loadPanel.setIcon(ItemXMLInfo.getIconURL(uint(i)));
            }
            mc.addChild(loadPanel);
            count++;
         }
      }
      
      private function onTimer(event:TimerEvent) : void
      {
         var by:ByteArray = new ByteArray();
         by.writeUTFBytes(txt.text);
         by.length = 32;
         SocketConnection.send(CommandID.USER_TIME_PASSWORD,by);
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         btn.removeEventListener(MouseEvent.CLICK,submit);
         closeBtn = null;
         txt = null;
         btn = null;
         startBtn.removeEventListener(MouseEvent.CLICK,startRun);
         startBtn = null;
         DisplayUtil.removeForParent(runPanel);
         runPanel = null;
         mcMap.clear();
         mcMap = null;
      }
      
      public function show() : void
      {
         var mc:MovieClip = null;
         for(var i:uint = 0; i < 12; i++)
         {
            mc = runPanel["mc_" + i];
            mc.gotoAndStop(1);
         }
         isClose = false;
         SocketConnection.addCmdListener(CommandID.USER_TIME_PASSWORD,onUseTimePassword);
         EventManager.addEventListener(ParseSocketError.TIME_PASSWORD_ERROR,onPasswordError);
         startBtn.mouseEnabled = true;
         DisplayUtil.removeForParent(runPanel);
         txt.text = "";
         addChild(mainMC);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(this);
      }
   }
}

