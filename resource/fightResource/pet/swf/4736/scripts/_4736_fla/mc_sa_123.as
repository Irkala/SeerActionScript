package _4736_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol485")]
   public dynamic class mc_sa_123 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_123()
      {
         super();
         addFrameScript(0,this.frame1,63,this.frame64,91,this.frame92);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame64() : *
      {
         this.hit = 1;
      }
      
      internal function frame92() : *
      {
         stop();
      }
   }
}

