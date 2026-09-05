package _4514_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol543")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,94,this.frame95,119,this.frame120);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame95() : *
      {
         this.hit = 1;
      }
      
      internal function frame120() : *
      {
         stop();
      }
   }
}

