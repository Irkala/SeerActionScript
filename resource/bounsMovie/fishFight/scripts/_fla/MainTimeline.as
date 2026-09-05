package _fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [SWF(width="960", height="560", backgroundColor="#666666", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var level_txt:TextField;
      
      public var hpBar:MovieClip;
      
      public var name_txt:TextField;
      
      public var iconMC:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(411,frame412);
      }
      
      internal function frame412() : *
      {
         stop();
      }
   }
}

