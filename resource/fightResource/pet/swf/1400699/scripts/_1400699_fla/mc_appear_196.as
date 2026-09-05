package _1400699_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol643")]
   public dynamic class mc_appear_196 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_appear_196()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,45,this.frame46);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         this.hit = 1;
      }
      
      internal function frame46() : *
      {
         stop();
      }
   }
}

