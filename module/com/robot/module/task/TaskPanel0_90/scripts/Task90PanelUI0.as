package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol66")]
   public dynamic class Task90PanelUI0 extends MovieClip
   {
      
      public var next_btn:SimpleButton;
      
      public function Task90PanelUI0()
      {
         super();
         addFrameScript(40,frame41);
      }
      
      internal function frame41() : *
      {
         stop();
         next_btn.addEventListener(MouseEvent.CLICK,nextHandler);
      }
      
      public function nextHandler(param1:MouseEvent) : void
      {
         nextFrame();
      }
   }
}

