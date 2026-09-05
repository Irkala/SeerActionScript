package _4454_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol502")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,frame1,90,frame91,117,frame118);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame91() : *
      {
         hit = 1;
      }
      
      internal function frame118() : *
      {
         stop();
      }
   }
}

