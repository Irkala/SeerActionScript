package §500_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol149")]
   public dynamic class Timeline_32 extends MovieClip
   {
      
      public var mosterMc:SimpleButton;
      
      public var mc11:MovieClip;
      
      public var mc12:MovieClip;
      
      public var mc13:MovieClip;
      
      public var mc14:MovieClip;
      
      public var mc15:MovieClip;
      
      public var mc16:MovieClip;
      
      public var mc17:MovieClip;
      
      public var mc18:MovieClip;
      
      public var mc19:MovieClip;
      
      public var mc10:MovieClip;
      
      public var mc20:MovieClip;
      
      public var mc21:MovieClip;
      
      public var mc22:MovieClip;
      
      public var mc23:MovieClip;
      
      public var mc24:MovieClip;
      
      public var mc25:MovieClip;
      
      public var mc26:MovieClip;
      
      public var mc27:MovieClip;
      
      public var mc28:MovieClip;
      
      public var mc29:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public var mc7:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc8:MovieClip;
      
      public var mc30:MovieClip;
      
      public var mc31:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc33:MovieClip;
      
      public var mc36:MovieClip;
      
      public var mc1:MovieClip;
      
      public var mc34:MovieClip;
      
      public var mc35:MovieClip;
      
      public var mc37:MovieClip;
      
      public var mc38:MovieClip;
      
      public var mc39:MovieClip;
      
      public var mc32:MovieClip;
      
      public var mc9:MovieClip;
      
      public var lvmc1:MovieClip;
      
      public var lvmc2:MovieClip;
      
      public var lvmc3:MovieClip;
      
      public var mc42:MovieClip;
      
      public var mc43:MovieClip;
      
      public var mc44:MovieClip;
      
      public var mc45:MovieClip;
      
      public var mc46:MovieClip;
      
      public var mc40:MovieClip;
      
      public var mc41:MovieClip;
      
      public var mc49:MovieClip;
      
      public var mc48:MovieClip;
      
      public var mc50:MovieClip;
      
      public var mc51:MovieClip;
      
      public var mc52:MovieClip;
      
      public var mc54:MovieClip;
      
      public var mc56:MovieClip;
      
      public var mc58:MovieClip;
      
      public var mc53:MovieClip;
      
      public var mc47:MovieClip;
      
      public var mc57:MovieClip;
      
      public var mc59:MovieClip;
      
      public var mc55:MovieClip;
      
      public var mc60:MovieClip;
      
      public var door_0:MovieClip;
      
      public var hit0:MovieClip;
      
      public function Timeline_32()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.door_0.addEventListener(MouseEvent.MOUSE_OVER,this.onOverHandler);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         this.door_0.gotoAndStop(1);
         this.door_0.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         this.door_0.gotoAndStop(2);
         this.door_0.addEventListener(MouseEvent.MOUSE_OUT,this.onOutHandler);
      }
   }
}

