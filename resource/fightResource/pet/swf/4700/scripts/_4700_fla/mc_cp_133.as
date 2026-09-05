package _4700_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol481")]
   public dynamic class mc_cp_133 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_133()
      {
         super();
         addFrameScript(0,this.frame1,40,this.frame41,70,this.frame71);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         this.hit = 1;
      }
      
      internal function frame71() : *
      {
         stop();
      }
   }
}

