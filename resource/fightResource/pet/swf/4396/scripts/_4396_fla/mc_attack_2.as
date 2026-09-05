package _4396_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol310")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,frame1,115,frame116,142,frame143);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame116() : *
      {
         hit = 1;
      }
      
      internal function frame143() : *
      {
         stop();
      }
   }
}

