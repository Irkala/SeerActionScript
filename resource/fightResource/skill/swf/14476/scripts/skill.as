package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class skill extends MovieClip
   {
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,21,this.frame22);
      }
      
      internal function frame1() : *
      {
         this.hit = 1;
      }
      
      internal function frame22() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

