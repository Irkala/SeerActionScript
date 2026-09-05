package _4714_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol718")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,101,this.frame102,130,this.frame131);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame102() : *
      {
         this.hit = 1;
      }
      
      internal function frame131() : *
      {
         stop();
      }
   }
}

