package §60_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol345")]
   public dynamic class Timeline_31 extends MovieClip
   {
      
      public var door_1:MovieClip;
      
      public var shitou_btn:SimpleButton;
      
      public var hit_1:MovieClip;
      
      public var yq_btn:SimpleButton;
      
      public var long_mc:MovieClip;
      
      public var pp_btn:SimpleButton;
      
      public function Timeline_31()
      {
         super();
         addFrameScript(0,frame1,87,frame88);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      public function clickTih(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("clickhamole"));
      }
      
      internal function frame88() : *
      {
         pp_btn.addEventListener(MouseEvent.CLICK,clickTih);
      }
   }
}

