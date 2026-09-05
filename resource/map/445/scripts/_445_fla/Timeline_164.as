package _445_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol512")]
   public dynamic class Timeline_164 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var pointArr:Array;
      
      public var imageArr:Array;
      
      public function Timeline_164()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : void
      {
         var _loc1_:MovieClip = null;
         this.pointArr = [new Point(208,148),new Point(188,182),new Point(260,213),new Point(283,149),new Point(199,223)];
         this.imageArr = [this.mc1,this.mc2,this.mc3,this.mc4,this.mc5];
         for each(_loc1_ in this.imageArr)
         {
            _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
            _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
            _loc1_.buttonMode = true;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:MovieClip = null;
         for each(_loc1_ in this.imageArr)
         {
            _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
            _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         }
         this.pointArr.length = 0;
         this.imageArr.length = 0;
      }
      
      public function checkImage(param1:MovieClip) : void
      {
         var _loc2_:uint = 5;
         var _loc3_:uint = uint(this.imageArr.indexOf(param1));
         var _loc4_:Point = this.pointArr[_loc3_];
         if(Point.distance(new Point(param1.x,param1.y),_loc4_) < 20)
         {
            param1.x = _loc4_.x;
            param1.y = _loc4_.y;
            param1.buttonMode = false;
            param1.mouseChildren = param1.mouseEnabled = false;
         }
         for each(param1 in this.imageArr)
         {
            if(param1.mouseChildren == false)
            {
               _loc2_--;
            }
         }
         if(_loc2_ == 0)
         {
            this.destroy();
            this.dispatchEvent(new Event("success"));
         }
      }
      
      public function mouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               _loc2_.startDrag();
               break;
            case MouseEvent.MOUSE_UP:
               _loc2_.stopDrag();
               this.checkImage(_loc2_);
         }
      }
      
      internal function frame1() : *
      {
         this.visible = false;
         stop();
      }
   }
}

