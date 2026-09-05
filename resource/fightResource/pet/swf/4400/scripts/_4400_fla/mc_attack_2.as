package _4400_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol385")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,frame1,137,frame138,176,frame177);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame138() : *
      {
         hit = 1;
      }
      
      internal function frame177() : *
      {
         stop();
      }
   }
}

