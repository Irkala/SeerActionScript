package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol99")]
   public dynamic class pet extends MovieClip
   {
      
      public var color_1:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(164,frame165);
      }
      
      internal function frame165() : *
      {
         stop();
      }
   }
}

