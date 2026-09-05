package _4724_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol120")]
   public dynamic class mc_sa_27 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_27()
      {
         super();
         addFrameScript(0,this.frame1,31,this.frame32,97,this.frame98);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         this.hit = 1;
      }
      
      internal function frame98() : *
      {
         stop();
      }
   }
}

