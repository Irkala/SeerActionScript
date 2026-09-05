package §31_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol159")]
   public dynamic class Timeline_48 extends MovieClip
   {
      
      public var door_1:MovieClip;
      
      public var comp_1:MovieClip;
      
      public var picture:MovieClip;
      
      public var standCable:MovieClip;
      
      public var cableMC:MovieClip;
      
      public var ear:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var earHit:MovieClip;
      
      public var door_0:MovieClip;
      
      public function Timeline_48()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function overHandler(param1:*) : *
      {
         cableMC.gotoAndStop(2);
      }
      
      internal function frame1() : *
      {
         cableMC.visible = false;
         cableMC.addEventListener(MouseEvent.MOUSE_OVER,overHandler);
         cableMC.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
         cableMC.addEventListener(MouseEvent.CLICK,clickHandler);
      }
      
      public function clickHandler(param1:*) : *
      {
         cableMC.gotoAndStop(3);
      }
      
      public function outHandler(param1:*) : *
      {
         cableMC.gotoAndStop(1);
      }
   }
}

