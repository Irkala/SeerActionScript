package §41_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol142")]
   public dynamic class Timeline_40 extends MovieClip
   {
      
      public var comp_1:MovieClip;
      
      public var kaka_mc:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var guang_mc:MovieClip;
      
      public var holeMC:MovieClip;
      
      public var kakaBtn:SimpleButton;
      
      public var shouHit:MovieClip;
      
      public var mc:MovieClip;
      
      public var door_0:MovieClip;
      
      public var door_1:MovieClip;
      
      public var diaMc_1:MovieClip;
      
      public var diamondBtn:SimpleButton;
      
      public var diaHit_1:MovieClip;
      
      public var holeHitMC:MovieClip;
      
      public var shouMc:MovieClip;
      
      public var stoneMC:MovieClip;
      
      public function Timeline_40()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickHandler(param1:*) : *
      {
         if(mc.currentFrame < 30)
         {
            mc.play();
         }
      }
      
      internal function frame1() : *
      {
         mc.addEventListener(MouseEvent.CLICK,clickHandler);
         mc.buttonMode = true;
      }
   }
}

