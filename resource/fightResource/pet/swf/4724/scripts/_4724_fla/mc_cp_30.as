package _4724_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol147")]
   public dynamic class mc_cp_30 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_30()
      {
         super();
         addFrameScript(0,this.frame1,77,this.frame78,100,this.frame101);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame78() : *
      {
         this.hit = 1;
      }
      
      internal function frame101() : *
      {
         stop();
      }
   }
}

