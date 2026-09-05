package _4500_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol584")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,127,this.frame128,157,this.frame158);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame128() : *
      {
         this.hit = 1;
      }
      
      internal function frame158() : *
      {
         stop();
      }
   }
}

