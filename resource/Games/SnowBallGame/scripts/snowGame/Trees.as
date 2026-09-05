package snowGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class Trees extends Sprite
   {
      
      private var tn:uint = 0;
      
      private var _rock:TreeBack;
      
      private var _level:uint = 0;
      
      private var _trees_0:TreeBack;
      
      private var _trees_1:TreeBack;
      
      private var bar_w:Number;
      
      private var _floor:MovieClip;
      
      private var _thumb_z:MovieClip;
      
      private var _ball_mc:MovieClip;
      
      private var ran:int;
      
      private var backTreen:uint = 0;
      
      private var rockTime:int = 6;
      
      private var _thumb_bar:MovieClip;
      
      private var _time:Timer;
      
      private var _speed_mc:MovieClip;
      
      private var rockn:uint = 0;
      
      private var _rock_mc:MovieClip;
      
      private var _trees_back:MovieClip;
      
      private var _trees_f:MovieClip;
      
      private var _thumb_mc:MovieClip;
      
      public function Trees(mc0:MovieClip, mc1:MovieClip, mc2:MovieClip, mc3:MovieClip, mc4:MovieClip, mc5:MovieClip, mc6:MovieClip)
      {
         super();
         _trees_back = mc0;
         _trees_f = mc1;
         _floor = mc2;
         _rock_mc = mc3;
         _thumb_mc = mc4;
         _speed_mc = mc5;
         _ball_mc = mc6;
         _thumb_bar = _thumb_mc["bar_mc"];
         _thumb_z = _thumb_mc["z_mc"];
         bar_w = _thumb_bar.width / 60;
         _time = new Timer(500,0);
         _time.addEventListener(TimerEvent.TIMER,timerHandler);
         _time.start();
      }
      
      public function destroy() : void
      {
         if(_time)
         {
            _time.stop();
            _time.removeEventListener(TimerEvent.TIMER,timerHandler);
            _time = null;
         }
         _trees_0 = null;
         _thumb_mc = null;
         _thumb_bar = null;
         _thumb_z = null;
         _floor = null;
         _ball_mc = null;
         _rock = null;
         _rock_mc = null;
         _speed_mc = null;
         _trees_back = null;
         _trees_f = null;
      }
      
      private function timerHandler(e:TimerEvent) : void
      {
         ++tn;
         ++backTreen;
         ++rockn;
         _thumb_z.x -= bar_w;
         if(_thumb_z.x <= _thumb_bar.x)
         {
            gameWin();
            return;
         }
         if(rockn == rockTime)
         {
            _speed_mc.nextFrame();
            _rock = new TreeBack(ZSnow_rock,_floor.rotation,6,700,365);
            _rock_mc.addChild(_rock);
            rockn = 0;
            ++_level;
         }
         if(backTreen == 2)
         {
            ran = Math.random() * 6;
            if(ran < 4)
            {
               _trees_0 = new TreeBack(ZSnow_tree1,_floor.rotation,10,700,365);
               _trees_back.addChild(_trees_0);
            }
            backTreen = 0;
         }
         _trees_1 = new TreeBack(ZSnow_tree0,_floor.rotation,2,850,550);
         _trees_f.addChild(_trees_1);
      }
      
      private function gameWin() : void
      {
         dispatchEvent(new Event("gamewin"));
      }
      
      public function get level() : uint
      {
         return _level;
      }
      
      public function enterFrame() : void
      {
         var k:int = 0;
         var temp2:TreeBack = null;
         var j:int = 0;
         var temp1:TreeBack = null;
         var i:int = 0;
         var temp:TreeBack = null;
         if(!_rock_mc)
         {
            return;
         }
         if(_rock_mc.numChildren > 0)
         {
            for(k = 0; k < _rock_mc.numChildren; k++)
            {
               temp2 = _rock_mc.getChildAt(k) as TreeBack;
               temp2.x += temp2.speedX;
               temp2.y += temp2.speedY;
               if(temp2.hitTestPoint(700,360 - _ball_mc.y))
               {
                  gameLost();
                  return;
               }
               if(temp2.x > temp2.endx)
               {
                  _rock_mc.removeChild(temp2);
                  temp2.destroy();
                  temp2 = null;
               }
            }
         }
         if(_trees_f.numChildren > 0)
         {
            for(j = 0; j < _trees_f.numChildren; j++)
            {
               temp1 = _trees_f.getChildAt(j) as TreeBack;
               temp1.x += temp1.speedX;
               temp1.y += temp1.speedY;
               if(temp1.x > temp1.endx)
               {
                  _trees_f.removeChild(temp1);
                  temp1.destroy();
                  temp1 = null;
               }
            }
         }
         if(_trees_back.numChildren > 0)
         {
            for(i = 0; i < _trees_back.numChildren; i++)
            {
               temp = _trees_back.getChildAt(i) as TreeBack;
               temp.x += temp.speedX;
               temp.y += temp.speedY;
               if(temp.x > temp.endx)
               {
                  _trees_back.removeChild(temp);
                  temp.destroy();
                  temp = null;
               }
            }
         }
      }
      
      private function gameLost() : void
      {
         dispatchEvent(new Event("gamelost"));
      }
   }
}

