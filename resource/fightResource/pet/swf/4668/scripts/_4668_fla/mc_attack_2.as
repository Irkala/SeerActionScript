package _4668_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol252")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,90,this.frame91,110,this.frame111);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame91() : *
      {
         this.hit = 1;
      }
      
      internal function frame111() : *
      {
         stop();
      }
   }
}

