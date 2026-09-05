package snowGame
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class GameStart extends Sprite
   {
      
      private static const bx:uint = 700;
      
      private static const by:uint = 365;
      
      private var _ballTiaoB:Boolean = false;
      
      private var _floor_mc:MovieClip;
      
      private var _boy:MovieClip;
      
      private var _floor:MovieClip;
      
      private var res_mc:MovieClip;
      
      private var _trees:Trees;
      
      private var rotationN:uint = 0;
      
      private var _body_mc:MovieClip;
      
      private var close_btn:SimpleButton;
      
      private var _treesBack:MovieClip;
      
      private var _back_mc:MovieClip;
      
      private var rock_mc:MovieClip;
      
      private var nTempGradown:int = 0;
      
      private var _thumbRoad_mc:MovieClip;
      
      private var _tSpeed:int = -8;
      
      private var _ball:MovieClip;
      
      private var _speed_mc:MovieClip;
      
      private var _treesF:MovieClip;
      
      private var quit_btn:SimpleButton;
      
      private const ts:int = -8;
      
      public function GameStart()
      {
         super();
         initGame();
      }
      
      public function level() : uint
      {
         return _trees.level;
      }
      
      private function tiaoBall() : void
      {
         if(_ballTiaoB)
         {
            constNtemp();
         }
      }
      
      private function gameWin(e:Event) : void
      {
         this.dispatchEvent(new Event("quitgame"));
      }
      
      private function constNtemp() : void
      {
         if(_ball.y > 0)
         {
            _ball.y = 0;
            _tSpeed = -_tSpeed * 0.4;
         }
         nTempGradown = _tSpeed;
         ++_tSpeed;
      }
      
      private function initGame() : void
      {
         _back_mc = new ZSnow_back();
         addChild(_back_mc);
         close_btn = _back_mc["closeBtn"];
         close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
         _treesBack = new MovieClip();
         addChild(_treesBack);
         _floor_mc = new ZSnow_floor_2();
         addChild(_floor_mc);
         _floor = _floor_mc["floor"];
         _body_mc = new ZSnow_body();
         rock_mc = new MovieClip();
         addChild(rock_mc);
         addChild(_body_mc);
         _treesF = new MovieClip();
         addChild(_treesF);
         _thumbRoad_mc = new ZSnow_thumbR();
         addChild(_thumbRoad_mc);
         _speed_mc = new ZSnow_speedBar();
         addChild(_speed_mc);
         _speed_mc.gotoAndStop(1);
         _boy = _body_mc["boy"];
         _ball = _body_mc["ball"];
         _boy.gotoAndStop(1);
         _trees = new Trees(_treesBack,_treesF,_floor_mc,rock_mc,_thumbRoad_mc,_speed_mc,_ball);
         _body_mc.x = bx;
         _body_mc.y = by;
         _floor_mc.x = bx;
         _floor_mc.y = by;
         _floor_mc.rotation = -5;
         _trees.addEventListener("gamewin",gameWin);
         _trees.addEventListener("gamelost",gameLost);
         _ball.buttonMode = true;
         _ball.addEventListener(MouseEvent.CLICK,clickBallHandler);
         this.addEventListener(Event.ENTER_FRAME,enterFrameHandler);
      }
      
      private function clickBallHandler(e:MouseEvent) : void
      {
         _ballTiaoB = true;
      }
      
      private function enterFrameHandler(e:Event) : void
      {
         _boy.y = _ball.y - _ball.width + 5;
         _ball.scaleX *= 1.001;
         _ball.scaleY *= 1.001;
         ++rotationN;
         if(rotationN == 100)
         {
            rotationN = 0;
            --_floor_mc.rotation;
         }
         tiaoBall();
         downBall();
         if(_trees)
         {
            _trees.enterFrame();
         }
      }
      
      private function gameLost(e:Event) : void
      {
         _ballTiaoB = true;
         _tSpeed = -12;
         if(_boy)
         {
            _boy.gotoAndPlay(2);
            _boy.addFrameScript(_boy.totalFrames - 1,endFrame);
         }
      }
      
      private function downBall() : void
      {
         if(!_ballTiaoB)
         {
            return;
         }
         if(_ball.y + nTempGradown > 0)
         {
            _ball.y = 0.1;
         }
         else
         {
            _ball.y += nTempGradown;
         }
         if(_ball.y >= 0 && Math.abs(nTempGradown) < 5)
         {
            _ball.y = 0;
            _ballTiaoB = false;
            _tSpeed = ts;
            nTempGradown = 0;
         }
      }
      
      public function destroyAll() : void
      {
         destroy();
         if(_trees)
         {
            _trees.removeEventListener("gamelost",gameLost);
            _trees.removeEventListener("gamewin",gameWin);
            _trees = null;
         }
         _floor_mc = null;
         _boy = null;
         _ball = null;
         _back_mc = null;
      }
      
      private function endFrame() : void
      {
         _boy.addFrameScript(_boy.totalFrames - 1,null);
         _boy.gotoAndStop(_boy.totalFrames - 1);
         res_mc = new ZSnow_lost();
         addChild(res_mc);
         quit_btn = res_mc["quit_btn"];
         quit_btn.addEventListener(MouseEvent.CLICK,clickQuitHandler);
         destroy();
      }
      
      private function clickQuitHandler(e:MouseEvent) : void
      {
         this.dispatchEvent(new Event("quitgame"));
         destroyAll();
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         this.dispatchEvent(new Event("quitgame"));
      }
      
      private function clickAgaHandler(e:MouseEvent) : void
      {
         this.dispatchEvent(new Event("againgame"));
         destroyAll();
      }
      
      public function destroy() : void
      {
         if(_ball)
         {
            _ball.removeEventListener(MouseEvent.CLICK,clickBallHandler);
            _ball = null;
         }
         if(_body_mc)
         {
            removeChild(_body_mc);
         }
         if(_speed_mc)
         {
            removeChild(_speed_mc);
         }
         if(_thumbRoad_mc)
         {
            removeChild(_thumbRoad_mc);
         }
         _body_mc = null;
         _speed_mc = null;
         _thumbRoad_mc = null;
         this.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
      }
   }
}

