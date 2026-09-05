package com.robot.module.app
{
   import com.robot.app.superParty.SPChannelController;
   import com.robot.app.superParty.SPConfig;
   import com.robot.app.superParty.SuperPartyInfo;
   import com.robot.app.task.taskUtils.taskDialog.NpcTipDialog;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.manager.map.config.MapConfig;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.item.Item;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SPPanel extends Sprite implements IModule
   {
      
      private var _petMc:Sprite;
      
      private var _oreMc:Sprite;
      
      private var _type:uint = 0;
      
      private var _closeBtn:SimpleButton;
      
      private var _nameTxt:TextField;
      
      private var _nextBtn:SimpleButton;
      
      private var _endX:Number;
      
      private var _picMc:MovieClip;
      
      private const MAX:uint = 4;
      
      private var _gameMc:Sprite;
      
      private var _maskMc:Sprite;
      
      private var _mainMc:SPPanelMc;
      
      private var _curIndex:uint = 0;
      
      private var _infoA:Array;
      
      private var _startX:Number = 34;
      
      private var _titleTxt:TextField;
      
      private var _name1Txt:TextField;
      
      private var _prevBtn:SimpleButton;
      
      private var _sendBtn:SimpleButton;
      
      public function SPPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         this.hide();
         this._mainMc = null;
         this._sendBtn = null;
         this._prevBtn = null;
         this._nextBtn = null;
         this._nameTxt = null;
         this._name1Txt = null;
         this._petMc = null;
         this._oreMc = null;
         this._gameMc = null;
         this._infoA = null;
      }
      
      private function setName(param1:uint) : void
      {
         var _loc2_:SuperPartyInfo = this._infoA[param1] as SuperPartyInfo;
         this._nameTxt.text = MapConfig.getName(_loc2_.mapID);
         this._name1Txt.text = MapConfig.getName(_loc2_.mapID);
         var _loc3_:String = "";
      }
      
      public function init(param1:Object = null) : void
      {
         this._infoA = param1 as Array;
      }
      
      public function setup() : void
      {
         this._mainMc = new SPPanelMc();
         this._sendBtn = this._mainMc["sendBtn"];
         this._prevBtn = this._mainMc["prevBtn"];
         this._nextBtn = this._mainMc["nextBtn"];
         this._nameTxt = this._mainMc["nameTxt"];
         this._name1Txt = this._mainMc["name1Txt"];
         this._petMc = this._mainMc["petMc"];
         this._oreMc = this._mainMc["oreMc"];
         this._gameMc = this._mainMc["gameMc"];
         this._closeBtn = this._mainMc["closeBtn"];
         this._picMc = this._mainMc["picMc"];
         this._picMc.gotoAndStop(1);
      }
      
      private function addOreIcon(param1:uint) : void
      {
         var _loc2_:Item = null;
         var _loc3_:Item = null;
         var _loc4_:SuperPartyInfo = this._infoA[param1] as SuperPartyInfo;
         var _loc5_:Array = _loc4_.oreIDs;
         var _loc6_:int = 0;
         while(_loc6_ < this.MAX)
         {
            _loc2_ = this._oreMc.getChildByName("ore_" + _loc6_) as Item;
            if(!_loc2_)
            {
               _loc2_ = new Item();
               _loc2_.name = "ore_" + _loc6_;
               this._oreMc.addChild(_loc2_);
               _loc2_.x = (_loc2_.width + 4) * _loc6_;
               _loc2_.y = 20;
            }
            if(_loc5_[_loc6_] == undefined)
            {
               _loc2_.show();
               ToolTipManager.remove(_loc2_);
            }
            else
            {
               if(_loc5_[_loc6_] != "")
               {
                  ToolTipManager.add(_loc2_,ItemXMLInfo.getName(uint(_loc5_[_loc6_])));
               }
               _loc2_.show("resource/item/doodle/icon/" + _loc5_[_loc6_] + ".swf");
            }
            _loc6_++;
         }
         if(_loc5_.length == 0)
         {
            _loc3_ = this._oreMc.getChildByName("ore_0") as Item;
            if(!_loc3_)
            {
               _loc3_ = new Item();
               _loc3_.name = "ore_0";
               this._oreMc.addChild(_loc3_);
               _loc3_.x = 0;
               _loc3_.y = 20;
            }
            _loc3_.setVi(2);
         }
      }
      
      private function onCloseHandler(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function addTitle() : void
      {
         if(Boolean(this._titleTxt) && Boolean(this._maskMc))
         {
            return;
         }
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = 16777215;
         _loc1_.size = 15;
         this._titleTxt = new TextField();
         this._titleTxt.text = SPConfig.title;
         this._titleTxt.setTextFormat(_loc1_);
         this._titleTxt.width = this._titleTxt.textWidth + 3;
         this._titleTxt.height = this._titleTxt.textHeight + 3;
         this._mainMc.addChild(this._titleTxt);
         this._titleTxt.x = 25;
         this._titleTxt.y = 303;
         this._maskMc = new Sprite();
         this._maskMc.graphics.lineStyle(1,0);
         this._maskMc.graphics.beginFill(0);
         this._maskMc.graphics.drawRect(0,0,364,this._titleTxt.height);
         this._maskMc.graphics.endFill();
         this._mainMc.addChild(this._maskMc);
         this._maskMc.x = this._titleTxt.x;
         this._maskMc.y = this._titleTxt.y;
         this._titleTxt.mask = this._maskMc;
         this._endX = this._startX - (this._titleTxt.width - 364);
      }
      
      private function onPrevHandler(param1:MouseEvent) : void
      {
         if(this._curIndex > 0)
         {
            --this._curIndex;
            this.addPetIcon(this._curIndex);
            this.addOreIcon(this._curIndex);
            this.setName(this._curIndex);
            this._picMc.gotoAndStop(this._curIndex + 1);
            this.addGameIcon(this._curIndex);
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._mainMc);
         this.removeEvent();
      }
      
      private function onSendHandler(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var info:SuperPartyInfo = null;
         info = this._infoA[this._curIndex] as SuperPartyInfo;
         if(MainManager.actorInfo.superNono)
         {
            if(NonoManager.info.func[18])
            {
               if(MainManager.actorInfo.coins < 2000)
               {
                  Alarm.show("使用超时空通道需要花费2000赛尔豆！你的赛尔豆不足2000哦!");
               }
               else
               {
                  Alert.show("你确定要花费2000赛尔豆开始时空穿梭之旅吗？",function():void
                  {
                     SocketConnection.addCmdListener(CommandID.REMOVE_COINS,onSucHandler);
                     SocketConnection.send(CommandID.REMOVE_COINS,2000);
                  });
               }
            }
            else
            {
               NpcTipDialog.show("主人你一定要加载了" + TextFormatUtil.getRedTxt("时空穿梭芯片") + "才能启动时空穿梭门哦，请到发明室里找肖恩博士领取吧！",null,NpcTipDialog.NONO);
            }
         }
         else
         {
            Alarm.show("只有超能NoNo才能使用超时空通道哦！");
         }
      }
      
      private function onSucHandler(param1:SocketEvent) : void
      {
         var _loc2_:SuperPartyInfo = this._infoA[this._curIndex] as SuperPartyInfo;
         MainManager.actorInfo.coins -= 2000;
         SocketConnection.removeCmdListener(CommandID.REMOVE_COINS,this.onSucHandler);
         SPChannelController.changeMap(_loc2_.mapID);
      }
      
      private function addGameIcon(param1:uint) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Item = null;
         var _loc4_:Item = null;
         var _loc5_:SuperPartyInfo = this._infoA[param1] as SuperPartyInfo;
         var _loc6_:int = 0;
         while(_loc6_ < this.MAX)
         {
            _loc2_ = this._gameMc.getChildByName("game_" + _loc6_) as Sprite;
            if(!_loc2_)
            {
               _loc2_ = new Game_Icon_Mc();
               _loc2_.name = "game_" + _loc6_;
               this._gameMc.addChild(_loc2_);
               _loc2_.x = (_loc2_.width + 10) * _loc6_;
               _loc2_.y = 25;
            }
            if(_loc5_.games[_loc6_] == undefined)
            {
               _loc2_.visible = false;
               ToolTipManager.remove(_loc2_);
            }
            else
            {
               _loc2_.visible = true;
               ToolTipManager.add(_loc2_,_loc5_.games[_loc6_]);
            }
            _loc6_++;
         }
         if(_loc5_.games.length == 0)
         {
            _loc3_ = this._gameMc.getChildByName("hh") as Item;
            if(!_loc3_)
            {
               _loc3_ = new Item();
               _loc3_.name = "hh";
               this._gameMc.addChild(_loc3_);
               _loc3_.x = 0;
               _loc3_.y = 25;
            }
            _loc3_.visible = true;
            _loc3_.setVi(2);
         }
         else
         {
            _loc4_ = this._gameMc.getChildByName("hh") as Item;
            if(_loc4_)
            {
               _loc4_.visible = false;
            }
         }
      }
      
      private function addPetIcon(param1:uint) : void
      {
         var _loc2_:Item = null;
         var _loc3_:Item = null;
         var _loc4_:SuperPartyInfo = this._infoA[param1] as SuperPartyInfo;
         var _loc5_:Array = _loc4_.petIDs;
         var _loc6_:int = 0;
         while(_loc6_ < this.MAX)
         {
            _loc2_ = this._petMc.getChildByName("pet_" + _loc6_) as Item;
            if(!_loc2_)
            {
               _loc2_ = new Item();
               _loc2_.name = "pet_" + _loc6_;
               this._petMc.addChild(_loc2_);
               _loc2_.x = (_loc2_.width + 4) * _loc6_;
               _loc2_.y = 20;
            }
            if(_loc5_[_loc6_] == undefined)
            {
               _loc2_.show();
               ToolTipManager.remove(_loc2_);
            }
            else
            {
               _loc2_.show(ClientConfig.getPetSwfPath(uint(_loc5_[_loc6_])),"pet");
               if(_loc5_[_loc6_] != "")
               {
                  ToolTipManager.add(_loc2_,PetXMLInfo.getName(uint(_loc5_[_loc6_])));
               }
            }
            _loc6_++;
         }
         if(_loc5_.length == 0)
         {
            _loc3_ = this._petMc.getChildByName("pet_0") as Item;
            if(!_loc3_)
            {
               _loc3_ = new Item();
               _loc3_.name = "pet_0";
               this._petMc.addChild(_loc3_);
               _loc3_.x = 0;
               _loc3_.y = 20;
            }
            _loc3_.setVi(2);
         }
      }
      
      private function onEnterHandler(param1:Event) : void
      {
         if(this._type == 0)
         {
            --this._titleTxt.x;
            if(this._titleTxt.x <= this._endX)
            {
               this._type = 1;
            }
         }
         if(this._type == 1)
         {
            ++this._titleTxt.x;
            if(this._titleTxt.x >= this._startX)
            {
               this._type = 0;
            }
         }
      }
      
      private function removeEvent() : void
      {
         this._sendBtn.removeEventListener(MouseEvent.CLICK,this.onSendHandler);
         this._prevBtn.removeEventListener(MouseEvent.CLICK,this.onPrevHandler);
         this._nextBtn.removeEventListener(MouseEvent.CLICK,this.onNextHandler);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this._mainMc.removeEventListener(Event.ENTER_FRAME,this.onEnterHandler);
         DragManager.remove(this._mainMc["dragMc"]);
         ToolTipManager.remove(this._mainMc["coMc"]);
      }
      
      private function onNextHandler(param1:MouseEvent) : void
      {
         if(this._curIndex < this._infoA.length - 1)
         {
            ++this._curIndex;
            this.addPetIcon(this._curIndex);
            this.addOreIcon(this._curIndex);
            this.setName(this._curIndex);
            this._picMc.gotoAndStop(this._curIndex + 1);
            this.addGameIcon(this._curIndex);
         }
      }
      
      private function addEvent() : void
      {
         this._sendBtn.addEventListener(MouseEvent.CLICK,this.onSendHandler);
         this._prevBtn.addEventListener(MouseEvent.CLICK,this.onPrevHandler);
         this._nextBtn.addEventListener(MouseEvent.CLICK,this.onNextHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this._mainMc.addEventListener(Event.ENTER_FRAME,this.onEnterHandler);
         DragManager.add(this._mainMc["dragMc"],this._mainMc);
         ToolTipManager.add(this._mainMc["coMc"],"时空精灵胶囊");
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._mainMc);
         DisplayUtil.align(this._mainMc,null,AlignType.MIDDLE_CENTER);
         this.addPetIcon(this._curIndex);
         this.addOreIcon(this._curIndex);
         this.setName(this._curIndex);
         this.addTitle();
         this.addGameIcon(this._curIndex);
         this.addEvent();
      }
   }
}

