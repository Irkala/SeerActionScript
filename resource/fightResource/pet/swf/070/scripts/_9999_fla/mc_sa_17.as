package _9999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol91")]
   public dynamic class mc_sa_17 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_17()
      {
         addFrameScript(0,this.frame1,10,this.frame11,45,this.frame46);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         this.hit = 1;
      }
      
      internal function frame46() : *
      {
         stop();
      }
   }
}

