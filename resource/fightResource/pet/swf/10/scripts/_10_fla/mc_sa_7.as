package _10_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol47")]
   public dynamic class mc_sa_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_7()
      {
         super();
         addFrameScript(0,this.frame1,29,this.frame30,124,this.frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         this.hit = 1;
      }
      
      internal function frame125() : *
      {
         stop();
      }
   }
}

