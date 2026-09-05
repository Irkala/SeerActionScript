package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol39")]
   public dynamic class FirstUI_StarGame extends MovieClip
   {
      
      public var enter_btn:SimpleButton;
      
      public function FirstUI_StarGame()
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

