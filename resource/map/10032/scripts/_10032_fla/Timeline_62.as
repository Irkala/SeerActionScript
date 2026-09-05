package _10032_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol202")]
   public dynamic class Timeline_62 extends MovieClip
   {
      
      public var hh:MovieClip;
      
      public var mhtHitMc:MovieClip;
      
      public var out_effect:MovieClip;
      
      public function Timeline_62()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         hh.buttonMode = false;
         hh.mouseChildren = false;
         hh.mouseEnabled = false;
      }
   }
}

