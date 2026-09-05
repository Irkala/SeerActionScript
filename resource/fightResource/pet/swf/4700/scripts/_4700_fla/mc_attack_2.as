package _4700_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol384")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,58,this.frame59,79,this.frame80);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame59() : *
      {
         this.hit = 1;
      }
      
      internal function frame80() : *
      {
         stop();
      }
   }
}

