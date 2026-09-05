package _3211_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol197")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,115,this.frame116,137,this.frame138);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame116() : *
      {
         this.hit = 1;
      }
      
      internal function frame138() : *
      {
         stop();
      }
   }
}

