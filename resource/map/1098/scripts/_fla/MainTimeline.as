package _fla
{
   import flash.display.MovieClip;
   
   [SWF(width="960", height="560", backgroundColor="#000000", frameRate="22")]
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
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.top_mc.mouseEnabled = false;
         this.top_mc.mouseChildren = false;
      }
   }
}

