package §52_fla§
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
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var top_mc:MovieClip;
      
      public var animator_mc:MovieClip;
      
      public var depth_mc:MovieClip;
      
      public var isOut:Boolean;
      
      public var bg_mc:MovieClip;
      
      public var control_mc:MovieClip;
      
      public var buttonLevel:MovieClip;
      
      public var type_mc:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onBallOver(param1:MouseEvent) : void
      {
         top_mc.addChild(top_mc.ballMc);
         isOut = true;
         top_mc.ballMc.removeEventListener(Event.ENTER_FRAME,onEnter);
         top_mc.ballMc.addEventListener(Event.ENTER_FRAME,onEnter);
      }
      
      internal function frame1() : *
      {
         isOut = true;
      }
      
      public function onEnter(param1:Event) : void
      {
         if(isOut)
         {
            top_mc.ballMc.alpha += 0.04;
            if(top_mc.ballMc.alpha >= 1)
            {
               top_mc.ballMc.removeEventListener(Event.ENTER_FRAME,onEnter);
            }
         }
         else
         {
            top_mc.ballMc.alpha -= 0.04;
            if(top_mc.ballMc.alpha <= 0.1)
            {
               top_mc.ballMc.alpha = 0;
               top_mc.removeChild(top_mc.ballMc);
               top_mc.ballMc.removeEventListener(Event.ENTER_FRAME,onEnter);
            }
         }
      }
      
      public function onBallOut(param1:MouseEvent) : void
      {
         isOut = false;
         top_mc.ballMc.removeEventListener(Event.ENTER_FRAME,onEnter);
         top_mc.ballMc.addEventListener(Event.ENTER_FRAME,onEnter);
      }
   }
}

