package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class pet extends MovieClip
   {
      
      public var color_1:MovieClip;
      
      public var color_2:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(62,this.frame63);
      }
      
      internal function frame63() : *
      {
         stop();
      }
   }
}

