package _4731_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol391")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,78,this.frame79,115,this.frame116);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame79() : *
      {
         this.hit = 1;
      }
      
      internal function frame116() : *
      {
         stop();
      }
   }
}

