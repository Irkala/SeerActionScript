package _4567_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol383")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,82,this.frame83,105,this.frame106);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame83() : *
      {
         this.hit = 1;
      }
      
      internal function frame106() : *
      {
         stop();
      }
   }
}

