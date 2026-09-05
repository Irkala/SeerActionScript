package _1400675_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol655")]
   public dynamic class mc_appear_182 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_appear_182()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,44,this.frame45);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         this.hit = 1;
      }
      
      internal function frame45() : *
      {
         stop();
      }
   }
}

