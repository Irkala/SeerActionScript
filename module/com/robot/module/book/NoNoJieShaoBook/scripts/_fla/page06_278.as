package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol888")]
   public dynamic class page06_278 extends MovieClip
   {
      
      public var nr_mc:MovieClip;
      
      public var mask_mc:MovieClip;
      
      public function page06_278()
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

