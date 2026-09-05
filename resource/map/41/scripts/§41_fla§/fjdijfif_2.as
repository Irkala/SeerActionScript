package §41_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18")]
   public dynamic class fjdijfif_2 extends MovieClip
   {
      
      public var maskMC2:MovieClip;
      
      public var maskMC:MovieClip;
      
      public function fjdijfif_2()
      {
         super();
         addFrameScript(0,frame1,3,frame4,6,frame7,34,frame35);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame35() : *
      {
         stop();
         maskMC = this.root["top_mc"]["maskMC"];
         maskMC2 = this.root["top_mc"]["maskMC2"];
         if(maskMC.currentFrame == 15)
         {
            maskMC2.parent.removeChild(maskMC2);
         }
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         stop();
      }
   }
}

