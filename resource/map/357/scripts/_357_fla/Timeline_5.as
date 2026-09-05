package _357_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol76")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public var bloodMC:MovieClip;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,3,this.frame4,4,this.frame5);
      }
      
      internal function frame1() : *
      {
         stop();
         this.bloodMC.visible = false;
      }
      
      internal function frame3() : *
      {
         this.bloodMC["per"].gotoAndStop(33);
      }
      
      internal function frame4() : *
      {
         this.bloodMC["per"].gotoAndStop(66);
      }
      
      internal function frame5() : *
      {
         this.bloodMC["per"].gotoAndStop(100);
      }
   }
}

