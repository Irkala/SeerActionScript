package task81donghua_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#666666", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public function MainTimeline()
      {
         super();
         addFrameScript(110,frame111);
      }
      
      internal function frame111() : *
      {
         stop();
      }
   }
}

