package _4163_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol199")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,frame1,107,frame108,134,frame135);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame108() : *
      {
         hit = 1;
      }
      
      internal function frame135() : *
      {
         stop();
      }
   }
}

