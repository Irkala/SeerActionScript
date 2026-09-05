package _9999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol71")]
   public dynamic class mc_cp_19 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_19()
      {
         addFrameScript(0,this.frame1,5,this.frame6,45,this.frame46);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame6() : *
      {
         this.hit = 1;
      }
      
      internal function frame46() : *
      {
         stop();
      }
   }
}

