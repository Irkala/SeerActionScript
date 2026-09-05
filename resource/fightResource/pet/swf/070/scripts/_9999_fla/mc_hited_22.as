package _9999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol52")]
   public dynamic class mc_hited_22 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_hited_22()
      {
         addFrameScript(0,this.frame1,1,this.frame2,9,this.frame10);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.hit = 1;
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

