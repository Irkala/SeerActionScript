package _1400701_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol504")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,63,this.frame64,89,this.frame90);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame64() : *
      {
         this.hit = 1;
      }
      
      internal function frame90() : *
      {
         stop();
      }
   }
}

