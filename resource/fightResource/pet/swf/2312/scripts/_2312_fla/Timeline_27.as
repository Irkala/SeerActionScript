package _2312_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol88")]
   public dynamic class Timeline_27 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_27()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,41,this.frame42);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         this.hit = 1;
      }
      
      internal function frame42() : *
      {
         stop();
      }
   }
}

