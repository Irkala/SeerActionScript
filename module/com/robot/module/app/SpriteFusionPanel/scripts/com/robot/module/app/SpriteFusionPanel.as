package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.info.pet.PetFusionInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.HatchTask.HatchTaskInfo;
   import com.robot.core.manager.HatchTaskManager;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.ui.alert.ItemInBagAlert;
   import com.robot.module.app.spriteFusion.BtnInfo;
   import com.robot.module.app.spriteFusion.BtnItem;
   import com.robot.module.app.spriteFusion.ElementItem;
   import com.robot.module.app.spriteFusion.ElementItemInfo;
   import com.robot.module.app.spriteFusion.PetChoosePanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.setTimeout;
   import org.taomee.ds.HashMap;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpriteFusionPanel extends Sprite implements IModule
   {
      
      public static const HAS_CHOS_PET:String = "Has_Chos_Pet";
      
      private var _subSpriteChosBtn:MovieClip;
      
      private var _itemArr:Array = [];
      
      private var _hasCohere:Boolean = false;
      
      private var _arrowHeadMC:MovieClip;
      
      private var _itemHash:HashMap;
      
      private var _nextBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var _currentPageData:Array = [];
      
      private var _fusionBtn:MovieClip;
      
      private var _bStart:Boolean = false;
      
      private var _enhanceMC:MovieClip;
      
      private var _bUsedEnhance:Boolean = false;
      
      private var _cohereMC:MovieClip;
      
      private var _hasEnhance:Boolean = false;
      
      private var _mainSpriteChosBtn:MovieClip;
      
      private var _subSpriteInfoTxt:TextField;
      
      private var _len:uint = 12;
      
      private var _eleItemPointArr:Array = [[4,-33],[272,-33],[-6,5],[281,5],[-3,45],[279,45],[11,83],[264,83],[34,116],[241,116],[64,143],[211,143]];
      
      private var _currentItem:ElementItem;
      
      private var _btnPointArr:Array = [[250,232],[211,272],[250,312],[289,272]];
      
      private var _totalPage:uint;
      
      private var _page:int = 1;
      
      private var _fusionData:Array = [0,0,0,0,0,0];
      
      private var _itemInfoArr:Array = [];
      
      private var _btnArr:Array = [];
      
      private var _closeBtn:SimpleButton;
      
      private var _mainSpriteInfoTxt:TextField;
      
      private var _itemContainer:MovieClip;
      
      private var _fusionResultMC:MovieClip;
      
      private var _animateMC:MovieClip;
      
      private var _bUsedCohere:Boolean = false;
      
      private var _currentBtn:BtnItem;
      
      private var _chosPetArr:Array = [0,0];
      
      private var _masterInfo:PetInfo;
      
      private var _enhanceID:uint = 300043;
      
      private var _cohereID:uint = 300044;
      
      private var _subInfo:PetInfo;
      
      private var _prevBtn:SimpleButton;
      
      private var _petChosPanel:PetChoosePanel;
      
      public function SpriteFusionPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         var btn:BtnItem = null;
         var item:ElementItem = null;
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,addItem);
         EventManager.removeEventListener(PetChoosePanel.PET_CHOOSE,getSubSpriteData);
         EventManager.removeEventListener(PetChoosePanel.PET_CHOOSE,getMainSpriteData);
         SocketConnection.removeCmdListener(CommandID.PET_FUSION,onGetPet);
         for each(btn in _btnArr)
         {
            if(btn)
            {
               btn.removeEventListener(MouseEvent.CLICK,onChosBtnType);
               btn = null;
            }
         }
         for each(item in _itemArr)
         {
            if(item)
            {
               item.removeEventListener(MouseEvent.CLICK,onChooseItem);
               item = null;
            }
         }
         if(_mainUI)
         {
            DisplayUtil.removeAllChild(_mainUI);
            DisplayUtil.removeForParent(_mainUI);
         }
         _mainUI = null;
         _closeBtn = null;
         _mainSpriteInfoTxt = null;
         _subSpriteInfoTxt = null;
         _mainSpriteChosBtn = null;
         _subSpriteChosBtn = null;
         _fusionBtn = null;
         _itemContainer = null;
         _petChosPanel = null;
         _currentBtn = null;
         _currentItem = null;
      }
      
      private function onChooseItem(evt:MouseEvent) : void
      {
         var btnInfo:BtnInfo = null;
         var b:BtnItem = null;
         var item:ElementItem = evt.currentTarget as ElementItem;
         item.mc.gotoAndStop(2);
         if(_currentItem)
         {
            _currentItem.mc.gotoAndStop(1);
         }
         _currentItem = null;
         _currentItem = item;
         if(_currentBtn)
         {
            if(!_bStart)
            {
               for each(b in _btnArr)
               {
                  b.visible = true;
                  b.mc.gotoAndStop(1);
               }
               _bStart = true;
            }
            btnInfo = new BtnInfo();
            btnInfo.item = item;
            btnInfo.itemInfo = item.info.info;
            _currentBtn.info = btnInfo;
            _currentBtn.mc.gotoAndStop(2);
         }
         switch(_currentBtn.type)
         {
            case 0:
               _fusionData[2] = _currentBtn.info.itemInfo.itemID;
               break;
            case 1:
               _fusionData[3] = _currentBtn.info.itemInfo.itemID;
               break;
            case 2:
               _fusionData[4] = _currentBtn.info.itemInfo.itemID;
               break;
            case 3:
               _fusionData[5] = _currentBtn.info.itemInfo.itemID;
         }
         upDateInfo(_page);
         checkData();
      }
      
      private function onAddEnhance(evt:MouseEvent) : void
      {
         if(_hasEnhance)
         {
            if(_bUsedEnhance)
            {
               _enhanceMC.gotoAndStop(1);
               _bUsedEnhance = false;
               _mainUI["jiazaiMC_0"].visible = true;
            }
            else
            {
               Alert.show("你确定要加载<font color=\'#ff0000\'>强固精华合剂</font>吗？",function():void
               {
                  _enhanceMC.gotoAndStop(2);
                  _bUsedEnhance = true;
                  _mainUI["jiazaiMC_0"].visible = false;
               });
            }
         }
         else
         {
            Alarm.show("在<font color=\'#ff0000\'>宇宙购物指南</font>中可以<br>购买到相关道具进行加载");
         }
      }
      
      private function onChosBtnType(evt:MouseEvent) : void
      {
         var btn:BtnItem = null;
         btn = evt.currentTarget as BtnItem;
         if(_currentBtn)
         {
            _currentBtn.mc.gotoAndStop(1);
         }
         btn.mc.gotoAndStop(2);
         _currentBtn = null;
         _currentBtn = btn;
         if(!_bStart)
         {
            if(_animateMC == null)
            {
               return;
            }
            btn.mouseChildren = false;
            btn.mouseEnabled = false;
            _animateMC.visible = true;
            _animateMC.gotoAndPlay(2);
            _animateMC.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
            {
               if(_animateMC.currentFrame == _animateMC.totalFrames)
               {
                  _animateMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  DisplayUtil.removeForParent(_animateMC);
                  _animateMC = null;
                  _itemContainer.visible = true;
                  btn.mouseChildren = true;
                  btn.mouseEnabled = true;
               }
            });
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function upDateInfo(page:uint) : void
      {
         var info:ElementItemInfo = null;
         var arr:Array = null;
         var count:uint = 0;
         var j:uint = 0;
         for each(info in _itemInfoArr)
         {
            info.num = _itemHash.getValue(info.info.itemID);
            count = 0;
            for(j = 2; j < 6; j++)
            {
               if(info.info.itemID == _fusionData[j])
               {
                  count++;
               }
            }
            info.num = info.info.itemNum - count;
         }
         arr = _itemInfoArr.slice(_len * (_page - 1),_len * _page);
         _currentPageData = arr;
         upDateItem(_currentPageData);
      }
      
      private function onAddCohere(evt:MouseEvent) : void
      {
         if(_hasCohere)
         {
            if(_bUsedCohere)
            {
               _cohereMC.gotoAndStop(1);
               _bUsedCohere = false;
               _mainUI["jiazaiMC_1"].visible = true;
            }
            else
            {
               Alert.show("你确定要加载<font color=\'#ff0000\'>元神凝聚制剂</font>吗？",function():void
               {
                  _cohereMC.gotoAndStop(2);
                  _bUsedCohere = true;
                  _mainUI["jiazaiMC_1"].visible = false;
               });
            }
         }
         else
         {
            Alarm.show("在<font color=\'#ff0000\'>宇宙购物指南</font>中可以<br>购买到相关道具进行加载");
         }
      }
      
      public function hide() : void
      {
      }
      
      private function addItem(evt:ItemEvent) : void
      {
         var info:SingleItemInfo = null;
         var eleInfo:ElementItemInfo = null;
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,addItem);
         var arr:Array = ItemManager.getCollectionInfos();
         for each(info in arr)
         {
            if(info.itemID >= 400001 && info.itemID <= 400049)
            {
               eleInfo = new ElementItemInfo();
               eleInfo.info = info;
               eleInfo.num = info.itemNum;
               _itemHash.add(info.itemID,eleInfo.num);
               _itemInfoArr.push(eleInfo);
            }
            if(info.itemID == 300043)
            {
               _hasEnhance = true;
               _enhanceMC["mc"].visible = true;
            }
            if(info.itemID == 300044)
            {
               _hasCohere = true;
               _cohereMC["mc"].visible = true;
            }
         }
         if(_itemInfoArr.length > _len)
         {
            _nextBtn.visible = true;
         }
         _totalPage = Math.ceil(_itemInfoArr.length / _len);
         upDateInfo(_page);
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onNext(evt:MouseEvent) : void
      {
         _prevBtn.visible = true;
         ++_page;
         if(_page == _totalPage)
         {
            _nextBtn.visible = false;
         }
         upDateInfo(_page);
      }
      
      private function onChosMainSprite(evt:MouseEvent) : void
      {
         showPetChosPanel(true);
         EventManager.addEventListener(PetChoosePanel.PET_CHOOSE,getMainSpriteData);
      }
      
      private function onChosSubSprite(evt:MouseEvent) : void
      {
         showPetChosPanel(false);
         EventManager.addEventListener(PetChoosePanel.PET_CHOOSE,getSubSpriteData);
      }
      
      public function setup() : void
      {
         var eleItem:ElementItem = null;
         var btnItem:BtnItem = null;
         _mainUI = new UI_SpriteFusion();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _arrowHeadMC = _mainUI["arrowHeadMC"];
         _arrowHeadMC.visible = false;
         _mainSpriteInfoTxt = _mainUI["mainSpriteInfoTxt"];
         _mainSpriteInfoTxt.visible = false;
         _mainSpriteInfoTxt.mouseEnabled = false;
         _subSpriteInfoTxt = _mainUI["subSpriteInfoTxt"];
         _subSpriteInfoTxt.visible = false;
         _subSpriteInfoTxt.mouseEnabled = false;
         _mainSpriteChosBtn = _mainUI["mainSpriteChosBtn"];
         _mainSpriteChosBtn["bg"].gotoAndStop(1);
         _mainSpriteChosBtn.buttonMode = true;
         _mainSpriteChosBtn.addEventListener(MouseEvent.CLICK,onChosMainSprite);
         ToolTipManager.add(_mainSpriteChosBtn,"只有最高阶段的精灵才能作为主融合精灵");
         _subSpriteChosBtn = _mainUI["subSpriteChosBtn"];
         _subSpriteChosBtn["bg"].gotoAndStop(2);
         ToolTipManager.add(_subSpriteChosBtn,"具有特殊元神能量的精灵不能作为副融合精灵");
         _itemContainer = _mainUI["itemContainer"];
         _itemContainer.visible = false;
         _itemHash = new HashMap();
         for(var i:uint = 0; i < _eleItemPointArr.length; i++)
         {
            eleItem = new ElementItem();
            _itemContainer.addChild(eleItem);
            eleItem.x = _eleItemPointArr[i][0];
            eleItem.y = _eleItemPointArr[i][1];
            eleItem.name = "eleItem_" + i;
            eleItem.type = i;
            _itemArr.push(eleItem);
         }
         for(var j:uint = 0; j < _btnPointArr.length; j++)
         {
            btnItem = new BtnItem();
            btnItem.x = _btnPointArr[j][0];
            btnItem.y = _btnPointArr[j][1];
            btnItem.name = "btn_" + j;
            btnItem.type = j;
            _mainUI.addChild(btnItem);
            _btnArr.push(btnItem);
            btnItem.visible = false;
            btnItem.buttonMode = true;
            btnItem.addEventListener(MouseEvent.CLICK,onChosBtnType);
         }
         _prevBtn = _mainUI["prevBtn"];
         _prevBtn.visible = false;
         _prevBtn.addEventListener(MouseEvent.CLICK,onPrev);
         _nextBtn = _mainUI["nextBtn"];
         _nextBtn.visible = false;
         _nextBtn.addEventListener(MouseEvent.CLICK,onNext);
         _animateMC = _mainUI["animateMC"];
         _animateMC.mouseEnabled = false;
         _animateMC.mouseChildren = false;
         _animateMC.gotoAndStop(1);
         _animateMC.visible = false;
         _fusionResultMC = new FusionResultMC();
         _fusionResultMC["mc"].gotoAndStop(1);
         _fusionResultMC["panel"].gotoAndStop(1);
         _fusionBtn = _mainUI["fusionBtn"];
         _fusionBtn.gotoAndStop(2);
         _enhanceMC = _mainUI["enhanceMC"];
         _enhanceMC.gotoAndStop(1);
         _enhanceMC.visible = false;
         _enhanceMC["mc"].visible = false;
         ToolTipManager.add(_enhanceMC,"精灵融合成功后，副融合精灵不消失");
         _cohereMC = _mainUI["cohereMC"];
         _cohereMC.gotoAndStop(1);
         _cohereMC.visible = false;
         _cohereMC["mc"].visible = false;
         ToolTipManager.add(_cohereMC,"精灵融合失败后，副融合精灵不降级");
         _mainUI["jiazaiMC_0"].visible = false;
         _mainUI["jiazaiMC_1"].visible = false;
         _petChosPanel = new PetChoosePanel();
      }
      
      private function onSpriteFusion(evt:MouseEvent) : void
      {
         Alert.show("精灵融合会消耗精灵的元神，融合成功时，主副精灵会转化成一个元神珠，如果失败，副融合精灵的等级会降低5级，你确定要花费<font color=\'#ff0000\'>1000赛尔豆</font>进行融合吗？",function():void
         {
            _fusionBtn.buttonMode = false;
            _fusionBtn.removeEventListener(MouseEvent.CLICK,onSpriteFusion);
            DisplayUtil.removeForParent(_mainUI);
            SocketConnection.addCmdListener(CommandID.PET_FUSION,onGetPet);
            if(!_bUsedEnhance && !_bUsedCohere)
            {
               SocketConnection.send(CommandID.PET_FUSION,_fusionData[0],_fusionData[1],_fusionData[2],_fusionData[3],_fusionData[4],_fusionData[5],0,0);
               return;
            }
            if(_hasEnhance && _bUsedEnhance)
            {
               if(!_bUsedCohere)
               {
                  SocketConnection.send(CommandID.PET_FUSION,_fusionData[0],_fusionData[1],_fusionData[2],_fusionData[3],_fusionData[4],_fusionData[5],_enhanceID,0);
                  return;
               }
            }
            if(_hasCohere && _bUsedCohere)
            {
               if(!_bUsedEnhance)
               {
                  SocketConnection.send(CommandID.PET_FUSION,_fusionData[0],_fusionData[1],_fusionData[2],_fusionData[3],_fusionData[4],_fusionData[5],0,_cohereID);
                  return;
               }
            }
            if(_hasEnhance && _bUsedEnhance && _hasCohere && _bUsedCohere)
            {
               SocketConnection.send(CommandID.PET_FUSION,_fusionData[0],_fusionData[1],_fusionData[2],_fusionData[3],_fusionData[4],_fusionData[5],_enhanceID,_cohereID);
            }
         });
      }
      
      private function upDateItem(arr:Array) : void
      {
         var item:ElementItem = null;
         var i:uint = 0;
         var itemInfo:ElementItemInfo = null;
         var name:String = null;
         var eleItem:ElementItem = null;
         for each(item in _itemArr)
         {
            item.info = null;
         }
         for(i = 0; i < arr.length; i++)
         {
            itemInfo = arr[i];
            name = "eleItem_" + i;
            eleItem = _itemContainer.getChildByName(name) as ElementItem;
            if(eleItem)
            {
               eleItem.info = itemInfo;
               eleItem.buttonMode = true;
               eleItem.addEventListener(MouseEvent.CLICK,onChooseItem);
            }
         }
      }
      
      private function onPrev(evt:MouseEvent) : void
      {
         _nextBtn.visible = true;
         --_page;
         if(_page <= 1)
         {
            _prevBtn.visible = false;
         }
         upDateInfo(_page);
      }
      
      private function onGetPet(evt:SocketEvent) : void
      {
         var info:PetFusionInfo = null;
         SocketConnection.removeCmdListener(CommandID.PET_FUSION,onGetPet);
         info = evt.data as PetFusionInfo;
         LevelManager.appLevel.addChild(_fusionResultMC);
         DisplayUtil.align(_fusionResultMC,null,AlignType.BOTTOM_CENTER);
         _fusionResultMC["mc"].gotoAndPlay(2);
         _fusionResultMC["mc"].addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            var i:HatchTaskInfo = null;
            if(_fusionResultMC["mc"].currentFrame == _fusionResultMC["mc"].totalFrames)
            {
               _fusionResultMC["mc"].removeEventListener(Event.ENTER_FRAME,arguments.callee);
               DisplayUtil.removeForParent(_fusionResultMC["mc"]);
               if(info.obtainTime == 0)
               {
                  _fusionResultMC["panel"].gotoAndStop(3);
                  setTimeout(function():void
                  {
                     var level:uint = 0;
                     DisplayUtil.removeForParent(_fusionResultMC);
                     _fusionResultMC = null;
                     if(info.costItemFlag == 1)
                     {
                        Alarm.show("一枚<font color=\'#ff0000\'>元神凝聚制剂</font>已经被消耗掉了！");
                        return;
                     }
                     if(_subInfo)
                     {
                        level = uint(_subInfo.level);
                        if(level > 5)
                        {
                           Alarm.show("很遗憾，这次融合没有成功，元神的损耗使你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(_subInfo.id) + "</font>等级降低了5级!");
                        }
                        else
                        {
                           Alarm.show("很遗憾，这次融合没有成功，元神的损耗使你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(_subInfo.id) + "</font>等级降低到了1级!");
                        }
                        return;
                     }
                     Alarm.show("很遗憾，这次融合没有成功，元神的损耗使你的副融合精灵等级降低了5级!");
                  },3000);
               }
               else
               {
                  _fusionResultMC["panel"].gotoAndStop(2);
                  setTimeout(function():void
                  {
                     var url:String = "resource/soulBead/icon/" + info.soulID + ".swf";
                     ResourceManager.getResource(url,function(m:MovieClip):void
                     {
                        if(m)
                        {
                           _fusionResultMC.addChild(m);
                           m.scaleX = 1.5;
                           m.scaleY = 1.5;
                           m.x = 170;
                           m.y = 266;
                        }
                     });
                  },1000);
                  setTimeout(function():void
                  {
                     DisplayUtil.removeAllChild(_fusionResultMC);
                     DisplayUtil.removeForParent(_fusionResultMC);
                     ItemInBagAlert.show(info.soulID,"恭喜你获得精灵<font color=\'#ff0000\'>元神珠</font>。当<font color=\'#ff0000\'>元神珠</font>吸收到相应的星球能量后就能进行元神赋形了！",function():void
                     {
                        if(info.costItemFlag == 1)
                        {
                           Alarm.show("一枚<font color=\'#ff0000\'>强固精华合剂</font>已经被消耗掉了！");
                        }
                        else
                        {
                           PetManager.deletePet(_fusionData[1]);
                        }
                     });
                  },3000);
                  PetManager.deletePet(_fusionData[0]);
                  HatchTaskManager.setTaskProStatus(info.obtainTime,0,false);
                  i = new HatchTaskInfo(info.obtainTime,info.soulID,[]);
                  HatchTaskManager.addHeadStatus(info.obtainTime,i);
                  ++MainManager.actorInfo.fuseTimes;
               }
            }
         });
         PetManager.setDefault(info.starterCpTm,false);
         destroy();
      }
      
      private function getSubSpriteData(evt:DynamicEvent) : void
      {
         var info:PetInfo;
         var btnItem:BtnItem;
         _subSpriteChosBtn["bg"].gotoAndStop(2);
         _arrowHeadMC.visible = true;
         _enhanceMC.visible = true;
         _enhanceMC.buttonMode = true;
         _enhanceMC.addEventListener(MouseEvent.CLICK,onAddEnhance);
         _cohereMC.visible = true;
         _cohereMC.buttonMode = true;
         _cohereMC.addEventListener(MouseEvent.CLICK,onAddCohere);
         _mainUI["jiazaiMC_0"].visible = true;
         _mainUI["jiazaiMC_1"].visible = true;
         btnItem = _mainUI.getChildByName("btn_0") as BtnItem;
         btnItem.visible = true;
         btnItem.mc.gotoAndStop(1);
         EventManager.removeEventListener(PetChoosePanel.PET_CHOOSE,getSubSpriteData);
         info = evt.paramObject as PetInfo;
         if(info)
         {
            _subInfo = info;
            _chosPetArr[1] = info.catchTime;
            EventManager.dispatchEvent(new DynamicEvent(HAS_CHOS_PET,_chosPetArr));
            _subSpriteInfoTxt.visible = true;
            _subSpriteInfoTxt.htmlText = "名称:" + PetXMLInfo.getName(info.id) + "\r" + "属性:" + PetXMLInfo.getTypeCN(info.id) + "\r" + "等级:" + info.level + "\r" + "性格:" + NatureXMLInfo.getName(info.nature);
            _fusionData[1] = info.catchTime;
            ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),function(m:MovieClip):void
            {
               m.gotoAndStop("rightdown");
               m.addEventListener(Event.ENTER_FRAME,function():void
               {
                  var mc:MovieClip = m.getChildAt(0) as MovieClip;
                  if(mc)
                  {
                     mc.gotoAndStop(1);
                     m.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  }
               });
               DisplayUtil.stopAllMovieClip(m);
               m.scaleX = 3;
               m.scaleY = 3;
               DisplayUtil.removeAllChild(_subSpriteChosBtn["sprite"]);
               _subSpriteChosBtn["sprite"].addChild(m);
               _subSpriteChosBtn["mc"].visible = false;
            },"pet");
         }
         checkData();
      }
      
      private function getMainSpriteData(evt:DynamicEvent) : void
      {
         var info:PetInfo;
         _mainSpriteChosBtn["bg"].gotoAndStop(2);
         _subSpriteChosBtn["bg"].gotoAndStop(1);
         _subSpriteChosBtn.buttonMode = true;
         _subSpriteChosBtn.addEventListener(MouseEvent.CLICK,onChosSubSprite);
         EventManager.removeEventListener(PetChoosePanel.PET_CHOOSE,getMainSpriteData);
         info = evt.paramObject as PetInfo;
         if(info)
         {
            _masterInfo = info;
            _chosPetArr[0] = info.catchTime;
            EventManager.dispatchEvent(new DynamicEvent(HAS_CHOS_PET,_chosPetArr));
            _mainSpriteInfoTxt.visible = true;
            _mainSpriteInfoTxt.htmlText = "名称:" + PetXMLInfo.getName(info.id) + "\r" + "属性:" + PetXMLInfo.getTypeCN(info.id) + "\r" + "等级:" + info.level + "\r" + "性格:" + NatureXMLInfo.getName(info.nature);
            _fusionData[0] = info.catchTime;
            ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),function(m:MovieClip):void
            {
               m.gotoAndStop("rightdown");
               m.addEventListener(Event.ENTER_FRAME,function():void
               {
                  var mc:MovieClip = m.getChildAt(0) as MovieClip;
                  if(mc)
                  {
                     mc.gotoAndStop(1);
                     m.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  }
               });
               DisplayUtil.stopAllMovieClip(m);
               m.scaleX = 3;
               m.scaleY = 3;
               DisplayUtil.removeAllChild(_mainSpriteChosBtn["sprite"]);
               _mainSpriteChosBtn["sprite"].addChild(m);
               _mainSpriteChosBtn["mc"].visible = false;
            },"pet");
         }
         checkData();
      }
      
      private function showPetChosPanel(b:Boolean) : void
      {
         _petChosPanel.show(b);
         LevelManager.appLevel.addChild(_petChosPanel);
         DisplayUtil.align(_petChosPanel,null,AlignType.MIDDLE_RIGHT);
      }
      
      private function checkData() : void
      {
         var i:uint = 0;
         for each(i in _fusionData)
         {
            if(i == 0)
            {
               return;
            }
         }
         _fusionBtn.buttonMode = true;
         _fusionBtn.gotoAndStop(1);
         _fusionBtn.addEventListener(MouseEvent.CLICK,onSpriteFusion);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         _mainUI.x = 205;
         _mainUI.y = 48;
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,addItem);
         ItemManager.getCollection();
      }
   }
}

