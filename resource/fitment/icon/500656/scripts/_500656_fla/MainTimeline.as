package _500656_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="24")]
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

