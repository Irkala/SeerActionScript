package _3200_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol183")]
   public dynamic class Timeline_58 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_58()
      {
         super();
         addFrameScript(0,this.frame1,39,this.frame40,70,this.frame71);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame40() : *
      {
         this.hit = 1;
      }
      
      internal function frame71() : *
      {
         stop();
      }
   }
}

