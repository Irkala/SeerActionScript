package _4543_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol500")]
   public dynamic class mc_sa_60 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_60()
      {
         super();
         addFrameScript(0,this.frame1,83,this.frame84,113,this.frame114);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame84() : *
      {
         this.hit = 1;
      }
      
      internal function frame114() : *
      {
         stop();
      }
   }
}

