package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol37")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         addFrameScript(0,this.frame1,46,this.frame47,96,this.frame97);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame47() : *
      {
         this.hit = 1;
      }
      
      internal function frame97() : *
      {
         stop();
      }
   }
}

