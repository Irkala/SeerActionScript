package _5003_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol53")]
   public dynamic class mc_cp_21 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_21()
      {
         super();
         addFrameScript(0,this.frame1,26,this.frame27,80,this.frame81);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame27() : *
      {
         this.hit = 1;
      }
      
      internal function frame81() : *
      {
         stop();
      }
   }
}

