package starGame.game
{
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.ui.Mouse;
   import flash.utils.Timer;
   import gs.TweenLite;
   
   public class Game extends MovieClip
   {
      
      private var _stage:Stage;
      
      private var _jianDao:MovieClip;
      
      private var isJianB:Boolean;
      
      private var _gRongqi_mc:MovieClip;
      
      private var _greenLine:Sprite;
      
      private var _jianDao_s:Sound;
      
      public var _isSoundB:Boolean;
      
      private var _ttime:Timer;
      
      private var _txtGame:MovieClip;
      
      private var _bar:MovieClip;
      
      private var drawLine:DrawLine;
      
      private var _stopIn_s:Sound;
      
      private var _btnRongqi_line:MovieClip;
      
      private var _starMap:MovieClip;
      
      private var isDrawB:Boolean;
      
      private var inButtonB:Boolean;
      
      private var _getGline:Shape;
      
      private var _level:int;
      
      private var _mask_mc:MovieClip;
      
      private var line_arr:Array;
      
      private var _closeBtn:MovieClip;
      
      private var _tempString:String = "";
      
      private var _timeInt:int = 3;
      
      private var _time:Timer;
      
      private var nnn:int = 0;
      
      private var isSendB:Boolean;
      
      private var _lineMc:SimpleButton;
      
      private var _levelArray:Array;
      
      private var _backUI:MovieClip;
      
      private var _gameSucc_s:Sound;
      
      private var fSimp:SimpleButton;
      
      public function Game(l:int, arr:Array, s:Stage, gsucc:Sound, si:Sound, jiand:Sound)
      {
         super();
         _stage = s;
         _level = l;
         _levelArray = arr;
         _gameSucc_s = gsucc;
         _stopIn_s = si;
         _jianDao_s = jiand;
         initGame();
      }
      
      private function delString(spr:Sprite) : void
      {
         var nstr:String = spr.name;
         var j:int = line_arr.indexOf(nstr);
         if(j >= 0)
         {
            line_arr.splice(j,1);
         }
      }
      
      private function mouseUpHandler(e:MouseEvent) : void
      {
         if(isJianB)
         {
            _jianDao.gotoAndStop(1);
         }
      }
      
      private function getString(m1:SimpleButton, m2:SimpleButton) : String
      {
         var i1:int = 0;
         var i2:int = 0;
         var str:String = null;
         var s1:String = m1.name;
         var s2:String = m2.name;
         var l1:int = s1.length;
         var l2:int = s2.length;
         s1 = s1.slice(1,l1);
         s2 = s2.slice(1,l2);
         i1 = int(s1);
         i2 = int(s2);
         if(s1.length == 1)
         {
            s1 = "0" + s1;
         }
         if(s2.length == 1)
         {
            s2 = "0" + s2;
         }
         if(i1 > i2)
         {
            str = s2 + s1;
         }
         else
         {
            str = s1 + s2;
         }
         return str;
      }
      
      private function showGreenLine() : void
      {
         var temp1:SimpleButton = null;
         var temp2:SimpleButton = null;
         _greenLine = new Sprite();
         for(var i:int = 0; i < _levelArray[5].length; i++)
         {
            temp1 = getM1(_levelArray[5][i]);
            temp2 = getM2(_levelArray[5][i]);
            _greenLine.addChild(drawLine.mcTomc(temp1,temp2,DrawLine.linecolor2,1));
         }
         _gRongqi_mc.addChild(_greenLine);
      }
      
      public function removeTimer() : void
      {
         if(_time)
         {
            _time.removeEventListener(TimerEvent.TIMER_COMPLETE,compTime);
            _time.removeEventListener(TimerEvent.TIMER_COMPLETE,compTime1);
         }
      }
      
      private function initGame() : void
      {
         nnn = 0;
         isSendB = false;
         isJianB = false;
         inButtonB = false;
         line_arr = new Array();
         isDrawB = false;
         drawLine = new DrawLine();
         _backUI = new BackUI_StarGame();
         addChild(_backUI);
         _mask_mc = new MaskMcUI_StarGame();
         _mask_mc.mask_btn.useHandCursor = false;
         _mask_mc.visible = false;
         var str:String = _levelArray[0];
         _jianDao = new ForfexUI_StarGame();
         _jianDao.visible = false;
         _bar = new BarM(_level,str,_mask_mc,_jianDao,this);
         _bar.x = -84;
         _bar.y = 466;
         addChild(_bar);
         _starMap = new StarMapUI_StarGame();
         _starMap.x = 485;
         _starMap.y = 255;
         var le:int = int(_levelArray[7]);
         _starMap.gotoAndStop(le);
         addChild(_starMap);
         _getGline = drawLine.getGline();
         _starMap.addChild(_getGline);
         addChild(_mask_mc);
         _jianDao.gotoAndStop(1);
         addChild(_jianDao);
         _gRongqi_mc = new MovieClip();
         _gRongqi_mc.alpha = 0;
         _starMap.addChild(_gRongqi_mc);
         _btnRongqi_line = _starMap.btnRongqi_line;
         _btnRongqi_line.alpha = 0;
         _closeBtn = new CloseUI_StarGame();
         _closeBtn.x = 900;
         _closeBtn.y = 12;
         addChild(_closeBtn);
         _closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         _time = new Timer(1000,4);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,compTime);
         this.addEventListener(Event.ENTER_FRAME,enterFrameThis);
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         removeAdd();
         _closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         this.dispatchEvent(new Event("closehandler"));
      }
      
      private function compTime1(e:TimerEvent) : void
      {
         _gRongqi_mc.visible = false;
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,compTime1);
         _time = null;
         _bar.startTime();
         addListenerBar();
         randomStar();
         if(_level > 4)
         {
            rongqiStar(false);
         }
         _bar.addEventS();
      }
      
      private function getMcArr(str:String) : Array
      {
         var i1:int = int(str.slice(0,2));
         var i2:int = int(str.slice(2,4));
         trace("11:" + "a" + i1 + "   22:" + "a" + i2);
         var temp1:SimpleButton = _starMap.getChildByName("a" + i1) as SimpleButton;
         var temp2:SimpleButton = _starMap.getChildByName("a" + i2) as SimpleButton;
         trace(temp1 + temp2);
         return new Array(temp1,temp2);
      }
      
      public function removeThis() : void
      {
         removeStageLis();
         if(_mask_mc)
         {
            removeChild(_mask_mc);
            _mask_mc = null;
         }
         if(_closeBtn)
         {
            removeChild(_closeBtn);
            _closeBtn = null;
         }
         for(var i:int = 0; i < _btnRongqi_line.numChildren; i++)
         {
            _btnRongqi_line.removeChildAt(i);
         }
         _btnRongqi_line = null;
         if(_backUI)
         {
            removeChild(_backUI);
            _backUI = null;
         }
         if(_bar)
         {
            _bar.removeEventListener("showjiandao",showJianDao);
            _bar.removeEventListener("againgame",againGame);
            _bar.removeEventListener("timeisover",timeIsOver);
            _bar.removeThis();
            removeChild(_bar);
            _bar = null;
         }
         if(_starMap)
         {
            _getGline = null;
            removeChild(_starMap);
            _starMap = null;
         }
      }
      
      private function timeIsOver(e:Event) : void
      {
         removeAdd();
         removeStageLis();
         this.dispatchEvent(new Event("gamefalse"));
      }
      
      private function isWin() : Boolean
      {
         var j:int = 0;
         trace("ff:" + _levelArray[5]);
         var arr:Array = _levelArray[5];
         var k:int = int(arr.length);
         if(k != line_arr.length)
         {
            return false;
         }
         trace("line_arr:" + line_arr);
         for(var i:int = 0; i < k; i++)
         {
            j = line_arr.indexOf(arr[i]);
            if(j < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function outMouseHandler(e:MouseEvent) : void
      {
         var str1:String = String(e.target.name);
         var str:String = str1.charAt(0);
         if(str == "a")
         {
            _tempString = "";
         }
      }
      
      private function winCompLete(e:TimerEvent) : void
      {
         if(_isSoundB)
         {
            _gameSucc_s.play(0,1);
         }
         _gRongqi_mc.visible = true;
         TweenLite.to(_gRongqi_mc,1,{"alpha":1});
         TweenLite.to(_starMap.pic,1,{"alpha":1});
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,winCompLete);
         _time = null;
         _time = new Timer(1000,3);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,winCompLete1);
      }
      
      private function mouseMoveHandler(e:Event) : void
      {
         var str1:String = String(e.target.name);
         var str:String = str1.charAt(0);
         if(str == "a" && str1 != _tempString)
         {
            _tempString = str1;
            _stopIn_s.play(0,1);
         }
         if(isDrawB)
         {
            if(fSimp)
            {
               if(str == "a")
               {
                  inButtonB = true;
                  drawLine.mcTop(fSimp,e.target.x,e.target.y);
               }
               else
               {
                  inButtonB = false;
               }
            }
         }
      }
      
      private function othern() : void
      {
         var temp:SimpleButton = null;
         for(var i:int = 0; i < 10; i++)
         {
            temp = _starMap.getChildByName("a9" + i) as SimpleButton;
            if(!temp)
            {
               return;
            }
            TweenLite.to(temp,1,{"alpha":0});
         }
      }
      
      private function getM1(s:String) : SimpleButton
      {
         var j:int = int(s.slice(0,2));
         return _starMap["a" + j] as SimpleButton;
      }
      
      private function sprDownHandler(e:MouseEvent) : void
      {
         var sp:Sprite = null;
         var str:String = null;
         var spr:Sprite = null;
         if(isJianB)
         {
            if(_isSoundB)
            {
               _jianDao_s.play(0,1);
            }
            sp = e.target as Sprite;
            str = String(sp.name).slice(0,4);
            spr = _starMap.rongqi_mc.getChildByName(str) as Sprite;
            sp.removeEventListener(MouseEvent.MOUSE_OVER,sprOverHandler);
            sp.removeEventListener(MouseEvent.MOUSE_DOWN,sprDownHandler);
            sp.removeEventListener(MouseEvent.MOUSE_OUT,sprOutHandler);
            sp.graphics.clear();
            spr.graphics.clear();
            delString(spr);
            _btnRongqi_line.removeChild(sp);
            _starMap.rongqi_mc.removeChild(spr);
            sp = null;
            spr = null;
            _jianDao.gotoAndStop(3);
            if(isWin())
            {
               isSendB = true;
               gameWin();
            }
         }
      }
      
      private function mouseDownHandler(e:MouseEvent) : void
      {
         var str1:String = null;
         var lint:int = 0;
         var spr:Sprite = null;
         var spr1:Sprite = null;
         var tempM:* = e.target;
         var str:String = String(tempM.name).charAt(0);
         if(str == "a")
         {
            isJianB = false;
            _jianDao.visible = false;
            Mouse.show();
            if(tempM != _lineMc)
            {
               if(_lineMc)
               {
                  str1 = getString(tempM,_lineMc);
                  lint = line_arr.indexOf(str1);
                  if(lint < 0)
                  {
                     drawLine.glineClear();
                     spr = drawLine.mcTomc(tempM,_lineMc,DrawLine.linecolor,1);
                     _starMap.rongqi_mc.addChild(spr);
                     spr1 = drawLine.mcTomc(tempM,_lineMc,DrawLine.linecolor,10);
                     spr1.alpha = 0;
                     _btnRongqi_line.addChild(spr1);
                     spr1.name = str1 + "j";
                     spr.name = str1;
                     spr1.addEventListener(MouseEvent.MOUSE_OVER,sprOverHandler);
                     spr1.addEventListener(MouseEvent.MOUSE_OUT,sprOutHandler);
                     spr1.addEventListener(MouseEvent.MOUSE_DOWN,sprDownHandler);
                     line_arr.push(str1);
                     _lineMc = null;
                     isDrawB = false;
                     if(isWin())
                     {
                        isSendB = true;
                        gameWin();
                     }
                  }
               }
               else
               {
                  fSimp = tempM;
                  isDrawB = true;
                  _lineMc = tempM;
               }
            }
         }
         else
         {
            isDrawB = false;
            drawLine.glineClear();
            _lineMc = null;
            if(isJianB && str != "0" && str != "1")
            {
               isJianB = false;
               _jianDao.visible = false;
               Mouse.show();
            }
         }
      }
      
      public function addListenerBar() : void
      {
         _stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         _stage.addEventListener(MouseEvent.MOUSE_OUT,outMouseHandler);
         _stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         _stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         _stage.addEventListener(Event.ENTER_FRAME,eventFrameHandler);
         _stage.addEventListener(MouseEvent.MOUSE_OVER,overMouseHandler);
         _bar.addEventListener("showjiandao",showJianDao);
         _bar.addEventListener("againgame",againGame);
         _bar.addEventListener("timeisover",timeIsOver);
      }
      
      private function getM2(s:String) : SimpleButton
      {
         var j:int = int(s.slice(2,4));
         return _starMap["a" + j] as SimpleButton;
      }
      
      private function againGame(e:Event) : void
      {
         isSendB = false;
         gameWin();
      }
      
      private function winCompLete1(e:TimerEvent) : void
      {
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,winCompLete1);
         _time = null;
         Mouse.show();
         if(isSendB)
         {
            this.dispatchEvent(new Event("gamewin"));
         }
         else
         {
            this.dispatchEvent(new Event("againgame"));
         }
      }
      
      public function removeAdd() : void
      {
         trace("removeListener");
         _bar.removeAdd();
      }
      
      public function removeStageLis() : void
      {
         _stage.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         _stage.removeEventListener(Event.ENTER_FRAME,eventFrameHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_OVER,overMouseHandler);
      }
      
      private function rongqiDx() : void
      {
         var temp:SimpleButton = null;
         var n:int = int(_levelArray[2]);
         for(var i:int = 1; i <= n; i++)
         {
            temp = _starMap["a" + i];
            temp.width = 27;
            temp.height = 27;
         }
      }
      
      private function compTime(e:TimerEvent) : void
      {
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,compTime);
         _time = null;
         greenAlphaL();
         if(_level > 4)
         {
            rongqiStar(true);
         }
         _time = new Timer(1000,1);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,compTime1);
      }
      
      private function showJianDao(e:Event) : void
      {
         isJianB = true;
         Mouse.hide();
      }
      
      private function isPoint(mx:Number, my:Number) : Boolean
      {
         var dn:Number = NaN;
         var temp:SimpleButton = null;
         var j:int = _levelArray[2] - 1;
         for(var i:int = 1; i <= j; i++)
         {
            temp = _starMap["a" + i];
            dn = (temp.x - mx) * (temp.x - mx) + (temp.y - my) * (temp.y - my);
            trace("dn:" + dn);
            if(dn < 2500)
            {
               return false;
            }
         }
         return true;
      }
      
      private function greenAlphaL() : void
      {
         TweenLite.to(_gRongqi_mc,1,{"alpha":0});
      }
      
      private function addTextStart() : void
      {
         _txtGame = new TextGame_StarGame();
         _txtGame.x = 460;
         _txtGame.y = 250;
         addChild(_txtGame);
         _ttime = new Timer(1000,5);
         _ttime.start();
         _ttime.addEventListener(TimerEvent.TIMER,timeEventHandler);
      }
      
      private function greenAlphaA() : void
      {
         _gRongqi_mc.visible = true;
         TweenLite.to(_gRongqi_mc,1,{"alpha":1});
      }
      
      private function gameWin() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _bar.removeAdd();
         TweenLite.to(_starMap.rongqi_mc,1,{"alpha":0});
         othern();
         _time = new Timer(1000,1);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,winCompLete);
      }
      
      public function soundChange() : void
      {
         _isSoundB = !_isSoundB;
         this.dispatchEvent(new Event("changesound"));
      }
      
      private function sprOutHandler(e:MouseEvent) : void
      {
         var sp:Sprite = null;
         var str:String = null;
         var arr:Array = null;
         var spr:Sprite = null;
         if(isJianB)
         {
            sp = e.target as Sprite;
            str = String(sp.name).slice(0,4);
            arr = getMcArr(str);
            spr = _starMap.rongqi_mc.getChildByName(str) as Sprite;
            drawLine.changeToRed(spr,arr[0],arr[1],DrawLine.linecolor,1);
         }
      }
      
      private function pointB(vx:Number, vy:Number) : void
      {
         trace("vx:" + vx + "    vy:" + vy);
         var sprt:SimpleButton = new XingxUI_StarGame();
         sprt.x = vx;
         sprt.y = vy;
         sprt.name = "a9" + nnn;
         sprt.width = 27;
         sprt.height = 27;
         sprt.alpha = 0;
         if(sprt.y < -235)
         {
            sprt.y = -235;
         }
         if(sprt.y > 203)
         {
            sprt.y = 203;
         }
         if(sprt.x < -420)
         {
            sprt.x = -420;
         }
         else if(sprt.x > 437)
         {
            sprt.x = 437;
         }
         _starMap.addChild(sprt);
         TweenLite.to(sprt,1,{"alpha":1});
      }
      
      private function enterFrameThis(e:Event) : void
      {
         if(this)
         {
            if(this.x == 0)
            {
               showGreenLine();
               greenAlphaA();
               _starMap.pic.alpha = 0;
               rongqiDx();
               if(_level == 0)
               {
                  trace("leve");
                  addTextStart();
               }
               this.removeEventListener(Event.ENTER_FRAME,enterFrameThis);
            }
         }
      }
      
      private function randomStar() : void
      {
         var n:int = int(_levelArray[6]);
         njjj1(n);
      }
      
      private function njjj1(n:int) : void
      {
         if(nnn < n)
         {
            njjj(n);
         }
      }
      
      private function timeEventHandler(e:TimerEvent) : void
      {
         _txtGame.start_txt.text = "游戏开始" + "\n" + String(_timeInt);
         if(_timeInt < 0)
         {
            trace("remvoe txt");
            removeChild(_txtGame);
            _txtGame = null;
            _ttime.stop();
            _ttime.removeEventListener(TimerEvent.TIMER,timeEventHandler);
            _ttime = null;
         }
         --_timeInt;
      }
      
      private function rongqiStar(b:Boolean) : void
      {
         var temp:SimpleButton = null;
         var n:int = int(_levelArray[2]);
         for(var i:int = 1; i <= n; i++)
         {
            temp = _starMap["a" + i];
            if(b)
            {
               TweenLite.to(temp,1,{"alpha":0});
            }
            else
            {
               TweenLite.to(temp,1,{"alpha":1});
            }
         }
      }
      
      private function eventFrameHandler(e:Event) : void
      {
         if(isJianB)
         {
            _jianDao.x = mouseX;
            _jianDao.y = mouseY;
         }
         if(isDrawB)
         {
            if(fSimp)
            {
               if(!inButtonB)
               {
                  drawLine.mcTop(fSimp,_starMap.mouseX - 2,_starMap.mouseY - 2);
               }
            }
         }
      }
      
      private function overMouseHandler(e:MouseEvent) : void
      {
         var str:String = String(e.target.name).charAt(0);
         if(str == "a")
         {
            if(_isSoundB)
            {
               _stopIn_s.play(0,1);
            }
         }
      }
      
      private function sprOverHandler(e:MouseEvent) : void
      {
         var sp:Sprite = null;
         var str:String = null;
         var arr:Array = null;
         var spr:Sprite = null;
         if(isJianB)
         {
            sp = e.target as Sprite;
            str = String(sp.name).slice(0,4);
            trace("..:" + str);
            arr = getMcArr(str);
            trace("sn:" + sp.name);
            trace(arr[0]);
            spr = _starMap.rongqi_mc.getChildByName(str) as Sprite;
            trace("pp:" + spr.name);
            drawLine.changeToRed(spr,arr[0],arr[1],DrawLine.linecolor1,1);
         }
      }
      
      private function njjj(n:int) : void
      {
         var vx:Number = NaN;
         var vy:Number = NaN;
         vx = Math.random() * 400 - 200;
         vy = Math.random() * 400 - 200;
         trace(isPoint(vx,vy));
         if(!isPoint(vx,vy))
         {
            njjj1(n);
            return;
         }
         pointB(vx,vy);
         ++nnn;
         njjj1(n);
      }
   }
}

