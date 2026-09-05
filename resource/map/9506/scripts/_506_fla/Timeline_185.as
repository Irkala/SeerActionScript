package _506_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol453")]
   public dynamic class Timeline_185 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var _mc1:MovieClip;
      
      public var mc3:MovieClip;
      
      public var _mc2:MovieClip;
      
      public var mc4:MovieClip;
      
      public var _mc3:MovieClip;
      
      public var mc5:MovieClip;
      
      public var movieMC:MovieClip;
      
      public var _mc4:MovieClip;
      
      public var _mc5:MovieClip;
      
      public var starMC:MovieClip;
      
      public var closeBTN:SimpleButton;
      
      public var mcArr:Array;
      
      public var mcPoint:Array;
      
      public function Timeline_185()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Point = null;
         this.mcArr = [this.mc1,this.mc2,this.mc3,this.mc4,this.mc5];
         this.mcPoint = [new Point(97.8,69.1),new Point(241.65,75.15),new Point(289.55,123.35),new Point(4.3,166.2),new Point(8.75,96.15)];
         for each(_loc1_ in this.mcArr)
         {
            _loc2_ = this.mcPoint[this.mcArr.indexOf(_loc1_)];
            _loc1_.x = _loc2_.x;
            _loc1_.y = _loc2_.y;
            _loc1_.visible = true;
            _loc1_.buttonMode = true;
            _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
            _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         }
         this._mc1.visible = false;
         this._mc2.visible = false;
         this._mc3.visible = false;
         this._mc4.visible = false;
         this._mc5.visible = false;
         this.movieMC.gotoAndStop(1);
      }
      
      public function destroy() : void
      {
         var _loc1_:MovieClip = null;
         for each(_loc1_ in this.mcArr)
         {
            _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
            _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         }
         this.mcArr.length = 0;
         this.mcPoint.length = 0;
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
            this.checkDistance(_loc2_);
         }
      }
      
      public function checkDistance(param1:MovieClip) : void
      {
         var _loc3_:uint = 0;
         var _loc2_:MovieClip = this["_" + param1.name];
         if(Point.distance(new Point(_loc2_.x,_loc2_.y),new Point(param1.x,param1.y)) < 20)
         {
            param1.stopDrag();
            param1.visible = false;
            _loc2_.visible = true;
            _loc3_ = 0;
            for each(param1 in this.mcArr)
            {
               if(param1.visible == false)
               {
                  _loc3_++;
               }
            }
            if(_loc3_ == 5)
            {
               this.movieMC.play();
            }
         }
      }
      
      internal function frame1() : *
      {
         this.visible = false;
         stop();
      }
   }
}

