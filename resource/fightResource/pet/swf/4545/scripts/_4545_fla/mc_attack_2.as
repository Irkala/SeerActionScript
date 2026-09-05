package _4545_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol197")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,69,this.frame70,97,this.frame98);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame70() : *
      {
         this.hit = 1;
      }
      
      internal function frame98() : *
      {
         stop();
      }
   }
}

