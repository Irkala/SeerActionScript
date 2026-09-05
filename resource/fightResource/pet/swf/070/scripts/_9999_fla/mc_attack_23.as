package _9999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol47")]
   public dynamic class mc_attack_23 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_23()
      {
         addFrameScript(0,this.frame1,10,this.frame11,43,this.frame44);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         this.hit = 1;
      }
      
      internal function frame44() : *
      {
         stop();
      }
   }
}

