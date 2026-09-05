package com.robot.module.game
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.PetInBagAlert;
   import com.robot.core.ui.alert.PetInStorageAlert;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class EggMechineGame extends Sprite implements IModule
   {
      
      private var downEgg:DownEgg = new DownEgg();
      
      private var catchPetID:uint;
      
      private var count:uint;
      
      private var giveGold:GiveGold = new GiveGold();
      
      private var eggNum1:uint;
      
      private var catchTime:uint;
      
      private var threeMC:Three;
      
      private var fourMC:Four;
      
      private var eggNum:uint;
      
      private var nineMC:Nine;
      
      private var fiveMC:Five;
      
      private var petName:String;
      
      private var btn1:MovieClip;
      
      private var btn2:MovieClip;
      
      private var btn3:MovieClip;
      
      private var actionTo:ActionTo = new ActionTo();
      
      private var eggMC:AggMachineMC;
      
      private var twoMC:Two;
      
      private var sevenMC:Seven;
      
      private var addPower:AddPower = new AddPower();
      
      private var eightMC:Eight;
      
      private var thingsName:String;
      
      private var oneMC:One;
      
      private var sixMC:Six;
      
      private var itemList:Array = [];
      
      public function EggMechineGame()
      {
         super();
      }
      
      private function clickEggBtnNumHandler(param1:MouseEvent) : void
      {
         this.eggNum1 = uint(String(param1.target.name).substr(4,1)) + 1;
         if(this["btn" + this.eggNum1].currentFrame == 1)
         {
            this.btn1.gotoAndStop(1);
            this.btn2.gotoAndStop(1);
            this.btn3.gotoAndStop(1);
            this["btn" + this.eggNum1].gotoAndStop(2);
            this.haveChance();
         }
      }
      
      public function show() : void
      {
         LevelManager.closeMouseEvent();
         this.eggMC = new AggMachineMC();
         DisplayUtil.align(this.eggMC,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(this.eggMC);
         this.eggMC.mc.gotoAndStop(1);
         this.eggMC.bigBox.allThings.gotoAndStop(1);
         this.eggMC.giveGift.gotoAndStop(1);
         this.eggMC.closeBtn.addEventListener(MouseEvent.CLICK,this.closeGame);
         this.eggMC.mc.addEventListener(MouseEvent.CLICK,this.runMC);
         this.eggMC.mc.mouseEnabled = false;
         this.btn1 = this.eggMC["btn_0"];
         this.btn2 = this.eggMC["btn_1"];
         this.btn3 = this.eggMC["btn_2"];
         this.btn1.gotoAndStop(1);
         this.btn2.gotoAndStop(1);
         this.btn3.gotoAndStop(1);
         this.btn1.buttonMode = true;
         this.btn2.buttonMode = true;
         this.btn3.buttonMode = true;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,this.onGetNum);
         ItemManager.getCollection();
      }
      
      private function onGetNum(param1:ItemEvent) : void
      {
         var _loc2_:SingleItemInfo = null;
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,this.onGetNum);
         var _loc3_:Array = ItemManager.getCollectionIDs();
         if(_loc3_.indexOf(400501) == -1)
         {
            this.eggNum = 0;
         }
         else
         {
            _loc2_ = ItemManager.getCollectionInfo(400501);
            this.eggNum = _loc2_.itemNum;
         }
         if(this.eggNum < 1)
         {
            this.eggMC.goldMC.mouseEnabled = false;
            this.eggMC.goldMC.alpha = 0.6;
         }
         else
         {
            this.eggMC.goldMC.alpha = 1;
            this.eggMC.goldMC.mouseEnabled = true;
         }
         this.eggMC.mc.alpha = 0.6;
         this.eggMC.giveGift.addEventListener(Event.ENTER_FRAME,this.stopMC);
         this.eggMC.bigBox.addEventListener(Event.ENTER_FRAME,this.giveMC);
         this.eggMC.goldNum.addEventListener(Event.ENTER_FRAME,this.haveAllGold);
      }
      
      private function stopMC(param1:Event) : void
      {
         if(this.eggMC.giveGift.currentFrame == 15)
         {
            this.eggMC.giveGift.gotoAndStop(1);
            this.eggMC.giveGift.removeEventListener(Event.ENTER_FRAME,this.stopMC);
         }
      }
      
      private function haveAllGold(param1:Event) : void
      {
         this.eggMC.goldNum.text = this.eggNum.toString();
      }
      
      private function delayAlpha() : void
      {
         this.eggMC.mc.alpha = 0.6;
         this.eggMC.bigBox.allThings.gotoAndPlay(1);
         this.actionTo = new ActionTo();
         this.actionTo.play();
         this.eggMC.bigBox.addEventListener(Event.ENTER_FRAME,this.giveMC);
      }
      
      private function petDelay() : void
      {
         this.eggMC.mouseChildren = false;
         PetManager.addEventListener(PetEvent.ADDED,function(param1:PetEvent):void
         {
            PetManager.removeEventListener(PetEvent.ADDED,arguments.callee);
            PetInBagAlert.show(catchPetID,"获得了精灵" + petName.toString() + "，你可以在你的精灵包中找到它。");
         });
         if(PetManager.length < 6)
         {
            PetManager.setIn(this.catchTime,1);
         }
         else
         {
            PetManager.addStorage(this.catchPetID,this.catchTime);
            PetInStorageAlert.show(this.catchPetID,"获得了精灵" + this.petName.toString() + "，你可以在你的精灵仓库中找到它。");
         }
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      private function closeGame(param1:MouseEvent) : void
      {
         this.destroy();
      }
      
      private function tingsDelay() : void
      {
         var _loc1_:String = null;
         this.eggMC.mouseChildren = false;
         var _loc2_:SingleItemInfo = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.itemList.length)
         {
            _loc2_ = new SingleItemInfo();
            _loc2_.itemID = this.itemList[_loc3_].itemID;
            _loc2_.itemNum = this.itemList[_loc3_].itemNum;
            _loc1_ = ItemXMLInfo.getName(_loc2_.itemID);
            Alarm.show("你获得了" + _loc2_.itemNum + "个<font color=\'#FF0000\'>" + _loc1_ + "</font>");
            if(_loc2_.itemID == 1)
            {
               MainManager.actorInfo.coins += _loc2_.itemNum;
            }
            _loc3_++;
         }
      }
      
      public function hide() : void
      {
      }
      
      private function haveChance() : void
      {
         if(this.eggNum > 0)
         {
            this.giveGold.play();
            this.eggMC.goldMC.alpha = 0.6;
            this.eggMC.mc.alpha = 1;
            this.eggMC.giveGift.gotoAndPlay(1);
            this.eggMC.mc.mouseEnabled = true;
         }
      }
      
      private function runMC(param1:MouseEvent) : void
      {
         this.addPower.play();
         this.eggMC.closeBtn.mouseEnabled = false;
         this.eggMC.mc.mouseEnabled = false;
         setTimeout(this.delayAlpha,1000);
      }
      
      private function giveMC(param1:Event) : void
      {
         if(this.eggMC.bigBox.allThings.currentFrame == 34)
         {
            this.eggMC.bigBox.allThings.gotoAndStop(1);
            this.eggMC.mc.mouseEnabled = false;
            SocketConnection.send(CommandID.EGG_GAME_PLAY,this.eggNum1);
            setTimeout(this.destroy,2000);
            SocketConnection.addCmdListener(CommandID.EGG_GAME_PLAY,this.giveGift);
            this.eggMC.bigBox.removeEventListener(Event.ENTER_FRAME,this.giveMC);
         }
      }
      
      private function giveGift(param1:SocketEvent) : void
      {
         var _loc2_:uint = 0;
         if(this.eggNum1 == 1)
         {
            this.eggNum1 = 1;
         }
         else if(this.eggNum1 == 2)
         {
            this.eggNum1 = 5;
         }
         else
         {
            if(this.eggNum1 != 3)
            {
               return;
            }
            this.eggNum1 = 10;
         }
         this.eggNum -= this.eggNum1;
         this.downEgg.play();
         SocketConnection.removeCmdListener(CommandID.EGG_GAME_PLAY,this.giveGift);
         var _loc3_:ByteArray = param1.data as ByteArray;
         var _loc4_:uint = _loc3_.readUnsignedInt();
         var _loc5_:uint = _loc3_.readUnsignedInt();
         var _loc6_:uint = _loc3_.readUnsignedInt();
         this.catchTime = _loc6_;
         this.catchPetID = _loc5_;
         if(_loc5_ != 0)
         {
            this.petName = PetXMLInfo.getName(_loc5_);
            trace(_loc5_);
            setTimeout(this.petDelay,2000);
         }
         var _loc7_:uint = _loc3_.readUnsignedInt();
         var _loc8_:SingleItemInfo = null;
         this.itemList = [];
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc8_ = new SingleItemInfo();
            _loc2_ = _loc3_.readUnsignedInt();
            this.count = _loc3_.readUnsignedInt();
            this.thingsName = ItemXMLInfo.getName(_loc2_);
            _loc8_.itemID = _loc2_;
            _loc8_.itemNum = this.count;
            this.itemList.push(_loc8_);
            if(_loc2_ == 300002)
            {
               this.threeMC = new Three();
               this.eggMC.addChild(this.threeMC);
               this.threeMC.x = 355;
               this.threeMC.y = 440;
               this.threeMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300017)
            {
               this.fourMC = new Four();
               this.eggMC.addChild(this.fourMC);
               this.fourMC.x = 620;
               this.fourMC.y = 290;
               this.fourMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300013)
            {
               this.fiveMC = new Five();
               this.eggMC.addChild(this.fiveMC);
               this.fiveMC.x = 315;
               this.fiveMC.y = 255;
               this.fiveMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300012)
            {
               this.sixMC = new Six();
               this.eggMC.addChild(this.sixMC);
               this.sixMC.x = 510;
               this.sixMC.y = 225;
               this.sixMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300001)
            {
               this.sevenMC = new Seven();
               this.eggMC.addChild(this.sevenMC);
               this.sevenMC.x = 350;
               this.sevenMC.y = 350;
               this.sevenMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300016)
            {
               this.eightMC = new Eight();
               this.eggMC.addChild(this.eightMC);
               this.eightMC.x = 620;
               this.eightMC.y = 340;
               this.eightMC.gotoAndPlay(1);
            }
            else if(_loc2_ == 300011)
            {
               this.nineMC = new Nine();
               this.eggMC.addChild(this.nineMC);
               this.nineMC.x = 430;
               this.nineMC.y = 325;
               this.nineMC.gotoAndPlay(1);
            }
            _loc9_++;
         }
         setTimeout(this.tingsDelay,2000);
         if(_loc5_ != 0)
         {
            if(_loc5_ == 59)
            {
               this.oneMC = new One();
               this.eggMC.addChild(this.oneMC);
               this.oneMC.x = 524;
               this.oneMC.y = 482;
               this.oneMC.gotoAndPlay(1);
            }
            else if(_loc5_ == 19)
            {
               this.twoMC = new Two();
               this.eggMC.addChild(this.twoMC);
               this.twoMC.x = 255;
               this.twoMC.y = 450;
               this.twoMC.gotoAndPlay(1);
            }
         }
      }
      
      public function destroy() : void
      {
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickEggBtnNumHandler);
         this.btn1 = null;
         this.btn2 = null;
         this.btn3 = null;
         LevelManager.openMouseEvent();
         if(this.eggMC)
         {
            this.eggMC.goldNum.removeEventListener(Event.ENTER_FRAME,this.haveAllGold);
            this.eggMC.giveGift.removeEventListener(Event.ENTER_FRAME,this.stopMC);
            this.eggMC.bigBox.removeEventListener(Event.ENTER_FRAME,this.giveMC);
            this.eggMC.bigBox = null;
            this.eggMC.closeBtn = null;
            this.eggMC.giveGift = null;
            this.eggMC.goldMC = null;
            this.eggMC.goldNum = null;
            this.eggMC.mc = null;
            LevelManager.appLevel.removeChild(this.eggMC);
         }
      }
      
      public function setup() : void
      {
      }
   }
}

