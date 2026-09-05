package com.game
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class Boat extends MovieClip
   {
      
      private const nGravity:Number = 0.09;
      
      private const ttt:int = 2;
      
      private var downNum:Number;
      
      private var bLeft:Boolean = false;
      
      private var tempMc:MovieClip;
      
      private var _isDown:Boolean;
      
      private var _body_mc:MovieClip;
      
      private const tttt:int = 6;
      
      private var right_mc:MovieClip;
      
      private var bUp:Boolean = false;
      
      private var _boat:MovieClip;
      
      private var body:MovieClip;
      
      private var bDown:Boolean = false;
      
      private var ifLand:Boolean = false;
      
      private var nSidePushPower:Number = 0;
      
      private var nTempGradown:Number = 0;
      
      private var nSuspendPower:Number = 0;
      
      private var up_mc:MovieClip;
      
      private var nPushPower:Number = 0;
      
      private var nTempPushLeft:Number = 0;
      
      private var _isUp:Boolean;
      
      private var nTempforce:Number = 0;
      
      private var rightNum:Number;
      
      private var left_mc:MovieClip;
      
      private var down_mc:MovieClip;
      
      private var _downArray:Array;
      
      private var _isRight:Boolean;
      
      private var bRight:Boolean = false;
      
      private var tempMc1:MovieClip;
      
      private var upNum:Number;
      
      private var nTempPushRight:Number = 0;
      
      private var _isLeft:Boolean;
      
      private var bUpLock:Boolean = false;
      
      private var tempInt:int;
      
      private var leftNum:Number;
      
      public function Boat(arr:Array)
      {
         super();
         _downArray = arr;
         init();
      }
      
      public function destroy() : void
      {
         _boat = null;
         _body_mc = null;
         up_mc = null;
         down_mc = null;
         left_mc = null;
         right_mc = null;
         tempMc = null;
         tempMc1 = null;
      }
      
      private function boatDown() : void
      {
         _boat.y += nTempGradown;
         if(Math.abs(nTempGradown) > 0.2)
         {
            ifLand = false;
         }
      }
      
      public function set isDown(b:Boolean) : void
      {
         _isDown = b;
      }
      
      private function init() : void
      {
         _isUp = false;
         _isDown = false;
         _isLeft = false;
         _isRight = false;
         tempInt = 1;
         _boat = new GameUI_boat();
         addChild(_boat);
         _body_mc = _boat["body_mc"];
         body = _boat["body"];
         body.gotoAndStop(1);
         up_mc = _boat["up_fire"];
         down_mc = _boat["down_fire"];
         left_mc = _boat["left_fire"];
         right_mc = _boat["right_fire"];
         up_mc.visible = false;
         down_mc.visible = false;
         left_mc.visible = false;
         right_mc.visible = false;
         tempMc = _downArray[0];
         _boat.x = tempMc.x + tempMc.width / 2;
         _boat.y = tempMc.y - _body_mc.height / 2;
         upNum = _body_mc.height / 2;
         downNum = 560 - _body_mc.height / 2;
         leftNum = 0;
         rightNum = 960 - _body_mc.width / 2;
         _downArray[0].guang_mc.gotoAndStop(10);
         addDownPoint();
      }
      
      private function boatDown1() : void
      {
         if(!bUp && !bDown)
         {
            nTempGradown += nPushPower + nGravity + nSuspendPower;
         }
         else if(bUp)
         {
            bUp = false;
            nTempGradown += nPushPower + nGravity + nSuspendPower;
            nTempGradown = -0.5 * nTempGradown;
            _boat.y += nTempGradown;
            if(nTempPushRight + nTempPushLeft > 0)
            {
               nTempPushRight -= 0.06;
            }
            else
            {
               nTempPushLeft += 0.06;
            }
            nTempforce = nTempGradown;
            if(int(nTempPushRight + nTempPushLeft) == 0 && nTempforce >= -1)
            {
               nTempPushRight = 0;
               nTempPushLeft = 0;
               nTempGradown = 0;
               nTempforce = 0;
               ifLand = true;
            }
         }
         else if(bDown)
         {
            bDown = false;
            nTempGradown += nPushPower + nGravity + nSuspendPower;
            nTempGradown = 0;
            _boat.y += 0.4 * ttt;
         }
      }
      
      private function boatUp() : void
      {
         nPushPower = -0.1;
         nPushPower += nPushPower;
         nSuspendPower = 0;
         if(ifLand)
         {
            ifLand = false;
            _boat.y += -2;
         }
      }
      
      public function enterFrameHandler() : void
      {
         var temp:MovieClip = null;
         if(body.currentFrame == 21)
         {
            if(body["car_mc"].currentFrame == 100)
            {
               this.dispatchEvent(new Event("gameover"));
            }
            return;
         }
         if(body)
         {
            if(body.currentFrame != 1 && body.currentFrame != 21)
            {
               if(body.currentFrame == 20)
               {
                  body.gotoAndStop(1);
               }
            }
         }
         for(var i:int = 0; i < _downArray.length; i++)
         {
            temp = _downArray[i];
            if(!_boat && Boolean(temp))
            {
               return;
            }
            if(_body_mc.hitTestObject(temp))
            {
               if(_boat.y > temp.y)
               {
                  bDown = true;
                  hitOk();
               }
               else if(_boat.y < temp.y + temp.height)
               {
                  bUp = true;
                  hitOk();
               }
               if(_boat.x < temp.x && _boat.y > temp.y - _body_mc.height / 2 && _boat.y < temp.y + temp.height + _body_mc.height / 2)
               {
                  bRight = true;
                  hitOk();
               }
               else if(_boat.x > temp.x + temp.width && _boat.y > temp.y - _body_mc.height / 2 && _boat.y < temp.y + temp.height + _body_mc.height / 2)
               {
                  bLeft = true;
                  hitOk();
               }
               if(ifLand)
               {
                  if(tempInt == i)
                  {
                     if(tempInt == _downArray.length - 1)
                     {
                        if(body.currentFrame != 21)
                        {
                           body.gotoAndStop(21);
                           this.dispatchEvent(new Event("timeover"));
                        }
                        return;
                     }
                     ++tempInt;
                     addDownPoint();
                  }
               }
            }
         }
         if(_boat.y > downNum)
         {
            bUp = true;
            hitOk();
         }
         else if(_boat.y < upNum)
         {
            bDown = true;
            hitOk();
         }
         if(_boat.x < leftNum)
         {
            bLeft = true;
            hitOk();
         }
         else if(_boat.x > rightNum)
         {
            bRight = true;
            hitOk();
         }
         if(!_isLeft && !_isRight && !_isUp && !_isDown)
         {
            right_mc.visible = false;
            left_mc.visible = false;
            down_mc.visible = false;
            up_mc.visible = false;
            prowerOff();
         }
         if(_isLeft)
         {
            boatLeft();
            right_mc.visible = true;
            left_mc.visible = false;
         }
         else
         {
            right_mc.visible = false;
         }
         if(_isRight)
         {
            boatRight();
            left_mc.visible = true;
            right_mc.visible = false;
         }
         else
         {
            left_mc.visible = false;
         }
         if(_isUp)
         {
            boatUp();
            up_mc.visible = true;
            down_mc.visible = false;
         }
         else
         {
            up_mc.visible = false;
         }
         if(_isDown)
         {
            up_mc.visible = false;
            down_mc.visible = true;
            suspend();
         }
         else
         {
            down_mc.visible = false;
         }
         parMove();
         boatDown1();
         boatDown();
      }
      
      private function boatLeft() : void
      {
         nSidePushPower = 0.05;
         nTempPushRight += nSidePushPower;
         if(_boat)
         {
            if(_boat.rotation < 5)
            {
               _boat.rotation += 0.15;
            }
         }
      }
      
      public function set isLeft(b:Boolean) : void
      {
         _isLeft = b;
      }
      
      private function parMove() : void
      {
         if(!bLeft && !bRight)
         {
            _boat.x += nTempPushRight + nTempPushLeft;
         }
         else if(bLeft)
         {
            bLeft = false;
            nTempPushRight = -0.6 * nTempPushRight;
            nTempPushLeft = -0.6 * nTempPushLeft;
            _boat.x += 0.8 * tttt;
         }
         else if(bRight)
         {
            bRight = false;
            nTempPushRight = -0.6 * nTempPushRight;
            nTempPushLeft = -0.6 * nTempPushLeft;
            _boat.x += -0.8 * tttt;
         }
      }
      
      public function set isRight(b:Boolean) : void
      {
         _isRight = b;
      }
      
      private function suspend() : void
      {
         if(nTempGradown < 0)
         {
            nSuspendPower = 0.12;
         }
         else
         {
            nSuspendPower = -0.18;
         }
      }
      
      private function hitOk() : void
      {
         var num:Number = Math.abs(nTempGradown) * 3;
         var num1:Number = Math.abs(nTempPushRight + nTempPushLeft) * 3;
         if(body.currentFrame == 1)
         {
            if(num >= 10 || num1 >= 10)
            {
               body.gotoAndPlay(2);
               this.dispatchEvent(new Event("hitboat"));
            }
         }
      }
      
      public function set isUp(b:Boolean) : void
      {
         _isUp = b;
      }
      
      private function boatRight() : void
      {
         nSidePushPower = 0.05;
         nTempPushLeft -= nSidePushPower;
         if(_boat.rotation > -5)
         {
            _boat.rotation -= 0.15;
         }
      }
      
      private function prowerOff() : void
      {
         nPushPower = 0;
         nSidePushPower = 0;
         nSuspendPower = 0;
      }
      
      private function addDownPoint() : void
      {
         if(tempMc1)
         {
            tempMc1.guang_mc.gotoAndStop(10);
         }
         tempMc1 = _downArray[tempInt];
         tempMc1.guang_mc.gotoAndPlay(1);
      }
   }
}

