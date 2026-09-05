package _4666_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol287")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,76,this.frame77,99,this.frame100);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame77() : *
      {
         this.hit = 1;
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}

