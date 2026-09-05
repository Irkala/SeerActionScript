package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol38")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         addFrameScript(0,this.frame1,65,this.frame66,103,this.frame104);
         super();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame66() : *
      {
         this.hit = 1;
      }
      
      internal function frame104() : *
      {
         stop();
      }
   }
}

