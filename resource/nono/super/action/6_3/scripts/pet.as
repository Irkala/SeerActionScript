package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol70")]
   public dynamic class pet extends MovieClip
   {
      
      public var color_1:MovieClip;
      
      public var color_2:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(99,this.frame100);
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}

