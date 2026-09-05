package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class pet extends MovieClip
   {
      
      public var color_1:MovieClip;
      
      public var color_2:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(63,this.frame64);
      }
      
      internal function frame64() : *
      {
         stop();
      }
   }
}

