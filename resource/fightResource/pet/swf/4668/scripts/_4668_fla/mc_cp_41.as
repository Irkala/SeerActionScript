package _4668_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol299")]
   public dynamic class mc_cp_41 extends MovieClip
   {
      
      public var hit:*;
      
      public function mc_cp_41()
      {
         super();
         addFrameScript(0,this.frame1,50,this.frame51,90,this.frame91);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame51() : *
      {
         this.hit = 1;
      }
      
      internal function frame91() : *
      {
         stop();
      }
   }
}

