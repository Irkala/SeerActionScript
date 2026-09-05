package _5003_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol29")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,134,this.frame135,195,this.frame196);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame135() : *
      {
         this.hit = 1;
      }
      
      internal function frame196() : *
      {
         stop();
      }
   }
}

