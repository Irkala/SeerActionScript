package §42_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol124")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var talkMC:MovieClip;
      
      public var diaMc_1:MovieClip;
      
      public var diaMc_2:MovieClip;
      
      public var diaHit_1:MovieClip;
      
      public var iceHit_mc:MovieClip;
      
      public var diaHit_2:MovieClip;
      
      public var ddMc:MovieClip;
      
      public var ice_mc:MovieClip;
      
      public var door_0:MovieClip;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         ice_mc.gotoAndStop(1);
      }
   }
}

