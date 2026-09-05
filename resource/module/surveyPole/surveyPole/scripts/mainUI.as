package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol289")]
   public dynamic class mainUI extends MovieClip
   {
      
      public var surveyPoleBtn:SimpleButton;
      
      public var normalNono:MovieClip;
      
      public var superNono:MovieClip;
      
      public function mainUI()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

