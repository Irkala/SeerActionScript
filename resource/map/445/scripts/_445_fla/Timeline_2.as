package _445_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol330")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var bossMC:MovieClip;
      
      public var pirateHit:MovieClip;
      
      public var kaziMC:MovieClip;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

