package _fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol227")]
   public dynamic class Timeline_46 extends MovieClip
   {
      
      public var mc2:MovieClip;
      
      public var mc4:MovieClip;
      
      public var i1:int;
      
      public var mc1:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc5:MovieClip;
      
      public function Timeline_46()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         param1.currentTarget.gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         i1 = 1;
         while(i1 < 6)
         {
            this["mc" + i1].addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
            this["mc" + i1].addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
            ++i1;
         }
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         param1.currentTarget.gotoAndStop(2);
         var _loc2_:uint = uint(this.getChildIndex(param1.currentTarget as MovieClip));
         var _loc3_:uint = 0;
         var _loc4_:int = 1;
         while(_loc4_ < 6)
         {
            if(this.getChildIndex(this["mc" + _loc4_]) > _loc3_)
            {
               _loc3_ = uint(this.getChildIndex(this["mc" + _loc4_]));
            }
            _loc4_++;
         }
         this.swapChildrenAt(_loc2_,_loc3_);
      }
   }
}

