package _691_fla
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
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var depth_mc:MovieClip;
      
      public var animator_mc:MovieClip;
      
      public var control_mc:MovieClip;
      
      public var buttonLevel:MovieClip;
      
      public var type_mc:MovieClip;
      
      public var top_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this["top_mc"].mouseEnabled = false;
         this["top_mc"].mouseChildren = false;
      }
   }
}

