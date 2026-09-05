package _4450_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol602")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,83,this.frame84,115,this.frame116);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame84() : *
      {
         this.hit = 1;
      }
      
      internal function frame116() : *
      {
         stop();
      }
   }
}

