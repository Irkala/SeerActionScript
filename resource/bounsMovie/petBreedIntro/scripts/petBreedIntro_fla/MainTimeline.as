package petBreedIntro_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [SWF(width="960", height="560", backgroundColor="#666666", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var formulaIcon:MovieClip;
      
      public var close:SimpleButton;
      
      public var arrow:MovieClip;
      
      public var mc:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

