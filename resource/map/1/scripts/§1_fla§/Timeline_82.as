package §1_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol205")]
   public dynamic class Timeline_82 extends MovieClip
   {
      
      public var maskMc:MovieClip;
      
      public var q_1:MovieClip;
      
      public var q_2:MovieClip;
      
      public var q_3:MovieClip;
      
      public var i:uint;
      
      public var q_4:MovieClip;
      
      public function Timeline_82()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         i = 1;
         while(i < 5)
         {
            this["q_" + i].mouseEnabled = false;
            this["q_" + i].mouseChildren = false;
            ++i;
         }
         maskMc.visible = false;
         maskMc.mouseEnabled = false;
         maskMc.mouseChildren = false;
      }
   }
}

