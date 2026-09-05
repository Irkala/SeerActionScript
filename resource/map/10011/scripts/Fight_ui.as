package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol210")]
   public dynamic class Fight_ui extends MovieClip
   {
      
      public var OtherInfoPanel:MovieClip;
      
      public var skill:SimpleButton;
      
      public var controlMC:MovieClip;
      
      public var barMC_up:MovieClip;
      
      public var msgMC:MovieClip;
      
      public var MyInfoPanel:MovieClip;
      
      public function Fight_ui()
      {
         super();
         addFrameScript(0,frame1,107,frame108);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame108() : *
      {
         stop();
      }
   }
}

