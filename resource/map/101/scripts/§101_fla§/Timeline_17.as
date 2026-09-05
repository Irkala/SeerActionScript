package §101_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol200")]
   public dynamic class Timeline_17 extends MovieClip
   {
      
      public var comp_1:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var redBtn:SimpleButton;
      
      public var clothMc:MovieClip;
      
      public var signMC:MovieClip;
      
      public var armExchangeMc:MovieClip;
      
      public var pondHit_mc:MovieClip;
      
      public var signHit:MovieClip;
      
      public var door_0:MovieClip;
      
      public var door_1:MovieClip;
      
      public var npc:MovieClip;
      
      public var blueBtn:SimpleButton;
      
      public var light:MovieClip;
      
      public var pond_mc:MovieClip;
      
      public var npcHit:MovieClip;
      
      public var bookBtn:MovieClip;
      
      public var trialsHit:MovieClip;
      
      public var armBookBtn:MovieClip;
      
      public var trialsMC:MovieClip;
      
      public function Timeline_17()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         trialsMC.gotoAndStop(2);
         trialsMC.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         trialsMC.gotoAndStop(1);
         trialsMC.removeEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      internal function frame1() : *
      {
         trialsMC.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
      }
   }
}

