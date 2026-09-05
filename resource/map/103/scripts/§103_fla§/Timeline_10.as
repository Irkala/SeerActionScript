package §103_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol297")]
   public dynamic class Timeline_10 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var bookbox:SimpleButton;
      
      public var egg:MovieClip;
      
      public var box:SimpleButton;
      
      public var equipHit0:MovieClip;
      
      public var eggHit:MovieClip;
      
      public var equipMc0:MovieClip;
      
      public var door_0:MovieClip;
      
      public var buyItemHit:MovieClip;
      
      public var shopMc:MovieClip;
      
      public var buyItem:MovieClip;
      
      public var elietCoinBtn:SimpleButton;
      
      public function Timeline_10()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         equipMc0.gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         equipMc0.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         equipMc0.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         equipMc0.gotoAndStop(2);
      }
   }
}

