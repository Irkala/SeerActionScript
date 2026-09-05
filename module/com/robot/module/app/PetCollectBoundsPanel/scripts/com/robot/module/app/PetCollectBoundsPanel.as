package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.PetInBagAlert;
   import com.robot.core.ui.alert.PetInStorageAlert;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.petcollect.PetChooseMonPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetCollectBoundsPanel extends Sprite implements IModule
   {
      
      private var modulMc1:MovieClip;
      
      private var modulMc2:MovieClip;
      
      private var modulMc4:MovieClip;
      
      private var statusMc1:MovieClip;
      
      private var modulMc3:MovieClip;
      
      private var statusMc4:MovieClip;
      
      private var statusMc2:MovieClip;
      
      private var statusMc3:MovieClip;
      
      private var prevBtn:SimpleButton;
      
      private const DATA:Array = [[22,23,24],[30,31,32],[35,36,37],[13,14,15],[10,11,12],[33,34],[38,39,40],[43,44,45],[25,26],[16,17,18]];
      
      private var mainMc:UI_PetCollectBg;
      
      private var all1:uint = 0;
      
      private const TIPSTR:Array = ["毛毛","贝尔","吉尔","比比鼠","皮皮","利牙鱼","火炎贝","罗奇","幽浮","仙人球"];
      
      private const TIPSTR1:Array = ["小豆芽","莫比","林克"];
      
      private const TIPSTR2:Array = ["依依","小鳍鱼","迪达","浮空苗","吉斯","玄冰兽","达比拉"];
      
      private const TIPSTR3:Array = ["米隆","查斯","伊娃","吉宝","弗曼","迷你芽","乌鲁","萨拉","幼镰鸟"];
      
      private const MAX:int = 10;
      
      private const DATA1:Array = [[27,28,29],[53,54,55],[65,66,67]];
      
      private const DATA2:Array = [[83,84,85],[198,199,200],[89,90],[249,250,251],[145,146,147],[51,52],[178,179,180]];
      
      private const DATA3:Array = [[235,236],[228,229],[232,233,234],[237,238,239],[291,292],[293,294,295],[414,415],[399,400],[344,345]];
      
      private var infoA:Array;
      
      private var NPCIcon:MovieClip;
      
      private var nextBtn:SimpleButton;
      
      private const MAX1:uint = 3;
      
      private const MAX2:uint = 7;
      
      private const MAX3:uint = 9;
      
      public function PetCollectBoundsPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         this.hide();
         this.mainMc = null;
         this.infoA = null;
      }
      
      private function removeEvent() : void
      {
         this.mainMc["closeBtn"].removeEventListener(MouseEvent.CLICK,this.onCloseBtnClickHandler);
         this.mainMc["dragMc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.onDragDownHandler);
      }
      
      private function onList4Handler(param1:PetEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < this.MAX3)
         {
            ToolTipManager.add(this.statusMc4.getChildByName("pet_" + (_loc5_ + 1)) as MovieClip,this.TIPSTR3[_loc5_]);
            _loc2_ = this.DATA3[_loc5_];
            for each(_loc3_ in _loc2_)
            {
               if(PetManager.containsBagForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc4.getChildByName("pet_" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
               if(PetManager.containsStorageForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc4.getChildByName("pet_" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
            }
            _loc5_++;
         }
         PetManager.removeEventListener(PetEvent.STORAGE_LIST,this.onList3Handler);
         if(this.all1 == this.MAX3)
         {
            this.statusMc4["boundsBtn"].addEventListener(MouseEvent.CLICK,this.onBound4Handler);
            this.statusMc4["boundsBtn"].alpha = 1;
         }
         else
         {
            this.statusMc4["boundsBtn"].mouseEnabled = false;
            this.statusMc4["boundsBtn"].alpha = 0.7;
         }
      }
      
      private function onBound2Handler(param1:MouseEvent) : void
      {
         this.statusMc2["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound2Handler);
         this.hide();
         this.send(2,71);
      }
      
      private function onCloseBtnClickHandler(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      public function show() : void
      {
         this.all1 = 0;
         this.addChild(this.mainMc);
         LevelManager.appLevel.addChild(this);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         this.x += 42;
         this.addEvent();
         this.showTemp1();
         this.hideIcon();
      }
      
      private function send(param1:uint, param2:uint) : void
      {
         SocketConnection.addCmdListener(CommandID.PET_COLLECT,this.onHandler);
         SocketConnection.send(CommandID.PET_COLLECT,param1,param2);
      }
      
      private function onList1Handler(param1:PetEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < this.MAX)
         {
            ToolTipManager.add(this.statusMc1.getChildByName("pet_" + _loc5_) as MovieClip,this.TIPSTR[_loc5_]);
            _loc2_ = this.DATA[_loc5_];
            for each(_loc3_ in _loc2_)
            {
               if(PetManager.containsBagForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc1.getChildByName("pet_" + _loc5_)["maskMc"].visible = false;
                  break;
               }
               if(PetManager.containsStorageForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc1.getChildByName("pet_" + _loc5_)["maskMc"].visible = false;
                  break;
               }
            }
            _loc5_++;
         }
         PetManager.removeEventListener(PetEvent.STORAGE_LIST,this.onList1Handler);
         if(this.all1 == this.MAX)
         {
            this.statusMc1["boundsBtn"].addEventListener(MouseEvent.CLICK,this.onBound1Handler);
            this.statusMc1["boundsBtn"].alpha = 1;
         }
         else
         {
            this.statusMc1["boundsBtn"].mouseEnabled = false;
            this.statusMc1["boundsBtn"].alpha = 0.7;
         }
      }
      
      private function onDragDownHandler(param1:MouseEvent) : void
      {
         this.mainMc.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUpHandler);
      }
      
      public function init(param1:Object = null) : void
      {
         this.infoA = param1 as Array;
      }
      
      private function onBound1Handler(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this.statusMc1["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound1Handler);
         PetChooseMonPanel.show(function(param1:uint):void
         {
            var id:uint = param1;
            SocketConnection.addCmdListener(CommandID.PET_COLLECT,function(param1:SocketEvent):void
            {
               var by:ByteArray = null;
               var catchTime:uint = 0;
               var id:uint = 0;
               var e:SocketEvent = param1;
               id = 0;
               SocketConnection.removeCmdListener(CommandID.PET_COLLECT,arguments.callee);
               by = e.data as ByteArray;
               id = by.readUnsignedInt();
               catchTime = by.readUnsignedInt();
               if(PetManager.length >= 6)
               {
                  PetManager.addStorage(id,catchTime);
                  PetInStorageAlert.show(id,"你获得了" + TextFormatUtil.getRedTxt(PetXMLInfo.getName(id)) + "，你可以在你基地的精灵仓库中找到它。");
               }
               else
               {
                  PetManager.addEventListener(PetEvent.ADDED,function(param1:PetEvent):void
                  {
                     PetManager.removeEventListener(PetEvent.ADDED,arguments.callee);
                     PetInBagAlert.show(id,TextFormatUtil.getRedTxt(PetXMLInfo.getName(id)) + "已经放入了你的精灵背包。");
                  });
                  PetManager.setIn(catchTime,1);
               }
            });
            SocketConnection.send(CommandID.PET_COLLECT,1,id);
         });
      }
      
      private function onMc1ClickHandler(param1:MouseEvent) : void
      {
         this.hideTemp1();
         this.statusMc1.visible = true;
         PetManager.addEventListener(PetEvent.STORAGE_LIST,this.onList1Handler);
         PetManager.getStorageList();
      }
      
      private function onMc2ClickHandler(param1:MouseEvent) : void
      {
         this.hideTemp1();
         this.statusMc2.visible = true;
         PetManager.addEventListener(PetEvent.STORAGE_LIST,this.onList2Handler);
         PetManager.getStorageList();
      }
      
      private function onMc3ClickHandler(param1:MouseEvent) : void
      {
         this.hideTemp1();
         this.statusMc3.visible = true;
         PetManager.addEventListener(PetEvent.STORAGE_LIST,this.onList3Handler);
         PetManager.getStorageList();
      }
      
      private function onMc4ClickHandler(param1:MouseEvent) : void
      {
         this.hideTemp1();
         this.statusMc4.visible = true;
         PetManager.addEventListener(PetEvent.STORAGE_LIST,this.onList4Handler);
         PetManager.getStorageList();
      }
      
      private function hideTemp1() : void
      {
         if(this.modulMc1["maskMc"].visible == false)
         {
            this.modulMc1.removeEventListener(MouseEvent.CLICK,this.onMc1ClickHandler);
         }
         if(this.modulMc2["maskMc"].visible == false)
         {
            this.modulMc2.removeEventListener(MouseEvent.CLICK,this.onMc2ClickHandler);
         }
         if(this.modulMc3["maskMc"].visible == false)
         {
            this.modulMc3.removeEventListener(MouseEvent.CLICK,this.onMc3ClickHandler);
         }
         if(this.modulMc4["maskMc"].visible == false)
         {
            this.modulMc4.removeEventListener(MouseEvent.CLICK,this.onMc4ClickHandler);
         }
         this.NPCIcon.visible = true;
         this.prevBtn.visible = false;
         this.nextBtn.visible = false;
         this.modulMc1.visible = false;
         this.modulMc2.visible = false;
         this.modulMc3.visible = false;
         this.modulMc4.visible = false;
      }
      
      private function onBound3Handler(param1:MouseEvent) : void
      {
         this.statusMc3["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound3Handler);
         this.hide();
         this.send(3,275);
      }
      
      private function onList3Handler(param1:PetEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < this.MAX2)
         {
            ToolTipManager.add(this.statusMc3.getChildByName("mc" + (_loc5_ + 1)) as MovieClip,this.TIPSTR2[_loc5_]);
            _loc2_ = this.DATA2[_loc5_];
            for each(_loc3_ in _loc2_)
            {
               if(PetManager.containsBagForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc3.getChildByName("mc" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
               if(PetManager.containsStorageForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc3.getChildByName("mc" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
            }
            _loc5_++;
         }
         PetManager.removeEventListener(PetEvent.STORAGE_LIST,this.onList3Handler);
         if(this.all1 == this.MAX2)
         {
            this.statusMc3["boundsBtn"].addEventListener(MouseEvent.CLICK,this.onBound3Handler);
            this.statusMc3["boundsBtn"].alpha = 1;
         }
         else
         {
            this.statusMc3["boundsBtn"].mouseEnabled = false;
            this.statusMc3["boundsBtn"].alpha = 0.7;
         }
      }
      
      public function hide() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.removeEvent();
         if(DisplayUtil.hasParent(this.statusMc1))
         {
            _loc1_ = 0;
            while(_loc1_ < this.MAX)
            {
               ToolTipManager.remove(this.statusMc1.getChildByName("pet_" + _loc1_) as MovieClip);
               _loc1_++;
            }
         }
         if(DisplayUtil.hasParent(this.statusMc2))
         {
            _loc2_ = 0;
            while(_loc2_ < this.MAX1)
            {
               ToolTipManager.remove(this.statusMc2.getChildByName("mc" + (_loc2_ + 1)) as MovieClip);
               _loc2_++;
            }
         }
         if(DisplayUtil.hasParent(this.statusMc3))
         {
            _loc3_ = 0;
            while(_loc3_ < this.MAX1)
            {
               ToolTipManager.remove(this.statusMc3.getChildByName("mc" + (_loc3_ + 1)) as MovieClip);
               _loc3_++;
            }
         }
         if(DisplayUtil.hasParent(this.statusMc4))
         {
            _loc4_ = 0;
            while(_loc4_ < this.MAX1)
            {
               ToolTipManager.remove(this.statusMc4.getChildByName("pet_" + (_loc4_ + 1)) as MovieClip);
               _loc4_++;
            }
         }
         if(DisplayUtil.hasParent(this.statusMc1))
         {
            if(this.statusMc1["boundsBtn"].alpha == 0.7)
            {
               this.statusMc1["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound1Handler);
            }
         }
         if(DisplayUtil.hasParent(this.statusMc2))
         {
            if(this.statusMc2["boundsBtn"].alpha == 0.7)
            {
               this.statusMc2["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound2Handler);
            }
         }
         if(DisplayUtil.hasParent(this.statusMc3))
         {
            if(this.statusMc3["boundsBtn"].alpha == 0.7)
            {
               this.statusMc3["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound3Handler);
            }
         }
         if(DisplayUtil.hasParent(this.statusMc4))
         {
            if(this.statusMc4["boundsBtn"].alpha == 0.7)
            {
               this.statusMc4["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound3Handler);
            }
         }
         ToolTipManager.remove(this.modulMc1);
         ToolTipManager.remove(this.modulMc2);
         ToolTipManager.remove(this.modulMc3);
         ToolTipManager.remove(this.modulMc4);
         DisplayUtil.removeForParent(this.mainMc);
         DisplayUtil.removeForParent(this);
      }
      
      private function onList2Handler(param1:PetEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < this.MAX1)
         {
            ToolTipManager.add(this.statusMc2.getChildByName("mc" + (_loc5_ + 1)) as MovieClip,this.TIPSTR1[_loc5_]);
            _loc2_ = this.DATA1[_loc5_];
            for each(_loc3_ in _loc2_)
            {
               if(PetManager.containsBagForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc2.getChildByName("mc" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
               if(PetManager.containsStorageForID(_loc3_))
               {
                  ++this.all1;
                  this.statusMc2.getChildByName("mc" + (_loc5_ + 1))["maskMc"].visible = false;
                  break;
               }
            }
            _loc5_++;
         }
         PetManager.removeEventListener(PetEvent.STORAGE_LIST,this.onList2Handler);
         if(this.all1 == this.MAX1)
         {
            this.statusMc2["boundsBtn"].addEventListener(MouseEvent.CLICK,this.onBound2Handler);
            this.statusMc2["boundsBtn"].alpha = 1;
         }
         else
         {
            this.statusMc2["boundsBtn"].mouseEnabled = false;
            this.statusMc2["boundsBtn"].alpha = 0.7;
         }
      }
      
      private function onUpHandler(param1:MouseEvent) : void
      {
         this.mainMc.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUpHandler);
      }
      
      private function hideIcon() : void
      {
         this.mainMc["btnContainer"].x = 63;
         this.mainMc["btnContainer"].y = 92;
         this.modulMc4.visible = false;
         this.prevBtn.visible = true;
         this.prevBtn.addEventListener(MouseEvent.CLICK,this.onPageBtn);
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onPageBtn);
         this.nextBtn.visible = true;
         this.NPCIcon.visible = false;
         this.statusMc1.visible = false;
         this.statusMc2.visible = false;
         this.statusMc3.visible = false;
         this.statusMc4.visible = false;
      }
      
      private function onBound4Handler(param1:MouseEvent) : void
      {
         this.statusMc4["boundsBtn"].removeEventListener(MouseEvent.CLICK,this.onBound4Handler);
         this.hide();
         this.send(4,669);
      }
      
      private function showTemp1() : void
      {
         ToolTipManager.add(this.modulMc1,"我为每个收集齐左边10个精灵的赛尔准备了一份大礼！");
         ToolTipManager.add(this.modulMc2,"稀有精灵收集计划");
         ToolTipManager.add(this.modulMc3,"要收集到所有属性的精灵才能算是精灵收集大师哦！");
         ToolTipManager.add(this.modulMc4,"一年一度的精灵考察又要开始啦！我正为那些小家伙们头疼呢！哦对了，如果你能帮我采集一些样本的话，我会送你一份大礼的哦！");
         this.modulMc1.visible = true;
         this.modulMc2.visible = true;
         this.modulMc3.visible = true;
         this.modulMc4.visible = true;
         this.modulMc1["maskMc"].visible = this.infoA[0];
         if(!this.modulMc1["maskMc"].visible)
         {
            this.modulMc1.addEventListener(MouseEvent.CLICK,this.onMc1ClickHandler);
         }
         this.modulMc2["maskMc"].visible = this.infoA[1];
         if(!this.modulMc2["maskMc"].visible)
         {
            this.modulMc2.addEventListener(MouseEvent.CLICK,this.onMc2ClickHandler);
         }
         this.modulMc3["maskMc"].visible = this.infoA[2];
         if(!this.modulMc3["maskMc"].visible)
         {
            this.modulMc3.addEventListener(MouseEvent.CLICK,this.onMc3ClickHandler);
         }
         this.modulMc4["maskMc"].visible = this.infoA[3];
         if(!this.modulMc4["maskMc"].visible)
         {
            this.modulMc4.addEventListener(MouseEvent.CLICK,this.onMc4ClickHandler);
         }
      }
      
      private function onHandler(param1:SocketEvent) : void
      {
         var by:ByteArray;
         var catchTime:uint;
         var id:uint = 0;
         var e:SocketEvent = param1;
         SocketConnection.removeCmdListener(CommandID.PET_COLLECT,this.onHandler);
         by = e.data as ByteArray;
         id = by.readUnsignedInt();
         catchTime = by.readUnsignedInt();
         if(PetManager.length >= 6)
         {
            PetInStorageAlert.show(id,"你获得了" + TextFormatUtil.getRedTxt(PetXMLInfo.getName(id)) + "，你可以在你基地的精灵仓库中找到它。");
            PetManager.addStorage(id,catchTime);
         }
         else
         {
            PetManager.addEventListener(PetEvent.ADDED,function(param1:PetEvent):void
            {
               PetManager.removeEventListener(PetEvent.ADDED,arguments.callee);
               PetInBagAlert.show(id,TextFormatUtil.getRedTxt(PetXMLInfo.getName(id)) + "已经放入了你的精灵背包。");
            });
            PetManager.setIn(catchTime,1);
         }
      }
      
      private function onPageBtn(param1:MouseEvent) : void
      {
         if(param1.currentTarget == this.prevBtn)
         {
            this.mainMc["btnContainer"].x = 63;
            this.mainMc["btnContainer"].y = 92;
            this.modulMc4.visible = false;
            this.modulMc1.visible = true;
         }
         else
         {
            this.mainMc["btnContainer"].x = -67;
            this.mainMc["btnContainer"].y = 92;
            this.modulMc4.visible = true;
            this.modulMc1.visible = false;
         }
      }
      
      private function addEvent() : void
      {
         this.mainMc["closeBtn"].addEventListener(MouseEvent.CLICK,this.onCloseBtnClickHandler);
         this.mainMc["dragMc"].buttonMode = true;
         this.mainMc["dragMc"].addEventListener(MouseEvent.MOUSE_DOWN,this.onDragDownHandler);
      }
      
      public function setup() : void
      {
         this.mainMc = new UI_PetCollectBg();
         this.prevBtn = this.mainMc["prevBtn"];
         this.nextBtn = this.mainMc["nextBtn"];
         this.NPCIcon = this.mainMc["NPCIcon"];
         this.modulMc1 = this.mainMc["btnContainer"]["btn1"];
         this.modulMc2 = this.mainMc["btnContainer"]["btn2"];
         this.modulMc3 = this.mainMc["btnContainer"]["btn3"];
         this.modulMc4 = this.mainMc["btnContainer"]["btn4"];
         this.statusMc1 = this.mainMc["icon1"];
         this.statusMc2 = this.mainMc["icon2"];
         this.statusMc3 = this.mainMc["icon3"];
         this.statusMc4 = this.mainMc["icon4"];
      }
   }
}

