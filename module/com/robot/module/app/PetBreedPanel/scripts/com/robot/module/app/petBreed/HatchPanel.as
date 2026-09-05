package com.robot.module.app.petBreed
{
   import com.robot.app.info.BreedInfo;
   import com.robot.core.CommandID;
   import com.robot.core.animate.AnimateManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.EggsXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.controller.GetPetController;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.ui.alert.SimpleAlarm;
   import com.robot.core.utils.CommonUI;
   import com.robot.module.app.PetBreedPanel;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class HatchPanel implements IBreedPanel
   {
      
      private var _parent:PetBreedPanel;
      
      private var _ui:MovieClip;
      
      private var _breedInfo:BreedInfo;
      
      private var _status:Array = ["悲伤","冷淡","平淡","友好","亲密无间"];
      
      private var _page:uint = 0;
      
      private var _eggList:Array = [];
      
      private var _quickPanel:QuickHatchPanel = new QuickHatchPanel();
      
      private var _choosePanel:ChooseFriendPanel = new ChooseFriendPanel();
      
      private var _currentEgg:EggInfo;
      
      private var _currentEggMc:MovieClip;
      
      private var _tips:Array = ["逗逗它","听音乐","调节湿度","调节温度"];
      
      public function HatchPanel()
      {
         super();
      }
      
      public function show(param1:PetBreedPanel) : void
      {
         var i:uint = 0;
         var j:uint = 0;
         var parent:PetBreedPanel = param1;
         this._parent = parent;
         this._ui = new hatch_ui();
         this.eggVisible = false;
         this.hatchVisible = false;
         this.getPetVisible = false;
         this._ui["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["start"].addEventListener(MouseEvent.CLICK,this.onStart);
         this._ui["quick"].addEventListener(MouseEvent.CLICK,this.onQuick);
         this._ui["give"].addEventListener(MouseEvent.CLICK,this.onGive);
         this._ui["prev"].addEventListener(MouseEvent.CLICK,this.onPrev);
         this._ui["next"].addEventListener(MouseEvent.CLICK,this.onNext);
         i = 0;
         while(i < 4)
         {
            this._ui["egg_" + i].buttonMode = true;
            this._ui["egg_" + i].mouseChildren = false;
            this._ui["egg_" + i].addEventListener(MouseEvent.CLICK,this.onSmallEgg);
            i++;
         }
         CommonUI.setEnabled(this._ui["start"],false);
         CommonUI.setEnabled(this._ui["quick"],false);
         CommonUI.setEnabled(this._ui["give"],false);
         j = 0;
         while(j < 4)
         {
            ToolTipManager.add(this._ui["btn_" + j],this._tips[j]);
            this._ui["btn_" + j].addEventListener(MouseEvent.CLICK,this.onActive);
            j++;
         }
         this._ui["getPet"].addEventListener(MouseEvent.CLICK,this.onGetPet);
         LevelManager.appLevel.addChild(this._ui);
         DisplayUtil.align(this._ui,null,AlignType.MIDDLE_CENTER);
         this._parent.updateInfo(function(param1:BreedInfo):void
         {
            _breedInfo = param1;
            switch(_breedInfo.hatchState)
            {
               case 0:
                  eggVisible = true;
                  initEgg();
                  break;
               case 1:
                  hatchVisible = true;
                  _ui["quick"].visible = true;
                  _ui["quick"].y = 211;
                  CommonUI.setEnabled(_ui["quick"],true);
                  initHatch();
                  break;
               case 2:
                  getPetVisible = true;
                  initGetPet();
            }
         });
      }
      
      private function initEgg() : void
      {
         SocketConnection.addCmdListener(CommandID.GET_EGG_LIST,function(param1:SocketEvent):void
         {
            var _loc3_:EggInfo = null;
            SocketConnection.removeCmdListener(CommandID.GET_EGG_LIST,arguments.callee);
            var _loc4_:ByteArray = param1.data as ByteArray;
            var _loc5_:uint = _loc4_.readUnsignedInt();
            var _loc6_:Number = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ = new EggInfo(_loc4_);
               _eggList.push(_loc3_);
               _loc6_++;
            }
            _page = 0;
            if(_loc5_ > 0)
            {
               _currentEgg = _eggList[0];
            }
            updateEggList();
            updateCurrnetItem();
            updateCurrnetEgg();
         });
         SocketConnection.send(CommandID.GET_EGG_LIST);
      }
      
      private function updateEggList() : void
      {
         var _loc1_:* = 0;
         var _loc2_:EggInfo = null;
         var _loc3_:Number = 0;
         while(_loc3_ < 4)
         {
            DisplayUtil.removeAllChild(this._ui["egg_" + _loc3_]["con"]);
            _loc1_ = this._page * 4 + _loc3_;
            if(_loc1_ < this._eggList.length)
            {
               this._ui["egg_" + _loc3_].mouseEnabled = true;
               _loc2_ = this._eggList[_loc1_];
               this.loadSmallEgg(_loc2_.eggID,this._ui["egg_" + _loc3_]["con"]);
            }
            else
            {
               this._ui["egg_" + _loc3_].mouseEnabled = false;
            }
            _loc3_++;
         }
      }
      
      private function updateCurrnetItem() : void
      {
         var _loc1_:* = 0;
         var _loc2_:EggInfo = null;
         if(this._currentEgg == null)
         {
            return;
         }
         var _loc3_:Number = 0;
         while(_loc3_ < 4)
         {
            _loc1_ = this._page * 4 + _loc3_;
            if(_loc1_ < this._eggList.length)
            {
               _loc2_ = this._eggList[_loc1_];
               if(this._currentEgg.eggCatchTime == _loc2_.eggCatchTime)
               {
                  this._ui["egg_" + _loc3_].gotoAndStop(2);
               }
               else
               {
                  this._ui["egg_" + _loc3_].gotoAndStop(1);
               }
            }
            else
            {
               this._ui["egg_" + _loc3_].gotoAndStop(1);
            }
            _loc3_++;
         }
      }
      
      private function updateCurrnetEgg() : void
      {
         if(this._currentEgg == null)
         {
            return;
         }
         this._ui["uid"].text = this._currentEgg.ownerID;
         this._ui["father"].text = PetXMLInfo.getName(EggsXMLInfo.getFatherID(this._currentEgg.eggID));
         this._ui["mother"].text = PetXMLInfo.getName(EggsXMLInfo.getMotherID(this._currentEgg.eggID));
         this.loadBigEgg(this._currentEgg.eggID,this._ui["eggCon"]);
         CommonUI.setEnabled(this._ui["start"],true);
         CommonUI.setEnabled(this._ui["quick"],true);
         CommonUI.setEnabled(this._ui["give"],true);
      }
      
      private function initHatch() : void
      {
         this._ui["status"].text = this._status[this._breedInfo.intimacy - 1];
         this._ui["father"].text = PetXMLInfo.getName(EggsXMLInfo.getFatherID(this._breedInfo.eggID));
         this._ui["mother"].text = PetXMLInfo.getName(EggsXMLInfo.getMotherID(this._breedInfo.eggID));
         this._ui["remain"].text = "预计还有" + Math.ceil(this._breedInfo.hatchLeftTime / 3600) + "小时，精灵蛋就会孵化";
         this.loadBigEgg(this._breedInfo.eggID,this._ui["eggCon"]);
      }
      
      private function initGetPet() : void
      {
         this._ui["status"].text = this._status[this._breedInfo.intimacy - 1];
         this._ui["father"].text = PetXMLInfo.getName(EggsXMLInfo.getFatherID(this._breedInfo.eggID));
         this._ui["mother"].text = PetXMLInfo.getName(EggsXMLInfo.getMotherID(this._breedInfo.eggID));
         this.loadBigEgg(this._breedInfo.eggID,this._ui["eggCon"]);
      }
      
      private function set eggVisible(param1:Boolean) : void
      {
         this._ui["uid"].visible = param1;
         this._ui["uidBg"].visible = param1;
         this._ui["start"].visible = param1;
         this._ui["quick"].visible = param1;
         this._ui["give"].visible = param1;
         this._ui["prev"].visible = param1;
         this._ui["next"].visible = param1;
         this._ui["egg_0"].visible = param1;
         this._ui["egg_1"].visible = param1;
         this._ui["egg_2"].visible = param1;
         this._ui["egg_3"].visible = param1;
      }
      
      private function set hatchVisible(param1:Boolean) : void
      {
         this._ui["status"].visible = param1;
         this._ui["statusBg"].visible = param1;
         this._ui["remain"].visible = param1;
         this._ui["btn_0"].visible = param1;
         this._ui["btn_1"].visible = param1;
         this._ui["btn_2"].visible = param1;
         this._ui["btn_3"].visible = param1;
      }
      
      private function set getPetVisible(param1:Boolean) : void
      {
         this._ui["status"].visible = param1;
         this._ui["statusBg"].visible = param1;
         this._ui["getPet"].visible = param1;
         this._ui["btn_0"].visible = param1;
         this._ui["btn_1"].visible = param1;
         this._ui["btn_2"].visible = param1;
         this._ui["btn_3"].visible = param1;
         if(param1)
         {
            CommonUI.setEnabled(this._ui["btn_0"],false);
            CommonUI.setEnabled(this._ui["btn_1"],false);
            CommonUI.setEnabled(this._ui["btn_2"],false);
            CommonUI.setEnabled(this._ui["btn_3"],false);
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent.hide();
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this._ui.mouseEnabled = false;
         this._ui.mouseChildren = false;
         Alert.show("精灵蛋一旦开始孵化，将不可停止，确定要孵化吗？",function():void
         {
            var by:ByteArray = new ByteArray();
            by.writeUnsignedInt(_currentEgg.ownerID);
            by.writeUnsignedInt(_currentEgg.eggCatchTime);
            SocketConnection.addCmdListener(CommandID.START_HATCH,function(param1:SocketEvent):void
            {
               SocketConnection.removeCmdListener(CommandID.START_HATCH,arguments.callee);
               _parent.showPanel(new HatchPanel());
            });
            SocketConnection.send(CommandID.START_HATCH,by);
         },function():void
         {
            _ui.mouseEnabled = true;
            _ui.mouseChildren = true;
         });
      }
      
      private function onQuick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         DisplayUtil.removeForParent(this._ui);
         this._quickPanel.show(this._currentEgg,function():void
         {
            _parent.showPanel(new HatchPanel());
         },function():void
         {
            LevelManager.appLevel.addChild(_ui);
            DisplayUtil.align(_ui,null,AlignType.MIDDLE_CENTER);
         });
      }
      
      private function onGive(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,function(param1:ItemEvent):void
         {
            var e:ItemEvent = param1;
            ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,arguments.callee);
            if(Boolean(ItemManager.getCollectionInfo(400684)))
            {
               DisplayUtil.removeForParent(_ui);
               _choosePanel.show(_currentEgg,function():void
               {
                  _parent.showPanel(new HatchPanel());
               },function():void
               {
                  LevelManager.appLevel.addChild(_ui);
                  DisplayUtil.align(_ui,null,AlignType.MIDDLE_CENTER);
               });
            }
            else
            {
               _ui.mouseEnabled = false;
               _ui.mouseChildren = false;
               Alert.show("为了保障精灵蛋的安全，需要精灵蛋保护罩才可以赠送给好友哦！你现在要去商城购买吗？",function():void
               {
                  _parent.hide();
                  ModuleManager.showModule(ClientConfig.getAppModule("SupermarketPanel"),"正在加载商城....");
               },function():void
               {
                  _ui.mouseEnabled = true;
                  _ui.mouseChildren = true;
               });
            }
         });
         ItemManager.upDateCollection(400684);
      }
      
      private function onPrev(param1:MouseEvent) : void
      {
         if(this._page > 0)
         {
            --this._page;
            this.updateEggList();
            this.updateCurrnetItem();
         }
      }
      
      private function onNext(param1:MouseEvent) : void
      {
         if(this._page < Math.ceil(this._eggList.length / 4) - 1)
         {
            ++this._page;
            this.updateEggList();
            this.updateCurrnetItem();
         }
      }
      
      private function onSmallEgg(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         var _loc3_:uint = uint(_loc2_.name.split("_")[1]);
         this._currentEgg = this._eggList[this._page * 4 + _loc3_];
         this.updateCurrnetItem();
         this.updateCurrnetEgg();
      }
      
      private function onActive(param1:MouseEvent) : void
      {
         var btn:SimpleButton = null;
         var index:uint = 0;
         var e:MouseEvent = param1;
         index = 0;
         this._ui.mouseEnabled = false;
         this._ui.mouseChildren = false;
         btn = e.currentTarget as SimpleButton;
         index = uint(uint(btn.name.split("_")[1]) + 1);
         SocketConnection.addCmdListener(CommandID.EFFECT_HATCH,function(param1:SocketEvent):void
         {
            var data:ByteArray = null;
            var intimacy:uint = 0;
            var e:SocketEvent = param1;
            intimacy = 0;
            SocketConnection.removeCmdListener(CommandID.EFFECT_HATCH,arguments.callee);
            data = e.data as ByteArray;
            intimacy = data.readUnsignedInt();
            if(Boolean(_currentEggMc))
            {
               switch(index)
               {
                  case 1:
                     _parent.playSound("touchegg");
                     break;
                  case 2:
                     _parent.playSound("musicegg");
                     break;
                  case 3:
                     _parent.playSound("wateregg");
                     break;
                  case 4:
                     _parent.playSound("wenduegg");
               }
               AnimateManager.playMcAnimate(_currentEggMc,index + 1,"mc_" + (index + 1),function():void
               {
                  _ui.mouseEnabled = true;
                  _ui.mouseChildren = true;
                  _ui["status"].text = _status[intimacy - 1];
                  SimpleAlarm.show("你和精灵蛋的亲密度提升为<font color=\'#ff0000\'>" + _status[intimacy - 1] + "</font>了！");
               });
            }
            else
            {
               _ui.mouseEnabled = true;
               _ui.mouseChildren = true;
               _ui["status"].text = _status[intimacy - 1];
               SimpleAlarm.show("你和精灵蛋的亲密度提升为<font color=\'#ff0000\'>" + _status[intimacy - 1] + "</font>了！");
            }
         });
         SocketConnection.send(CommandID.EFFECT_HATCH,index);
      }
      
      private function onGetPet(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         SocketConnection.addCmdListener(CommandID.GET_HATCH_PET,function(param1:SocketEvent):void
         {
            var data:ByteArray = null;
            var id:uint = 0;
            var ct:uint = 0;
            var e:SocketEvent = param1;
            id = 0;
            ct = 0;
            SocketConnection.removeCmdListener(CommandID.GET_HATCH_PET,arguments.callee);
            data = e.data as ByteArray;
            id = data.readUnsignedInt();
            ct = data.readUnsignedInt();
            if(Boolean(_currentEggMc))
            {
               _parent.playSound("eggout");
               AnimateManager.playMcAnimate(_currentEggMc,6,"mc_6",function():void
               {
                  GetPetController.getPet(id,ct);
                  _parent.showPanel(new HatchPanel());
               });
            }
            else
            {
               GetPetController.getPet(id,ct);
               _parent.showPanel(new HatchPanel());
            }
         });
         SocketConnection.send(CommandID.GET_HATCH_PET);
      }
      
      private function loadSmallEgg(param1:uint, param2:MovieClip) : void
      {
         var id:uint = param1;
         var con:MovieClip = param2;
         ResourceManager.getResource(EggsXMLInfo.getEggIconURL(id),function(param1:DisplayObject):void
         {
            con.addChild(param1);
         },"egg");
      }
      
      private function loadBigEgg(param1:uint, param2:MovieClip) : void
      {
         var id:uint = param1;
         var con:MovieClip = param2;
         DisplayUtil.removeAllChild(con);
         ResourceManager.getResource(EggsXMLInfo.getEggEffectURL(id),function(param1:DisplayObject):void
         {
            _currentEggMc = param1 as MovieClip;
            con.addChild(_currentEggMc);
         },"egg");
      }
      
      public function hide() : void
      {
         this._ui["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["start"].removeEventListener(MouseEvent.CLICK,this.onStart);
         this._ui["quick"].removeEventListener(MouseEvent.CLICK,this.onQuick);
         this._ui["give"].removeEventListener(MouseEvent.CLICK,this.onGive);
         this._ui["prev"].removeEventListener(MouseEvent.CLICK,this.onPrev);
         this._ui["next"].removeEventListener(MouseEvent.CLICK,this.onNext);
         var _loc1_:Number = 0;
         while(_loc1_ < 4)
         {
            this._ui["egg_" + _loc1_].removeEventListener(MouseEvent.CLICK,this.onSmallEgg);
            _loc1_++;
         }
         var _loc2_:Number = 0;
         while(_loc2_ < 4)
         {
            ToolTipManager.remove(this._ui["btn_" + _loc2_]);
            this._ui["btn_" + _loc2_].removeEventListener(MouseEvent.CLICK,this.onActive);
            _loc2_++;
         }
         this._ui["getPet"].removeEventListener(MouseEvent.CLICK,this.onGetPet);
         DisplayUtil.removeForParent(this._ui);
         this._quickPanel.destory();
         this._choosePanel.destroy();
         this._parent = null;
         this._ui = null;
         this._breedInfo = null;
         this._status = null;
         this._eggList = null;
         this._quickPanel = null;
         this._choosePanel = null;
         this._currentEgg = null;
         this._currentEggMc = null;
         this._tips = null;
      }
   }
}

