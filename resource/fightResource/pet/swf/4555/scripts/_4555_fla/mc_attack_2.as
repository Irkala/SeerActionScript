package _4555_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol302")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,83,this.frame84,110,this.frame111);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame84() : *
      {
         this.hit = 1;
      }
      
      internal function frame111() : *
      {
         stop();
      }
   }
}

