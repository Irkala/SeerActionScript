package 瑞波_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol206")]
   public dynamic class mc_attack_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_attack_2()
      {
         super();
         addFrameScript(0,this.frame1,81,this.frame82,104,this.frame105);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame82() : *
      {
         this.hit = 1;
      }
      
      internal function frame105() : *
      {
         stop();
      }
   }
}

