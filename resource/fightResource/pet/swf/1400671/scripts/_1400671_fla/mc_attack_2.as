package _1400671_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol524")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,84,this.frame85,121,this.frame122);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame85() : *
      {
         this.hit = 1;
      }
      
      internal function frame122() : *
      {
         stop();
      }
   }
}

