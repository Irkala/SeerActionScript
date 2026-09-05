package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18")]
   public dynamic class TaskPanelUI0_92 extends MovieClip
   {
      
      public var ok_btn:SimpleButton;
      
      public function TaskPanelUI0_92()
      {
         super();
         addFrameScript(0,frame1,39,frame40);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame == 41)
         {
            MovieClip(this).dispatchEvent(new Event("endpanel"));
         }
         else
         {
            nextFrame();
         }
      }
      
      internal function frame1() : *
      {
      }
      
      internal function frame40() : *
      {
         stop();
         ok_btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}

