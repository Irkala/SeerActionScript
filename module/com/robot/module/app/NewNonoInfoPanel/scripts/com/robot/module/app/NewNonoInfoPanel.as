package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.NonoInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.UserManager;
   import com.robot.core.mode.BasePeoleModel;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.machineDog.ChipInfoBgPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NewNonoInfoPanel extends Sprite implements IModule
   {
      
      private var _ps0Mc:MovieClip;
      
      private var _dragMc:Sprite;
      
      private var _iconMc:Sprite;
      
      private var _mc2Mc:MovieClip;
      
      private var _leftMc:Sprite;
      
      private var _nickBg:Sprite;
      
      private var _curSuperPage:uint = 0;
      
      private const _superPage:uint = 6;
      
      private var _ps3Mc:MovieClip;
      
      private var _mainPanel:NewNonoBaseInfoMc;
      
      private var _isSuperA:Array = [];
      
      private var _mc1Mc:MovieClip;
      
      private const _endId:uint = 700060;
      
      private var _pointA1:Array = new Array(70,96,122);
      
      private var _pointA2:Array = new Array(66,85,104,123);
      
      private var _pointA3:Array = new Array(158,186.5,215);
      
      private var _pointA4:Array = new Array(158,178,198,218);
      
      private const _page:uint = 7;
      
      private var _totalPage:uint;
      
      private var _ps2Mc:MovieClip;
      
      private var _superIconMc:Sprite;
      
      private var _info:NonoInfo;
      
      private var _isHaveA:Array = [];
      
      private var _rightMc:Sprite;
      
      private var _isA:Array = [];
      
      private var _mc0Mc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _curPage:uint = 0;
      
      private var _sucMc:Sprite;
      
      private var _changeMc:Sprite;
      
      private var _idA:Array = [700019,700018,700017,700016,700015,700014,700013,700012,700011,700010,700009,700008,700007,700006,700005,700004,700003,700002,700001];
      
      private var _ps1Mc:MovieClip;
      
      private var _nickTxt:TextField;
      
      private var _mc3Mc:MovieClip;
      
      private var _isSuperHaveA:Array = [];
      
      private const _startId:uint = 700001;
      
      private var _totalSuperPage:uint;
      
      private var _powerA:Array = [0,100,250,450,700,1300,1900,2600,3400,5000,5000];
      
      public function NewNonoInfoPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _mainPanel = null;
         _dragMc = null;
         _closeBtn = null;
         _changeMc = null;
         _sucMc = null;
         _nickTxt = null;
         _leftMc = null;
         _rightMc = null;
         _iconMc = null;
         _ps0Mc = null;
         _ps1Mc = null;
         _ps2Mc = null;
         _ps3Mc = null;
         _mc0Mc = null;
         _mc1Mc = null;
         _mc2Mc = null;
         _mc3Mc = null;
         _nickBg = null;
         _pointA1 = null;
         _pointA2 = null;
         _pointA3 = null;
         _pointA4 = null;
         _idA = null;
         _isHaveA = null;
         _info = null;
         _powerA = null;
      }
      
      private function onRightHandler(e:MouseEvent) : void
      {
         _rightMc.mouseEnabled = false;
         _rightMc.mouseChildren = false;
         var b1:Boolean = false;
         var b2:Boolean = false;
         if(_curPage < _totalPage)
         {
            ++_curPage;
            b1 = true;
         }
         if(_curSuperPage < _totalSuperPage)
         {
            ++_curSuperPage;
            b2 = true;
         }
         addIcon(b1,b2);
         _rightMc.mouseEnabled = true;
         _rightMc.mouseChildren = true;
      }
      
      private function onSucHandler(e:MouseEvent) : void
      {
         var by:ByteArray = null;
         if(_nickTxt.text != "")
         {
            SocketConnection.addCmdListener(CommandID.NONO_CHANGE_NAME,onChangeSuccessHandler);
            by = new ByteArray();
            by.writeUTFBytes(_nickTxt.text);
            by.length = 16;
            SocketConnection.send(CommandID.NONO_CHANGE_NAME,by);
         }
         else
         {
            Alarm.show("你还没有输入昵称呢！");
         }
      }
      
      public function init(data:Object = null) : void
      {
         _info = data.info as NonoInfo;
         if(_info.superNono)
         {
            _mainPanel["bgMc"].gotoAndStop(2);
            _mainPanel["faceMc"]["norMc"].visible = false;
            _mainPanel["faceMc"]["superMc"].visible = true;
         }
         else
         {
            _mainPanel["bgMc"].gotoAndStop(1);
            _mainPanel["faceMc"]["norMc"].visible = true;
            _mainPanel["faceMc"]["norMc"]["eyeMc"].gotoAndStop(makeNorNoFace());
            _mainPanel["faceMc"]["superMc"].visible = false;
         }
         if(data.point)
         {
            _mainPanel.x = data.point.x - _mainPanel.width;
            _mainPanel.y = data.point.y;
         }
         else
         {
            _mainPanel.x = (960 - _mainPanel.width) / 2;
            _mainPanel.y = (560 - _mainPanel.height) / 2;
         }
         SocketConnection.addCmdListener(CommandID.NONO_INFO,onInfoComHandler);
         SocketConnection.send(CommandID.NONO_INFO,_info.userID);
      }
      
      private function onChangeSuccessHandler(e:SocketEvent) : void
      {
         _nickBg.alpha = 0;
         _nickTxt.selectable = false;
         SocketConnection.removeCmdListener(CommandID.NONO_CHANGE_NAME,onChangeSuccessHandler);
         _changeMc.visible = true;
         _changeMc.addEventListener(MouseEvent.CLICK,onChangeHandler);
         _sucMc.visible = false;
         _nickTxt.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
      }
      
      private function onUpHandler(e:MouseEvent) : void
      {
         _mainPanel.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function setData() : void
      {
         var ainew:uint = 0;
         var superL:uint = 0;
         var model:BasePeoleModel = null;
         _nickTxt.text = _info.nick;
         _ps1Mc["txt"].text = _info.ai.toString();
         ToolTipManager.add(_changeMc,"修改昵称");
         if(_info.userID == MainManager.actorID)
         {
            _changeMc.visible = true;
            _ps2Mc["txt"].text = MainManager.actorInfo.nick;
         }
         else
         {
            model = UserManager.getUserModel(_info.userID);
            if(model)
            {
               _ps2Mc["txt"].text = model.info.nick;
            }
            else
            {
               _ps2Mc["txt"].text = _info.userID.toString();
            }
         }
         var date:Date = new Date(_info.birth);
         var year:String = "赛尔历" + (date.getFullYear() - 2009 + 39).toString() + "年";
         var month:String = (date.getMonth() + 1).toString() + "月";
         var day:String = date.getDate().toString() + "日";
         _ps3Mc["txt"].text = year + month + day;
         if(int(_info.power) > 100)
         {
            _mc2Mc["mc"]["mc"].scaleX = 1;
         }
         else
         {
            _mc2Mc["mc"]["mc"].scaleX = int(_info.power) / 100;
         }
         _mc2Mc["mc"]["txt"].selectable = false;
         _mc2Mc["mc"]["txt"].text = int(_info.power) + "/" + "100";
         if(int(_info.mate) > 100)
         {
            _mc3Mc["mc"]["mc"].scaleX = 1;
         }
         else
         {
            _mc3Mc["mc"]["mc"].scaleX = int(_info.mate) / 100;
         }
         _mc3Mc["mc"]["txt"].selectable = false;
         _mc3Mc["mc"]["txt"].text = int(_info.mate) + "/" + "100";
         if(_info.ai < 100)
         {
            ainew = _info.ai + 1;
         }
         else
         {
            ainew = uint(_info.ai);
         }
         var total:uint = 7 * ainew * ainew + 93 * ainew;
         if(_info.iq > total)
         {
            _mc1Mc["mc"]["mc"].scaleX = 1;
         }
         else
         {
            _mc1Mc["mc"]["mc"].scaleX = _info.iq / total;
         }
         _mc1Mc["mc"]["txt"].selectable = false;
         _mc1Mc["mc"]["txt"].text = String(_info.iq) + "/" + total.toString();
         if(_info.ai == 100)
         {
            ToolTipManager.add(_mc1Mc,"你的AI已经满级了哦");
         }
         else
         {
            ToolTipManager.add(_mc1Mc,"距离AI升级还需要" + (total - _info.iq).toString() + "点智慧值");
         }
         _ps0Mc.gotoAndStop(_info.superLevel);
         if(_info.superNono == true)
         {
            _ps0Mc.filters = [];
            ToolTipManager.add(_ps0Mc,_info.superLevel.toString() + "级超能NoNo");
            if(_info.superLevel < 10)
            {
               superL = uint(_info.superLevel);
            }
            else
            {
               superL = 10;
            }
            if(_info.superEnergy / _powerA[superL] < 1)
            {
               _mc0Mc["mc"]["mc"].scaleX = _info.superEnergy / _powerA[superL];
            }
            else
            {
               _mc0Mc["mc"]["mc"].scaleX = 1;
            }
            _mc0Mc["mc"]["txt"].text = _info.superEnergy.toString() + "/" + _powerA[superL];
            _mc0Mc["mc"]["txt"].selectable = false;
            _mainPanel["faceMc"]["superMc"]["bgMc"].gotoAndStop(_info.superStage);
            if(_info.mate <= 30)
            {
               _mainPanel["faceMc"]["superMc"]["eyeMc"].gotoAndStop(3);
            }
            else if(_info.mate <= 60)
            {
               _mainPanel["faceMc"]["superMc"]["eyeMc"].gotoAndStop(1);
            }
            else
            {
               _mainPanel["faceMc"]["superMc"]["eyeMc"].gotoAndStop(2);
            }
         }
         else
         {
            ToolTipManager.add(_ps0Mc,"曾经超能" + _info.superLevel.toString() + "级");
            _ps0Mc.filters = [ColorFilter.setGrayscale()];
         }
         makeTips(superL);
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainPanel);
      }
      
      private function makeTips(superL:uint) : void
      {
         var mStr:String = null;
         var eStr:String = null;
         if(_info.superNono == true)
         {
            _mc0Mc["mc"]["txt"].visible = true;
            if(_powerA[superL] == _info.superEnergy && _powerA[superL] == 5000 || _info.superEnergy > 5000)
            {
               ToolTipManager.add(_mc0Mc,"十级超能NoNo");
            }
            else
            {
               ToolTipManager.add(_mc0Mc,"距离升级还需要" + Math.ceil((_powerA[superL] - _info.superEnergy) / 5).toString() + "天超级能量");
            }
            _mc0Mc.filters = [];
            ToolTipManager.add(_mc2Mc,"能量满满哦！");
         }
         else
         {
            _mc0Mc["mc"]["txt"].text = "";
            _mc0Mc["mc"]["txt"].visible = false;
            ToolTipManager.add(_mc0Mc,"曾经的超级能量" + _info.superEnergy.toString());
            _mc0Mc.filters = [ColorFilter.setGrayscale()];
            if(_info.power <= 10)
            {
               eStr = "你的NoNo需要补充能量咯！";
            }
            if(_info.power >= 11 && _info.power <= 50)
            {
               eStr = "记得充电哦！";
            }
            if(_info.power >= 51 && _info.power <= 80)
            {
               eStr = "NoNo很开心，电力充足，能量满满！";
            }
            if(_info.power >= 81)
            {
               eStr = "只要能量充足，什么问题都难不倒NoNo！";
            }
            ToolTipManager.add(_mc2Mc,eStr);
         }
         if(_info.mate <= 30)
         {
            mStr = "要花更多时间跟你的NoNo交流哦！";
         }
         else if(_info.mate <= 60)
         {
            mStr = "保持最高的同步率才能百战百胜！";
         }
         else
         {
            mStr = "非常好哦，继续保持这样的默契！";
         }
         ToolTipManager.add(_mc3Mc,mStr);
      }
      
      private function removeEvent() : void
      {
         if(_info.superNono == true)
         {
            ToolTipManager.remove(_mc0Mc);
         }
         ToolTipManager.remove(_mc1Mc);
         ToolTipManager.remove(_mc2Mc);
         ToolTipManager.remove(_mc3Mc);
         ToolTipManager.remove(_superIconMc["nono"]);
         _dragMc.removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         ToolTipManager.remove(_closeBtn);
         ToolTipManager.remove(_changeMc);
         _changeMc.removeEventListener(MouseEvent.CLICK,onChangeHandler);
         _leftMc.removeEventListener(MouseEvent.CLICK,onLeftHandler);
         _rightMc.removeEventListener(MouseEvent.CLICK,onRightHandler);
         _sucMc.removeEventListener(MouseEvent.CLICK,onSucHandler);
         _nickTxt.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         SocketConnection.removeCmdListener(CommandID.NONO_CHANGE_NAME,onChangeSuccessHandler);
         SocketConnection.removeCmdListener(CommandID.NONO_INFO,onInfoComHandler);
      }
      
      private function addEvent() : void
      {
         if(_info.state[1])
         {
            _dragMc.buttonMode = true;
            _dragMc.addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         }
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         ToolTipManager.add(_closeBtn,"关闭");
         ToolTipManager.add(_superIconMc["nono"],"超能芯片");
         _changeMc.addEventListener(MouseEvent.CLICK,onChangeHandler);
         _leftMc.addEventListener(MouseEvent.CLICK,onLeftHandler);
         _rightMc.addEventListener(MouseEvent.CLICK,onRightHandler);
         _sucMc.addEventListener(MouseEvent.CLICK,onSucHandler);
      }
      
      public function setup() : void
      {
         _mainPanel = new NewNonoBaseInfoMc();
         _dragMc = _mainPanel["dragMc"];
         _closeBtn = _mainPanel["closeBtn"];
         _iconMc = _mainPanel["iconMc"];
         _superIconMc = _mainPanel["superIconMc"];
         _changeMc = _mainPanel["changeMc"];
         _changeMc.buttonMode = true;
         _sucMc = _mainPanel["sucMc"];
         _sucMc.buttonMode = true;
         _sucMc.visible = false;
         _leftMc = _mainPanel["leftMc"];
         _rightMc = _mainPanel["rightMc"];
         _nickTxt = _mainPanel["nickTxt"];
         _nickBg = _mainPanel["nickBgMc"];
         _ps0Mc = _mainPanel["sp0"];
         _ps1Mc = _mainPanel["sp1"];
         _ps2Mc = _mainPanel["sp2"];
         _ps3Mc = _mainPanel["sp3"];
         _mc0Mc = _mainPanel["mc0"];
         _mc1Mc = _mainPanel["mc1"];
         _mc2Mc = _mainPanel["mc2"];
         _mc3Mc = _mainPanel["mc3"];
      }
      
      private function onInfoComHandler(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.NONO_INFO,onInfoComHandler);
         _info = new NonoInfo(e.data as ByteArray);
         addBg();
         checkIshave();
         makePage();
         addIcon(true,true);
         setData();
         addEvent();
      }
      
      private function makePage() : void
      {
         _curPage = 1;
         _curSuperPage = 1;
         if(_isA.length <= _page)
         {
            _totalPage = 1;
         }
         else if(_isA.length % _page == 0)
         {
            _totalPage = uint(_isA.length / _page);
         }
         else
         {
            _totalPage = uint(_isA.length / _page) + 1;
         }
         if(_isSuperA.length <= _superPage)
         {
            _totalSuperPage = 1;
         }
         else if(_isSuperA.length % _superPage == 0)
         {
            _totalSuperPage = uint(_isSuperA.length / _superPage);
         }
         else
         {
            _totalSuperPage = uint(_isSuperA.length / _superPage) + 1;
         }
      }
      
      private function makeNorNoFace() : uint
      {
         var index:uint = 1;
         if(_info.mate <= 30)
         {
            if(_info.power <= 50)
            {
               index = 4;
            }
            if(_info.power > 50 && _info.power <= 80)
            {
               index = 3;
            }
            if(_info.power > 80)
            {
               index = 1;
            }
         }
         else if(_info.mate <= 60)
         {
            if(_info.power <= 10)
            {
               index = 4;
            }
            if(_info.power > 10 && _info.power <= 50)
            {
               index = 3;
            }
            if(_info.power > 50 && _info.power <= 80)
            {
               index = 1;
            }
            if(_info.power > 80)
            {
               index = 2;
            }
         }
         else
         {
            if(_info.power <= 10)
            {
               index = 3;
            }
            if(_info.power > 10 && _info.power <= 50)
            {
               index = 1;
            }
            if(_info.power > 50)
            {
               index = 2;
            }
         }
         return index;
      }
      
      private function removeAllIcon() : void
      {
         var icon:ChipInfoBgPanel = null;
         var icon1:ChipInfoBgPanel = null;
         for(var i1:int = 0; i1 < _page; i1++)
         {
            icon = _iconMc.getChildByName("icon" + i1) as ChipInfoBgPanel;
            icon.destroy();
            DisplayUtil.removeForParent(icon);
            icon = null;
            if(i1 < _superPage)
            {
               icon1 = _iconMc.getChildByName("sicon" + i1) as ChipInfoBgPanel;
               icon1.destroy();
               DisplayUtil.removeForParent(icon1);
               icon1 = null;
            }
         }
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function checkIshave() : void
      {
         for(var i1:uint = 0; i1 < _idA.length; i1++)
         {
            if(ItemXMLInfo.getVipOnly(_idA[i1]))
            {
               _isSuperA.push(_idA[i1]);
               if(_info.superNono)
               {
                  _isSuperHaveA.push(_info.func[_idA[i1] - 700001]);
               }
               else
               {
                  _isSuperHaveA.push(false);
               }
            }
            else
            {
               _isA.push(_idA[i1]);
               _isHaveA.push(_info.func[_idA[i1] - 700001]);
            }
         }
      }
      
      private function addIcon(b1:Boolean, b2:Boolean) : void
      {
         var idA:Array = null;
         var isHaveA:Array = null;
         var sIdA:Array = null;
         var isSuperHaveA:Array = null;
         var icon:ChipInfoBgPanel = null;
         var suIcon:ChipInfoBgPanel = null;
         if(b1)
         {
            idA = _isA.slice((_curPage - 1) * _page,_curPage * _page);
            isHaveA = _isHaveA.slice((_curPage - 1) * _page,_curPage * _page);
         }
         if(b2)
         {
            sIdA = _isSuperA.slice((_curSuperPage - 1) * _superPage,_curSuperPage * _superPage);
            isSuperHaveA = _isSuperHaveA.slice((_curSuperPage - 1) * _superPage,_curSuperPage * _superPage);
         }
         for(var i1:int = 0; i1 < _page; i1++)
         {
            icon = _iconMc.getChildByName("icon" + i1) as ChipInfoBgPanel;
            suIcon = _superIconMc.getChildByName("sicon" + i1) as ChipInfoBgPanel;
            if(b1)
            {
               if(idA[i1] != undefined)
               {
                  icon.addIcon(idA[i1],isHaveA[i1]);
               }
               else
               {
                  icon.removeIcon();
               }
            }
            if(b2)
            {
               if(i1 < _superPage)
               {
                  if(sIdA[i1] != undefined)
                  {
                     suIcon.addIcon(sIdA[i1],isSuperHaveA[i1]);
                  }
                  else
                  {
                     suIcon.removeIcon();
                  }
               }
            }
         }
      }
      
      private function onKeyDown(e:KeyboardEvent) : void
      {
         if(e.keyCode == Keyboard.ENTER)
         {
            onSucHandler(null);
         }
      }
      
      private function addBg() : void
      {
         var icon:ChipInfoBgPanel = null;
         var superIcon:ChipInfoBgPanel = null;
         for(var i1:int = 0; i1 < _page; i1++)
         {
            icon = new ChipInfoBgPanel(uint(_info.superNono));
            _iconMc.addChild(icon);
            icon.x = (icon.width + 2.6) * i1;
            icon.name = "icon" + i1;
            if(i1 < _superPage)
            {
               superIcon = new ChipInfoBgPanel(uint(_info.superNono));
               _superIconMc.addChild(superIcon);
               superIcon.x = (superIcon.width + 2.6) * i1;
               superIcon.name = "sicon" + i1;
            }
         }
      }
      
      private function onChangeHandler(e:MouseEvent) : void
      {
         _nickBg.alpha = 0.3;
         _nickTxt.selectable = true;
         _changeMc.visible = false;
         _sucMc.visible = true;
         LevelManager.stage.focus = _nickTxt;
         if(_info.userID != MainManager.actorID)
         {
            _sucMc.visible = false;
         }
         else
         {
            _nickTxt.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         }
      }
      
      private function onLeftHandler(e:MouseEvent) : void
      {
         _leftMc.mouseEnabled = false;
         _leftMc.mouseChildren = false;
         var b1:Boolean = false;
         var b2:Boolean = false;
         if(_curPage > 1)
         {
            --_curPage;
            b1 = true;
         }
         if(this._curSuperPage > 1)
         {
            --_curSuperPage;
            b2 = true;
         }
         addIcon(b1,b2);
         _leftMc.mouseEnabled = true;
         _leftMc.mouseChildren = true;
      }
      
      private function onDownHandler(e:MouseEvent) : void
      {
         _mainPanel.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainPanel);
      }
   }
}

