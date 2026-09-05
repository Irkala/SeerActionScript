package §10_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol264")]
   public dynamic class Timeline_18 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var comp_1:MovieClip;
      
      public var mc:MovieClip;
      
      public var funComp_0:MovieClip;
      
      public var door_1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var m2:MovieClip;
      
      public var door_0:MovieClip;
      
      public var testMC:MovieClip;
      
      public var flower1:MovieClip;
      
      public var flower2:MovieClip;
      
      public var oreMC:MovieClip;
      
      public function Timeline_18()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickHander(param1:*) : *
      {
         m2 = param1.currentTarget as MovieClip;
         m2.addEventListener(Event.ENTER_FRAME,onEnter);
         m2.gotoAndStop(2);
      }
      
      public function overHandler(param1:*) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndPlay(2);
      }
      
      public function outHandler(param1:*) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         mc2.addEventListener(MouseEvent.MOUSE_OVER,overHandler);
         mc2.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
         flower1.buttonMode = true;
         flower2.buttonMode = true;
         flower1.addEventListener(MouseEvent.CLICK,clickHander);
         flower2.addEventListener(MouseEvent.CLICK,clickHander);
      }
      
      public function onEnter(param1:*) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_.currentFrame == 2)
         {
            m2.removeEventListener(Event.ENTER_FRAME,onEnter);
            _loc3_ = _loc2_.mc as MovieClip;
            if(_loc3_)
            {
               _loc3_.gotoAndPlay(1);
            }
         }
      }
   }
}

