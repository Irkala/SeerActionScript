package _4544_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol370")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,85,this.frame86,114,this.frame115);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame86() : *
      {
         this.hit = 1;
      }
      
      internal function frame115() : *
      {
         stop();
      }
   }
}

