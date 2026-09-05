package _4733_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol397")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,114,this.frame115,132,this.frame133);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame115() : *
      {
         this.hit = 1;
      }
      
      internal function frame133() : *
      {
         stop();
      }
   }
}

