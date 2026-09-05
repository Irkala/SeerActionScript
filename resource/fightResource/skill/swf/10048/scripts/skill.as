package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol77")]
   public dynamic class skill extends MovieClip
   {
      
      public var isEnd:*;
      
      public var hit:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,49,this.frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
         this.isEnd = 1;
      }
   }
}

