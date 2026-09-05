package _4556_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol339")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,57,this.frame58,101,this.frame102);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame58() : *
      {
         this.hit = 1;
      }
      
      internal function frame102() : *
      {
         stop();
      }
   }
}

