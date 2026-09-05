package _3326_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol131")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,49,this.frame50,72,this.frame73);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame50() : *
      {
         this.hit = 1;
      }
      
      internal function frame73() : *
      {
         stop();
      }
   }
}

