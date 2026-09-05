package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol74")]
   public dynamic class TaskPanel81UI0 extends MovieClip
   {
      
      public var next_btn:SimpleButton;
      
      public var close_btn:SimpleButton;
      
      public function TaskPanel81UI0()
      {
         super();
         addFrameScript(40,frame41);
      }
      
      public function nextHandler(param1:MouseEvent) : void
      {
         nextFrame();
      }
      
      internal function frame41() : *
      {
         stop();
         next_btn.addEventListener(MouseEvent.CLICK,nextHandler);
      }
   }
}

