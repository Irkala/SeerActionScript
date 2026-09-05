package _3453_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol341")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,17,this.frame18,57,this.frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         this.hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}

