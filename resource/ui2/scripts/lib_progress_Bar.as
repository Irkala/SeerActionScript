package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1629")]
   public dynamic class lib_progress_Bar extends MovieClip
   {
      
      public var txt:TextField;
      
      public function lib_progress_Bar()
      {
         super();
         addFrameScript(0,frame1,99,frame100);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}

