package §337_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol76")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var mosterMc:SimpleButton;
      
      public var units_mc:MovieClip;
      
      public var door_0:MovieClip;
      
      public var hit0:MovieClip;
      
      public var tens_mc:MovieClip;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         door_0.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         door_0.gotoAndStop(2);
         door_0.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         door_0.gotoAndStop(1);
         door_0.removeEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
   }
}

