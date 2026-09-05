package openEye_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#ffffff", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var bg_mc:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(124,frame125);
      }
      
      internal function frame125() : *
      {
         stop();
      }
   }
}

