package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public dynamic class AllBookPanel extends MovieClip
   {
      
      public var shipBtn:SimpleButton;
      
      public var closeBtn:SimpleButton;
      
      public var nonoBookBtn:SimpleButton;
      
      public var petBtn:SimpleButton;
      
      public var paintBtn:SimpleButton;
      
      public var jgBtn:SimpleButton;
      
      public function AllBookPanel()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      public function closeHandler(param1:*) : *
      {
         this.parent.removeChild(this);
      }
   }
}

