package com.robot.module.game.kickBall.mc
{
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.taomee.utils.DisplayUtil;
   
   public class Ball extends Sprite
   {
      
      public static const HIT_DOWN:String = "hitDown";
      
      public static const HIT_UP:String = "hitUp";
      
      private var tempSX:Number;
      
      private var tempSY:Number;
      
      private var _rightN:uint;
      
      private var _upN:uint;
      
      private var _nTempX:Number = 0;
      
      private var _nTempY:Number = 0;
      
      private var _nonoStage:uint;
      
      private var _ball:MovieClip;
      
      private var _leftN:uint;
      
      private var _downN:uint;
      
      private var color_mc:MovieClip;
      
      public var tiaoB:Boolean = false;
      
      public function Ball()
      {
         super();
         init();
      }
      
      public function get ballWidth() : uint
      {
         return uint(_ball.width);
      }
      
      public function set leftN(n:uint) : void
      {
         _leftN = n;
      }
      
      public function destroy() : void
      {
         removeChild(_ball);
         _ball = null;
      }
      
      private function init() : void
      {
         _nonoStage = MainManager.actorInfo.vipStage;
         switch(_nonoStage)
         {
            case 1:
               _ball = new KickBallGame_nono0();
               break;
            case 2:
               _ball = new KickBallGameUI_nono1();
               break;
            case 3:
               _ball = new KickBallGameUI_nono2();
               break;
            case 4:
               _ball = new KickBallGameUI_nono3();
               break;
            default:
               _ball = new KickBallGame_nono0();
         }
         color_mc = _ball["color_mc"];
         DisplayUtil.FillColor(color_mc,MainManager.actorInfo.nonoColor);
         _ball.buttonMode = true;
         addChild(_ball);
         _ball.x = 307;
         _ball.y = 500;
      }
      
      public function set downN(n:uint) : void
      {
         _downN = n;
      }
      
      public function set rightN(n:uint) : void
      {
         _rightN = n;
      }
      
      public function set upN(n:uint) : void
      {
         _upN = n;
      }
      
      public function set nTempY(n:Number) : void
      {
         _nTempY = n;
      }
      
      public function enterFrame() : void
      {
         if(tiaoB)
         {
            _nTempY += 2;
            tempSY = _ball.y + _nTempY;
            if(tempSY >= _downN)
            {
               dispatchEvent(new Event(HIT_DOWN));
               if(Math.abs(_nTempY) <= 5)
               {
                  tiaoB = false;
               }
               if(_nTempY >= 0)
               {
                  if(_nTempY <= 5)
                  {
                     _nTempY = 0;
                  }
               }
               _ball.y = _downN;
               _nTempY *= -0.8;
               return;
            }
            if(tempSY <= _upN)
            {
               if(_ball.x > 234 && _ball.x < 370)
               {
                  dispatchEvent(new Event(HIT_UP));
               }
               _ball.y = _upN;
               _nTempY *= -0.5;
               return;
            }
            _ball.y += _nTempY;
         }
         if(_nTempX != 0)
         {
            _nTempX *= 0.95;
            if(Math.abs(_nTempX) < 0.00001)
            {
               _nTempX = 0;
            }
            tempSX = _ball.x + _nTempX;
            if(tempSX >= _rightN)
            {
               _ball.x = _rightN;
               _nTempX *= -0.5;
               return;
            }
            if(tempSX <= _leftN)
            {
               _ball.x = _leftN;
               _nTempX *= -0.5;
               return;
            }
            _ball.x += _nTempX;
         }
      }
      
      public function get ballX() : Number
      {
         return _ball.x;
      }
      
      public function get ballY() : Number
      {
         return _ball.y;
      }
      
      public function set nTempX(n:Number) : void
      {
         _nTempX = n;
      }
   }
}

