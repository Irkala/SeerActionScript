package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol641")]
   public dynamic class Timeline_205 extends MovieClip
   {
      
      public var nr_mc:MovieClip;
      
      public var mask_mc:MovieClip;
      
      public function Timeline_205()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.nr_mc.mask = this.mask_mc;
      }
   }
}

