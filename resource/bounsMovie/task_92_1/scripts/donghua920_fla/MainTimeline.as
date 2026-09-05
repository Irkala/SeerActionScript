package donghua920_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#666666", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public function MainTimeline()
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

