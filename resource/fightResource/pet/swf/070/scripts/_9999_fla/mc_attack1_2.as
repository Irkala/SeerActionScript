package _9999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol237")]
   public dynamic class mc_attack1_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack1_2()
      {
         addFrameScript(0,this.frame1,44,this.frame45,155,this.frame156);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         this.hit = 1;
      }
      
      internal function frame156() : *
      {
         stop();
      }
   }
}

