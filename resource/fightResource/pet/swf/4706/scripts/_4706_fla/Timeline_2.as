package _4706_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3721")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,146,this.frame147,179,this.frame180);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame147() : *
      {
         this.hit = 1;
      }
      
      internal function frame180() : *
      {
         stop();
      }
   }
}

