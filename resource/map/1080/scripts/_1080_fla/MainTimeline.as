package _1080_fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#000000", frameRate="24")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var depth_mc:MovieClip;
      
      public var animator_mc:MovieClip;
      
      public var control_mc:MovieClip;
      
      public var buttonLevel:MovieClip;
      
      public var type_mc:MovieClip;
      
      public var top_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         top_mc.mouseEnabled = false;
         top_mc.mouseChildren = false;
      }
   }
}

