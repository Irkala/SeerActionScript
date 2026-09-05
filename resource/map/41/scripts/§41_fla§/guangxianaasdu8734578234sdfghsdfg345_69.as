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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol183")]
   public dynamic class guangxianaasdu8734578234sdfghsdfg345_69 extends MovieClip
   {
      
      public var maskMC2:MovieClip;
      
      public var stone:MovieClip;
      
      public var mirrorMC:MovieClip;
      
      public function guangxianaasdu8734578234sdfghsdfg345_69()
      {
         super();
         addFrameScript(0,frame1,9,frame10,14,frame15,16,frame17);
      }
      
      internal function frame17() : *
      {
         stop();
         maskMC2 = this.root["top_mc"]["maskMC2"];
         this.root["top_mc"].addChild(maskMC2);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stone = this.root["control_mc"]["stoneMC"];
      }
      
      internal function frame15() : *
      {
         stop();
         stone = this.root["control_mc"]["stoneMC"];
         maskMC2 = this.root["top_mc"]["maskMC2"];
         if(stone.currentFrame >= 35)
         {
            maskMC2.parent.removeChild(maskMC2);
         }
      }
   }
}

