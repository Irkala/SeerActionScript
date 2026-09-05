package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol48")]
   public dynamic class MainFortuneAnimate_mystery extends MovieClip
   {
      
      public var button_mc:MovieClip;
      
      public var normal_mc:MovieClip;
      
      public function MainFortuneAnimate_mystery()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

