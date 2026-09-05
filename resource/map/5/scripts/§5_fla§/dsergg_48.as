package §5_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol160")]
   public dynamic class dsergg_48 extends MovieClip
   {
      
      public var myColor:Object;
      
      public var tempMC:*;
      
      public function dsergg_48()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         try
         {
            tempMC = this.parent;
            while(tempMC.colorObj == null && tempMC != null)
            {
               tempMC = tempMC.parent;
            }
            myColor = tempMC.colorObj;
            this.parent.transform.colorTransform = new ColorTransform(myColor.red / 256,myColor.green / 256,myColor.blue / 256,1);
         }
         catch(E:*)
         {
         }
      }
   }
}

