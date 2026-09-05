package _448_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol441")]
   public dynamic class Timeline_171 extends MovieClip
   {
      
      public var mainMC:MovieClip;
      
      public var closeBTN:SimpleButton;
      
      public function Timeline_171()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function startPlay() : void
      {
         this.mainMC.startPlay();
      }
      
      public function stopPlay() : void
      {
         this.mainMC.stopPlay();
      }
      
      internal function frame1() : *
      {
         this.visible = false;
      }
   }
}

