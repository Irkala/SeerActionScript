package src.com
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class Game extends Sprite
   {
      
      public static const GAME_WIN:String = "game_win";
      
      public static const GAME_LOST:String = "game_lost";
      
      public static const GAME_CLOSE:String = "game_close";
      
      private var timeint:int = 60;
      
      private var bili:Number;
      
      private var houPao_mc:MovieClip;
      
      private var _timer:Timer;
      
      private var _gameB:Boolean = false;
      
      private var help_mc:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      private var pao_mc:MovieClip;
      
      private var mpao:MovieClip;
      
      private var _paoW:int;
      
      private var _pao:PaoPao;
      
      private var _str:String;
      
      private var back_mc:MovieClip;
      
      private var up_mc:MovieClip;
      
      private var time_txt:TextField;
      
      public function Game(str:String)
      {
         super();
         _str = str;
         initGame();
      }
      
      public function destroy() : void
      {
         _pao.destroy();
         _pao.removeEventListener("pengqiang",pengQiangHandler);
         _timer.removeEventListener(TimerEvent.TIMER,timeHander);
         _timer.removeEventListener(TimerEvent.TIMER_COMPLETE,completeHandler);
         _timer.stop();
         _timer = null;
         removeChild(houPao_mc);
         houPao_mc = null;
         removeChild(back_mc);
         back_mc = null;
         back_mc = null;
         pao_mc = null;
         _pao = null;
         mpao = null;
         removeChild(up_mc);
         up_mc = null;
      }
      
      private function timeHander(e:TimerEvent) : void
      {
         var temp:BasePao = null;
         --timeint;
         if(timeint < 0)
         {
            time_txt.text = "0" + timeint.toString();
         }
         else
         {
            time_txt.text = timeint.toString();
         }
         if(!_paoW)
         {
            _paoW = _pao.width;
         }
         var ran:int = int(int(Math.random() * 2));
         var temp1:BasePao = new HouPao();
         houPao_mc.addChild(temp1);
         if(ran == 1)
         {
            temp = new RedPao();
         }
         else
         {
            temp = new BluePao();
         }
         pao_mc.addChild(temp);
      }
      
      private function isOver() : void
      {
         bili = _pao.paoW / _paoW;
         if(bili < 0.8)
         {
            dispatchEvent(new Event(GAME_LOST));
         }
         else if(bili >= 3)
         {
            dispatchEvent(new Event(GAME_WIN));
         }
      }
      
      private function completeHandler(e:TimerEvent) : void
      {
         bili = _pao.paoW / _paoW;
         dispatchEvent(new Event(GAME_WIN));
      }
      
      private function initGame() : void
      {
         var ok_btn:SimpleButton = null;
         var clickHandler:Function = null;
         clickHandler = function(e:MouseEvent):void
         {
            ok_btn.removeEventListener(MouseEvent.CLICK,clickHandler);
            ok_btn = null;
            removeChild(help_mc);
            _pao.init();
            _gameB = true;
            _timer.start();
            _timer.addEventListener(TimerEvent.TIMER,timeHander);
            _timer.addEventListener(TimerEvent.TIMER_COMPLETE,completeHandler);
            _close_btn.addEventListener(MouseEvent.CLICK,closeHandler);
            time_txt.text = timeint.toString();
         };
         back_mc = new BackBoard();
         addChild(back_mc);
         houPao_mc = new MovieClip();
         addChild(houPao_mc);
         pao_mc = new MovieClip();
         addChild(pao_mc);
         _pao = new PaoPao(_str);
         addChild(_pao);
         _pao.addEventListener("pengqiang",pengQiangHandler);
         up_mc = new UpBackMc();
         addChild(up_mc);
         time_txt = up_mc["time_txt"];
         _close_btn = up_mc["close_btn"];
         time_txt.text = "00";
         help_mc = new Help_mc();
         addChild(help_mc);
         _timer = new Timer(1000,59);
         ok_btn = help_mc["ok_btn"];
         ok_btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
      
      private function pengQiangHandler(e:Event) : void
      {
         isOver();
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         _close_btn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _close_btn = null;
         dispatchEvent(new Event(GAME_CLOSE));
      }
      
      public function enterFrame() : void
      {
         var j:int = 0;
         var tempm:BasePao = null;
         var i:int = 0;
         var temp:BasePao = null;
         var din:int = 0;
         var w:int = 0;
         var p:int = 0;
         if(!_gameB)
         {
            return;
         }
         _pao.enterFrame();
         if(!pao_mc)
         {
            return;
         }
         if(_pao._pao.currentFrame == 3)
         {
            if(_pao._pao["pao"])
            {
               if(_pao._pao["pao"].currentFrame == 13)
               {
                  dispatchEvent(new Event(GAME_LOST));
               }
            }
            return;
         }
         var m:int = houPao_mc.numChildren;
         if(m > 0)
         {
            for(j = 0; j < m; j++)
            {
               tempm = houPao_mc.getChildAt(j) as BasePao;
               tempm.enterFrame();
            }
         }
         var n:int = pao_mc.numChildren;
         if(n > 0)
         {
            for(i = 0; i < n; i++)
            {
               temp = pao_mc.getChildAt(i) as BasePao;
               temp.enterFrame();
               din = int((temp._pao.x - _pao._pao.x) * (temp._pao.x - _pao._pao.x) + (temp._pao.y - _pao._pao.y) * (temp._pao.y - _pao._pao.y));
               w = temp._pao.width / 2 + _pao._pao.width / 2;
               p = w * w;
               if(temp._pao.y < -50)
               {
                  temp.destroy();
                  pao_mc.removeChild(temp);
                  return;
               }
               if(din < p)
               {
                  if(temp._cB)
                  {
                     _pao._pao.scaleX *= 1.05;
                     _pao._pao.scaleY *= 1.05;
                     isOver();
                  }
                  else
                  {
                     bili = _pao.paoW / _paoW;
                     _pao._pao.gotoAndStop(3);
                  }
                  temp.destroy();
                  if(Boolean(temp) && Boolean(pao_mc))
                  {
                     pao_mc.removeChild(temp);
                  }
                  return;
               }
            }
         }
      }
      
      public function get biNum() : Number
      {
         return bili;
      }
   }
}

