package com.robot.module.game.kickBall.mc
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import org.taomee.utils.Delegate;
   
   public class Game extends Sprite
   {
      
      private var _clickT_text:TextField;
      
      private var _du_mc:MovieClip;
      
      private var _disx:int;
      
      private const qiuH:uint = 444;
      
      private var _disy:int;
      
      private var _y_mc:MovieClip;
      
      private var _tar_txt:TextField;
      
      private var mPoint:Point;
      
      private var _out_btn:SimpleButton;
      
      private var _cur_txt:TextField;
      
      private var _jt_mc:MovieClip;
      
      private var _bestClick_txt:TextField;
      
      private var _click_txt:TextField;
      
      private var _back:MovieClip;
      
      private var nn:int = 0;
      
      private var _dis:uint;
      
      private const sjH:uint = 201;
      
      private var _nono_txt:TextField;
      
      private var best_n:int = -10273;
      
      private var _bW:uint;
      
      private var bPoint:Point;
      
      private var _ball:Ball;
      
      private var _now_click:uint = 0;
      
      private var _hui_n:uint = 0;
      
      private var _nono_mc:MovieClip;
      
      private var _best_txt:TextField;
      
      private var _sj_mc:MovieClip;
      
      public function Game()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         _back = new KickBallGameUI_base();
         _nono_mc = _back["nono_mc"];
         _nono_txt = _back["nono_txt"];
         _cur_txt = _back["cur_txt"];
         _tar_txt = _back["tar_txt"];
         _best_txt = _back["best_txt"];
         _click_txt = _back["click_txt"];
         _du_mc = _back["du_mc"];
         _sj_mc = _du_mc["zheng_mc"];
         _out_btn = _back["out_btn"];
         _jt_mc = _back["jt_mc"];
         _bestClick_txt = _back["bestClick_txt"];
         _cur_txt.text = "-10273km";
         _tar_txt.text = "-1213km";
         _best_txt.text = "-10273km";
         _click_txt.text = "0";
         _bestClick_txt.text = "0";
         addChild(_back);
         _jt_mc.gotoAndPlay(2);
         _nono_mc.gotoAndStop(1);
         _ball = new Ball();
         _ball.downN = 500;
         _ball.leftN = 60;
         _ball.rightN = 560;
         _ball.upN = 56;
         _bW = uint(_ball.width / 2);
         addChild(_ball);
         _ball.addEventListener(Ball.HIT_DOWN,hidDownHandler);
         _ball.addEventListener(Ball.HIT_UP,hitUpHandler);
         _out_btn.addEventListener(MouseEvent.CLICK,clickHandlerOut);
         addEventListener(Event.ENTER_FRAME,enterFrameHandler);
      }
      
      public function nowClickTimes() : void
      {
         ++_now_click;
         _click_txt.text = String(_now_click);
      }
      
      private function enterFrameHandler(e:Event) : void
      {
         if(_ball)
         {
            initSJ();
            _ball.enterFrame();
         }
      }
      
      private function removeYMC(m:MovieClip) : void
      {
         m.addFrameScript(_y_mc.totalFrames - 1,null);
         removeChild(m);
         m = null;
      }
      
      private function hidDownHandler(e:Event) : void
      {
         initClickTimes();
      }
      
      private function clickHandlerOut(e:MouseEvent) : void
      {
         dispatchEvent(new Event(Ball.HIT_UP));
      }
      
      public function initClickTimes() : void
      {
         if(_now_click == 0)
         {
            return;
         }
         _jt_mc.gotoAndPlay(2);
         ++_hui_n;
         if(_now_click > int(_bestClick_txt.text))
         {
            _bestClick_txt.text = String(_now_click);
         }
         if(_now_click > 100)
         {
            _nono_txt.text = "(≧▽≦)/ 神一般的主人，神一般的NoNo";
            _nono_mc.gotoAndStop(2);
         }
         else if(_hui_n < 10 && _now_click < 4)
         {
            _nono_txt.text = "不断的点击你的NoNo，保证它不断浮起，直到脱离海沟异常水压和重力影响↖(^ω^)↗";
            _nono_mc.gotoAndStop(4);
         }
         else if(_hui_n >= 10 && _now_click < 4)
         {
            _nono_txt.text = "NoNo不干嘛，NoNo要浮起来嘛，快点我，点中间，点中间o(>﹏<)o";
            _nono_mc.gotoAndStop(3);
         }
         else if(_hui_n < 5 && _now_click >= 4 && _now_click <= 6)
         {
            _nono_txt.text = "主人，快点把我托起来吧，就差点点啦o(>﹏<)o";
            _nono_mc.gotoAndStop(4);
         }
         else if(_hui_n >= 5 && _now_click >= 4 && _now_click <= 6)
         {
            _nono_txt.text = "主人，快点把我托起来吧，我给你带回了海沟里的能量宝藏哦 (@﹏@)";
            _nono_mc.gotoAndStop(3);
         }
         else if(_hui_n < 5 && _now_click >= 7 && _now_click < 16)
         {
            _nono_txt.text = "X﹏X 就差那么一丁点，就差那么一丁点，就差那么一丁点……";
            _nono_mc.gotoAndStop(4);
         }
         else if(_hui_n > 4 && _now_click >= 7 && _now_click < 16)
         {
            _nono_txt.text = "~~o(>_<)o ~~ 不要拿我当皮球拍，快点把我托起来……";
            _nono_mc.gotoAndStop(3);
         }
         else if(_hui_n < 5 && _now_click > 15 && _now_click < 31)
         {
            _nono_txt.text = "⊙﹏⊙ 好厉害啊，主人加油，主人加油！";
            _nono_mc.gotoAndStop(4);
         }
         else if(_hui_n > 4 && _now_click > 15 && _now_click < 31)
         {
            _nono_txt.text = "~~~~(>_<)~~~~  不要玩了嘛，让我浮起来嘛";
            _nono_mc.gotoAndStop(3);
         }
         else if(_hui_n < 5 && _now_click > 30)
         {
            _nono_txt.text = "( ⊙o⊙ )哇！主人你太厉害了,NoNo还要玩……";
            _nono_mc.gotoAndStop(4);
         }
         else if(_hui_n > 4 && _now_click > 30)
         {
            _nono_txt.text = "╮(╯▽╰)╭ 我还在水底，我永远都在水底，啦啦啦，我就是不浮起来……";
            _nono_mc.gotoAndStop(4);
         }
         _now_click = 0;
         _click_txt.text = "0";
      }
      
      public function clickStage() : void
      {
         bPoint = new Point(_ball.ballX,_ball.ballY);
         mPoint = new Point(_ball.mouseX,_ball.mouseY);
         _dis = uint(Point.distance(bPoint,mPoint));
         if(_dis <= _bW)
         {
            _y_mc = new KickBallGame_line();
            _y_mc.x = _ball.mouseX;
            _y_mc.y = _ball.mouseY;
            _clickT_text = _y_mc["num_txt"];
            _clickT_text.text = String(_now_click + 1);
            addChild(_y_mc);
            _clickT_text = null;
            _y_mc.addFrameScript(_y_mc.totalFrames - 1,Delegate.create(removeYMC,_y_mc));
            nowClickTimes();
            _disx = int(_ball.ballX - _ball.mouseX);
            _disy = uint(_ball.mouseY - _ball.ballY + _ball.ballWidth / 2);
            _ball.tiaoB = true;
            _ball.nTempY = -_disy / _ball.ballWidth / 2 * 80;
            _ball.nTempX = _disx / _ball.ballWidth * 80;
         }
      }
      
      private function hitUpHandler(e:Event) : void
      {
         dispatchEvent(new Event(Ball.HIT_UP));
      }
      
      public function clickNum() : uint
      {
         return _now_click;
      }
      
      private function initSJ() : void
      {
         _sj_mc.y = 209 - uint(500 - _ball.ballY) * sjH / qiuH;
         nn = -10273 + 9060 * uint(500 - _ball.ballY) / qiuH;
         if(nn > best_n)
         {
            _best_txt.text = String(nn) + "km";
            best_n = nn;
         }
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         _nono_txt = null;
         _cur_txt = null;
         _best_txt = null;
         _bestClick_txt = null;
         _click_txt = null;
         _du_mc = null;
         _sj_mc = null;
         _out_btn = null;
      }
   }
}

