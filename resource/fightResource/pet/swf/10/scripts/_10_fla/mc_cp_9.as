package _10_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol65")]
   public dynamic class mc_cp_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_9()
      {
         super();
         addFrameScript(0,this.frame1,33,this.frame34,124,this.frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame34() : *
      {
         this.hit = 1;
      }
      
      internal function frame125() : *
      {
         stop();
      }
   }
}

