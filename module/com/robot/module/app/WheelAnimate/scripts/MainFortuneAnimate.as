package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol118")]
   public dynamic class MainFortuneAnimate extends MovieClip
   {
      
      public var normal_mc:MovieClip;
      
      public var button_mc:MovieClip;
      
      public function MainFortuneAnimate()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
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

