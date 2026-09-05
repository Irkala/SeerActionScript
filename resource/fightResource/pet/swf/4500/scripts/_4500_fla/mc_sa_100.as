package _4500_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol900")]
   public dynamic class mc_sa_100 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_sa_100()
      {
         super();
         addFrameScript(0,this.frame1,106,this.frame107,133,this.frame134);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame107() : *
      {
         this.hit = 1;
      }
      
      internal function frame134() : *
      {
         stop();
      }
   }
}

