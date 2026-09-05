package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol103")]
   public dynamic class pet extends MovieClip
   {
      
      public function pet()
      {
         super();
         addFrameScript(7,frame8);
      }
      
      internal function frame8() : *
      {
         stop();
      }
   }
}

