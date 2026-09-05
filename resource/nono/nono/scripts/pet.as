package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol127")]
   public dynamic class pet extends MovieClip
   {
      
      public var body:MovieClip;
      
      public var color_1:MovieClip;
      
      public var color_2:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

