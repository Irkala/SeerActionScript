package _448_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol431")]
   public dynamic class Timeline_174 extends MovieClip
   {
      
      public var red1:MovieClip;
      
      public var red2:MovieClip;
      
      public var red3:MovieClip;
      
      public var blue1:MovieClip;
      
      public var blue2:MovieClip;
      
      public var blue3:MovieClip;
      
      public var blue4:MovieClip;
      
      public var leftTxt:TextField;
      
      public var blueArr:Array;
      
      public var timer:Timer;
      
      public function Timeline_174()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function checkResult() : void
      {
         var _loc2_:MovieClip = null;
         this.graphics.clear();
         this.graphics.lineStyle(4,16711680);
         this.graphics.moveTo(this.red1.x,this.red1.y);
         this.graphics.lineTo(this.red2.x,this.red2.y);
         this.graphics.moveTo(this.red1.x,this.red1.y);
         this.graphics.lineTo(this.red3.x,this.red3.y);
         var _loc1_:uint = 0;
         for each(_loc2_ in this.blueArr)
         {
            if(this.isOnLine(new Point(this.red1.x,this.red1.y),new Point(this.red2.x,this.red2.y),new Point(_loc2_.x,_loc2_.y)) || this.isOnLine(new Point(this.red1.x,this.red1.y),new Point(this.red3.x,this.red3.y),new Point(_loc2_.x,_loc2_.y)))
            {
               _loc2_.gotoAndStop(2);
               _loc1_++;
            }
            else
            {
               _loc2_.gotoAndStop(1);
            }
         }
         if(_loc1_ == 4)
         {
            trace("解锁成功");
            this.destroyBalls();
            this.parent.dispatchEvent(new Event("success"));
         }
      }
      
      public function lsqr(param1:Point, param2:Point) : Number
      {
         return Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
      }
      
      public function isOnLine(param1:Point, param2:Point, param3:Point) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         _loc4_ = this.lsqr(param1,param3);
         _loc5_ = this.lsqr(param2,param3);
         _loc6_ = this.lsqr(param2,param1);
         if(_loc4_ + _loc5_ - _loc6_ < 1)
         {
            return true;
         }
         return false;
      }
      
      public function mouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            _loc2_.startDrag();
         }
         else if(param1.type == MouseEvent.MOUSE_UP)
         {
            _loc2_.stopDrag();
            this.checkResult();
         }
         else if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            this.checkResult();
         }
      }
      
      public function configBalls() : void
      {
         this.red1.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red1.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red1.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red2.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red2.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red2.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red3.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red3.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red3.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red1.buttonMode = this.red2.buttonMode = this.red3.buttonMode = true;
      }
      
      public function destroyBalls() : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer = null;
         }
         this.red1.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red1.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red1.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red2.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red2.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red2.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red3.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.red3.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.red3.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.red1.buttonMode = this.red2.buttonMode = this.red3.buttonMode = false;
         this.red1.stopDrag();
         this.red2.stopDrag();
         this.red3.stopDrag();
      }
      
      public function startPlay() : void
      {
         this.red1.x = 23;
         this.red1.y = 108;
         this.red2.x = 62;
         this.red2.y = 30;
         this.red3.x = 66;
         this.red3.y = 182;
         this.configBalls();
         this.checkResult();
         this.leftTxt.text = "60";
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
      }
      
      public function timerHandler(param1:TimerEvent) : void
      {
         this.leftTxt.text = "" + (int(this.leftTxt.text) - 1);
         if(int(this.leftTxt.text) == 0)
         {
            trace("解锁失败");
            this.destroyBalls();
            this.parent.dispatchEvent(new Event("failed"));
         }
      }
      
      public function stopPlay() : void
      {
         this.destroyBalls();
         this.graphics.clear();
      }
      
      internal function frame1() : *
      {
         this.blueArr = [this.blue1,this.blue2,this.blue3,this.blue4];
      }
   }
}

