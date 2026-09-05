package com.robot.app.task.petstory
{
   import com.robot.app.fight.FightManager;
   import com.robot.app.mapProcess.control.activityControl.ActivityControl;
   import com.robot.app.ogre.OgreController;
   import com.robot.app.toolBar.ToolBarController;
   import com.robot.core.CommandID;
   import com.robot.core.animate.AnimateManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.dispatcher.FightDispatcher;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.event.MCLoadEvent;
   import com.robot.core.event.MapEvent;
   import com.robot.core.event.PetFightEvent;
   import com.robot.core.info.SystemTimeInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.BufferRecordManager;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.manager.map.config.BaseMapProcess;
   import com.robot.core.mode.OgreModel;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.newloader.MCLoader;
   import com.robot.core.npc.NPC;
   import com.robot.core.npc.NpcDialog;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.SimpleAlarm;
   import com.robot.core.utils.CronTimeVo;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import org.taomee.debug.DebugTrace;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.Delegate;
   import org.taomee.utils.DisplayUtil;
   
   public class PetStory_1
   {
      
      private static var _monMode:OgreModel;
      
      private static var _spriteMC:MovieClip;
      
      private static var _resetMC:MovieClip;
      
      private static var _partMC_1:MovieClip;
      
      private static var _partMC_2:MovieClip;
      
      private static var _partMC_3:MovieClip;
      
      private static var _flyCanvas:MovieClip;
      
      private static var _petCanvas:MovieClip;
      
      private static var _mainPanel:MovieClip;
      
      private static var _loader:MCLoader;
      
      private static var _closeBtn:SimpleButton;
      
      private static var _app:ApplicationDomain;
      
      private static var _startBtn:SimpleButton;
      
      private static var _flyControl:MovieClip;
      
      private static var _currentNum:uint;
      
      private static var _stoneMC:MovieClip;
      
      private static var _adMC:MovieClip;
      
      private static var _comMC:MovieClip;
      
      private static var _downBtn:SimpleButton;
      
      private static var _downMC:MovieClip;
      
      private static var _numCanvas:MovieClip;
      
      private static var _selectNum:uint;
      
      private static var _flyMac:MovieClip;
      
      private static var _map:BaseMapProcess;
      
      private static var _petIdo:MovieClip;
      
      private static var _excalMark:MovieClip;
      
      public static var isActive:Boolean = false;
      
      private static var PATH:String = ClientConfig.getResPath("module/ext/fly/fly.swf");
      
      private static var _numList:Array = [];
      
      private static var _numBtnList:Array = [];
      
      private static var _num2ItemList:Array = [0,400726,400727,400728,400729,400730];
      
      private static var _isCanfight:Boolean = false;
      
      private static const AC:ActivityControl = new ActivityControl([new CronTimeVo("*","*","18-29","9","*","2015")]);
      
      private static const TIME_STR:String = "9月18日-9月29日";
      
      public function PetStory_1()
      {
         super();
      }
      
      public static function initTask(param1:BaseMapProcess) : void
      {
         _map = param1;
         isActive = false;
         _isCanfight = false;
         _spriteMC = param1.conLevel["sprite_mc"];
         _spriteMC.visible = false;
         _spriteMC.buttonMode = true;
         _resetMC = param1.conLevel["resetMC"];
         _resetMC.buttonMode = true;
         _resetMC.visible = false;
         _resetMC.addEventListener(MouseEvent.CLICK,onMouseReset);
         _partMC_1 = param1.conLevel["part_0"];
         _partMC_2 = param1.conLevel["part_1"];
         _partMC_3 = param1.conLevel["part_2"];
         ToolTipManager.add(_partMC_1,"部件一");
         ToolTipManager.add(_partMC_2,"部件二");
         ToolTipManager.add(_partMC_3,"部件三");
         checkShowPartMC(_partMC_1,120);
         checkShowPartMC(_partMC_2,121);
         checkShowPartMC(_partMC_3,122);
         _flyCanvas = param1.conLevel["flyCanvas"];
         _flyMac = _flyCanvas["flyMac"];
         _flyMac.visible = false;
         _flyControl = _flyCanvas["flyControl"];
         _flyControl.buttonMode = true;
         _flyControl.addEventListener(MouseEvent.CLICK,onMouseFly);
         _stoneMC = param1.conLevel["stoneMC"];
         _stoneMC.buttonMode = true;
         _stoneMC.addEventListener(MouseEvent.CLICK,onMouseStone);
         _adMC = param1.topLevel["adMC"];
         (_adMC["closeBtn"] as SimpleButton).addEventListener(MouseEvent.CLICK,onMouseCloseAd);
         _adMC.visible = false;
         _comMC = param1.conLevel["comMC"];
         _petIdo = param1.conLevel["petIdo"];
         _petIdo.buttonMode = true;
         _petIdo.addEventListener(MouseEvent.CLICK,onMonClick);
         SocketConnection.addCmdListener(CommandID.SYSTEM_TIME,onSystemTime);
         SocketConnection.send(CommandID.SYSTEM_TIME);
         MapManager.addEventListener(MapEvent.MAP_SWITCH_COMPLETE,onMapOpenHandler);
         MapManager.addEventListener(MapEvent.MAP_DESTROY,onMapDestroyHandler);
      }
      
      private static function onMouseStone(param1:MouseEvent) : void
      {
         Alarm.show("活动已结束！");
      }
      
      private static function onMouseCloseAd(param1:MouseEvent) : void
      {
         _adMC.visible = false;
      }
      
      private static function onMousePet(param1:MouseEvent) : void
      {
         fightWithBoss();
      }
      
      private static function onMouseFly(param1:MouseEvent) : void
      {
         if(checkState(3))
         {
            loadFLyPanel();
         }
         else
         {
            NpcDialog.show(NPC.SEER,["咦！这个装置好像已经损坏不能使用了！"],["去附近看看吧！"],null);
         }
      }
      
      private static function loadFLyPanel() : void
      {
         if(!_mainPanel)
         {
            _loader = new MCLoader(PATH,LevelManager.topLevel,1,"正在加飞行器");
            _loader.addEventListener(MCLoadEvent.SUCCESS,onComplete);
            _loader.doLoad();
         }
         else
         {
            showPanel();
         }
      }
      
      private static function onComplete(param1:MCLoadEvent) : void
      {
         var _loc2_:SimpleButton = null;
         _app = param1.getApplicationDomain();
         _loader.removeEventListener(MCLoadEvent.SUCCESS,onComplete);
         _mainPanel = new (_app.getDefinition("Fly_UI") as Class)() as MovieClip;
         var _loc3_:SimpleButton = _mainPanel["num2"];
         var _loc4_:SimpleButton = _mainPanel["num4"];
         var _loc5_:SimpleButton = _mainPanel["num6"];
         var _loc6_:SimpleButton = _mainPanel["num8"];
         var _loc7_:SimpleButton = _mainPanel["num10"];
         _numBtnList.push(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         for each(_loc2_ in _numBtnList)
         {
            _loc2_.addEventListener(MouseEvent.CLICK,onMouseNumBtn);
         }
         _startBtn = _mainPanel["startBtn"];
         _downBtn = _mainPanel["downBtn"];
         _downBtn.addEventListener(MouseEvent.CLICK,onMouseDownBtn);
         _downMC = _mainPanel["downMC"];
         (_downMC["mc"] as MovieClip).gotoAndStop(1);
         _numCanvas = _mainPanel["numCanvas"];
         _numCanvas.visible = false;
         _startBtn.addEventListener(MouseEvent.CLICK,onMouseStart);
         showPanel();
      }
      
      private static function onMouseDownBtn(param1:MouseEvent) : void
      {
         if((_downMC["mc"] as MovieClip).currentFrame == 1)
         {
            (_downMC["mc"] as MovieClip).gotoAndPlay(1);
         }
      }
      
      private static function onMouseNumBtn(param1:MouseEvent) : void
      {
         var btn:InteractiveObject = null;
         var frame:int = 0;
         var e:MouseEvent = param1;
         var num:uint = uint((e.currentTarget.name as String).slice(3));
         _currentNum = num;
         if((e.currentTarget as SimpleButton).filters.length == 0)
         {
            btn = InteractiveObject(e.currentTarget);
            btn.mouseEnabled = false;
            frame = num / 2 + 1;
            _numCanvas.visible = true;
            AnimateManager.playMcAnimate(_numCanvas,frame - 1,"numMC",function():void
            {
               if(btn)
               {
                  btn.mouseEnabled = true;
               }
            });
            _selectNum = frame;
            DebugTrace.show("当前选中按钮：" + num);
         }
      }
      
      private static function showPetDialog() : void
      {
         NpcDialog.show(668,["哈哈哈！我最喜欢8了！等了好久终于等到了，嘿嘿，最喜欢这个吉利的数字，现在你知道了吧！"],["一个喜欢数字8的精灵，精灵世界真是无奇不有啊！"],[function():void
         {
            NpcDialog.show(NPC.SEER,["看到你这么喜欢数字，我也开始慢慢喜欢数字了！对了，小东西，现在你是不是也该兑现你对我的承诺，成为我的好朋友了呢？"],["好呀！"],[function():void
            {
               NpcDialog.show(668,["恩，我当然会兑现我的承诺，我会伴随在你的身边，让我们一起去宇宙探险吧！不过老规矩，还是要先看看你的实力哦！如果你可以抓到我的话，嘿嘿！"],["没问题，来吧！点击小精灵进行对战！"],[function():void
               {
               }]);
            }]);
         }]);
      }
      
      private static function onMouseStart(param1:MouseEvent) : void
      {
         var sound:Sound = null;
         var e:MouseEvent = param1;
         if(_selectNum != 0)
         {
            LevelManager.closeMouseEvent();
            _spriteMC.visible = false;
            if(_currentNum == 8)
            {
               sound = new Sound(new URLRequest(ClientConfig.getResPath("module/ext/music/music_1.mp3")));
               sound.play();
            }
            AnimateManager.playMcAnimate(_flyCanvas,_selectNum,"flyMac",function():void
            {
               LevelManager.openMouseEvent();
               expendItem(_num2ItemList[_selectNum - 1]);
               if(_currentNum == 8)
               {
                  _isCanfight = true;
                  showPetDialog();
               }
               _spriteMC.visible = true;
            });
            closeHandler(new MouseEvent(MouseEvent.CLICK));
         }
         else
         {
            Alarm.show("请选择一个数字");
         }
      }
      
      private static function showPanel() : void
      {
         DisplayUtil.align(_mainPanel,null,AlignType.MIDDLE_CENTER);
         LevelManager.closeMouseEvent();
         LevelManager.appLevel.addChild(_mainPanel);
         _closeBtn = _mainPanel["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         (_downMC["mc"] as MovieClip).gotoAndStop(1);
         _numCanvas.visible = false;
         _selectNum = 0;
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,onItemList);
         ItemManager.getCollection();
      }
      
      private static function onItemList(param1:ItemEvent) : void
      {
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,onItemList);
         var _loc2_:SingleItemInfo = ItemManager.getCollectionInfo(400726);
         var _loc3_:SingleItemInfo = ItemManager.getCollectionInfo(400727);
         var _loc4_:SingleItemInfo = ItemManager.getCollectionInfo(400728);
         var _loc5_:SingleItemInfo = ItemManager.getCollectionInfo(400729);
         var _loc6_:SingleItemInfo = ItemManager.getCollectionInfo(400730);
         _numList.push(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
         checkNumBtn();
      }
      
      private static function checkNumBtn() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < _numList.length)
         {
            if(_numList[_loc1_])
            {
               (_numBtnList[_loc1_] as SimpleButton).mouseEnabled = true;
               (_numBtnList[_loc1_] as SimpleButton).filters = [];
               ToolTipManager.add(_numBtnList[_loc1_],"剩余数量:" + (_numList[_loc1_] as SingleItemInfo).itemNum);
            }
            else
            {
               (_numBtnList[_loc1_] as SimpleButton).filters = [ColorFilter.setGrayscale()];
               ToolTipManager.add(_numBtnList[_loc1_],"尚未获得");
            }
            _loc1_++;
         }
      }
      
      private static function closeHandler(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = null;
         DisplayUtil.removeForParent(_mainPanel,false);
         LevelManager.openMouseEvent();
         _closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _closeBtn = null;
         for each(_loc2_ in _numBtnList)
         {
            ToolTipManager.remove(_loc2_);
         }
         _numList.splice(0);
      }
      
      private static function onMapOpenHandler(param1:MapEvent) : void
      {
      }
      
      private static function onMapDestroyHandler(param1:MapEvent) : void
      {
         _monMode = null;
      }
      
      private static function checkShowPartMC(param1:MovieClip, param2:uint) : void
      {
         var _loc3_:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,param2));
         param1.buttonMode = true;
         param1.addEventListener(MouseEvent.CLICK,Delegate.create(onMousePartHandler,param2));
         if(!_loc3_ && checkState(1))
         {
            param1.mouseEnabled = true;
         }
         else
         {
            param1.visible = false;
            param1.mouseEnabled = false;
         }
      }
      
      private static function showAllPartMC() : void
      {
         _partMC_1.mouseEnabled = true;
         _partMC_1.visible = true;
         _partMC_2.mouseEnabled = true;
         _partMC_2.visible = true;
         _partMC_3.mouseEnabled = true;
         _partMC_3.visible = true;
      }
      
      private static function onMousePartHandler(param1:MouseEvent, param2:uint) : void
      {
         var mc:MovieClip = null;
         var e:MouseEvent = param1;
         var index:uint = param2;
         mc = e.currentTarget as MovieClip;
         if(mc)
         {
            BufferRecordManager.setState(MainManager.actorInfo,index,true,function():void
            {
               DisplayUtil.removeForParent(mc);
               ToolTipManager.remove(mc);
               var msg:String = "";
               if(index == 120)
               {
                  msg = "部件一被发现了！";
               }
               else if(index == 121)
               {
                  msg = "部件二被发现了！";
               }
               else
               {
                  msg = "部件三被发现了！";
               }
               SimpleAlarm.show(msg);
               checkCompletePart();
            });
         }
      }
      
      private static function checkCompletePart() : void
      {
         if(checkState(2))
         {
            BufferRecordManager.setState(MainManager.actorInfo,123,true,function():void
            {
               AnimateManager.playMcAnimate(_comMC,0,"",function():void
               {
                  _flyMac.visible = true;
                  NpcDialog.show(630,["哇哇哇！太好了，数字风筝....你终于把它修好了，太棒了！"],["哈哈！我就说我也许可以帮到你吧！"],[function():void
                  {
                     NpcDialog.show(630,["快快！放起来看看，我已经好久没有看数字风筝了！简直太兴奋了！"],["但是，问题是怎么放呢？这个风筝好像有玄机哦！"],[function():void
                     {
                        NpcDialog.show(630,["不用担心，我来告诉你吧！当时迪恩操作的时候我可看的一清二楚啊！不过就要看你的运气了！仔细听好哦！"],["恩，我已经等不及了，快说吧！"],[function():void
                        {
                           AnimateManager.playFullScreenAnimate(ClientConfig.getResPath("module/ext/movie/movie_2.swf"),function():void
                           {
                              NpcDialog.show(630,["怎么样！你明白了吧！数字风筝可不是谁都能放的哦！"],["原来是这样啊！我明白了！"],[function():void
                              {
                                 NpcDialog.show(630,["小个子你有所不知，在数字星球上所有的野生精灵体内都会有一个数字存在，只要你有毅力去收集这些数字，相信里面总有一个是扶来精灵所喜欢的！ "],["好的，我这就去！"],[function():void
                                 {
                                    OgreController.isShow = true;
                                 }]);
                              }]);
                           });
                        }]);
                     }]);
                  }]);
               });
            });
         }
      }
      
      private static function onMouseReset(param1:MouseEvent = null) : void
      {
         var e:MouseEvent = param1;
         BufferRecordManager.setState(MainManager.actorInfo,119,false,function():void
         {
            BufferRecordManager.setState(MainManager.actorInfo,120,false,function():void
            {
               BufferRecordManager.setState(MainManager.actorInfo,121,false,function():void
               {
                  BufferRecordManager.setState(MainManager.actorInfo,122,false,function():void
                  {
                     BufferRecordManager.setState(MainManager.actorInfo,123,false,function():void
                     {
                     });
                  });
               });
            });
         });
      }
      
      private static function onSystemTime(param1:SocketEvent) : void
      {
         if(!MapManager.currentMap)
         {
            return;
         }
         if(MapManager.currentMap.id != 481)
         {
            SocketConnection.removeCmdListener(CommandID.SYSTEM_TIME,onSystemTime);
            return;
         }
         var date:Date = (param1.data as SystemTimeInfo).date;
         var hour:int = date.hours;
         if(hour >= 18 && hour <= 20)
         {
            if(AC.isInActivityTime)
            {
               if(!isActive)
               {
                  startActive();
               }
            }
            else
            {
               clearActive();
            }
         }
         monWarning(date);
      }
      
      private static function monWarning(param1:Date) : void
      {
         if(_excalMark == null)
         {
            _excalMark = UIManager.getMovieClip("lib_excalmatory_mark");
            DisplayUtil.FillColor(_excalMark,16776960);
            _excalMark.y = 0;
            _excalMark.x = 15;
         }
         _petIdo.addChild(_excalMark);
      }
      
      private static function onMonClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(isActive)
         {
            if(!checkState(2) && checkState(1) && !checkState(3))
            {
               NpcDialog.show(630,["等等，一共是三个部件啦！你还没有全部找到！继续加油啊！我相信你一定可以的！ "],["我马上就会找到的！"],null);
            }
            else if(checkState(1) && checkState(2) && checkState(3))
            {
               NpcDialog.show(630,["小个子你有所不知，在数字星球上所有的野生精灵体内都会有一个数字存在，只要你有毅力去收集这些数字，相信里面总有一个是扶来精灵所喜欢的！"],["我马上就去"],null);
            }
            else if(checkState(1) && checkState(2) && !checkState(3))
            {
               NpcDialog.show(630,["加油！"],null,null);
            }
            else if(!checkState(1) && !checkState(2) && !checkState(3))
            {
               NpcDialog.show(630,["看天上飞的就是传说中的扶来。"],null,null);
            }
         }
         else
         {
            NpcDialog.show(630,[TIME_STR + "来这里转转吧！"],null,null);
         }
      }
      
      private static function onItemData(param1:ItemEvent) : void
      {
         var event:ItemEvent = param1;
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,onItemData);
         var arr:Array = ItemManager.getCollectionIDs();
         if(arr.indexOf(400726) == -1 && arr.indexOf(400727) == -1 && arr.indexOf(400728) == -1 && arr.indexOf(400729) == -1 && arr.indexOf(400730) == -1)
         {
            NpcDialog.show(668,["你还是先搞清楚数字风筝里的奥秘吧！如果你能发现我最喜欢哪个数字的话，我就会下来成为你最衷心的伙伴，怎么样！你愿意尝试一下吗？"],["赛尔无所不能，你就等着吧！"],null);
         }
         else
         {
            NpcDialog.show(668,["快用数字风筝试试看我最喜欢哪个数字吧！呵呵！"],["点击数字风筝装置，放飞风筝吧！"],null);
         }
      }
      
      private static function clearActive() : void
      {
         if(isActive)
         {
            isActive = false;
         }
      }
      
      private static function startActive() : void
      {
         isActive = true;
         _spriteMC.visible = true;
         _spriteMC.gotoAndPlay("start");
         _spriteMC.addEventListener(MouseEvent.CLICK,onMouseSprite);
         ToolBarController.showOrHideAllUser(false);
         if(!checkState(3))
         {
            OgreController.isShow = false;
         }
         if(checkState(2))
         {
            _flyMac.visible = true;
         }
      }
      
      private static function checkState(param1:uint) : Boolean
      {
         var result:Boolean = false;
         var b119:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,119));
         var b120:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,120));
         var b121:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,121));
         var b122:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,122));
         var b123:Boolean = Boolean(BufferRecordManager.getState(MainManager.actorInfo,123));
         switch(param1)
         {
            case 1:
               result = b119;
               break;
            case 2:
               result = b120 && b121 && b122;
               break;
            case 3:
               result = b123;
               break;
            default:
               throw new Error("检查buff状态参数传递错误！");
         }
         return result;
      }
      
      private static function fightWithBoss() : void
      {
         if(isActive)
         {
            FightDispatcher.addEventListener(PetFightEvent.CATCH_PET,onCatchPetHandler);
            FightDispatcher.addEventListener(PetFightEvent.ALARM_CLICK,onAlarmClickHandler);
            FightManager.fightWithBoss("扶来",0);
         }
      }
      
      private static function onCatchPetHandler(param1:PetFightEvent) : void
      {
         var e:PetFightEvent = param1;
         FightDispatcher.removeEventListener(PetFightEvent.ALARM_CLICK,onAlarmClickHandler);
         FightDispatcher.removeEventListener(PetFightEvent.CATCH_PET,onCatchPetHandler);
         _isCanfight = false;
         NpcDialog.show(668,["你的实力非同一般啊！看来我可是选对人了，主人，今后我们就是最好的伙伴了，让我们一起探索更多的星球吧！哟呵........"],["你真是个可爱的小东西，哈哈！我成功啦！"],null);
      }
      
      private static function onAlarmClickHandler(param1:PetFightEvent) : void
      {
         var e:PetFightEvent = param1;
         FightDispatcher.removeEventListener(PetFightEvent.ALARM_CLICK,onAlarmClickHandler);
         FightDispatcher.removeEventListener(PetFightEvent.CATCH_PET,onCatchPetHandler);
         _isCanfight = false;
         NpcDialog.show(668,["很遗憾哦！你抓不到我，还是先回去练练吧！到时记得来找我吧！"],["可恶，竟然输给这个小东西！下次它一定会知道我的实力！"],null);
      }
      
      private static function expendItem(param1:uint) : void
      {
         var buf:ByteArray = new ByteArray();
         buf.writeUnsignedInt(1);
         buf.writeUnsignedInt(param1);
         buf.writeUnsignedInt(1);
         SocketConnection.addCmdListener(CommandID.ITEM_EXPEND,onItemExpendHandler);
         SocketConnection.send(CommandID.ITEM_EXPEND,buf);
      }
      
      private static function onItemExpendHandler(param1:SocketEvent) : void
      {
         SimpleAlarm.show("数字" + _currentNum + "消耗掉一个");
      }
      
      private static function onMouseSprite(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(_isCanfight)
         {
            fightWithBoss();
            return;
         }
         if(checkState(1) && checkState(2) && checkState(3))
         {
            ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,onItemData);
            ItemManager.getCollection();
         }
         else if(!checkState(1))
         {
            NpcDialog.show(668,["啊！有人来了，快闪！"],["哇！那只会飞的东西是什么？"],[function():void
            {
               NpcDialog.show(630,["哎呀…你个大笨蛋，扶来快被你吓跑了，你要是晚点来该多好啊！"],["啊！我…我不知道啊！发生什么事情了"],[function():void
               {
                  NpcDialog.show(630,["扶来是我们这个数字星球最为稀有的精灵，难得能见它一面啊！"],["额..对不起，不过我很想知道是什么事情！也许我能帮到你哦！"],[function():void
                  {
                     NpcDialog.show(630,["告诉你吧！这些精灵特别喜欢数字，除了数字其他的一切对它们来说没有任何吸引力。我好不容易才等到它从天上下来，现在又失败了！"],["额..我不是故意的，不过我很想知道这些精灵的故事，你能告诉我吗？"],[function():void
                     {
                        NpcDialog.show(630,["这个么，告诉你也无妨，就不知道你有没有这个本事把它修好了！仔细听好吧！"],["恩，我会尽我所能的！"],[function():void
                        {
                           AnimateManager.playFullScreenAnimate(ClientConfig.getResPath("module/ext/movie/movie_1.swf"),function():void
                           {
                              NpcDialog.show(630,["自从我把这个数字风筝弄坏后，我就再也看不到以前在天空中翱翔的扶来！呜呜呜......"],["你别难过，数字风筝我一定可以想办法修好的。"],[function():void
                              {
                                 NpcDialog.show(630,["时间过了这么久，不知道数字风筝还能不能用，现在就连这些部件在什么地方都不知道了！"],["恩，放心吧！有我在一定会找到这些部件的！"],[function():void
                                 {
                                    NpcDialog.show(630,["真的吗？你真的愿意帮助我？太好了，我当时只知道机器爆炸后这些部件就被炸飞了？"],["我先到处看看吧！你就在这等我的好消息吧！"],[function():void
                                    {
                                       BufferRecordManager.setState(MainManager.actorInfo,119,true,function():void
                                       {
                                          showAllPartMC();
                                       });
                                    }]);
                                 }]);
                              }]);
                           },false);
                        }]);
                     }]);
                  }]);
               }]);
            }]);
         }
      }
   }
}

